<%@ page import="servlet.FileReader" language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Video Transcription</title>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	</head>
	<body>
		<div>
			<p align="center"><font face="verdana" color="green">Choose file to upload in server</font></p>
			
			<div>
				<input type="file" name="file" id="file"/>
				<button type="submit" value="Upload" name="submit" id="submit" onclick="upload()">Load</button>
			</div>
			
			<embed id="audioF" src=""
			loop="1"
			height="200"
			width="500"
			autostart="false">
			</embed>

		<div>
			<textarea rows="10" cols="2" id="treanscriptionText" style="width:100%;">try</textarea>
			
			<!--  <div id="docRow" class="row top20 proBg">
                <div class="col-lg-12">-->

            <div id="docNameWrapper" class="dropdown pro">
                <button id="docSaveButton" type="button" class="btn btn-primary" data-toggle="tooltip"
                        onclick="openASavedDoc()">
                	<i class="fa fa-floppy-o"></i>  Open a saved document
                </button>
                      
                <button id="docSaveButton" type="button" class="btn btn-primary" data-toggle="tooltip"
                        onclick="registerPopup()">
                	<i class="fa fa-floppy-o"></i>  Save
                </button>
            </div>
			
		</div>
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
				var fileConverter = new FileReader();
				document.write("line2");
				document.getElementById('treanscriptionText').value = "";
				//document.write("in openASavedDoc");
				//var doc = new ActiveXObject("Word.Application"); // creates the word object
				//doc.Visible=false; // doesn't display Word window
				//doc.Documents.Open("C:\\Users\\naama\\workspace\\VideoTranscription\\try.docx"); // specify path to document
				//copy the content from my word document and throw it into my variable
				//var txt;
				//txt = doc.Documents("C:\\Users\\naama\\workspace\\VideoTranscription\\try.docx").Content; 
				//document.all.myarea.value = txt;
				//doc.quit(0); // quit word (very important or you'll quickly chew up memory!
				//document.write("in openASavedDoc");
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
	</body>
</html>