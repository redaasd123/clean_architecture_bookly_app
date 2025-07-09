import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// custom_book_image_loading_fading.dart

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImageLoadingFading extends StatelessWidget {
  const CustomBookImageLoadingFading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

