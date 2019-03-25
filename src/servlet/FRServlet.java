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
	private static final String thisPath="C:\\Users\\naama\\workspace\\VideoTranscription";
	private String path = "";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");

		String text = request.getParameter("transcriptionText");
		System.out.println(request.getParameter("nisaion"));
		System.out.println(text);
		FileReader fr = new FileReader();
		fr.saveText(path, text);
		//response.setContentType("text/plain");
		//response.setCharacterEncoding("UTF-8");
		
		request.setAttribute("data", text);
		request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text;
		FileReader fr = new FileReader();
		request.setCharacterEncoding("UTF-8");
		path = request.getParameter("wordfile");
		if (path != null) {
			text = fr.getText(path);
		} else {
			text = "badPath";
		}
		
//		response.setContentType("text/plain");
//		response.setCharacterEncoding("UTF-8");
		request.setAttribute("data", text);
        request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
	}
}