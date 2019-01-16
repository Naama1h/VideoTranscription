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
			<!--<form method="post" name="form" id="uplaodFile" enctype="multipart/form-data" >
				<input type="file" name="file" id="file"/>
				<input type="submit" value="Upload" name="submit" id="submit" onclick="upload()"/>
			</form> -->
			
			<div>
				<input type="file" name="file" id="file"/>
				<button type="submit" value="Upload" name="submit" id="submit" onclick="upload()">Load</button>
			</div>
			
			
			<embed id="audioF" src="C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3"
			loop="1"
			height="200"
			width="500"
			autostart="false">
			</embed>
			
		</div>
		<div>
			<textarea cols="2" id="treanscriptionText" style="width:100%;"></textarea>
			
			<div id="docRow" class="row top20 proBg">
                <div class="col-lg-12">

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
				
				var ChosenPath = document.getElementById('file');
				var pathValue = ChosenPath.value;
				var game=document.getElementById("audioF");
				var clone=game.cloneNode(true);
				clone.setAttribute('src',pathValue);
				game.parentNode.replaceChild(clone,game)
				
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
				
				//document.write("oooofff");
				//$('#audioF').remove();
				
				//var ChosenPath = document.getElementById('file');
				//var pathValue = ChosenPath.value;
				//var myEmbed = document.createElement("embed");
				//myEmbed.setAttribute("src", pathValue);
				//myEmbed.setAttribute("id", "audioF");
				//myEmbed.setAttribute("loop", "1");
				//myEmbed.setAttribute("height", "200");
				//myEmbed.setAttribute("width", "500");
				//myEmbed.setAttribute("autostart", "false");
				//document.body.appendChild(myEmbed);
				
				
				//C:\Users\naama\workspace\VideoTranscription\mp3\tetaaru_lahem.mp3
				
				//<form method="post" name="form" id="uplaodFile" enctype="multipart/form-data" >
				//<input type="file" name="file" id="file"/>
				//<input type="submit" value="Upload" name="submit" id="submit" onclick="upload()"/>
				//</form>
				
				
				//action="${pageContext.request.contextPath}/TVServlet"
			}
			
			function openASavedDoc() {
				//document.write("in openASavedDoc");
				var doc = new ActiveXObject("Word.Application"); // creates the word object
				doc.Visible=false; // doesn't display Word window
				doc.Documents.Open("C:\\Users\\naama\\workspace\\VideoTranscription\\try.docx"); // specify path to document
				//copy the content from my word document and throw it into my variable
				var txt;
				txt = doc.Documents("C:\\Users\\naama\\workspace\\VideoTranscription\\try.docx").Content; 
				document.all.myarea.value = txt;
				doc.quit(0); // quit word (very important or you'll quickly chew up memory!
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