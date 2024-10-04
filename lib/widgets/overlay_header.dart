import 'package:flutter/material.dart';
//to sort menu
class OverlayHeader extends StatelessWidget {
  const OverlayHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 153,
          top: 14,
          child: Text(
            'Sort by',
            style: TextStyle(
              color: Color(0xFF272727),
              fontSize: 24,
              fontFamily: 'Gabarito',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          left: 26,
          top: 19,
          child: Text(
            'Clear',
            style: TextStyle(
              color: Color(0xFF272727),
              fontSize: 16,
              fontFamily: 'Circular Std',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // Positioned(
        //   left: 332,
        //   top: 16,
        //   child: Container(
        //     width: 24,
        //     height: 24,
        //     child: FlutterLogo(),
        //   ),
        // ),
      ],
    );
  }
}
