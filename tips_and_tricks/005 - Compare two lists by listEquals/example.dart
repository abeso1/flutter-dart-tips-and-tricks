import 'package:flutter/foundation.dart';

void main() {
  final listA = [1, 2, 3];
  final listB = [1, 2, 3];

  // Using == operator
  // Checks if both references point to the same object
  print(listA == listB); // false ❌

  // Using listEquals
  // Checks if both lists have the same elements in the same order
  print(listEquals(listA, listB)); // true ✅
}
