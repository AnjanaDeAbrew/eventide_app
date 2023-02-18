import 'package:eventide_app/components/custom_text_poppins.dart';
import 'package:eventide_app/providers/admin/admin_provider.dart';
import 'package:eventide_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sam extends StatefulWidget {
  const Sam({super.key});

  @override
  State<Sam> createState() => _SamState();
}

class _SamState extends State<Sam> {
  final _emal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 96),
            const CustomText('Admin - Save product info',
                color: AppColors.black, fontSize: 20),
            const SizedBox(height: 41),
            Consumer<AdminProvider>(
              builder: (context, value, child) {
                return value.image.path == ""
                    ? IconButton(
                        onPressed: () => value.selectImage(),
                        icon: const Icon(
                          Icons.image,
                          size: 60,
                        ),
                      )
                    : InkWell(
                        onTap: () => value.selectImage(),
                        child: Image.file(
                          value.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      );
              },
            ),
            const SizedBox(height: 29),
          ]),
        ),
      ),
    );
  }
}
