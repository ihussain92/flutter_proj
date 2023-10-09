import 'package:flutter/material.dart';
import 'package:car_management_system/car.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;
  final Object heroTag;

  const CarDetailScreen({super.key, required this.car, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: Text(
                  'Car Details - ${car.make} ${car.model}',
                ),
                background: Hero(
                  tag: heroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      car.images[0],
                      width: 200,
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                const TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'Car Details',
                    ),
                    Tab(text: 'Engine Details'),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        Text(
                          'Make: ${car.make}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Model: ${car.model}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Year: ${car.year}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Engine Type: ${car.engineType}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Horsepower: ${car.horsepower}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Fuel Type: ${car.fuelType}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
