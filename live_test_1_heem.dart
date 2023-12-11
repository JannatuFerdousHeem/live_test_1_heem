import 'dart:io';

void main() {
  List<Map<String, dynamic>> fruits = [];

  for (var i = 1; i <= 3; i++) {
    print('\nEnter details for Fruit $i:');
    var fruit = getUserInput();
    fruits.add(fruit);
  }

  print('\nOriginal Fruit Details before Discount:\n');
  displayFruitDetails(fruits);

  applyPriceDiscount(fruits);

  print('\nFruit Details After Applying Discount:\n');
  displayFruitDetails(fruits);
}

Map<String, dynamic> getUserInput() {
  stdout.write('Enter fruit name: ');
  var name = stdin.readLineSync() ?? '';

  stdout.write('Enter fruit color: ');
  var color = stdin.readLineSync() ?? '';

  stdout.write('Enter fruit price: ');
  var price = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;

  return {'name': name, 'color': color, 'price': price};
}

void displayFruitDetails(List<Map<String, dynamic>> fruits) {
  for (var fruit in fruits) {
    print('Name: ${fruit['name']}, Color: ${fruit['color']}, Price: \$${fruit['price']}');
  }
}

void applyPriceDiscount(List<Map<String, dynamic>> fruits) {
  stdout.write('Enter discount percentage: ');
  var discountPercentage = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;

  for (var fruit in fruits) {
    if (fruit.containsKey('price') && fruit['price'] is double) {
      double originalPrice = fruit['price'];
      double discountedPrice = originalPrice - (originalPrice * discountPercentage / 100);
      fruit['price'] = discountedPrice;
    }
  }
}
