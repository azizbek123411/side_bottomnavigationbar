import 'package:flutter/material.dart';
import 'package:side_bottomnavigationbar/homa_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentIndex = 0;
  PageController controller = PageController();
  Color obimaneColor = Colors.transparent;
  double pos = -0.8;
  bool isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: controller,
          children: [
            Container(color: Colors.white),
            Container(color: Colors.red),
            Container(color: Colors.greenAccent),
            Container(color: Colors.redAccent),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: Colors.red.withBlue(200),
          child: Stack(
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    item(
                        icon: Icons.home,
                        position: 0,
                        currentIndex: currentIndex,
                        onTap: () {
                          setState(() {
                            obimaneColor = Colors.black;
                            pos = -0.8;
                          });
                          controller.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutQuint,
                          );
                          setState(() {
                            currentIndex = 0;
                          });
                        }),
                    item(
                        icon: Icons.search,
                        position: 1,
                        currentIndex: currentIndex,
                        onTap: () {
                          setState(() {
                            obimaneColor = Colors.black;
                            pos = -0.2;
                          });
                          controller.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutQuint,
                          );
                          setState(() {
                            currentIndex = 1;
                          });
                        }),
                    item(
                        icon: Icons.settings,
                        position: 2,
                        currentIndex: currentIndex,
                        onTap: () {
                          setState(() {
                            obimaneColor = Colors.black;
                            pos = 0.2;
                          });
                          controller.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutQuint,
                          );
                          setState(() {
                            currentIndex = 2;
                          });
                        }),
                    item(
                        icon: Icons.account_circle_outlined,
                        position: 3,
                        currentIndex: currentIndex,
                        onTap: () {
                          setState(() {
                            obimaneColor = Colors.black;
                            pos = 0.8;
                          });
                          controller.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutQuint,
                          );
                          setState(() {
                            currentIndex = 3;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: AnimatedAlign(
                  onEnd: () {
                    setState(() {
                      isAnimating = false;
                      obimaneColor = Colors.transparent;
                    });
                  },
                  alignment: Alignment(pos, 0.1),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: 18.0,
                    width: isAnimating?32:18.0,
                    decoration: BoxDecoration(
                      color: obimaneColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget item({
    required IconData icon,
    required int position,
    required int currentIndex,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: (){
        isAnimating = true;
        onTap();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: position == currentIndex ? Colors.black : Colors.black54,
          borderRadius: BorderRadius.circular(40),
        ),
        duration: const Duration(milliseconds: 300),
        child: Icon(
          icon,
          size: 36,
          color: Colors.black,
        ),
      ),
    );
  }
}
