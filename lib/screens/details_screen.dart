import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: Container(
        child: Center(  
            child: Text('$movie'),
        ),
      ),
    );
  }
}