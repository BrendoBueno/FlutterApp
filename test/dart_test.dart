import 'package:flutter_test/flutter_test.dart';

bool isPerfect(int num) {
  if (num < 1) return false;
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      sum += i;
    }
  }
  return sum == num;
}

int factorial(int n) {
  if (n < 0) throw ArgumentError('Número deve ser não negativo.');
  int result = 1;
  int i = n;
  while (i > 1) {
    result *= i;
    i--;
  }
  return result;
  }

void main() {
  group('Testes de Número perfeito', () {
    test('Número perfeito 6', () {
      expect(isPerfect(6), isTrue);
    });

    test('Número negativo não deve ser perfeito', () {
      expect(isPerfect(-6), isFalse);
    });
  });
  test('Fatorial de número negativo deve lançar erro', () {
    expect(() => factorial(-3), throwsArgumentError);
  });

  import 'dart:math';

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  if (number == 2 || number == 3) {
    return true;
  }
  if (number % 2 == 0 || number % 3 == 0) {
    return false;
  }
  
  int maxDivisor = sqrt(number).toInt();
  for (int i = 5; i <= maxDivisor; i += 6) {
    if (number % i == 0 || number % (i + 2) == 0) {
      return false;
    }
  }
  
  return true;
}

int sumOfDigits(int number) {
  if (number < 0) {
    throw ArgumentError('Número negativo não é permitido.');
  }
  
  int sum = 0;
  while (number > 0) {
    sum += number % 10;
    number ~/= 10;
  }
  
  return sum;
}

void main() {
  // Testes para número primo
  group('Testes de Número primo', () {
    test('Número primo 7', () {
      expect(isPrime(7), isTrue);
    });
    test('Número não primo 10', () {
      expect(isPrime(10), isFalse);
    });
  });

  // Testes para soma dos dígitos
  group('Testes de Soma dos dígitos', () {
    test('Soma dos dígitos de 123', () {
      expect(sumOfDigits(123), equals(6));
    });
    test('Soma dos dígitos de -1', () {
      expect(() => sumOfDigits(-1), throwsArgumentError);
    });
  });
}


}
