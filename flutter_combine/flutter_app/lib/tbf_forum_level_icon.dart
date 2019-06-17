
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class ForumLevelIcon extends StatelessWidget {
  final String value;
  final double width;
  final double height;

  ForumLevelIcon({
    this.value = "0",
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ClipPath(
        clipper: _StarCliper(),
        child: SizedBox(
          width: width,
          height:height,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: min(width, height) / 2),
            ),
            width: width,
            height: height,
            decoration: BoxDecoration (
                gradient: LinearGradient (
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [_getStartColor(value), _getEndColor(value)],
                )),
          ),
        ) ,
      ),
    );
  }

  Color _getStartColor(String value) {
    int level = int.tryParse(value) ?? -1;
    if (level <= 3) {
      return Colors.tealAccent[400];
    } else if (level <= 9) {
      return Colors.blue[400];
    } else if (level <= 15) {
      return Colors.yellow[400];
    } else {
      return Colors.orange[400];
    }
  }

  Color _getEndColor(String value) {
    int level = int.tryParse(value) ?? -1;
    if (level <= 3) {
      return Colors.tealAccent[700];
    } else if (level <= 9) {
      return Colors.blue[700];
    } else if (level <= 15) {
      return Colors.yellow[700];
    } else {
      return Colors.orange[700];
    }
  }
}

class _StarCliper extends CustomClipper<Path>{

  _StarCliper();

  @override
  Path getClip(Size size) {

    double arcHeight = size.height * 0.1;
    double slashX = size.width * 0.25;
    double slashY = size.height * 0.3;
    double arcWidth = size.width * 0.5;

    Path path = new Path();

    path.moveTo(slashX, arcHeight);
    path.arcToPoint(Offset(slashX + arcWidth, arcHeight), radius: Radius.circular(size.height));
    path.lineTo(slashX * 2 + arcWidth, arcHeight + slashY);
    path.lineTo(size.width / 2, size.width);
    path.lineTo(0, arcHeight + slashY);
    path.close();

    return path;
  }


  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return true;
  }

}