class CardModel{
  String bankName;
  String cardNum;
  String accepted;
  String imagePath;

  CardModel({this.bankName, this.cardNum, this.accepted, this.imagePath});


  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    bankName: json['bankname'],
    cardNum: json['cardNum'],
    accepted: json['accepted'],
    imagePath: json['imagePath'],
  );
}