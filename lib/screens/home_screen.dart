import 'package:flutter/material.dart';
import '../Widget/item_widget.dart'; // Ensure this path is correct

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Image with Location and Search Buttons
            Stack(
              children: [
                Image.asset(
                  'assets/Container.png', // Path to your background image
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 320,
                ),
                Positioned(
                  top: 30,
                  left: 15,
                  right: 15,
                  child: Column(
                    children: [
                      // Location TextField
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Location is",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (_isSearchVisible)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search for...",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      SizedBox(height: 10),
                      // Coffee Photo Container
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/Banner.png', // Path to your coffee photo
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // TabBar
            TabBar(
              controller: _tabController,
              labelColor: Colors.brown,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Colors.brown),
              ),
              tabs: [
                Tab(text: "All Coffee"),
                Tab(text: "Macchiato"),
                Tab(text: "Latte"),
                Tab(text: "Americano"),
              ],
            ),
            SizedBox(height: 10),
            
            // Display ItemWidget based on selected tab
            Expanded(
              child: IndexedStack(
                index: _tabController.index,
                children: [
                  ItemWidget(), // Display widgets based on selected tab
                  ItemWidget(),
                  ItemWidget(),
                  ItemWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}