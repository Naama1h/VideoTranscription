
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
	<header style="text-align: center;">
		<div style="background-image: url('backgrounds-blank-blue-953214.jpg'); height: 150px;">
			<div>
				<p align="left" style="font-family: 'Century Schoolbook', Georgia, Times, serif; margin: 16px 16px 16px; color: #ff4411; font-size: 48px; padding-bottom: 10px; border-bottom-color: gray;">
				<img src="pen_icon_no_bg.jpg" alt="logo" style="margin-top: 15px; width: 51px; height: 47px; border-radius: 63px;">
				Video Transcription
				</p>
				
			</div>
			<div align="left" style="margin-left: 20px">
				<button id="about" onclick="showAbout()">About</button> 
				<button id="Instructions" onclick="showInstructions()">Instructions</button>
			</div>
		</div>

		<div id="AboutInformation" class="modal">
			<div class="modal-content">
				<span id="closeAbout" onclick="CloseAbout()" class="close">&times;</span>
				<h2 style="font-family: 'Trebuchet MS', Verdana, sans-serif;">About</h2>
				<p id="AboutText" style="color: #930049; font-family: 'Trebuchet MS', Verdana, sans-serif;"></p>
			</div>
		</div>
		<div id="UsageInstructions" class="modal">
			<div class="modal-content">
				<span id="closeInstruction" onclick="CloseInstructions()" class="close">&times;</span>
				<h2 style="font-family: 'Trebuchet MS', Verdana, sans-serif;">Usage Instructions</h2>
				<p id="UsageInstructionsText" style="color: #472C4B; font-family: 'Trebuchet MS', Verdana, sans-serif;"></p>
			</div>
		</div> 
	</header>
	<section style="float: left; margin-top: 10px; margin-right: 10px; margin-left: 10px;">
		<section style="float: left; width: 45%; height: 300px;">
				<p align="left">
					<font
						style="font-family: 'Trebuchet MS', Verdana, sans-serif; margin: 16px 16px 16px; color: #ff4411; font-size: 15px; padding-bottom: 10px;">Load
						a video to transcript</font>
				</p>
				<input type="file" name="file" id="file" accept=".mp3"/>
				<button type="submit" value="Upload" name="submit" id="submit"
					style="" onclick="upload()">Load</button>
				
				<div align="right">
					<audio style="float: center; width: 100%" id="audioF1" controls="controls">
						<source src="" type="audio/mp3">
						<source src="" type="audio/ogg">
					</audio>
				</div>
		</section>
		<section style="float: right; width: 45%; height: 300px;">
				<div style="float: right; background-color: #ffffcc; background-clip: padding-box; border-radius: 8px; text-align: center;">
					<p>
						<font style="font-family: 'Trebuchet MS', Verdana, sans-serif; font-size: 14px; margin: 5px 5px 5px; text-align: center;">Please
							choose language for transcription, and insert names of client and
							therapist</font>
					</p>
					<div align="center">
						<form style="width: 86px;">
							<select style="font-family: 'Trebuchet MS', Verdana, sans-serif;"
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
								style="float: inherit; width: 250px;">
						    <input type="text"
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
		</section>
	</section>
	<section style="float: left; margin-right: 10px; margin-left: 10px; margin-bottom: 10px;">
		<section style="float: left; width: 48%; height: 500px;">
			<section style="float: center; width: 100%; height: 90%;">
				<form action="FRServlet" method="get">
					<textarea disabled rows="10" cols="2" id="transcriptionText"
						name="transcriptionText" style="hight:100%; width:100%; background-attachment: fixed">בחר הקלטה בכדי להתחיל</textarea>
					<input type="hidden" name="lan" id="lan" value="">
					<input type="submit" value="save">
				</form>
			</section>
			<section style="float: center; width: 100%; height: 10%;">
				<form id="uploadwordfile" action="FRServlet" method="post" style="width: 775px;">
					<input type="file" name="wordfile" id="wordfile" accept=".docx">
					<input type="text" name="password" id="password" placeholder="הכנס סיסמא">
					<input type="hidden" name="mp3file" id="mp3file">
					<input type="hidden" name="mp3fullfilename" id="mp3fullfilename" value="">
					<input id="submitUploadWordFile" type="submit" value="open" disabled>
				</form>
			</section>
		</section>
	
		<section style="float: left; width: 48%; height: 500px;">
			<div id="buttons"></div>
		</section>
	</section>
	
	<section style="float: center; margin-right: 10px; margin-left: 10px; margin-bottom: 10px;">
		<input type="hidden" id="intactness" value=<%= request.getAttribute("intactnessMessage") %>>
		<input type="hidden" id="chosenfilename" value=<%= request.getAttribute("fullname") %>>
		<textarea style="display:none;" rows="10" cols="2" id="hiddenP"><%= request.getAttribute("data") %></textarea>

		<script type="text/javascript" src="javaScripts/files.js"></script>
		<script type="text/javascript" src="javaScripts/modals.js"></script>
		<script type="text/javascript" src="javaScripts/textArea.js"></script>
		<script type="text/javascript" src="javaScripts/alertIntactness.js"/></script>
	</section>
</body>
</html>