import 'package:flutter/material.dart';
import 'package:recipes/app.dart';
import 'injection_containor.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const RecipeApp());
}