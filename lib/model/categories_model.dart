class CategoriesModel{
  String id;
  String name;

  CategoriesModel({this.id, this.name});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    id: json['id'],
    name: json['name'],
  );
}