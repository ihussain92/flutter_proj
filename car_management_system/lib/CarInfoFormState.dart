import 'package:car_management_system/CarProvider.dart';
import 'package:car_management_system/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:car_management_system/car.dart';

import 'dart:io';

class CarInfoForm extends StatefulWidget {
  final CarProvider carProvider;

  const CarInfoForm({Key? key, required this.carProvider}) : super(key: key);

  @override
  _CarInfoFormState createState() => _CarInfoFormState();
}

class _CarInfoFormState extends State<CarInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<File> _images = [];
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController engineTypeController = TextEditingController();
  final TextEditingController horsepowerController = TextEditingController();
  final TextEditingController fuelTypeController = TextEditingController();

  List<File> _convertImagePathsToFiles(List<String> imagePaths) {
    return imagePaths.map((imagePath) => File(imagePath)).toList();
  }

  Future<void> _getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const Text(
              'Car Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            _images.isNotEmpty
                ? SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.file(
                            _images[index],
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                : const Icon(
                    Icons.add_a_photo,
                    size: 55.0,
                  ),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Image'),
            ),
            TextFormField(
              controller: makeController,
              decoration: const InputDecoration(labelText: 'Car Make'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the car make';
                }
                return null;
              },
            ),
            TextFormField(
              controller: modelController,
              decoration: const InputDecoration(labelText: 'Car Model'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the car model';
                }
                return null;
              },
            ),
            TextFormField(
              controller: yearController,
              decoration: const InputDecoration(labelText: 'Year'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the year';
                }
                return null;
              },
            ),
            TextFormField(
                controller: engineTypeController,
                decoration: const InputDecoration(labelText: 'Engine Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Engine Type';
                  }
                  return null;
                }),
            TextFormField(
                controller: horsepowerController,
                decoration: const InputDecoration(labelText: 'Horsepower'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the HP';
                  }
                  return null;
                }),
            TextFormField(
                controller: fuelTypeController,
                decoration: const InputDecoration(labelText: 'Fuel Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Fuel';
                  }
                  return null;
                }),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  List<File> imageFiles =
                      _images.map((xFile) => File(xFile.path)).toList();

                  Car newCar = Car(
                    make: makeController.text,
                    model: modelController.text,
                    year: int.parse(yearController.text),
                    images: imageFiles,
                    engineType: engineTypeController.text,
                    horsepower:
                        (double.parse(horsepowerController.text)).toInt(),
                    fuelType: fuelTypeController.text,
                  );

                  widget.carProvider.addCar(newCar);
                  print('Notify Listeners Called');

                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarListScreen(
                              carProvider: widget.carProvider,
                            )),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
