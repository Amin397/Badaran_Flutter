class WalletModel{
  String name;
  String price;

  WalletModel({this.name, this.price});

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    name: json['name'],
    price: json['price'],
  );
}