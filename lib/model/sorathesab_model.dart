
class Transactions{
  String price;
  String date;
  String billNum;
  String euroPrice;

  Transactions({this.price, this.date, this.billNum, this.euroPrice});

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    price: json["price"],
    date: json["date"],
    billNum: json["BillNum"],
    euroPrice: json["ePrice"],
  );
}