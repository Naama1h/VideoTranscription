<%@ page import="servlet.*"%>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Video Transcription</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<div>
		<p align="center">
			<font face="verdana" color="green">Choose file to upload in
				server</font>
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
			<textarea rows="10" cols="2" id="treanscriptionText"
				style="width: 100%;"></textarea>

			<!--  <div id="docRow" class="row top20 proBg">
                <div class="col-lg-12">-->

			<div id="docNameWrapper" class="dropdown pro">
				<button id="docSaveButton" type="button" class="btn btn-primary"
					data-toggle="tooltip" onclick="openASavedDoc()">
					<i class="fa fa-floppy-o"></i> Open a saved document
				</button>

				<button id="docSaveButton" type="button" class="btn btn-primary"
					data-toggle="tooltip" onclick="registerPopup()">
					<i class="fa fa-floppy-o"></i> Save
				</button>
			</div>

		</div>
		<script src= "https://www.java.com/js/deployJava.js"></script>
		<script>
    		<!-- applet id can be used to get a reference to the applet object -->
    		var attributes = { id:'fileReaderApplet',
       			code:'servlet.FileReaderApplet',  width:1, height:1} ;
    		var parameters = { jnlp_href: 'file_reader_applet.jnlp'} ;
    		deployJava.runApplet(attributes, parameters, '1.6');
		</script>
		<script type="text/javascript">
			function upload() {
				// upload the file
				var ChosenPath = document.getElementById('file').value;
				var audio=document.getElementById("audioF");
				var clone=audio.cloneNode(true);
				clone.setAttribute('src',ChosenPath);
				audio.parentNode.replaceChild(clone,audio)
			}
			
			function openASavedDoc() {
				//document.getElementById('treanscriptionText').value = "hi";
				//var str = FileReader.getText("C:\\Users\\User\\git\\VideoTranscription\\try.docx");
				var fileReader = fileReaderApplet.getFileReader();
				document.getElementById('treanscriptionText').value = fileReader.getText("C:\\Users\\User\\git\\VideoTranscription\\try.docx");
			};
				
			function registerPopup() {
				//var textToWrite = document.getElementById('treanscriptionText').innerHTML;
				//var textFileAsBlob = new Blob([ textToWrite ], { type: 'text/plain' });
				//var fileNameToSaveAs = "ecc.docx";
				//var downloadLink = document.createElement("a");
				//downloadLink.download = fileNameToSaveAs;
				//downloadLink.innerHTML = "Download File";
				//if (window.webkitURL != null) {
				    // Chrome allows the link to be clicked without actually adding it to the DOM.
				    //downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
				//} else {
				    // Firefox requires the link to be added to the DOM before it can be clicked.
				    //downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
				    //downloadLink.onclick = destroyClickedElement;
				    //downloadLink.style.display = "none";
				    //document.body.appendChild(downloadLink);
				//}

				//downloadLink.click();
				//document.write("in registerPopup");
				
				//var text = document.getElementById("treanscriptionText").value;
				//document.write("in registerPopup");
			    //text = text.replace(/\n/g, "\r\n"); // To retain the Line breaks.
			    //var blob = new Blob([text], { type: "text/plain"});
			    //var anchor = document.createElement("a");
			    //anchor.download = "my-filename.txt";
			    //anchor.href = window.URL.createObjectURL(blob);
			    //anchor.target ="_blank";
			    //anchor.style.display = "none"; // just to be safe!
			    //document.body.appendChild(anchor);
			    //anchor.click();
			    //document.body.removeChild(anchor);
			    
				var textToWrite = document.getElementById("treanscriptionText").value;
				var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
			    var fileNameToSaveAs = "try.txt"
			    var downloadLink = document.createElement("a");
			    downloadLink.download = fileNameToSaveAs;
			    downloadLink.innerHTML = "Download File";
			    if (window.webkitURL != null)
			    {
			        // Chrome allows the link to be clicked
			        // without actually adding it to the DOM.
			        downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
			    }
			    else
			    {
			        // Firefox requires the link to be added to the DOM
			        // before it can be clicked.
			        downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
			        downloadLink.onclick = destroyClickedElement;
			        downloadLink.style.display = "none";
			        document.body.appendChild(downloadLink);
			    }

			    downloadLink.click();
			    //document.write("in registerPopup");
			}
			
			var button = document.getElementById('docSaveButton');
			button.addEventListener('click', registerPopup);

			function destroyClickedElement(event) {
			    // remove the link from the DOM
			    document.body.removeChild(event.target);
			    //document.write("in destroyClickedElement");
			}

		</script>
	</div>
</body>
</html>