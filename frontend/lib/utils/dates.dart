class Dates {
  static DateTime now = DateTime.now();
  static DateTime today = DateTime(now.year, now.month, now.day);
  static DateTime todayEod = DateTime(now.year, now.month, now.day,24,59,59);
  static DateTime tomorrow = today.add(const Duration(days: 1));


  static String currentYear() {
    final now = DateTime.now();
    if (now.month >= 8) {
      return "${now.year}-${"${now.year + 1}".substring(2)}";
    } else {
      return "${now.year - 1}-${"${now.year}".substring(2)}";
    }
  }
}