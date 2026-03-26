import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const MainPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(title: 'Home'),
      const ProfilePage(),
      UserSettingsPage(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Lab 10")),
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: currentPageIndex == 0
                ? Lottie.asset('assets/lottie/home.json', width: 30, height: 30)
                : const Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: currentPageIndex == 1
                ? Lottie.asset('assets/lottie/profile.json', width: 30, height: 30)
                : const Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: currentPageIndex == 2
                ? Lottie.asset('assets/lottie/user.json', width: 30, height: 30)
                : const Icon(Icons.person_add_alt_1_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class UserSettingsPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserSettingsPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            Text("Email: $email", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            Text("Phone: $phone", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
