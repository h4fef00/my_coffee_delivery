import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/views/cart/cart_view.dart';
import 'package:my_coffee_delivery/views/home/home_view.dart';
import "package:my_coffee_delivery/views/favorites/favorites_view.dart";
import 'package:my_coffee_delivery/views/profile/profile_view.dart';

class NavigationItems {
  NavigationItems(
      {required this.label, required this.iconActive, required this.icon});
  final String label;
  final Widget iconActive;
  final Widget icon;
}

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 0;

  final List<NavigationItems> _routes = [
    NavigationItems(
      label: "Home",
      iconActive: const Icon(Icons.home),
      icon: const Icon(Icons.home_outlined),
    ),
    NavigationItems(
      label: "Preferiti",
      iconActive: const Icon(Icons.favorite),
      icon: const Icon(Icons.favorite_outline),
    ),
    NavigationItems(
      label: "Carrello",
      iconActive: const Icon(Icons.shopping_bag),
      icon: const Icon(Icons.shopping_bag_outlined),
    ),
    NavigationItems(
      label: "Profilo",
      iconActive: const Icon(Icons.person),
      icon: const Icon(Icons.person_outlined),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeView(),
          const FavoritesView(),
          CartView(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 125, 125, 125),
        selectedItemColor: const Color.fromARGB(255, 141, 74, 50),
        unselectedItemColor: const Color.fromARGB(255, 95, 93, 93),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _routes
            .map(
              (route) => BottomNavigationBarItem(
                activeIcon: route.iconActive,
                icon: route.icon,
                // aggiungere counter che viene mostrato se ci sono elementi
                label: route.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
