import 'package:eventide_app/models/organizers_model.dart';
import 'package:eventide_app/utils/assets_constant.dart';
import 'package:flutter/material.dart';

class RelatedOrganizer extends StatelessWidget {
  RelatedOrganizer({super.key});

  final List<Organizer> organizers = [
    Organizer(
        id: 1,
        name: "Magical Moments (Pvt) Ltd",
        mobile: "0112345455",
        fullLocation: "17 Lily Ave, Colombo 00600",
        image: "2.png",
        AccessTime: "24/7 access Reception Mon-Fri 9AM-5PM"),
    Organizer(
        id: 2,
        name: "Wedding Sri Lanka (Pvt) Ltd",
        mobile: "0115456445",
        fullLocation: "74 Park Street, Colombo 00610",
        image: "7.png",
        AccessTime: "24/7 access Reception Mon-Fri 9AM-5PM"),
    Organizer(
        id: 3,
        name: "Johens Events (Pvt) Ltd",
        mobile: "0117345646",
        fullLocation: "32 Lily Ave, Colombo 00600",
        image: "4.png",
        AccessTime: "24/7 access Reception Mon-Fri 9AM-5PM"),
    Organizer(
        id: 4,
        name: "Lassana Flora (Pvt) Ltd",
        mobile: "0114567890",
        fullLocation: "21 Ave Garden, Colombo 00600",
        image: "5.png",
        AccessTime: "24/7 access Reception Mon-Fri 9AM-5PM"),
    Organizer(
        id: 5,
        name: "Eventride (Pvt) Ltd",
        mobile: "0112006576",
        fullLocation: "27 Baker Street, Colombo 00600",
        image: "6.png",
        AccessTime: "24/7 access Reception Mon-Fri 9AM-5PM"),
    Organizer(
        id: 6,
        name: "Best Planners (Pvt) Ltd",
        mobile: "0112087868",
        fullLocation: "67 Flower Street, Colombo 00600",
        image: "3.png",
        AccessTime: "24/7 access Reception Mon-Fri 9AM-5PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          height: 85,
          width: 75,
          child: Column(
            children: [
              Container(
                height: 75,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            '${AssetConstant.organizersPath}${organizers[index].image}'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemCount: organizers.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
