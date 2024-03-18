
import 'dart:math' as math;

const String fontName ="Satoshi";
List<String> get alphabetList => [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

String camelCase(String input) {
  if (input == null) {
    return '';
  }
  if (input.length < 2) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

String randomString(int stringLength) {
  const chars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  math.Random rnd = math.Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < stringLength; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

const _days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const _shortMonths = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec'
];

const _shortDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
