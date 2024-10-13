import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/app_colors.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width:60.w,
            height:60.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Container(
                  height: 60.h,width:60.w ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),color: Colors.grey),
                )
            ),
          ),
          SizedBox(width: 12.w,),SizedBox(
            width:60.w,
            height:60.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Container(
                  height: 60.h,width:60.w ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),color: Colors.grey),
                )
            ),
          ),
          SizedBox(width: 12.w,),
          SizedBox(
            width:60.w,
            height:60.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Container(
                  height: 60.h,width:60.w ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),color: Colors.grey),
                )
            ),
          ),
          SizedBox(width: 12.w,),SizedBox(
            width:60.w,
            height:60.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Container(
                  height: 60.h,width:60.w ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),color: Colors.grey),
                )
            ),
          ),

        ],

    );
  }
}
class CustomShimmerTopSelling extends StatelessWidget {
  const CustomShimmerTopSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.h,
            width: 159.w,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Padding(
                  padding:  EdgeInsets.all(25.r),
                  child: Container(
                      height: 220.h,
                      width: 159.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey),
                  ),
                )
            ),
          ),
          SizedBox(width: 2.w,),
          SizedBox(
            height: 220.h,
            width: 159.w,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Padding(
                  padding:  EdgeInsets.all(25.r),
                  child: Container(
                    height: 220.h,
                    width: 159.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey),
                  ),
                )
            ),
          ),

        ],

    );
  }
}
