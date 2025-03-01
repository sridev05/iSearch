import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(  // <- added const here
      body: Center(
        child: Text('Search Screen'),
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: 2),
    );
  }
}