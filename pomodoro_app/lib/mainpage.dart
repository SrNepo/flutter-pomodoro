import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_app/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  late final List<Widget> telas;

  @override
  void initState() {
    super.initState();
    telas = [
      HomePage(),
      Container(color: Colors.deepPurple),
      Container(color: Colors.white),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu app", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.white,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home, color: Colors.white),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.checklist),
            icon: Icon(Icons.checklist, color: Colors.white),
            label: "Tarefas",
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: telas,
      ),
    );
  }
}
