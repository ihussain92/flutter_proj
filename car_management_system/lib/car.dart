import 'dart:io';

class Car {
  final String make;
  final String model;
  final int year;
  final List<File> images; // Assuming you want to store multiple images
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
      // Assuming you have URLs or paths associated with the images.
      images[index].path;
      return images[index].path; // Change this based on your data structure.
    } else {
      // Handle the case when the index is out of bounds, e.g., return a default URL or throw an error.
      return 'default_image_url.png'; // Replace with your logic.
    }
  }
}
