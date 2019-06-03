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