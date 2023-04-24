import 'package:flutter/material.dart';
import 'package:recipes/core/utils/colors.dart';

class DetailLabel extends StatelessWidget {
  const DetailLabel({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title;
  final Object? detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primaryColor),
        ),
        Text(
          detail == null ? '--' : '$detail',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
