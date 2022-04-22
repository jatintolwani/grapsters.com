import 'package:flutter/material.dart';

import '../controllers/responsive.dart';

class FeaturedHeading extends StatefulWidget {
  const FeaturedHeading({Key? key, required this.screenSize}) : super(key: key);

  final Size screenSize;

  @override
  State<FeaturedHeading> createState() => _FeaturedHeadingState();
}

class _FeaturedHeadingState extends State<FeaturedHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.06,
        left: widget.screenSize.width / 15,
        right: widget.screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Make Gaming your lifestyle',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Make Gaming your lifestyle',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
