import 'package:flutter/material.dart';
import 'package:recipes/core/utils/colors.dart';
import 'package:recipes/core/utils/media_query.dart';
import 'package:shimmer/shimmer.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: AppColors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.black.withOpacity(0.10)
                  ),
                  constraints:
                      BoxConstraints.loose(Size(double.infinity, context.cardHeight)),
                ),
              ),
            );
  }
}