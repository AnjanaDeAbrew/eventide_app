class AniversaryModel {
  String orgName;
  String streetNo;
  String streetName;
  String town;
  String description;
  String mobile;
  String price;
  String img;

  AniversaryModel(this.orgName, this.streetNo, this.streetName, this.town,
      this.description, this.mobile, this.price, this.img);

  //-------this named constructor will bind json data to our model
  AniversaryModel.fromJason(Map<String, dynamic> json)
      : orgName = json['orgName'],
        streetNo = json['streetNo'],
        streetName = json['streetName'],
        town = json['town'],
        price = json['price'],
        description = json['description'],
        mobile = json['mobile'],
        img = json['img'];
}
