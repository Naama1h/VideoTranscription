package servlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

public class FileReader {

	public String getText(String path) {
		try {
			System.out.println("enter function");
            File file = new File(path);
            FileInputStream fis = new FileInputStream(file.getAbsolutePath());
            XWPFDocument document = new XWPFDocument(fis);

            List<XWPFParagraph> paragraphs = document.getParagraphs();
            String text = "";
            for (XWPFParagraph para : paragraphs) {
                text = text + para.getText() + "\n";
            }
            fis.close();
            document.close();
            System.out.println(text);
            return text;
        } catch (Exception e) {
            e.printStackTrace();
            return "badPath";
        }
	}

	public void saveText(String path, String text) {
		XWPFDocument document = new XWPFDocument();
		XWPFParagraph tmpParagraph = document.createParagraph();
		XWPFRun tmpRun = tmpParagraph.createRun();
		tmpRun.setText(text);
		tmpRun.setFontSize(12);
		try {
			document.write(new FileOutputStream(new File(path+".docx")));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
