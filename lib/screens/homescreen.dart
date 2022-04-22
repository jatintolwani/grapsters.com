import 'package:flutter/material.dart';
import 'package:grapsters/controllers/responsive.dart';
import 'package:grapsters/widgets/appbar.dart';
import 'package:grapsters/widgets/quick_access.dart';
import 'package:grapsters/widgets/sideDrawer.dart';

import '../widgets/featured_heading.dart';
import '../widgets/featured_tiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.black.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                "Grapsters.com",
                style: TextStyle(color: Colors.white),
              ))
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: AppBarContent(),
            ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1592424002053-21f369ad7fdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVjaGFuaWNhbCUyMGtleWJvYXJkfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    QuickAccessBar(screenSize: screenSize),
                    Column(
                      children: [
                        FeaturedHeading(
                          screenSize: screenSize,
                        ),
                        FeaturedTiles(screenSize: screenSize)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
