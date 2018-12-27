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
			
			<embed id="audioF" src="C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3"
			loop="1"
			height="200"
			width="500"
			autostart="false">
			</embed>
			
		</div>
		<script type="text/javascript">
			function upload() {
				
				//var ChosenPath = document.getElementById('file');
				//var pathValue = ChosenPath.value;
				//document.write(pathValue);
				//var newElement = "<embed src='" + pathValue +"' id='audioF' loop='1' height='200' width='500' autostart='false'></embed>";
				//document.write(newElement);
				//var parent = $('#audioF').parent();
				//document.write(pathValue);
				//$('#audioF').remove();
				//parent.append(newElement);
				
				//document.write(document.getElementById('file').value);
				//var ChosenPath = document.getElementById('file');
				//var pathValue = ChosenPath.value;
				//document.write(path);
				//var file = document.getElementById('audio');
				//document.write("oooofff");
				//var clone = file.cloneNode(true);
				
				//var aa =  $("#audioF").clone();
				//document.write(pathValue);
				//aa.find('embed').attr('src', pathValue);
				//$("#audioF").replaceWith(aa);
				//alert( $("#audioF").find('embed').attr('src'));
				
				//clone.setAttribute('src',pathValue);
				//file.parentNode.replaceChild(clone,file);
				//document.write(pathValue);
				//file.src = pathValue;
				//file.attr("src",PathValue);
				
				//file.play();
				//alert('upload has been submitted');
				
				$('#audioF').remove();
				document.write("oooofff");
				var ChosenPath = document.getElementById('file');
				var pathValue = ChosenPath.value;
				var myEmbed = document.createElement("embed");
				myEmbed.setAttribute("src", pathValue);
				myEmbed.setAttribute("id", "audioF");
				myEmbed.setAttribute("loop", "1");
				myEmbed.setAttribute("height", "200");
				myEmbed.setAttribute("width", "500");
				myEmbed.setAttribute("autostart", "false");
				document.body.appendChild(myEmbed);
				
				
				//C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3
				
				//<form method="post" name="form" id="uplaodFile" enctype="multipart/form-data" >
				//<input type="file" name="file" id="file"/>
				//<input type="submit" value="Upload" name="submit" id="submit" onclick="upload()"/>
				//</form>
				
				
				//action="${pageContext.request.contextPath}/TVServlet"
			}
			
			function onFileSelected(file, directory) {
				//var ChosenPath = document.getElementById('file');
				//var pathValue = ChosenPath.value;
				//jQuery('embed#audio').attr('src', pathValue);
				//document.write('oooooofffff');
				//var parent = $('embed#audio').parent();
				//var newElement = "<embed src='new src' id='audio'>";

				//$('embed#audio').remove();
				//parent.append(newElement);
				};
		</script>
	</body>
</html>