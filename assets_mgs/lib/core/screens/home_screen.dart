import 'package:flutter/material.dart';

import '../../config/themes/color_theme.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea (
        child:Text('Home screens', style: TextStyle(color: lightColorScheme.primary),)
      ),
    );
  }
}



