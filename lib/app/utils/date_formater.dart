import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String toFormattedDate(String value) {
  try {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(value));
  } catch (e) {
    debugPrint('Error formatting date: $e');
    return '';
  }
}
