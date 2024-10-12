import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/flutter_toast.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import '../../../home_cubit/home_cubit.dart';
import '../../../home_cubit/home_states.dart';
import '../../../model/category_model.dart';
import 'item_categorie.dart';

class RowOptions extends StatelessWidget {
  RowOptions({Key? key}) : super(key: key);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(

      listener: (BuildContext context, Object? state) {
        if (state is CategoryFailure) {
          ShowToast(state.errmsg);
        }
      },
      builder: (BuildContext context, state) {
        return state is CategoryLoading
            ? CustomShimmerCategory()
            : ItemListViewCategorie(dataList:context
            .read<HomeCubit>()
            .categoryList ,
            );
      },
    );
  }
}
////////////////////////////////////////////////////////////
class ItemListViewCategorie extends StatelessWidget {

   ItemListViewCategorie({
    super.key,
 required this.dataList,
  });
  final List<CategoryModel> dataList;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 116.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: dataList
            .length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: ItemCategorie(
              onPress: () {
              }, model: dataList[index],
            ),
          );
        },
      ),
    );
  }
}
