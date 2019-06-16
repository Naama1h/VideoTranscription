package servlet;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.openxml4j.opc.PackageAccess;
import org.apache.poi.poifs.crypt.Decryptor;
import org.apache.poi.poifs.crypt.EncryptionInfo;
import org.apache.poi.poifs.crypt.EncryptionMode;
import org.apache.poi.poifs.crypt.Encryptor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

/***
 * File Reader Class
 * @author User
 *
 */
public class FileReaderClass {
	/***
	 * get text from file
	 * @param path the path of the word file
	 * @param password the password to open him
	 * @param mp3sourse the record source
	 * @return the hole text from the word file
	 */
	public String getText(String path, String password, String mp3sourse) {
		try {
			// try to open the file if he have password
			POIFSFileSystem filesystem = new POIFSFileSystem(new FileInputStream(path));
			EncryptionInfo info = new EncryptionInfo(filesystem);
			Decryptor d = Decryptor.getInstance(info);
			if (!d.verifyPassword(password)) {
				// return to the user massage that this is wrong password
				return "badPassword";
			}
			InputStream dataStream = d.getDataStream(filesystem);
			XWPFDocument document = new XWPFDocument(dataStream);    
			List<XWPFParagraph> paragraphs = document.getParagraphs();
			// read the text
	        String text = "";
	        for (int i=0; i < paragraphs.size() ; i++) {
	        	text = text + paragraphs.get(i).getText() + "\n";
	        }
	        // remove the "@ סיום"
	        if (text.contains("@ סיום\n")) {
	        	text = text.replaceAll("@ סיום\n", "");
	        }
	        filesystem.close();
	        document.close();
	        // add the start if this is an empty file
	        if (text.equals("\n")) {
	        	return "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
	        }
	        return text;
		} catch (org.apache.poi.poifs.filesystem.OfficeXmlFileException ex1) {
			try {
				// try to open the file if he haven't password
				FileInputStream fis2 = new FileInputStream(path);
				XWPFDocument xdoc2 = new XWPFDocument(OPCPackage.open(fis2));
				List<XWPFParagraph> paragraphList = xdoc2.getParagraphs();
				// read the text
		        String text = "";
		        for (int i=0; i < paragraphList.size() ; i++) {
		        	text = text + paragraphList.get(i).getText() + "\n";
		        }
		        xdoc2.close();
		        fis2.close();
		        // remove the "@ סיום"
		        if (text.contains("@ סיום\n")) {
		        	text = text.replaceAll("@ סיום\n", "");
		        }
		        // add the start if this is an empty file
		        if (text.equals("\n")) {
		        	return "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
		        }
		        return text;
			} catch (Exception ex) {
				ex.printStackTrace();
				return "badPath";
			}
		} catch (GeneralSecurityException ex) {
			// return to the user massage that this is wrong password
			return "badPassword";
		} catch (org.apache.poi.EmptyFileException e1) {
			e1.printStackTrace();
			// add the start if this is an empty file
			return "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
		} catch (Exception e) {
			e.printStackTrace();
			// return "badPath" if there is not exist word file with this path
			return "badPath";
		}
	}

	/***
	 * save the text in word file with password
	 * @param path the word file path
	 * @param text the hole text
	 * @param password the password
	 */
	public void saveText(String path, String text, String password) {
		// save the text in .txt file
        BufferedWriter writer = null;
        try {
        	writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(newPathToTxt(path)), Charset.forName("UTF-8")));
            writer.write(text + "@ סיום");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
            	writer.close();
            } catch (Exception e) {
            }
        }
 
        convertTextToWord(newPathToTxt(path),path);
        
        /*
		// save the text in .docx file
		XWPFDocument document = new XWPFDocument();
		XWPFParagraph tmpParagraph = document.createParagraph();
		tmpParagraph.setAlignment(ParagraphAlignment.LEFT);
	    XWPFRun tmpRun = tmpParagraph.createRun();
		String[] para = text.split("\n");
		tmpRun.setFontFamily("Arial (גוף עברי)");
		tmpRun.setLang("iw-IL");
		for (int i=0; i < para.length ; i++) {
			tmpRun.setText(para[i]);
			tmpRun.addCarriageReturn();
			tmpRun.setFontSize(12);
		}
		// add the "סיום"
		tmpRun.setText("@ סיום");
		tmpRun.setFontFamily("Arial (גוף עברי)");
		tmpRun.setFontSize(12);
		try {
			// write to the file
			File file = new File(path);
			FileOutputStream out = new FileOutputStream(file);
			document.write(out);
			document.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		// encryption with password
		try (POIFSFileSystem fs = new POIFSFileSystem()) {
  			EncryptionInfo info = new EncryptionInfo(EncryptionMode.agile);
  			// EncryptionInfo info = new EncryptionInfo(EncryptionMode.agile, CipherAlgorithm.aes192, HashAlgorithm.sha384, -1, -1, null);
  			Encryptor enc = info.getEncryptor();
  			enc.confirmPassword(password);

  			// Read in an existing OOXML file and write to encrypted output stream
  			try (OPCPackage opc = OPCPackage.open(new File(path), PackageAccess.READ_WRITE);
    			OutputStream os = enc.getDataStream(fs)) {
    			opc.save(os);
  			} catch (InvalidFormatException e) {
				e.printStackTrace();
			}

  			// Write out the encrypted version
  			try (FileOutputStream fos = new FileOutputStream(path)) {
    			fs.writeFilesystem(fos);
  			}
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (GeneralSecurityException e2) {
			e2.printStackTrace();
		}
	}

	
	public String newPathToTxt(String path) {
		return path.replace(".docx", ".txt");
	}

	public void convertTextToWord(String src,String des){
		try{
			//check source file existence
			File sourcefile = new File(src);
            if(!sourcefile.exists()){
                    System.out.println("Source not found");
                    System.exit(-1);
            }
            BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(sourcefile), Charset.forName("UTF-8"))); //wrap file reader in BufferedReader
            //so the reader can read the text by line
            XWPFDocument docx=new XWPFDocument(); //create document for ms word 2007+
            String text="";
            XWPFParagraph pa=docx.createParagraph(); //create paragraph in the document
            pa.setAlignment(ParagraphAlignment.RIGHT);
            XWPFRun run=pa.createRun(); //create run object in the paragraph
            run.setFontFamily("Arial"); //set the font name of the text to be written
            run.setFontSize(12); //set the font size of the text to be writtten
            while((text=br.readLine())!=null){
            	run.setText(text);
            	run.addCarriageReturn();
		    }
            //write the content of the document to the output file
         	File file = new File(des);
         	FileOutputStream out = new FileOutputStream(file);
         	docx.write(out);
         	docx.close();
         	out.close();
         	br.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}