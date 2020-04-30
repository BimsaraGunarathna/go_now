import 'package:flutter/material.dart';

//Page
import '../pages/user_vehicle_host_page.dart';
import '../pages/search_page.dart';
import '../pages/profile_page.dart';
import '../pages/offers_page.dart';
import '../pages/trip_page.dart';

class BottomNavigationBarController extends StatefulWidget {
  static const routeName = '/bottom-nav-bar-controller';
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    SearchPage(
      key: PageStorageKey('Page1'),
    ),
    TripPage(
      key: PageStorageKey('Page2'),
    ),
    OffersPage(
      key: PageStorageKey('Page3'),
    ),
    UserVehicleHostPage(
      key: PageStorageKey('Page4'),
    ),
    ProfilePage(
      key: PageStorageKey('Page5'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            title: Text('Trip'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Offers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            title: Text('Hsot'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
