import 'dart:io';

class Car {
  final String make;
  final String model;
  final int year;
  final List<File> images; 
  final String engineType;
  final int horsepower;
  final String fuelType;

  Car({
    required this.make,
    required this.model,
    required this.year,
    required this.images,
    required this.engineType,
    required this.horsepower,
    required this.fuelType,
  });

  String getImageUrl(int index) {
    if (index >= 0 && index < images.length) {
      
      images[index].path;
      return images[index].path;
    } else {
      
      return 'default_image_url.png'; 
    }
  }
}
