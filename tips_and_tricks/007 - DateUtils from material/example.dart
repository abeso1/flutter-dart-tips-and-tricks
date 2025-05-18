import 'package:flutter/material.dart';

void main() {
  // Fixed date: May 19, 2025 at 11:30 AM
  DateTime date = DateTime(2025, 5, 19, 11, 30, 0, 0, 0);

  DateTimeRange range = DateTimeRange(
    start: date,
    end: date.add(Duration(days: 10)),
  );

  // Adds 5 days to date
  DateTime newDate1 = DateUtils.addDaysToDate(
    date,
    5,
  ); // 2025-05-24 00:00:00.000
  print('Add 5 days: $newDate1');

  // Adds 2 months to date's month
  DateTime newDate2 = DateUtils.addMonthsToMonthDate(
    date,
    2,
  ); // 2025-07-01 00:00:00.000
  print('Add 2 months: $newDate2');

  // Returns date with time set to 00:00:00.000
  DateTime dateOnly = DateUtils.dateOnly(date); // 2025-05-19 00:00:00.000
  print('Date only: $dateOnly');

  // Gets days in month of date
  int daysInMonth = DateUtils.getDaysInMonth(date.year, date.month); // 31
  print('Days in month: $daysInMonth');

  // Checks if two dates are in the same day
  bool isSameDay = DateUtils.isSameDay(date, DateTime.now()); // true
  print('Is same day: $isSameDay');

  // Checks if two dates are in the same month
  bool isSameMonth = DateUtils.isSameMonth(date, DateTime.now()); // true
  print('Is same month: $isSameMonth');

  // Returns the month delta between two dates
  int monthDelta = DateUtils.monthDelta(
    date,
    DateTime.now().add(Duration(days: 30)),
  ); // 1
  print('Month delta: $monthDelta');

  // Returns the offset of the first day of the month
  int offset = DateUtils.firstDayOffset(
    2025,
    5,
    DefaultMaterialLocalizations(),
  ); // 4
  print('First day offset: $offset');

  // Returns date time range with time set to 00:00:00.000
  DateTimeRange normalizedRange = DateUtils.datesOnly(
    range,
  ); // 2025-05-19 00:00:00.000 to 2025-05-29 00:00:00.000
  print('Normalized range: ${normalizedRange.start} to ${normalizedRange.end}');
}
