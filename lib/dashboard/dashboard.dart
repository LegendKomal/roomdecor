import 'package:flutter/material.dart';
import 'package:roomdecor/navigator/navigator.dart';
import 'package:roomdecor/products/products.dart';
import 'package:roomdecor/search/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Hello, Komal"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // bottomNavigationBar: navigator(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildSearchBar(context),
            Expanded(child: _buildNavigationSection(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => search()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Search",
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationSection(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 800 ? 3 : 2;
    crossAxisCount = MediaQuery.of(context).size.width > 1200 ? 4 : crossAxisCount;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: [
        _buildGridItem(
          context,
          "Sofas",
          'assets/sofa.png',
          Colors.black,
          Products(category: 'Sofas'),
        ),
        _buildGridItem(
          context,
          "Chair",
          'assets/chair.png',
          Colors.black,
          Products(category: 'Chair'),
        ),
        _buildGridItem(
          context,
          "Table",
          'assets/table.png',
          Colors.black,
          Products(category: 'Table'),
        ),
        _buildGridItem(
          context,
          "Bed",
          'assets/bed.png',
          Colors.black,
          Products(category: 'Bed'),
        ),
        _buildGridItem(
          context,
          "TV Stands",
          'assets/tvstand.png',
          Colors.black,
          Products(category: 'TV Stands'),
        ),
        _buildGridItem(
          context,
          "Nightstands",
          'assets/nightstand.png',
          Colors.black,
          Products(category: 'Nightstands'),
        ),
        _buildGridItem(
          context,
          "Dressers",
          'assets/dresser.png',
          Colors.black,
          Products(category: 'Dressers'),
        ),
        _buildGridItem(
          context,
          "Wardrobes",
          'assets/wardrobe.png',
          Colors.black,
          Products(category: 'Wardrobes'),
        ),
        _buildGridItem(
          context,
          "Cribs",
          'assets/crib.png',
          Colors.black,
          Products(category: 'Cribs'),
        ),
        _buildGridItem(
          context,
          "Swing",
          'assets/swing.png',
          Colors.black,
          Products(category: 'Swing'),
        ),
      ],
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    String imagePath,
    Color color,
    Widget destination,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Products(category: title)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(imagePath, height: 50, width: 50),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
