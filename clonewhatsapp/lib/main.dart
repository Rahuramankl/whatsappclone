import 'package:clonewhatsapp/Listview/cardview.dart';
import 'package:clonewhatsapp/Listview/cardview_viewmodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CardViewViewmodel cardViewViewmodel = CardViewViewmodel(); // Initialize the view model

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CardView(viewModel: cardViewViewmodel), // Pass the view model to CardView
    );
  }
}