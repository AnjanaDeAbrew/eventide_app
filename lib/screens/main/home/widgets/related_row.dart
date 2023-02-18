// import 'package:eventide_app/components/custom_text_poppins.dart';
// import 'package:eventide_app/models/category_model.dart';
// import 'package:eventide_app/screens/main/organizer_category_list/wedding_organizer_list/wedding_organizer_list_page.dart';
// import 'package:eventide_app/utils/app_colors.dart';
// import 'package:eventide_app/utils/assets_constant.dart';
// import 'package:eventide_app/utils/util_functions.dart';
// import 'package:flutter/material.dart';

// class RelatedRow extends StatefulWidget {
//   RelatedRow({super.key});
//   final List<CategoryModel> categoryL = [
//     CategoryModel(
//         id: 1,
//         category: "Wedding",
//         image: "catWedding.png",
//         vectorImage: "weddingVector.png"),
//     CategoryModel(
//         id: 2,
//         category: "Birthday",
//         image: "catBirthday.png",
//         vectorImage: "bdayVector.png"),
//     CategoryModel(
//         id: 3,
//         category: "Engagement",
//         image: "catEngagement.png",
//         vectorImage: "engagementVector.png"),
//     CategoryModel(
//         id: 4,
//         category: "Aniversary",
//         image: "catAniversary.png",
//         vectorImage: "aniversaryVector.png"),
//     CategoryModel(
//         id: 5,
//         category: "Office Party",
//         image: "catOffice.png",
//         vectorImage: "officeVector.png"),
//     CategoryModel(
//         id: 6,
//         category: "Exhibition",
//         image: "catExhibition.png",
//         vectorImage: "exhibitionVector.png")
//   ];
//   @override
//   State<RelatedRow> createState() => _RelatedRowState();
// }

// class _RelatedRowState extends State<RelatedRow> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainer(context);
//   }













//   InkWell CustomContainer(BuildContext context,Fuction() onTap,) {
//     return InkWell(
//     splashColor: Colors.transparent,
//     highlightColor: Colors.transparent,
//     onTap: () {
//       UtilFunction.navigateTo(
//           context,
//           WeddingList(
//             categoryModel: CategoryModel(
//                 id: 1,
//                 category: "Wedding",
//                 image: "catWedding.png",
//                 vectorImage: "weddingVector.png"),
//           ));
//     },
//     child: Container(
//       width: 80,
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         // color: const Color.fromARGB(255, 235, 235, 235),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 70,
//             height: 55,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 238, 238, 238),
//               borderRadius: BorderRadius.circular(10),
//               image: const DecorationImage(
//                   image: AssetImage(
//                     AssetConstant.evening,
//                   ),
//                   fit: BoxFit.contain),
//             ),
//           ),
//           const CustomText(
//             'ssdsd',
//             fontSize: 11,
//             color: AppColors.bottomColor,
//             fontWeight: FontWeight.w500,
//           )
//         ],
//       ),
//     ),
//   );
//   }
// }
