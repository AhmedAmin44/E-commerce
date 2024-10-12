// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/text_style.dart';
import '../../home_cubit/home_cubit.dart';
import '../widgets/home_header.dart';
import '../widgets/item_list_view.dart';
import '../widgets/item_list_view_categorie.dart';
import '../widgets/new_in_list_view.dart';
import '../widgets/search_text_field.dart';
import '../widgets/text_spacer_text.dart';

class IconHomeView extends StatelessWidget {
  const IconHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<CategoryModel> categories = [
    //   CategoryModel(
    //       name: "Hoodies",
    //       route: Routes.hoodiesScreen,
    //       imagePath: 'assets/images/home_images/hoodie.png'),
    //   CategoryModel(
    //       name: "Shorts",
    //       route: Routes.shortsScreen,
    //       imagePath: 'assets/images/home_images/short.png'),
    //   CategoryModel(
    //       name: "Bags",
    //       route: Routes.bagsScreen,
    //       imagePath: 'assets/images/home_images/bag.png'),
    //   CategoryModel(
    //       name: "Shoes",
    //       route: Routes.shoesScreen,
    //       imagePath: 'assets/images/home_images/shoes.png'),
    //   CategoryModel(
    //       name: "Accessories",
    //       route: Routes.accessoriesScreen,
    //       imagePath: 'assets/images/home_images/accessorie.png'),
    // ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              HomeHeader(),
              SizedBox(height: 30.h),
              const SearchTextField(),
              SizedBox(height: 10.h),
              Text('Categories', style: TextStyles.font16BlackW700),
              SizedBox(height: 10.h),

              BlocProvider(
                create: (context) => HomeCubit()..getCategogyData(),
                child: RowOptions(),
              ),

              TextSpacerText(
                leadingText: "Top Selling",
                textPress: () {},
              ),
              BlocProvider(
                create: (context) => HomeCubit()..getTopSellingData(),
                child: RowOptionsTopSelling(),
              ),
              SizedBox(height: 10.h),
              TextSpacerText(
                leadingText: "New In",
                textPress: () {},
              ),
              BlocProvider(
                create: (context) => HomeCubit()..getNewInData(),
                child: RowOptionsNewIn(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
