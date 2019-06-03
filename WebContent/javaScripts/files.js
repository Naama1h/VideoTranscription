function upload() {
// upload the file
	var ChosenPath = document.getElementById('file').value;
			
	var audio1=document.getElementById("audioF1");
	var clone1=audio1.cloneNode(true);
	var s = String(ChosenPath).replace("C:\\Users\\User\\git\\VideoTranscription\\",'');
	//var s = String(ChosenPath);
	clone1.setAttribute('src',s);
	audio1.parentNode.replaceChild(clone1,audio1);

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
		//var selem = String(path);
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