class CategoryModel {
  final String name;
  final String? route; // route to navigate to
  final String imagePath; // path or URL for the category image

  CategoryModel({
    required this.name,
    this.route,
    required this.imagePath,
  });

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(
      name: jsonData['name'],
      imagePath: jsonData['image'],
    );
  }
}
