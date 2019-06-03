function LoadModals() {
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "Modals.xml", false);
	xhttp.send();
	var xmlDoc = xhttp.responseXML;
	if (!xmlDoc) {
		xmlDoc = (new DOMParser()).parseFromString(xhttp.responseText,'text/xml');
	}
	var modals = xmlDoc.getElementsByTagName('modal');
	var i, name, text;
	for (i = 0 ; i < modals.length; i++) {
	   	name = modals[i].getElementsByTagName("name")[0].firstChild.data;
	   	text = modals[i].getElementsByTagName("text")[0].firstChild.data;
	   	document.getElementById(name).innerHTML = text.replace(/#/g,"<br>");
	   	//if (i>0){document.write(name);}
	}
	//document.write(name+text);
}

var aboutInfo = document.getElementById("AboutInformation");
var InstructionInfo = document.getElementById("UsageInstructions");
var btn = document.getElementById("about");
var btn2 = document.getElementById("Instructions");
//var span = document.getElementsByClassName("close")[0]; 
//var span2 = document.getElementsByClassName("closeInstr")[0];

function showAbout() {
	LoadModals();
	aboutInfo.style.display = "block";
}
			
function showInstructions() {
	LoadModals();
	InstructionInfo.style.display = "block";
}

function CloseAbout() {
	aboutInfo.style.display = "none";
}
			
function CloseInstructions() {
	InstructionInfo.style.display = "none";
}