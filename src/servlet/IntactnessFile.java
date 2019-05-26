package servlet;

public class IntactnessFile {
	public String checkIntactness(String text, String source) {
		if (text == null) {
			return "missBeginning";
		}
		String[] lines = text.split("\n");
		// check the file start
		if (lines.length < 4) {
			return "missBeginning";
		}
		// check source of mp3
		if (!lines[0].equals("@ מקור: " + source + "\r")) {
			return "problemWithMp3";
		}
		// check beginning
		if (!lines[1].equals("@ התחל:\r")) {
			return "problemWithBeginning";
		}
		// check languish
		if (!lines[2].equals("@ שפה: עב\r")) {
			return "problemWithLanguage";
		}
		// check participants
		if (!lines[3].equals("@ משתתפים:\tקל קליינט, מט מטפל\r")) {
			return "problemWithParticipants";
		}
		// check the other lines
		for (int i = 4; i<lines.length; i++) {
			if (!lines[i].startsWith("%:") && !lines[i].isEmpty()) {
				if (lines.length < i) {
					return i + "notInTheFormat";
				}
				if (!timeFormat(lines[i])) {
					return i + "notTime";
				}
				if (lines[i+1] == null) {
					return (i + 1) + "notStartWithPatientOrTherapist";
				}
				if (!lines[i + 1].startsWith("*מט:\t") && !lines[i + 1].startsWith("*קל:\t")
						&& !lines[i + 1].startsWith("*מט:    ") && !lines[i + 1].startsWith("*קל:    ")) {
					return (i + 1) + "notStartWithPatientOrTherapist";
				}
				i++;
			}
		}
		return "";
	}
	
	private boolean timeFormat(String line) {
		if (line.length() != 11) {
			return false;
		}
		if (!line.startsWith("-") || line.charAt(9) != '-') {
			return false;
		}
		if (line.charAt(3) != ':' || line.charAt(6) != ':') {
			return false;
		}
		if (!Character.isDigit(line.charAt(1)) || !Character.isDigit(line.charAt(2))
				|| !Character.isDigit(line.charAt(4)) || !Character.isDigit(line.charAt(5))
				|| !Character.isDigit(line.charAt(7)) || !Character.isDigit(line.charAt(8))) {
			return false;
		}
		if (!line.endsWith("\r")) {
			return false;
		}
		return true;
	}
}
