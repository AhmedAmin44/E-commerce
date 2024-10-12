import 'package:cached_network_image/cached_network_image.dart';
import 'package:depi_final_project/features/home/model/top_selling_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_style.dart';

class ItemListTopSelling extends StatefulWidget {
  final TopSellingModel model;

  const ItemListTopSelling({super.key, required this.model});

  @override
  State<ItemListTopSelling> createState() => _ItemListTopSellingState();
}

class _ItemListTopSellingState extends State<ItemListTopSelling> {
  bool isLove = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 265.h,
          width: 159.w,
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    height: 200.h,
                    width: double.infinity.w,
                    fit: BoxFit.cover,
                    imageUrl: widget.model.imagePath,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 200.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  widget.model.name,
                  style: TextStyle(
                      color: AppColors.black,
                      fontStyle: FontStyle.normal
                      ,fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "\$ ${widget.model.price}",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontStyle: FontStyle.italic
                   ,fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 4.h,
          right: 4.h,
          child: IconButton(
            onPressed: () {
              setState(() {
                isLove = !isLove;
              });
            },
            icon: isLove
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: AppColors.black,
                  ),
          ),
        ),
      ],
    );
  }
}
