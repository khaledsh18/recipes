import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/utils/colors.dart';
import 'package:recipes/features/home/presentation/bloc/bottom_navigation_bar_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomNavigationBar({super.key, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    final bottomNavigationBloc = context.read<BottomNavigationBarBloc>();

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'feed'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: 'favorite'),
      ],
      selectedItemColor: AppColors.primaryColor,
      showUnselectedLabels: false,
      onTap: (index) => bottomNavigationBloc.add(TabChangeEvent(index)),
      currentIndex: currentIndex,
    );
  }
}