class NewInModel {
  final String name;
  final String price;
  final String imagePath;
  final String description;

  NewInModel({
    required this.name,
    required this.imagePath,
    required this.price, required this.description,
  });

  factory NewInModel.fromJson(jsonData) {
    return NewInModel(
      name: jsonData['name'],
      price:jsonData['price'],
      imagePath: jsonData['image'],
      description: jsonData['description'],

    );
  }
}
