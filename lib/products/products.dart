import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final String category;

  const Products({Key? key, required this.category}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final List<Map<String, dynamic>> allProducts = [
    {"name": "Leather Sofa", "category": "Sofas", "icon": Icons.chair},
    {"name": "Fabric Sofa", "category": "Sofas", "icon": Icons.chair_outlined},
    {"name": "Reclining Loveseat", "category": "Loveseats", "icon": Icons.weekend},
    {"name": "L-Shaped Sectional", "category": "Sectionals", "icon": Icons.dashboard},
    // ... add more products for each category
  ];

  late List<Map<String, dynamic>> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts.where((product) => product["category"] == widget.category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text("${widget.category}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            return _buildGridItem(
              context,
              filteredProducts[index]["name"],
              filteredProducts[index]["icon"],
              Colors.black,
            );
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Container(
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
            ),
            child: Icon(icon, size: 30, color: Colors.black),
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}