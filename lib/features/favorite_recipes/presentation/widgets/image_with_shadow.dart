import 'package:flutter/material.dart';
import 'package:recipes/core/utils/colors.dart';

class ImageWithShadow extends StatelessWidget {
  final String url;
  const ImageWithShadow({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackWithObacity60,
                  offset: const Offset(0.0, 10.0),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  AppColors.blackWithObacity35,
                  BlendMode.multiply,
                ),
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          );
        
  }
}