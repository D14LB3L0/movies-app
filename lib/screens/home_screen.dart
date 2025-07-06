import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in theaters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: (){}, 
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            // Principal cards
            CardSwiper(),
        
            // Movies slider
            MovieSlider(), 
            
        
          ],
        ),
      )
    );
  }
}