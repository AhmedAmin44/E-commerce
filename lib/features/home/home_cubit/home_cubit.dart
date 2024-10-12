import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category_model.dart';
import '../model/category_model.dart';
import '../model/top_selling_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

List<CategoryModel> CategoryList =[];
List<TopSellingModel> TopSellingList =[];



//Category Data
  Future<void> getCategogyData() async {
    try {
      emit(CategoryLoading());
      await FirebaseFirestore.instance
          .collection('category_items')
          .get()
          .then((value) => value.docs.forEach((element)  {
         CategoryList.add(
            CategoryModel.fromJson(element.data()));
        emit(CategorySucces());
      }));
    } on Exception catch (e) {
      emit(CategoryFailure(errmsg: e.toString()));
    }
  }
  //TopSelling Data
  Future<void> getTopSellingData() async {
    try {
      emit(TopSellingLoading());
      await FirebaseFirestore.instance
          .collection('top_selling')
          .get()
          .then((value) => value.docs.forEach((element)  {
        TopSellingList.add(
            TopSellingModel.fromJson(element.data()));
        emit(TopSellingSucces());
      }));
    } on Exception catch (e) {
      emit(TopSellingFailure(errmsg: e.toString()));
    }
  }
}