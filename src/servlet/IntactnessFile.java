package servlet;
/***
 * Intactness File
 * @author User
 *
 */
public class IntactnessFile {
	/***
	 * check if there is problem in the text
	 * @param text the hole text
	 * @param source the record source
	 * @param language the language
	 * @return "" if good, else the problem
	 */
	public String checkIntactness(String text, String source, String language) {
		if (text == null) {
			return "missBeginning";
		}
		String[] lines = text.split("\n");
		// check the file start
		if (lines.length < 4) {
			return "missBeginning";
		}
		// check source of mp3
		if (!lines[0].equals("@ מקור: " + source + "\r") && !lines[0].equals("@ מקור: " + source)) {
			return "problemWithMp3";
		}
		// check beginning
		if (!lines[1].equals("@ התחל:\r") && !lines[1].equals("@ התחל:\r")) {
			return "problemWithBeginning";
		}
		// check languish
		if (!lines[2].equals("@ שפה: עב\r") && !lines[2].equals("@ שפה: עב\r")) {
			return "problemWithLanguage";
		}
		// check participants
		if (!lines[3].equals("@ משתתפים:\tקל קליינט, מט מטפל\r") && !lines[3].equals("@ משתתפים:\tקל קליינט, מט מטפל")) {
			return "problemWithParticipants";
		}
		// check the other lines
		for (int i = 4; i<lines.length; i++) {
			if (!lines[i].startsWith("%:") && !lines[i].isEmpty()) {
				if (lines[i].startsWith("@ סיום")) {
					return i + "notNeedToWriteTheEndTag";
				}
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
				String problemWithTags = checkEndOfTags(lines[i + 1],language);
				if (!problemWithTags.equals("")) {
					return (i + 1) + problemWithTags;
				}
				i++;
			}
		}
		return "";
	}
	
	/***
	 * check if line in the time format
	 * @param line the line
	 * @return true if in format, else false
	 */
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

	/***
	 * check if the tags ended
	 * @param line the line to check
	 * @param language the language
	 * @return
	 */
	private String checkEndOfTags(String line, String language) {
		// check the tags that have an end tag 
		if(line.contains("<מהר>") && !line.contains("<סמהר>")) {
			return "notCloseTagOfSpeed";
		}
		if(line.contains("<לאט>") && !line.contains("<סלאט>")) {
			return "notCloseTagOfSpeed";
		}
		if(line.contains("<רם>") && !line.contains("<סרם>")) {
			return "notCloseTagOfLoudr";
		}
		if(line.contains("<צעקה>") && !line.contains("<סצעקה>")) {
			return "notCloseTagOfYell";
		}
		if(line.contains("<חלש>") && !line.contains("<סחלש>")) {
			return "notCloseTagOfWeak";
		}
		if(line.contains("<חיקוי>") && !line.contains("<סחיקוי>")) {
			return "notCloseTagOfImitation";
		}
		if(line.contains("<רועד>") && !line.contains("<סרועד>")) {
			return "notCloseTagOfShivering";
		}
		if(line.contains("<ציניות>") && !line.contains("<סציניות>")) {
			return "notCloseTagOfCynicism";
		}	
		if(line.contains("<הומור>") && !line.contains("<סהומור>")) {
			return "notCloseTagOfHumor";
		}
		// check the number of the other tags of beginnings are like the endings 
		String line1 = line.replaceAll("<", "");
		String line2 = line.replaceAll(">", "");
		if(line1.length() != line2.length()){
			return "notCloseOrOpenTagOf<>";
		}
		String line3 = line.replaceAll("\\[", "");
		String line4 = line.replaceAll("\\]", "");
		if(line3.length() != line4.length()){
			return "notCloseOrOpenTagOf[]";
		}
		String line5 = line.replaceAll("\\(", "");
		String line6 = line.replaceAll("\\)", "");
		if(line5.length() != line6.length()){
			return "notCloseOrOpenTagOf()";
		}
		// if there is no problem
		return "";
	}
}
