class TopSellingModel {
  final String name;
  final String price;
  final String imagePath; // path or URL for the category image
  final String description; // path or URL for the category image

  TopSellingModel( {
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });

  factory TopSellingModel.fromJson(jsonData) {
    return TopSellingModel(
      description: jsonData['description'],
      name: jsonData['name'],
      price:jsonData['price'],
      imagePath: jsonData['image'],
    );
  }
}
