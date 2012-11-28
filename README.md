# Format Actionscript 3 Date Objects with Coldfusion's syntax
This class repurposes the syntax of Coldfusion's DateFormat and Timeformat functions for Actionscript 3, allowing you to easily format strings from AS3 Date Objects.

##Usage
```javascript
import com.qnotemedia.utils.DateFormatter;
var date:Date = new Date();
var strDateShort:String = "Today's date is " + DateFormatter.toCFdateFormat(date,"short"); // returns 1/1/1999
var strDateLong:String = "Today's date is " + DateFormatter.toCFdateFormat(date,"full"); // returns Sunday, January 1, 1999
var strDateCustom:String = "Today's date is " + DateFormatter.toCFdateFormat(date,"mmm d, yyyy"); // returns Jan. 1, 1999

var strTimeShort:String = "Current time is " + DateFormatter.toCFtimeFormat(date,"short"); // returns 1:00 AM
var strTimeLong:String = "Current time is " + DateFormatter.toCFtimeFormat(date,"full"); // returns 1:00:00 AM EST
var strTimeCustom:String = "Current time is " + DateFormatter.toCFtimeFormat(date,"hh:mm:ss"); // returns 01:00:00

var strMonthName:String = DateFormatter.monthByName(0); // returns January
var strMonthAbbr:String = DateFormatter.monthByAbbr(0); // returns Jan.
var strMonthName:String = DateFormatter.dayByName(0); // returns Sunday
var strMonthName:String = DateFormatter.dayByAbbr(0); // returns Sun.
```

##DateFormat Reference
* short: equivalent to m/d/y
* medium: equivalent to mmm d, yyyy
* long: equivalent to mmmm d, yyyy
* full: equivalent to dddd, mmmm d, yyyy
* d: Day of the month as digits; no leading zero for single-digit days.
* dd: Day of the month as digits; leading zero for single-digit days.
* ddd: Day of the week as a three-letter abbreviation.
* dddd: Day of the week as its full name.
* m: Month as digits; no leading zero for single-digit months.
* mm: Month as digits; leading zero for single-digit months.
* mmm: Month as a three-letter abbreviation.
* mmmm: Month as its full name.
* yy: Year as last two digits; leading zero for years less than 10.
* yyyy: Year represented by four digits.

##Timeformat Reference
* h: hours; no leading zero for single-digit hours (12-hour clock)
* hh: hours; leading zero for single-digit hours (12-hour clock)
* H: hours; no leading zero for single-digit hours (24-hour clock)
* HH: hours; leading zero for single-digit hours (24-hour clock)
* m: minutes; no leading zero for single-digit minutes
* mm: minutes; a leading zero for single-digit minutes
* s: seconds; no leading zero for single-digit seconds
* ss: seconds; leading zero for single-digit seconds
* l or L: milliseconds. l gives 3 digits. L gives 2 digits.
* t: one-character time marker string, such as A or P
* tt: multiple-character time marker string, such as AM or PM
* short: equivalent to h:mm tt
* medium: equivalent to h:mm:ss tt
* long: medium followed by three-letter time zone; as in, 2:34:55 PM EST
* full: same as long