import 'package:intl/intl.dart';

class AppDateUtils {
  static yMdFormat(dateTime) {
    if (dateTime == '' || dateTime == null) return '';
    dateTime = dateTime is String ? DateTime.parse(dateTime) : dateTime;
    return DateFormat.yMd().format(dateTime);
  }

  static stringToDateTime(dateTime) {
    if (dateTime == '' || dateTime == null) return DateTime.now();

    return DateTime.parse(dateTime);
  }

  static stringToDateTimeForm(dateTime) {
    if (dateTime == '' || dateTime == null) return null;

    return DateTime.parse(dateTime);
  }

  static yyyyMMddFormat(dateTime) {
    if (dateTime == '' || dateTime == null) return '';
    dateTime = dateTime is String ? DateTime.parse(dateTime) : dateTime;
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  static yyyyMMddHHmmssFormat(dateTime) {
    if (dateTime == '' || dateTime == null) return '';
    dateTime = dateTime is String ? DateTime.parse(dateTime) : dateTime;

    String formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return '$formattedDate $formattedTime';
  }

  static hourFormat(dateTime) {
    dateTime = dateTime is String ? DateTime.parse(dateTime) : dateTime;
    return DateFormat.Hm().format(dateTime);
  }

  static timestampToyMd(date) {
    try {
      if (date == null) return '';

      if (date.runtimeType == String) {
        return yyyyMMddHHmmssFormat(date);
      }

      if (date.runtimeType == int) {
        return yyyyMMddHHmmssFormat(
            DateTime.fromMillisecondsSinceEpoch(date * 1000));
      }

      if (date?['_seconds'] != null) {
        DateTime newDate =
            DateTime.fromMillisecondsSinceEpoch(date['_seconds']! * 1000);
        return yyyyMMddHHmmssFormat(newDate);
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}
