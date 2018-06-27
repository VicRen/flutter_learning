// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter_test/flutter_test.dart';
import 'dart:convert' as json;

void main() {

  List<int> parse(String jsonStr) {
    final parse = json.jsonDecode(jsonStr);
    final listOfString = List<int>.from(parse);
    return listOfString;
  }

  test('Tying Testing', () {
    const jsonString = "[12345,56789]";
    expect(parse(jsonString).first, 12345);
  });
}
