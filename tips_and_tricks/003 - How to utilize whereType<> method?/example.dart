abstract class Animal {
  final String name;

  Animal(this.name);

  void speak();
}

class Dog extends Animal {
  Dog(super.name);

  @override
  void speak() => print('$name says: Woof!');
}

class Cat extends Animal {
  Cat(super.name);

  @override
  void speak() => print('$name says: Meow!');
}

void main() {
  List<Animal> animals = [
    Dog('Rex'),
    Cat('Whiskers'),
    Dog('Buddy'),
    Cat('Luna'),
  ];

  // Filter only the dogs
  List<Dog> dogs = animals.whereType<Dog>().toList();

  for (var dog in dogs) {
    dog.speak(); // Only dogs will speak
  }

  // Output:
  // Rex says: Woof!
  // Buddy says: Woof!
}
