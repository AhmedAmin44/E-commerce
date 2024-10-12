class NewInModel {
  final String name;
  final String price;
  final String imagePath; // path or URL for the category image

  NewInModel( {
    required this.name,
    required this.imagePath,
    required this.price,
  });

  factory NewInModel.fromJson(jsonData) {
    return NewInModel(
      name: jsonData['name'],
      price:jsonData['price'],
      imagePath: jsonData['image'],
    );
  }
}
