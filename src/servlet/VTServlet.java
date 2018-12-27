package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 * Servlet implementation class VTServlet
 */
@WebServlet("/VTServlet")
public class VTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VTServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	private static final String thisPath="C:\\Users\\naama\\workspace\\VideoTranscription"; 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		PrintWriter out = response.getWriter();
//		out.println("Hello World, Naama");
		//response.sendRedirect(thisPath + "\\WebContent\\HomePage.jsp");
	}

	private final String UPLOAD_DIRECTORY = "C:\\Users\\naama\\workspace\\VideoTranscription\\files";
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//process only if its multipart content
		
//		PrintWriter out = response.getWriter();
//
//		if(ServletFileUpload.isMultipartContent(request)){
//			FileItemFactory itemFactory = new DiskFileItemFactory();
//			ServletFileUpload upload = new ServletFileUpload(itemFactory);
//			try {
//				List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
//				for (FileItem item : items) {
//					String contentType = item.getContentType();
//					
//					if(!item.isFormField()){
//						String name = new File(item.getName()).getName();
//						item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
//					}
//				}      
//				//File uploaded successfully
//				request.setAttribute("message", "File Uploaded Successfully");
//			} catch (Exception ex) {
//				request.setAttribute("message", "File Upload Failed due to " + ex);
//			}         
//	    } else {
//	    	request.setAttribute("message","Sorry this Servlet only handles file upload request");
//	    }
		//request.getRequestDispatcher("/Upload.jsp").forward(request, response);
	}

}
