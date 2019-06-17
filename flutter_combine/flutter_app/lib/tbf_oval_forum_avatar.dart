import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/tbf_image_widget.dart';

class OvalForumAvatar extends StatelessWidget {
  final double borderWidth;
  final double width;
  final double height;
  final Color borderColor;
  final TbImageWidget imageChild;

  // ignore: non_constant_default_value
  OvalForumAvatar({this.borderWidth = 0.5, this.width = 40, this.height = 40, this.borderColor = Color(0xFFD4D4D4), this.imageChild});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: new _StarCliper(),
              child:new SizedBox(
                width: width + borderWidth * 2,
                height:height + borderWidth * 2,
                child: Container(
                  width: width + borderWidth * 2,
                  height: height + borderWidth * 2,
                  color: borderColor,
                ),
              ) ,
            ),
            Container(
              padding: EdgeInsets.all(borderWidth),
              child: ClipPath(
                clipper: new _StarCliper(),
                child:new SizedBox(
                  width: width,
                  height:height,
                  child: imageChild,
                ) ,
              ),
            ),


          ],
        )
    );
  }
}

class _StarCliper extends CustomClipper<Path>{

  _StarCliper();

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {

    Path path = new Path();

    double borderLeft = 0;
    double borderRight = size.width;
    double horizelCenter = (borderLeft + borderRight) / 2;
    double borderTop = 0;
    double borderBottom = size.height;
    double verticalCenter = (borderTop + borderBottom) / 2;
    double horizelParam = (borderRight - borderLeft) / 2 * 51 / 65;
    double verticalParam = (borderBottom - borderTop) / 2 * 51 / 65;

    path.moveTo(horizelCenter, borderTop);
    path.cubicTo(horizelCenter + horizelParam, borderTop, borderRight, verticalCenter - verticalParam, borderRight, verticalCenter);
    path.cubicTo(borderRight, verticalCenter + verticalParam, horizelCenter + horizelParam, borderBottom, horizelCenter, borderBottom);
    path.cubicTo(horizelCenter - horizelParam, borderBottom, borderLeft, verticalCenter + verticalParam, borderLeft, verticalCenter);
    path.cubicTo(borderLeft, verticalCenter - verticalParam, horizelCenter - horizelParam, borderTop, horizelCenter, borderTop);
    path.close();

    return path;
  }


  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return true;
  }

}