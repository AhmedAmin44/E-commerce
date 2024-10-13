// import 'package:depi_final_project/features/home/model/category_model.dart';
// import 'package:flutter/material.dart';
//
// class HoodieListScreen extends StatelessWidget {
//   late final CategoryModel model;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // Sliver App Bar with back button and title
//           SliverAppBar(
//             pinned: true,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             title: Text('Hoodies (240)'),
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.black,
//             elevation: 0,
//           ),
// SliverToBoxAdapter(child: CategoryDetailsView(model: []),)
//           // Sliver to contain the product grid
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
// // CategoryDetailsView Widget
// class CategoryDetailsView extends StatelessWidget {
//   final CategoryModel model;
//
//   const CategoryDetailsView({Key? key, required this.model}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       sliver: SliverToBoxAdapter(
//         child: GridView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // 2 items per row
//             crossAxisSpacing: 12.0,
//             mainAxisSpacing: 12.0,
//             childAspectRatio: 0.7, // Control the height/width ratio
//           ),
//           itemCount: model.length,
//           itemBuilder: (context, index) {
//             final product = model[index];
//             return ProductCard(
//               imageUrl: product['image']!,
//               title: product['title']!,
//               price: product['price']!,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // ProductCard widget (can stay the same)
// class ProductCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String price;
//
//   const ProductCard({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4.0,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Product image
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
//               child: Image.asset(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4.0),
//                 Text(
//                   price,
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Favorite Icon
//           Align(
//             alignment: Alignment.topRight,
//             child: IconButton(
//               icon: Icon(Icons.favorite_border),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
