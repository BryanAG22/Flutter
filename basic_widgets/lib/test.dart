import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      children: [
         Center(child: Padding(
           padding: EdgeInsets.all(8.0),
           child: Text('texto a la izq'),
         )), 
      Expanded
      (
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
             SizedBox(height: 20,),
             Text('descripcion de la imagen'),
          ],
        ))],
    );
  }
}

class ColumnText extends StatelessWidget {
  const ColumnText({super.key});

@override
  Widget build(BuildContext context) {
    return   Column(    
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
       const Expanded(
        flex: 2,
        child: Text('arriba')), 
        Expanded(
        flex: 4,
        child: Container(
          color: Colors.blue.shade300,
          child: const Center(child: Text('centro')))), 
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.amber.shade300,
                      child: const Center(child: Text('bajo'))))],
    );
  }
  }

