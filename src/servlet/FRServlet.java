package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.net.www.http.HttpClient;

/**
 * Servlet implementation class FRServlet
 */
@WebServlet("/FRServlet")
public class FRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FRServlet() {
        super();
    }
	private String path = "";
	private String password = "";
	private String mp3sourse = "";
	private String fullName = "";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("transcriptionText");
		String lunguish = request.getParameter("lan");
		FileReaderClass fr = new FileReaderClass();
		IntactnessFile i = new IntactnessFile();
		fr.saveText(this.path, text, this.password);
		String intactnessMessage = i.checkIntactness(text, this.mp3sourse, lunguish);
		request.setAttribute("intactnessMessage", intactnessMessage);
		request.setAttribute("data", text);
		request.setAttribute("fullname", this.fullName);
		request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text;
		FileReaderClass fr = new FileReaderClass();
		this.path = request.getParameter("wordfile");
		this.password = request.getParameter("password");
		this.mp3sourse = request.getParameter("mp3file");
		this.fullName = request.getParameter("mp3fullfilename");
		if (this.path != null) {
			text = fr.getText(this.path,this.password,this.mp3sourse);
		} else {
			text = "badPath";
		}
		request.setAttribute("data", text);
		request.setAttribute("fullname", this.fullName);
        request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
	}
}