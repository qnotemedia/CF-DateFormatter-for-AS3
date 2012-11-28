package com.politico.utils {
	/*
		usage:
		import com.qnotemedia.utils.DateFormat;
		var date:Date = new Date();
		var str:String = "Today's date is " + DateFormat.toCFdateFormat(date,"mmm d");
	*/
	public class DateFormat {
		private static var monthNames:Array = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
		private static var dayNames:Array = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
		
		private static var monthAbbrs:Array = new Array("Jan.","Feb.","March","April","May","June","July","Aug.","Sept.","Oct.","Nov.","Dec.");
		private static var dayAbbrs:Array = new Array("Sun","Mon","Tues","Wed","Thurs","Fri","Sat");
		
		public static function monthByName(num:uint):String {
			return monthNames[num];
		}
		public static function monthByAbbr(num:uint):String {
			return monthAbbrs[num];
		}
		public static function dayByName(num:uint):String {
			return dayNames[num];
		}
		public static function dayByAbbr(num:uint):String {
			return dayAbbrs[num];
		}
		public static function includeZero(num:uint):String {
			var numStr:String = num.toString();
			if (num > -1 && num < 10) {
				numStr = "0" + numStr;
			}
			return numStr;
		}
		
		public static function to12Hour(num:uint):uint {
			if (num > 12) {
				num -= 12;
			} else if (num == 0) {
				num = 12;
			}
			return num;
		}
		public static function to24Hour(num:uint):uint {
			if (num == 0) {
				num = 12;
			}
			return num;
		}
		public static function AorP(num:uint):String {
			// input = hours
			var str:String = "A";
			if (num > 11) {
				str = "P";
			}
			return str;
		}
		public static function AMorPM(num:uint):String {
			// input = hours
			var str:String = "AM";
			if (num > 11) {
				str = "PM";
			}
			return str;
		}

		public static function toCFdateFormat(dt:Date,msk:String):String {
			// d: Day of the month as digits; no leading zero for single-digit days.
			// dd: Day of the month as digits; leading zero for single-digit days.
			// ddd: Day of the week as a three-letter abbreviation.
			// dddd: Day of the week as its full name.
			// m: Month as digits; no leading zero for single-digit months.
			// mm: Month as digits; leading zero for single-digit months.
			// mmm: Month as a three-letter abbreviation.
			// mmmm: Month as its full name.
			// yy: Year as last two digits; leading zero for years less than 10.
			// yyyy: Year represented by four digits.
			
			// The following masks tell how to format the full date and cannot be combined with other masks:
			// short: equivalent to m/d/y
			// medium: equivalent to mmm d, yyyy
			// long: equivalent to mmmm d, yyyy
			// full: equivalent to dddd, mmmm d, yyyy

			switch (msk) {
				case "short":
					msk = "m/d/yy";
					break;
				case "medium":
					msk = "mmm d, yyyy";
					break;
				case "long":
					msk = "mmmm d, yyyy";
					break;
				case "full":
					msk = "dddd, mmmm d, yyyy";
					break;
			}
			
			var returnedString:String = "";
			var currChar:String = "";
			var currIndex:uint = 0;
			var arMSK:Array = new Array();
			for (var i:uint=0; i < msk.length; i++) {
				var char:String = msk.charAt(i);
				if (char == currChar) {
					arMSK[currIndex] = arMSK[currIndex] + char;
				} else {
					currIndex += 1;
					currChar = char;
					arMSK[currIndex] = currChar;
				}
			}
			for (var j:uint=0; j < arMSK.length; j++) {
				var mskItem:* = (arMSK[j] == undefined) ? "" : arMSK[j];
				switch (mskItem) {
					case "dddd":
						mskItem = dayByName(dt.day);
						break;
					case "mmmm":
						mskItem = monthByName(dt.month); //both are 0-based
						break;
					case "yyyy":
						mskItem = dt.fullYear;
						break;
					case "ddd":
						mskItem = dayByAbbr(dt.day);
						break;
					case "mmm":
						mskItem = monthByAbbr(dt.month); //both are 0-based
						break;
					case "dd":
						mskItem = includeZero(dt.date);
						break;
					case "mm":
						mskItem = includeZero(dt.month+1); //.month is 0-based
						break;
					case "yy":
						mskItem = dt.fullYear.toString().slice(2,4);
						break;
					case "d":
						mskItem = dt.date;
						break;
					case "m":
						mskItem = dt.month+1; //.month is 0-based
						break;
					case "y":
						mskItem = dt.fullYear.toString().slice(2,4); // same as "yy"
						break;
				}
				arMSK[j] = mskItem;
			}

			return arMSK.join("");
		}
		
		public static function toCFtimeFormat(dt:Date,msk:String):String {
			// h: hours; no leading zero for single-digit hours (12-hour clock)
			// hh: hours; leading zero for single-digit hours (12-hour clock)
			// H: hours; no leading zero for single-digit hours (24-hour clock)
			// HH: hours; leading zero for single-digit hours (24-hour clock)
			// m: minutes; no leading zero for single-digit minutes
			// mm: minutes; a leading zero for single-digit minutes
			// s: seconds; no leading zero for single-digit seconds
			// ss: seconds; leading zero for single-digit seconds
			// l or L: milliseconds. l gives 3 digits. L gives 2 digits.
			// t: one-character time marker string, such as A or P
			// tt: multiple-character time marker string, such as AM or PM
			// short: equivalent to h:mm tt
			// medium: equivalent to h:mm:ss tt
			// long: medium followed by three-letter time zone; as in, 2:34:55 PM EST
			// full: same as long

			switch (msk) {
				case "short":
					msk = "h:mm tt";
					break;
				case "medium":
					msk = "h:mm:ss tt";
					break;
				case "long":
					msk = "h:mm:ss tt EST";
					break;
				case "full":
					msk = "h:mm:ss tt EST";
					break;
			}
			
			var returnedString:String = "";
			var currChar:String = "";
			var currIndex:uint = 0;
			var arMSK:Array = new Array();
			for (var i:uint=0; i < msk.length; i++) {
				var char:String = msk.charAt(i);
				if (char == currChar) {
					arMSK[currIndex] = arMSK[currIndex] + char;
				} else {
					currIndex += 1;
					currChar = char;
					arMSK[currIndex] = currChar;
				}
			}

			for (var j:uint=0; j < arMSK.length; j++) {
				var mskItem:* = (arMSK[j] == undefined) ? "" : arMSK[j];
				switch (mskItem) {
					case "h":
						mskItem = to12Hour(dt.hours);
						break;
					case "hh":
						mskItem = includeZero(to12Hour(dt.hours));
						break;
					case "H":
						mskItem = to24Hour(dt.hours+1);
						break;
					case "HH":
						mskItem = includeZero(to24Hour(dt.hours));
						break;
					case "m":
						mskItem = dt.minutes;
						break;
					case "mm":
						mskItem = includeZero(dt.minutes);
						break;
					case "s":
						mskItem = dt.seconds;
						break;
					case "ss":
						mskItem = includeZero(dt.seconds);
						break;
					case "l":
						mskItem = dt.milliseconds;
						break;
					case "ll":
						mskItem = includeZero(dt.milliseconds);
						break;
					case "t":
						mskItem = AorP(dt.hours);
						break;
					case "tt":
						mskItem = AMorPM(dt.hours);
						break;
				}
				arMSK[j] = mskItem;
			}

			return arMSK.join("");
		}
	}
}