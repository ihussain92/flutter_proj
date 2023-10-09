import 'package:car_management_system/CarInfoFormState.dart';
import 'package:car_management_system/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:car_management_system/car.dart';
import 'package:car_management_system/CarProvider.dart';
import 'cardetailsceen.dart';

Future<void> main() async {
  final CarProvider carProvider = CarProvider();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    carProvider: carProvider,
  ));
}

class MyApp extends StatelessWidget {
  final CarProvider carProvider;

  const MyApp({
    super.key,
    required this.carProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Car Management System',
        theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 16),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(
          carProvider: carProvider,
        ));
  }
}

class HomeScreen extends StatelessWidget {
  final CarProvider carProvider;

  const HomeScreen({super.key, required this.carProvider});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Welcome to Car Management',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarListScreen(
                                  carProvider: carProvider,
                                )),
                      );
                    },
                    child: const Text('View Car List'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CarInfoForm(
                            carProvider: CarProvider(),
                          ),
                        ),
                      );
                    },
                    child: const Text('Add Car'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarListScreen extends StatelessWidget {
  final CarProvider carProvider;

  const CarListScreen({
    super.key,
    required this.carProvider,
  });

  void _showCarInfoForm(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return CarInfoForm(
          carProvider: carProvider,
        );
      },
    );
  }

  void _showCarDetail(BuildContext context, Car car) {
    final String heroTag = 'carImage_${car.make}_${car.model}_${car.year}';

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CarDetailScreen(car: car, heroTag: heroTag),
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Car> cars = carProvider.cars;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (BuildContext context, int index) {
              final car = cars[index];

              return InkWell(
                onTap: () {
                  _showCarDetail(context, car);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'carImage_$index',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            car.images[0],
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Make: ${car.make}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              'Model: ${car.model}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Year: ${car.year}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCarInfoForm(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
