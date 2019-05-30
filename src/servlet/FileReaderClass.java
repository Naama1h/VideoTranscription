package servlet;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.util.List;

import org.apache.poi.common.usermodel.fonts.FontCharset;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.openxml4j.opc.PackageAccess;
import org.apache.poi.poifs.crypt.Decryptor;
import org.apache.poi.poifs.crypt.EncryptionInfo;
import org.apache.poi.poifs.crypt.EncryptionMode;
import org.apache.poi.poifs.crypt.Encryptor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTP;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTPPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STOnOff;

public class FileReaderClass {
	
	public String getText(String path, String password, String mp3sourse) {
		try {
			POIFSFileSystem filesystem = new POIFSFileSystem(new FileInputStream(path));
			EncryptionInfo info = new EncryptionInfo(filesystem);
			Decryptor d = Decryptor.getInstance(info);
			if (!d.verifyPassword(password)) {
			    throw new RuntimeException("Unable to process: document is encrypted");
			}
			InputStream dataStream = d.getDataStream(filesystem);
			XWPFDocument document = new XWPFDocument(dataStream);    
			List<XWPFParagraph> paragraphs = document.getParagraphs();
	        String text = "";
	        for (int i=0; i < paragraphs.size() ; i++) {
	        	text = text + paragraphs.get(i).getText() + "\n";
	        }
	        if (text.contains("@ סיום\n")) {
	        	text = text.replaceAll("@ סיום\n", "");
	        }
	        filesystem.close();
	        document.close();
	        if (text.equals("\n")) {
	        	return "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
	        }
	        return text;
		} catch (org.apache.poi.poifs.filesystem.OfficeXmlFileException ex1) {
			try {
				FileInputStream fis2 = new FileInputStream(path);
				XWPFDocument xdoc2 = new XWPFDocument(OPCPackage.open(fis2));
				List<XWPFParagraph> paragraphList = xdoc2.getParagraphs();
		        String text = "";
		        for (int i=0; i < paragraphList.size() ; i++) {
		        	text = text + paragraphList.get(i).getText() + "\n";
		        }
		        xdoc2.close();
		        fis2.close();
		        if (text.contains("@ סיום\n")) {
		        	text = text.replaceAll("@ סיום\n", "");
		        }
		        if (text.equals("\n")) {
		        	return "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
		        }
		        return text;
			} catch (Exception ex) {
				ex.printStackTrace();
				return "badPath";
			}
		} catch (GeneralSecurityException ex) {
			return "badPassword";
		} catch (org.apache.poi.EmptyFileException e1) {
			e1.printStackTrace();
			return "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
		} catch (Exception e) {
			e.printStackTrace();
			return "badPath";
		}
	}

	public void saveText(String path, String text, String password) {
		/*
        BufferedWriter writer = null;
        try {
        	writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:\\Users\\User\\git\\VideoTranscription\\try.txt"), Charset.forName("UTF-8")));
            writer.write(text);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
            	writer.close();
            } catch (Exception e) {
            }
        }
        convertTextToWord("C:\\Users\\User\\git\\VideoTranscription\\try.txt",path);
		*/
		// change the text in the file
		XWPFDocument document = new XWPFDocument();
		XWPFParagraph tmpParagraph = document.createParagraph();
		tmpParagraph.setAlignment(ParagraphAlignment.LEFT);
	    XWPFRun tmpRun = tmpParagraph.createRun();
		String[] para = text.split("\n");
		tmpRun.setFontFamily("Arial (גוף עברי)");
		//tmpRun.setLang("HEBREW");
		//tmpRun.setFontFamily(FontCharset.HEBREW.name());
		for (int i=0; i < para.length ; i++) {
			tmpRun.setText(para[i]);
			tmpRun.addCarriageReturn();
			tmpRun.setFontSize(12);
		}
		tmpRun.setText("@ סיום");
		tmpRun.setFontFamily("Arial (גוף עברי)");
		//setOrientation(tmpParagraph, TextOrientation.RTL);
		//tmpRun.addCarriageReturn();
		tmpRun.setFontSize(12);
		try {
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
	private enum TextOrientation {
        LTR,
        RTL
    }
	private static void setOrientation(XWPFParagraph par, TextOrientation orientation) {
        if ( par.getCTP().getPPr()==null ) {
            par.getCTP().addNewPPr();
        }
        if ( par.getCTP().getPPr().getBidi()==null ) {
           par.getCTP().getPPr().addNewBidi();
        }
        par.getCTP().getPPr().getBidi().setVal(orientation==TextOrientation.RTL?STOnOff.ON:STOnOff.OFF);
    }

	public void convertTextToWord(String src,String des){
		try{
			//check source file existence
			File sourcefile = new File(src);
            if(!sourcefile.exists()){
                    System.out.println("Source not found");
                    System.exit(-1);
            }
            FileReader fr=new FileReader(sourcefile); //create file reader
            BufferedReader br=new BufferedReader(fr); //wrap file reader in BufferedReader
            //so the reader can read the text by line
            XWPFDocument docx=new XWPFDocument(); //create document for ms word 2007+
            String text="";
            while((text=br.readLine())!=null){
            	XWPFParagraph pa=docx.createParagraph(); //create paragraph in the document
                XWPFRun run=pa.createRun(); //create run object in the paragraph
                run.setFontFamily("Arial"); //set the font name of the text to be written
                run.setFontSize(12); //set the font size of the text to be writtten
                run.setText(text);//add text to paragraph
                run.addBreak(); //add break
		   }
           //check destination directory
           File desdir;
           //if(des.lastIndexOf('/')!=-1){
           //        desdir=new File(des.substring(0,des.lastIndexOf('/')));
           //        if(!desdir.exists())
           //                desdir.mkdirs(); //create destination directory
           //}
           docx.write(new FileOutputStream(new File(des))); //write the content of the document to the output file
		   br.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}