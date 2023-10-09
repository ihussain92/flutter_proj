import 'package:car/car.dart';
import 'package:flutter/foundation.dart'; // Import ChangeNotifier

class CarProvider with ChangeNotifier {
  List<Car> cars = [];

  void addCar(Car car) {
    cars.add(car);
    notifyListeners();
  }
}
