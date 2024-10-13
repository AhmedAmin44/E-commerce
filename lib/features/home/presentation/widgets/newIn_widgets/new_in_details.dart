import 'package:cached_network_image/cached_network_image.dart';
import 'package:depi_final_project/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewInDetails extends StatelessWidget {
  const NewInDetails(
      {Key? key,
      required this.name,
      required this.discription,
      required this.imageUrl})
      : super(key: key);
  final String name;
  final String discription;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              " Why This  ${name} ?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor),
            ),

          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    height: 320.h,
                    width: 184.w,
                    child: Text(
                      discription,
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              height: 300,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
              ),
            )
          ],
        )
      ],
    );
  }
}
