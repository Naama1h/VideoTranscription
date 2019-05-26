
<%@ page import="servlet.*" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>

<html dir="rtl">
<head>
<meta charset="utf-8">
<title>Video Transcription</title>

<link rel="stylesheet" href="Styles.css">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<div>
		<div
			style="background-image: url('backgrounds-blank-blue-953214.jpg'); height: 150px;">
			<p align="left" class="headline">
				<img src="pen_icon_no_bg.jpg"
					style="margin-top: 15px; width: 51px; height: 47px; border-radius: 70px; border-style: hidden;">
				<font
					style="font-family: 'Century Schoolbook', Georgia, Times, serif; margin: 16px 16px 16px; color: #ff4411; font-size: 48px; padding-bottom: 10px; border-bottom-color: gray;">Video
					Transcription</font>
			</p>
			<button id="about" onclick="showAbout()">About</button>
		</div>

		<div id="AboutInformation" class="modal"
			style="display: none; position: fixed; z-index: 1; padding-top: 100px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0.4); background-color: #fefefe;">
			<div class="modal-content"
				style="margin: auto; padding: 20px; border: 1px solid #888; width: 80%;">
				<span id="closeAbout" onclick="CloseAbout()" class="close"
					style="color: #aaaaaa; float: right; font-size: 28px; font-weight: bold;">&times;</span>
				<p>Some information in the Modal..</p>
			</div>
		</div>

		<div align="left">
			<p align="left">
				<font
					style="font-family: 'Trebuchet MS', Verdana, sans-serif; margin: 16px 16px 16px; color: #ff4411; font-size: 15px; padding-bottom: 10px;">Load
					a video to transcript</font>
			</p>
			<input type="file" name="file" id="file" />
			<button type="submit" value="Upload" name="submit" id="submit"
				style="" onclick="upload()">Load</button>
		</div>

		<div align="left">
			<div style="width: 60%; float: left">
				<embed id="audioF" src="" loop="1" height="200" width="500"
					autostart="false" style="width: 467px; height: 223px">
				</embed>
				<audio id="audioF1" controls>
					<source src="" type="audio/mp3">
				</audio>
				<video id="audioF2" style="width: 60%; float: left" controls>
					<source src="" type="video/mp4">
				</video>
			</div>
			<div
				style="width: 40%; float: right; background-color: #ffffcc; background-clip: padding-box; border-radius: 8px">
				<p>
					<font
						style="font-family: 'Trebuchet MS', Verdana, sans-serif; font-size: 14px; margin: 5px 5px 5px; text-align: center;">Please
						choose language for transcription, and insert names of client and
						therapist</font>
				</p>
				<div align="center">
					<form style="width: 86px;">
						<select style="font-family: 'Trebuchet MS', Verdana, sans-serif"
							id="languageSelect">
							<option>עברית</option>
							<option>English</option>
						</select>
					</form>
				</div>
				<div align="center">
					<form style="width: 173px;">
						<input type="text" id="therapist" name="therapist"
							placeholder="insert the therapist's name"
							style="float: inherit; width: 250px;"> <input type="text"
							id="client" name="client" placeholder="insert the client's name"
							style="float: inherit; width: 250px;">
					</form>
				</div>
				<div align="center">
					<button onclick="setData()">set</button>
				</div>

				<p hidden="" id="language" value="עברית">
				<p hidden="" id="therapistName"></p>
				<p hidden="" id="clientName"></p>
			</div>
		</div>


		<div>
			<form action="FRServlet" method="get">
				<textarea disabled rows="10" cols="2" id="transcriptionText"
					name="transcriptionText" style="width: 100%;">בחר הקלטה בכדי להתחיל</textarea>
				<input type="submit" value="save" />
			</form>

			<!--  <div id="docRow" class="row top20 proBg">
                <div class="col-lg-12">-->

			<form id="uploadwordfile" action="FRServlet" method="post">
				<input type="file" name="wordfile" id="wordfile" />
				<input type="text" name="password" id="password" placeholder="הכנס סיסמא">
				<input type="hidden" name="mp3file" id="mp3file" />
				<input type="hidden" name="mp3fullfilename" id="mp3fullfilename" value="">
				<input id="submitUploadWordFile" type="submit" value="open" disabled/>
			</form>

			<input type="hidden" id="intactness" value=<%= request.getAttribute("intactnessMessage") %>>
			<input type="hidden" id="chosenfilename" value=<%= request.getAttribute("fullname") %>>
			<textarea hidden rows="10" cols="2" id="hiddenP" style="width: 100%;"><%= request.getAttribute("data") %></textarea>
		</div>
		<script type="text/javascript">
			//request.setCharacterEncoding("UTF-8");
			function upload() {
				// upload the file
				var ChosenPath = document.getElementById('file').value;

				var audio=document.getElementById("audioF");
				var clone=audio.cloneNode(true);
				clone.setAttribute('src',ChosenPath);
				audio.parentNode.replaceChild(clone,audio);
				
				var audio1=document.getElementById("audioF1");
				var clone1=audio1.cloneNode(true);
				var s = String(ChosenPath).replace("C:\\Users\\User\\git\\VideoTranscription\\",'');
				//var s = String(ChosenPath);
				clone1.setAttribute('src',s);
				audio1.parentNode.replaceChild(clone1,audio1);
				
				//var audio2=document.getElementById("audioF2");
				//var clone2=audio2.cloneNode(true);
				//clone2.setAttribute('src',ChosenPath);
				//audio2.parentNode.replaceChild(clone2,audio2);
				var s2 = String(ChosenPath).split("\\")
				s2 = s2[s2.length - 1]
				document.getElementById("submitUploadWordFile").disabled = false;
				document.getElementById("transcriptionText").disabled = false;
				document.getElementById("mp3file").value = s2;
				document.getElementById("mp3fullfilename").value = ChosenPath;
			}
			
			function setAudio(path) {
				if (path != "null") {
					var audioelem = document.getElementById("audioF1");
					var cloneelem = audioelem.cloneNode(true);
					var selem = String(path).replace("C:\\Users\\User\\git\\VideoTranscription\\",'');
					//var s = String(path);
					cloneelem.setAttribute('src',selem);
					audioelem.parentNode.replaceChild(cloneelem,audioelem);

					document.getElementById("transcriptionText").disabled = false;
				}
			}
			
			setAudio(document.getElementById("chosenfilename").value);
			
			function uploudTestFromWordFile() {
			    var text = document.getElementById('hiddenP').value;
				if((text != "badPath") && (text != "null")) {
					document.getElementById('transcriptionText').value = text;
				} else if(text != "null") {
					alert('invalid file');
				}
			}
			var txt;
			
			uploudTestFromWordFile();
			
			function checkIfButtonsAreExist() {
				if (document.getElementById('0') != null) {
					//document.write('here');
					var i = 0;
					while (document.getElementById(i) != null) {
						var elem = document.getElementById(i);
						elem.parentNode.removeChild(elem);
						i++;
					}
				}
			}

			function openXmlOfTags(xml) {
				checkIfButtonsAreExist();
			    var x, i, xmlDoc, txt;
			    xmlDoc = xml.responseXML;
			    symbols = xmlDoc.getElementsByTagName('symbol');
			    names = xmlDoc.getElementsByTagName('name');
			    types = xmlDoc.getElementsByTagName('type');
			    opens = xmlDoc.getElementsByTagName('opentag');
			    openIndex = 0;
			    for (i = 0 ; i < names.length; i++) {
			    	name = names[i].childNodes[0].nodeValue;
			        var b = document.createElement("BUTTON");
				    var t = document.createTextNode(name);
				    b.appendChild(t);
				    // for client and therapist buttons
					if (name == "מטפל") {
						var s = "@מט" + document.getElementById('therapistName').innerHTML.substring(0,1) + "\t";
						b.setAttribute("name", s);
					} else if (name == "therapist") {
						var s = "@th" + document.getElementById('therapistName').innerHTML.substring(0,1) + "\t";
						b.setAttribute("name", s);
					} else if (name == "קליינט") {
						var s = "@קל" + document.getElementById('clientName').innerHTML.substring(0,1) + "\t";
						b.setAttribute("name", s);
					} else if (name == "client") {
						var s = "@cl" + document.getElementById('clientName').innerHTML.substring(0,1) + "\t";
						b.setAttribute("name", s);
					} else {
			        	b.setAttribute("name", symbols[i].childNodes[0].nodeValue);
					}
			        b.setAttribute("id", i);
			        type = types[i].childNodes[0].nodeValue;
			        b.setAttribute("type", type);
			        if (type == "close") {
			        	b.disabled = true;
			        } else {
			        	b.disabled = false;
			        	if (type == "open") {
			        		b.setAttribute("close", opens[openIndex].childNodes[0].nodeValue);
			        		openIndex++;
			        	}
			        }
			      	b.onclick = function() {
			      		writeSymbol(this.getAttribute("name"));
			      		if (this.getAttribute("type") == "open") {
				        	updateDisable(this.getAttribute("close"), xmlDoc);
				        } else if (this.getAttribute("type") == "close") {
				        	updateDisable("restartDisable", xmlDoc);
				        }
			      	};
			      	document.body.appendChild(b);
			    }
			}

			function writeSymbol(symbol) {
				typeInTextarea(document.getElementById('transcriptionText'), symbol);
				return false;
			}
			
			function typeInTextarea(el, newText) { 
				var start = el.selectionStart;
				var end = el.selectionEnd;
				var text = el.value;
				var before = text.substring(0, start);
				var after  = text.substring(end, text.length);
				el.value = before + newText + after;
				el.selectionStart = el.selectionEnd = start + newText.length;
				el.focus();
				return false
			}
			TherapistOrClient = 0;
			function getAudioFCurrentTime() {
				writeSymbol("\n");
				if (TherapistOrClient%2 == 0) {
					if (document.getElementById('language') == "English") {
						var s = "*th" + document.getElementById('therapistName').innerHTML.substring(0,1);
					} else {
						var s = "*מט" + document.getElementById('therapistName').innerHTML.substring(0,1);
					}
				} else {
					if (document.getElementById('language') == "English") {
						var s = "*cl" + document.getElementById('clientName').innerHTML.substring(0,1);
					} else {
						var s = "*קל" + document.getElementById('clientName').innerHTML.substring(0,1);
					}
				}
				var time = '-' + FormatTime(document.getElementById('audioF1').currentTime) + '-' + '\n' + s + ":    ";
				writeSymbol(time);
				TherapistOrClient += 1;
			}
			
			function FormatTime(seconds) {
				var hours = Math.floor(seconds/360);
				var mins = Math.floor((seconds-hours*360)/60);
				var sec = Math.floor(seconds%60);
				if (hours < 10) {
    				hours = "0" + hours; 
  				}
				if (mins < 10) {
    				mins = "0" + mins; 
  				}
  				if (sec < 10) {
    				sec  = "0" + sec;
  				}
				return String(hours) + ":" + String(mins) + ":" + String(sec)
			}
			
			document.onkeypress = function (e) { 
				e = e || window.event; 
				var charCode = e.charCode || e.keyCode; 
				if (e.keyCode === 13) {
					e.preventDefault();
					getAudioFCurrentTime();
				}
			};
			
			function updateDisable(element, xmlDoc) {
				//symbols = xmlDoc.getElementsByTagName('symbol');
		        names = xmlDoc.getElementsByTagName('name');
		        types = xmlDoc.getElementsByTagName('type');
				if (element == "restartDisable") {
				    for (i = 0 ; i < names.length; i++) {
					    if (types[i].childNodes[0].nodeValue == "close") {
					    	document.getElementById(i).disabled = true;
				        } else {
				        	document.getElementById(i).disabled = false;
				        }
				    }
				} else {
				    for (i = 0 ; i < names.length; i++) {
					    if (names[i].childNodes[0].nodeValue == element) {
					    	document.getElementById(i).disabled = false;
				        } else {
				        	document.getElementById(i).disabled = true;
				        }
				    }
				}
			}

			function setData() {
				var t = document.getElementById("therapist").value;
				var p = document.getElementById("client").value;
				document.getElementById("therapistName").innerHTML = t;
				document.getElementById("clientName").innerHTML = p;
				var x = document.getElementById("languageSelect");
				var i = x.selectedIndex;
				document.getElementById("language").innerHTML = x.options[i].text;
				
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
				    	openXmlOfTags(this);
				    }
				};
				if (document.getElementById('language').innerHTML == "עברית") {
					xhttp.open("GET", "tags.xml", true);
				} else if (document.getElementById('language').innerHTML == "English") {
					xhttp.open("GET", "EnglishTags.xml", true);
				} else {
					xhttp.open("GET", "tags.xml", true);
				}
				xhttp.send();
			}
			
			var aboutInfo = document.getElementById("AboutInformation");
			var btn = document.getElementById("about");
			var span = document.getElementsByClassName("close")[0];

			function showAbout() {
 				aboutInfo.style.display = "block";
			}

			function CloseAbout() {
 				aboutInfo.style.display = "none";
			}
			//window.onclick = function(event) {
  				//if (event.target == aboutInfo) {
    				//aboutInfo.style.display = "none";
  				//}
			//}
			
			function alertIntactness(message) {
				if (message != "null" && message != "") {
					if (message == "missBeginning") {
						alert("הפורמט אינו חוקי");
					} else if (message == "problemWithMp3") {
						alert("בעיה בשורת מקור הקובץ");
					} else if (message == "problemWithBeginning") {
						alert("בעיה בשורת ההתחל");
					} else if (message == "problemWithLanguage") {
						alert("בעיה בשורת השפה");
					} else if (message == "problemWithParticipants") {
						alert("בעיה בשורת המשתתפים");
					} else {
						alert("בעיה בפורמט :" + String(message));
					}
				}
			}
			alertIntactness(document.getElementById("intactness").value);
		</script>
	</div>
</body>
</html>