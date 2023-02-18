import 'package:eventide_app/models/category_model.dart';
import 'package:eventide_app/providers/admin/organizer_provider.dart';
import 'package:eventide_app/screens/main/category/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({
    Key? key,
  }) : super(key: key);

  final List<CategoryModel> category = [
    CategoryModel(
        id: 1,
        category: "Wedding",
        image: "catWedding.png",
        vectorImage: "weddingVector.png"),
    CategoryModel(
        id: 2,
        category: "Birthday",
        image: "catBirthday.png",
        vectorImage: "bdayVector.png"),
    CategoryModel(
        id: 3,
        category: "Engagement",
        image: "catEngagement.png",
        vectorImage: "engagementVector.png"),
    CategoryModel(
        id: 4,
        category: "Aniversary",
        image: "catAniversary.png",
        vectorImage: "aniversaryVector.png"),
    CategoryModel(
        id: 5,
        category: "Office Party",
        image: "catOffice.png",
        vectorImage: "officeVector.png"),
    CategoryModel(
        id: 6,
        category: "Exhibition",
        image: "catExhibition.png",
        vectorImage: "exhibitionVector.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<OrganizerProvider>(
            builder: (context, value, child) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 45),
                itemBuilder: (context, index) => CategoryTile(
                  category: category[index],
                ),
                itemCount: category.length,
              );
            },
          )),
    );
  }
}
