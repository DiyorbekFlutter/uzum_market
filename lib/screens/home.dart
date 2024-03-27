import 'package:flutter/material.dart';

import '../d_navigation_bar.dart';
import '../data/appbars_list.dart';
import '../data/pages_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  final DNavigationBarController bottomNavigationBarController = DNavigationBarController();

  @override
  void initState() {
    super.initState();
    bottomNavigationBarController.pages = pages;
    bottomNavigationBarController.appBars = appBars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: bottomNavigationBarController.appBar,
      body: bottomNavigationBarController.page,
      bottomNavigationBar: DNavigationBar(
        onChanged: (value){
          setState(() {});
        },
        controller: bottomNavigationBarController,
        items: [
          DNavigationBarItem(
            label: 'Asosiy',
            icon: const Icon(Icons.home_outlined),
            // icon: SvgPicture.asset(width: 20, height: 20, 'assets/icons/home.svg'),
            selectedIcon: const Icon(Icons.home, color: Colors.blue),
          ),
          DNavigationBarItem(
            label: 'Saqlangan',
            icon: const Icon(Icons.bookmark_border),
            selectedIcon: const Icon(Icons.bookmark, color: Colors.blue),
          ),
          DNavigationBarItem(
            label: 'Qidirish',
            icon: const Icon(Icons.search_outlined),
            selectedIcon: const Icon(Icons.search, color: Colors.blue),
          ),
          DNavigationBarItem(
            label: 'Settings',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings, color: Colors.blue),
          ),
          DNavigationBarItem(
            label: 'Profil',
            icon: const Icon(Icons.person_outlined),
            selectedIcon: const Icon(Icons.person, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
