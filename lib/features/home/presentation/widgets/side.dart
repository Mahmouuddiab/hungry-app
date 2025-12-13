class SideModel{
  String name;
  String image;
  
  SideModel({required this.name,required this.image});

 static List<SideModel> sides= [
    SideModel(name: "Fries", image: "assets/fries.jpeg"),
    SideModel(name: "Salad", image: "assets/salad.jpeg"),
    SideModel(name: "Cola", image: "assets/cola.jpeg"),
    SideModel(name: "Onion", image: "assets/onion.jpeg")
  ];

}



