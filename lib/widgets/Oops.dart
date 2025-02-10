import 'package:flutter/material.dart';

class Oops extends StatelessWidget {
  const Oops({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/oops.jpg'),
          const SizedBox(height: 20,),
          const Text('There are no news',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255,36, 206, 255)))
        ],
      ),
    );
  }
}