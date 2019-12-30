import 'package:amr_apps/ui/shared/color.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;

  const BackgroundScreen({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // 10% of the width, so there are ten blinds.
          colors: [primaryColor3,primaryColor3,primaryColor2b,primaryColor2b],
          // whitish to gray
          tileMode: TileMode.clamp, // rep// eats the gradient over the canvas
        ),
      ),
      child: Center(child: child),
    );
  }
}