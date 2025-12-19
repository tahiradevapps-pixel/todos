import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/ApiScreen.dart';
import 'package:flutter_application_1/view/todoswithModel_view.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: "API with Model"),
            Tab(text: "without MOdel"),
            Tab(text: "Mutton"),
          ],
        ),
      ),
      body: Column(
        children: [
          Icon(Icons.image, size: 35),
          SizedBox(
            height: 300,
            child: Card(
              child: TabBarView(
                controller: tabController,
                children: [
                  ApiwithModelscreen(),
                  Apiscreen(),
                  Text("fruits screen"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
