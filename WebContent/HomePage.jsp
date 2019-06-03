
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
			<button id="Instructions" onclick="showInstructions()">Instructions</button>
		</div>

		<div id="AboutInformation" class="modal"
			style="display: none; position: fixed; z-index: 1; padding-top: 100px; left: 10%; top: 10%; width: 80%; height: 50%; overflow: auto; background-color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0.4); background-color: #FFF2F9; font-family: Verdana, Arial, Sans-Serif; color: #800040; text-align: center; right: 10%; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: thin; border-right-style: none; border-left-style: none; border-bottom-style: none; border-top-style: none; border-bottom-color: #000000; border-left-color: #000000; border-top-color: #000000; border-right-color: #000000">
			<div class="modal-content">
				<span id="closeAbout" onclick="CloseAbout()" class="close">&times;</span>
				<h2>About</h2>
				<p id="AboutText" style="color: #930049"></p>
			</div>
		</div><div id="UsageInstructions" class="modal2" style="display: none; position: fixed; z-index: 1; padding-top: 100px; left: 10%; top: 0px; width: 80%; height: 100%; overflow: auto; background-color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0.4); background-color: #EDE2EF; font-family: Verdana, Arial, Sans-Serif; color: #400040; right: 10%; cursor: hand; text-decoration: none">
			<div class="modal-content2" style="margin: auto; padding: 20px; border: 1px solid #888; width: 80%;">
				<span id="closeInstruction" onclick="CloseInstructions()" class="closeInstr" style="color: #aaaaaa; float: right; font-size: 28px; font-weight: bold;">&times;</span>
					<h2><p align="center"><b>Usage Instructions</b></p></h2>
				<p id="UsageInstructionsText" style="color: #472C4B; overflow: scroll; width: 100%; font-family: Verdana, Arial, Sans-Serif; height: 100%"></p>
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
				<audio id="audioF1" controls>
					<source src="" type="audio/mp3">
				</audio>
			</div>
			<div
				style="width: 496px; float: right; background-color: #ffffcc; background-clip: padding-box; border-radius: 8px">
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
					name="transcriptionText" style="width: 1272px; background-attachment: fixed">בחר הקלטה בכדי להתחיל</textarea>
				<input type="submit" value="save">
			</form>

			<form id="uploadwordfile" action="FRServlet" method="post" style="width: 775px; ">
				<input type="file" name="wordfile" id="wordfile">
				<input type="text" name="password" id="password" placeholder="הכנס סיסמא">
				<input type="hidden" name="mp3file" id="mp3file">
				<input type="hidden" name="mp3fullfilename" id="mp3fullfilename" value="">
				<input id="submitUploadWordFile" type="submit" value="open" disabled>
			</form>
			<!--  <div id="docRow" class="row top20 proBg">
                <div class="col-lg-12">-->

			

			<input type="hidden" id="intactness" value=<%= request.getAttribute("intactnessMessage") %>>
			<input type="hidden" id="chosenfilename" value=<%= request.getAttribute("fullname") %>>
			<textarea hidden rows="10" cols="2" id="hiddenP"><%= request.getAttribute("data") %></textarea>
		</div>
		<script type="text/javascript" src="javaScripts/files.js"></script>
		<script type="text/javascript" src="javaScripts/modals.js"></script>
		<script type="text/javascript" src="javaScripts/textArea.js"></script>
		<script type="text/javascript" src="javaScripts/alertIntactness.js"/></script>
	</div>
</body>
</html>