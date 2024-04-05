class food{
  final String name;
  final String description;
  final String imagePath;
  final String price;


  food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });
}

//food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}


//food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });


 

}