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
			<form method="post" name="form" id="uplaodFile" enctype="multipart/form-data" >
				<input type="file" name="file" id="file"/>
				<input type="submit" value="Upload" name="submit" id="submit" onclick="upload()"/>
			</form>
			
			<embed id="audio" src="C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3"
			loop="1"
			height="200"
			width="500"
			autostart="false">
			</embed>
			
		</div>
		<script type="text/javascript">
			function upload() {
				//document.write(document.getElementById('file').value);
				var ChosenPath = document.getElementById('file');
				var pathValue = ChosenPath.value;
				//document.write(path);
				var file = document.getElementById('audio'); 
				//document.write(pathValue);
				file.src = pathValue;
				//file.setAttribute("src",variable);
				//file.play();
				//alert('upload has been submitted');
				//C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3
			}
		</script>
	</body>
</html>