import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {
    var counter = 0;

    counter++;

    expect(counter, 1);
  });
  testCounter();
}

class Counter {
  int value = 0;

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}

void testCounter() {
  _primeFactorsOf(0);
  group('test Counter', () {
    test('value should start at 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();
      counter.increment();
      counter.decrement();
      expect(counter.value, 0);
    });
  });
}

int _primeFactorsOf(int number) {
  return 0;
}