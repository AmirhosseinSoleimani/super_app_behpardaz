import 'package:flutter/material.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/widgets/drawer_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Draggable Drawer'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // باز کردن endDrawer
          },
        ),
      ),
      body: Stack(
        children: [
          // محتوای اصلی
          Center(
            child: Text('Main Content'),
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerWidget()
      ),
    );
  }
}
