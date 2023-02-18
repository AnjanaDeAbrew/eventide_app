class OrganizerModel {
  String orgName;
  String streetNo;
  String streetName;
  String town;
  String description;
  String mobile;
  String price;
  bool wedding;
  bool bday;
  bool engage;
  bool aniversary;
  bool office;
  bool exhibition;
  String img;

  OrganizerModel(
      this.orgName,
      this.streetNo,
      this.streetName,
      this.town,
      this.description,
      this.mobile,
      this.price,
      this.wedding,
      this.bday,
      this.engage,
      this.aniversary,
      this.office,
      this.exhibition,
      this.img);

  //-------this named constructor will bind json data to our model
  OrganizerModel.fromJason(Map<String, dynamic> json)
      : orgName = json['orgName'],
        streetNo = json['streetNo'],
        streetName = json['streetName'],
        town = json['town'],
        price = json['price'],
        description = json['description'],
        mobile = json['mobile'],
        wedding = json['wedding'],
        bday = json['bday'],
        engage = json['engage'],
        aniversary = json['aniversary'],
        office = json['office'],
        exhibition = json['exhibition'],
        img = json['img'];
}
