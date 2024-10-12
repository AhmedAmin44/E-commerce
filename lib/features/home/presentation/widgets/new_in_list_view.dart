import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_final_project/features/home/model/new_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/flutter_toast.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import 'new_in_item.dart';

class RowOptionsNewIn extends StatelessWidget {
  RowOptionsNewIn({Key? key}) : super(key: key);
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
            : ItemListViewNewIn(
                dataList: context.read<HomeCubit>().NewInList,
                height: 300,
              );
      },
    );
  }
}

/////////////////////////////////////////////////////
class ItemListViewNewIn extends StatelessWidget {
  const ItemListViewNewIn(
      {super.key, required this.height, required this.dataList});

  final List<NewInModel> dataList;
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
          child: ItemListNewIn(
            model: dataList[index],
          ),
        ),
        itemCount: dataList.length,
      ),
    );
  }
}
