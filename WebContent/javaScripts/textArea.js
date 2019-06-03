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