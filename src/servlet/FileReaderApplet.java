package servlet;

import java.applet.Applet;

public class FileReaderApplet extends Applet {
	public FileReader getFileReader() {
        return new FileReader();
    }
}