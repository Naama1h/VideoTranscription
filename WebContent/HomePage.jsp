<%@ page import="servlet.*" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<html dir="rtl">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Video Transcription</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<div>
		<p align="center">
			<font face="verdana" color="green">Choose file to upload in server</font>
		</p>

		<div>
			<input type="file" name="file" id="file" />
			<button type="submit" value="Upload" name="submit" id="submit"
				onclick="upload()">Load</button>
		</div>

		<embed id="audioF" src="" loop="1" height="200" width="500"
			autostart="false">
		</embed>

		<div>
			<form action="FRServlet" method="get">
				<input type = "text" id="nisaion" name="nisaion" value="נסיון">
				<textarea rows="10" cols="2" id="transcriptionText"
				name="transcriptionText" style="width: 100%;"></textarea>
				<input type="submit" value="save"/>
			</form>

			<!--  <div id="docRow" class="row top20 proBg">
                <div class="col-lg-12">-->

         	<form id="uploadwordfile" action="FRServlet" method="post">
         		<input type="file" name="wordfile" id="wordfile" />
				<input type="submit" value="open"/>
        	</form>
                			
			<div>
				<p id="symbol">Symbol</p>
			</div>
			
			<textarea hidden rows="10" cols="2" id="hiddenP"
				style="width: 100%;"><%= request.getAttribute("data") %></textarea>
		</div>
		<script type="text/javascript">
			//request.setCharacterEncoding("UTF-8");
			function upload() {
				// upload the file
				var ChosenPath = document.getElementById('file').value;
				var audio=document.getElementById("audioF");
				var clone=audio.cloneNode(true);
				clone.setAttribute('src',ChosenPath);
				audio.parentNode.replaceChild(clone,audio)
			}
			
			function uploudTestFromWordFile() {
			    var text = document.getElementById('hiddenP').value;
				if((text != "badPath") && (text != "null")) {
					document.getElementById('transcriptionText').value = text;
				} else if(text != "null") {
					alert('invalid file');
				}
			}
			uploudTestFromWordFile();
			
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			    	openXmlOfTags(this);
			    }
			};
			xhttp.open("GET", "tags.xml", true);
			xhttp.send();

			function openXmlOfTags(xml) {
			    var x, i, xmlDoc, txt;
			    xmlDoc = xml.responseXML;
			    txt = "";
			    symbols = xmlDoc.getElementsByTagName('symbol');
			    for (i = 0 ; i <symbols.length; i++) {
			        txt += symbols[i].childNodes[0].nodeValue + "<br>";
			    }
			    document.getElementById("symbol").innerHTML = txt;

			    names = xmlDoc.getElementsByTagName('name');
			    for (i = 0 ; i <names.length; i++) {
			        var b = document.createElement("BUTTON");
				    var t = document.createTextNode(names[i].childNodes[0].nodeValue);
				    b.appendChild(t);
				    document.body.appendChild(b);
			    }
			}
		</script>
	</div>
</body>
</html>