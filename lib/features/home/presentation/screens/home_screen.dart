import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/config/routes/app_routes.dart';
import 'package:recipes/core/utils/strings.dart';
import 'package:recipes/features/home/presentation/bloc/bottom_navigation_bar_bloc.dart';

import '../widgets/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.restaurant_menu),
                SizedBox(width: 10),
                Text(AppStrings.appName),
              ],
            ),
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: currentIndex,
          ),
          body: SafeArea(
            child: AppRoutes.widgetOptions.elementAt(currentIndex),
          ),
        );
      },
    );
  }
}
