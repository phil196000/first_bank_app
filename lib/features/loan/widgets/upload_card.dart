import 'dart:io';

import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/common_widgets/text/secondary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadCard extends StatefulWidget {
  const UploadCard({
    super.key,
    this.title,
    this.description,
  });
  final String? title;
  final String? description;
  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 400,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          selectedImage = File(
            image.path,
          );
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: widget.title ?? '',
          fontSize: FontSizes.s18,
        ),
        SecondaryText(
          text: widget.description ?? '',
          fontSize: FontSizes.s14,
        ),
        SizedBox(
          height: Spacing.s24,
        ),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            height: Spacing.s160,
            padding: selectedImage != null
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(
                    vertical: Spacing.s16,
                    horizontal: Spacing.s24,
                  ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(
                  0xFFEAECF0,
                ),
              ),
            ),
            child: selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Spacing.s4,
                    ),
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.fill,
                    ),
                  )
                : Column(
                    children: [
                      SvgPicture.asset(
                        Assets.uploadCloud,
                      ),
                      SizedBox(
                        height: Spacing.s12,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Click to upload',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: ' or drag and drop',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SecondaryText(
                        text: 'PNG, JPG(max. 800x400px)',
                      )
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
