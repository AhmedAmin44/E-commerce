import 'package:cached_network_image/cached_network_image.dart';
import 'package:depi_final_project/features/home/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/text_style.dart';

class ItemCategorie extends StatelessWidget {
  const ItemCategorie({super.key, required this.onPress, required this.model});

  final CategoryModel model;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          CircleAvatar(
            radius: 36.r,
            child: CachedNetworkImage(
              imageUrl: model.imagePath,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            model.name,
            style: TextStyles.font12BlackW500,
          )
        ],
      ),
    );
  }
}
