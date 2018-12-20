<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Video Transcription</title>
	</head>
	<body>
		<div>
			<h3>Choose file to upload in server</h3>
			<form method="post" name="uplaoudFile">
				<input type="file" name="file">
				<input type="submit" value="Upload" onclick="upload()"/>
			</form>
			
			<embed src="C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3"
			loop="1"
			height="200"
			width="500"
			autostart="false">
			</embed>
		</div>
		
		<script>
		<!--
			function upload() {
				if(ServletFileUpload.isMultipartContent(request)){
					try {
						List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
						for(FileItem item : multiparts){
							if(!item.isFormField()){
								String name = new File(item.getName()).getName();
								item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
							}
						}      
						//File uploaded successfully
						request.setAttribute("message", "File Uploaded Successfully");
					} catch (Exception ex) {
						request.setAttribute("message", "File Upload Failed due to " + ex);
					}         
		    	}else{
		    		request.setAttribute("message","Sorry this Servlet only handles file upload request");
		    	}
				request.getRequestDispatcher("/Upload.jsp").forward(request, response);
			}
		
		</script>
	</body>
</html>
