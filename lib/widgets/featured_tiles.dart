import 'package:flutter/material.dart';

import '../controllers/responsive.dart';

class FeaturedTiles extends StatefulWidget {
  const FeaturedTiles({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  State<FeaturedTiles> createState() => _FeaturedTilesState();
}

class _FeaturedTilesState extends State<FeaturedTiles> {
  final List<String> assets = [
    'https://media.istockphoto.com/photos/green-gaming-mouse-on-stone-texture-table-picture-id1197265704?b=1&k=20&m=1197265704&s=170667a&w=0&h=SVAlwsKsBLgtHEBY7jOveT9C6gLaKX6RLJzqbzzmEwo=',
    'https://media.istockphoto.com/photos/green-gaming-mouse-on-stone-texture-table-picture-id1197265704?b=1&k=20&m=1197265704&s=170667a&w=0&h=SVAlwsKsBLgtHEBY7jOveT9C6gLaKX6RLJzqbzzmEwo=',
    'https://media.istockphoto.com/photos/green-gaming-mouse-on-stone-texture-table-picture-id1197265704?b=1&k=20&m=1197265704&s=170667a&w=0&h=SVAlwsKsBLgtHEBY7jOveT9C6gLaKX6RLJzqbzzmEwo=',
  ];

  final List<String> title = ['Wired Keyboard', 'Wireless Mouse', 'Mouse'];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: widget.screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: widget.screenSize.width / 15),
                  ...Iterable<int>.generate(assets.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: widget.screenSize.width / 2.5,
                              width: widget.screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  assets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: widget.screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: widget.screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.06,
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: widget.screenSize.width / 6,
                        width: widget.screenSize.width / 3.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            assets[pageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: widget.screenSize.height / 70,
                        ),
                        child: Text(
                          title[pageIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
