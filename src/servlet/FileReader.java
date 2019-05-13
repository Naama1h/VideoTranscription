package servlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

public class FileReader {
	
	public String getText(String path, String password) {
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
	        	return "@ התחל:\n";
	        }
	        return text;
		} catch (GeneralSecurityException ex) {
			return "badPassword";
		} catch (org.apache.poi.EmptyFileException e1) {
			e1.printStackTrace();
			return "@ התחל:\n";
		} catch (Exception e) {
			e.printStackTrace();
			return "badPath";
		}
	}

	public void saveText(String path, String text, String password) {
		// change the text in the file
		XWPFDocument document = new XWPFDocument();
		XWPFParagraph tmpParagraph = document.createParagraph();
		XWPFRun tmpRun = tmpParagraph.createRun();
		String[] para = text.split("\n");
		for (int i=0; i < para.length ; i++) {
			tmpRun.setText(para[i]);
			tmpRun.addCarriageReturn();
			tmpRun.setFontSize(12);
		}
		tmpRun.setText("@ סיום");
		tmpRun.addCarriageReturn();
		tmpRun.setFontSize(12);
		try {
			document.write(new FileOutputStream(new File(path)));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// try to encryption with password
		/*
		POIFSFileSystem fs = new POIFSFileSystem();
		EncryptionInfo info = new EncryptionInfo(EncryptionMode.agile);
		Encryptor enc = info.getEncryptor();
		enc.confirmPassword(password);
		try (OutputStream os = enc.getDataStream(fs)) {
			document = new XWPFDocument();
			document.write(os);
			document.close();
			// Write out the encrypted version
			FileOutputStream fos = new FileOutputStream(path);
			fs.writeFilesystem(fos);
			fos.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (GeneralSecurityException e2) {
			e2.printStackTrace();
		}*/
	}
}
