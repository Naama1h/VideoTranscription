package servlet;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

public class FileReader {

	public static String nisaion() {
		return "ya man";
	}
	
	public static String getText(String path) {
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

	public static void main(String[] args) {
		System.out.println(getText("C:\\Users\\User\\git\\VideoTranscription\\try.docx"));
		System.out.print("last one");
	}
}
