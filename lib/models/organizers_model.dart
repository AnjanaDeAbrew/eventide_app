class Organizer {
  Organizer({
    required this.id,
    required this.name,
    required this.image,
    this.description =
        'A RGBA and Hex Color CSS generator that helps you quickly convert and generate RGBA and Hex Color CSS declarations for your website. It comes with many options and it demonstrates instantly. If you want to have cool fonts, please also try our font keyboard to help easily get fonts at Font Keyboard iOS app and Font Keyboard Android app.',
    this.location = "Colombo",
    this.fullLocation = "17 Lily Ave, Colombo 00600",
    this.AccessTime = "24/7 access Reception Mon-Fri 9AM-5PM",
    required this.mobile,
  });

  final int id;
  final String name;
  final String location;
  final String image;
  final String? description;
  final String fullLocation;
  final String AccessTime;
  final String mobile;
}
