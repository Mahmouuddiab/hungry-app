class CategoryModel{
  String name;
  CategoryModel({required this.name});
  static List<CategoryModel> categories= [
    CategoryModel(name: "All"),
    CategoryModel(name: "Chicken"),
    CategoryModel(name: "Beef"),
    CategoryModel(name: "Veggie"),
    CategoryModel(name: "Cheese")
  ];
}