import 'package:car_management_system/car.dart';
import 'package:flutter/foundation.dart';

class CarProvider with ChangeNotifier {
  List<Car> cars = [];

  void addCar(Car car) {
    cars.add(car);
    notifyListeners();
  }
}
