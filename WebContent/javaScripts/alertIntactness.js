function alertIntactness(message) {
	if (message != "null" && message != "") {
		if (message.startsWith("missBeginning")) {
			var mp3sourse = message.substring(13);
			if (confirm("הפורמט אינו חוקי\nלהוספת התחלה נכונה לחץ OK, לסיום לחץ save")) {
				document.getElementById('transcriptionText').value = "@ מקור: " + mp3sourse + "\n@ התחל:\n@ שפה: עב\n@ משתתפים:\tקל קליינט, מט מטפל\n";
			}
		} else if (message.startsWith("problemWithMp3")) {
			var mp3sourse = message.substring(14);
			var indexToBreak = document.getElementById('transcriptionText').value.indexOf("\r");
			var newText = document.getElementById('transcriptionText').value.substring(indexToBreak);
			if (confirm("בעיה בשורת המקור\nלעריכת השורה אוטומטית לחץ OK, לסיום לחץ save")) {
				document.getElementById('transcriptionText').value = "@ מקור: " + mp3sourse + "\n" + newText;
			}
		} else if (message == "problemWithBeginning") {
			var indexToBreak = document.getElementById('transcriptionText').value.indexOf("\r");
			var indexToSecondBreak = document.getElementById('transcriptionText').value.indexOf("\r", indexToBreak);
			var startText = document.getElementById('transcriptionText').value.substring(0, indexToBreak);
			var endText = document.getElementById('transcriptionText').value.substring(indexToSecondBreak);
			if (confirm("בעיה בשורת ההתחל\nלעריכת השורה אוטומטית לחץ OK, לסיום לחץ save")) {
				document.getElementById('transcriptionText').value = startText + "@ התחל\n" + endText;
			}
		} else if (message == "problemWithLanguage") {
			var firstLineIndex = document.getElementById('transcriptionText').value.indexOf("\r");
			var indexToBreak = document.getElementById('transcriptionText').value.indexOf("\r", firstLineIndex);
			var indexToSecondBreak = document.getElementById('transcriptionText').value.indexOf("\r", indexToBreak);
			var startText = document.getElementById('transcriptionText').value.substring(0, indexToBreak);
			var endText = document.getElementById('transcriptionText').value.substring(indexToSecondBreak);
			if (confirm("בעיה בשורת השפה\nלעריכת השורה אוטומטית לחץ OK, לסיום לחץ save")) {
				document.getElementById('transcriptionText').value = startText + "@ שפה: עב\n" + endText;
			}
		} else if (message == "problemWithParticipants") {
			var firstLineIndex = document.getElementById('transcriptionText').value.indexOf("\r");
			var secondLineIndex = document.getElementById('transcriptionText').value.indexOf("\r", firstLineIndex);
			var indexToBreak = document.getElementById('transcriptionText').value.indexOf("\r", secondLineIndex);
			var indexToSecondBreak = document.getElementById('transcriptionText').value.indexOf("\r", indexToBreak);
			var startText = document.getElementById('transcriptionText').value.substring(0, indexToBreak);
			var endText = document.getElementById('transcriptionText').value.substring(indexToSecondBreak);
			if (confirm("בעיה בשורת המשתתפים\nלעריכת השורה אוטומטית לחץ OK, לסיום לחץ save")) {
				document.getElementById('transcriptionText').value = startText + "@ משתתפים:\tקל קליינט, מט מטפל\n" + endText;
			}
		//} else if (String(message).endsWith('notInTheFormat')) {
		//	alert("בעיה בפורמט בשורה :" + String(message).charAt(0));
		//} else if (String(message).endsWith('notTime')) {
		//	alert("בעיה בהצגת הזמן בשורה :" + String(message).charAt(0));
		//} else if (String(message).endsWith('notStartWithPatientOrTherapist')) {
		//	alert("שורה :" + String(message).charAt(0) + " אינה מתחילה בשם המטפל/מטופל");
		} else {
			alert("בעיה בפורמט בשורה " + String(message).charAt(0) + ": " + String(message).substring(1));
		}
	}
}
alertIntactness(document.getElementById("intactness").value);