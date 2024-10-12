class TopSellingModel {
  final String name;
  final String price;
  final String imagePath; // path or URL for the category image

  TopSellingModel( {
    required this.name,
    required this.imagePath,
    required this.price,
  });

  factory TopSellingModel.fromJson(jsonData) {
    return TopSellingModel(
      name: jsonData['name'],
      price:jsonData['price'],
      imagePath: jsonData['image'],
    );
  }
}
