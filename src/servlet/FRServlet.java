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
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect(thisPath + "\\WebContent\\HomePage.jsp");
		String text = request.getParameter("treanscriptionText");
		String path = "C:\\Users\\User\\git\\VideoTranscription\\doc";
		FileReader fr = new FileReader();
		fr.saveText(path, text);
		System.out.println(text);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("data", text);
		request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		String text;
		FileReader fr = new FileReader();
		String fileName = request.getParameter("wordfile");
		if (fileName != null) {
			text = fr.getText(fileName);
		} else {
			text = "badPath";
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		
		//PrintWriter out = response.getWriter();
		System.out.println("after set request");
		//out.append("<p value='try1' />");
		//out.append(text);
//		out.close();
		request.setAttribute("data", text);

		//out.write(text);
		System.out.println("after out.write");
		//out.append((String)request.getAttribute("data"));
        request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
        System.out.println("end of function post");
		//response.setCharacterEncoding(text);
		//response.sendRedirect(thisPath + "\\WebContent\\HomePage.jsp");
	}
}