package servlet;

import java.applet.Applet;

public class FileReaderApplet extends Applet {
	public FileReaderClass getFileReader() {
        return new FileReaderClass();
    }
}