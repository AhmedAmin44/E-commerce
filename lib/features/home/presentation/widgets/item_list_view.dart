import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemListView extends StatelessWidget {
  const ItemListView(
      {super.key, required this.itemBuilder, required this.height});
  final Widget itemBuilder;
  final int height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: itemBuilder,
        ),
        itemCount: 15,
      ),
    );
  }
}
