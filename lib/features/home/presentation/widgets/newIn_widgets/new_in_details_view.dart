import 'package:depi_final_project/core/utils/app_colors.dart';
import 'package:depi_final_project/features/home/model/new_in_model.dart';
import 'package:depi_final_project/features/home/presentation/widgets/Topselling_Widgets/item_list_view_top_selling.dart';
import 'package:depi_final_project/features/home/presentation/widgets/newIn_widgets/new_in_details.dart';
import 'package:depi_final_project/features/home/presentation/widgets/newIn_widgets/new_in_list_view.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_cubit/home_cubit.dart';

class NewInDetailsView extends StatelessWidget {
  const NewInDetailsView({Key? key, required this.model})
      : super(key: key);
  final NewInModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 45,
                ),
              ),
              SliverToBoxAdapter(
                child: NewInDetails(
                  name: "${model.name}",
                  discription: model.description,
                  imageUrl: model.imagePath,
                ),
              ),
              // SliverToBoxAdapter(
              //   child:CharactersDetailsSection()
              // ),
              SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
              SliverToBoxAdapter(
                child: Text("Other Items",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),

              SliverToBoxAdapter(
                child: BlocProvider(
                  create: (context) => HomeCubit()..getTopSellingData(),
                  child: Container(
                      width: 200, height: 320, child: RowOptionsTopSelling()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
