import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/flutter_toast.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../model/top_selling_model.dart';
import 'item_list_top_selling.dart';


class RowOptionsTopSelling extends StatelessWidget {
  RowOptionsTopSelling({Key? key}) : super(key: key);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(

      listener: (BuildContext context, Object? state) {
        if (state is TopSellingFailure) {
          ShowToast(state.errmsg);
        }
      },
      builder: (BuildContext context, state) {
        return state is TopSellingLoading
            ? CustomShimmerTopSelling()
            : ItemListViewTopSelling(
          dataList:context
            .read<HomeCubit>()
            .TopSellingList, height: 300 ,
        );
      },
    );
  }
}

/////////////////////////////////////////////////////
class ItemListViewTopSelling extends StatelessWidget {
  const ItemListViewTopSelling(
      {super.key, required this.height, required this.dataList});
  final List<TopSellingModel>dataList;
  final int height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ItemListTopSelling(model: dataList[index],),
        ),
        itemCount: dataList.length,
      ),
    );
  }
}
