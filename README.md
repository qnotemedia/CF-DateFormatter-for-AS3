# Format Actionscript 3 Date Objects with Coldfusion's syntax
This class repurposes the syntax of Coldfusion's DateFormat function for Actionscript 3, allowing you to easily format strings from AS3 Date Objects.

##Usage
```javascript
import com.qnotemedia.utils.DateFormat;
var date:Date = new Date();
var strFormatted:String = "Today's date is " + DateFormat.toCFdateFormat(date,"mmm d, yyyy"); // returns Jan. 1, 1999

var strMonthName:String = DateFormat.monthByName(0); // returns January
var strMonthAbbr:String = DateFormat.monthByAbbr(0); // returns Jan.
var strMonthName:String = DateFormat.dayByName(0); // returns Sunday
var strMonthName:String = DateFormat.dayByAbbr(0); // returns Sun.
```

##Reference
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