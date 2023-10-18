import 'package:chuva_dart/app/chuva_dart.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences appPreferences;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  appPreferences = await SharedPreferences.getInstance();
  
  setupProviders();

  runApp(const ChuvaDart());
}