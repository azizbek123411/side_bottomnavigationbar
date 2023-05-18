import 'package:flutter/material.dart';
import 'package:side_bottomnavigationbar/my_side_bar.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late PageController _pageController;
  late int _selectIndex;

  @override
  void initState() {
    // TODO :implement initState
    super.initState();
    _pageController = PageController();
    _selectIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      drawer: const MySideBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: const Center(
              child: Text(
                "PAGE 1",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Center(
              child: Text(
                "PAGE 2",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.red),
            child: const Center(
              child: Text(
                "PAGE 3",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favourites"),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.purple,
        onTap: (int itemIndex) {
          setState(() {
            _selectIndex = itemIndex;
            _pageController.animateToPage(itemIndex,
                duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
