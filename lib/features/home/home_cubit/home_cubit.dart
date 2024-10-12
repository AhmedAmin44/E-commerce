import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_final_project/features/home/model/new_in_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category_model.dart';
import '../model/category_model.dart';
import '../model/top_selling_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CategoryModel> categoryList =[];
  List<TopSellingModel> topSellingList =[];
  List<NewInModel> newInList =[];



//Category Data
  Future<void> getCategogyData() async {
    try {
      emit(CategoryLoading());
      await FirebaseFirestore.instance
          .collection('category_items')
          .get()
          .then((value) => value.docs.forEach((element)  {
        categoryList.add(
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
        topSellingList.add(
            TopSellingModel.fromJson(element.data()));
        emit(TopSellingSucces());
      }));
    } on Exception catch (e) {
      emit(TopSellingFailure(errmsg: e.toString()));
    }
  }
  //NewIn Data
  Future<void> getNewInData() async {
    try {
      emit(NewInLoading());
      await FirebaseFirestore.instance
          .collection('newIn_item')
          .get()
          .then((value) => value.docs.forEach((element)  {
        newInList.add(
            NewInModel.fromJson(element.data()));
        emit(NewInSucces());
      }));
    } on Exception catch (e) {
      emit(NewInFailure(errmsg: e.toString()));
    }
  }
}