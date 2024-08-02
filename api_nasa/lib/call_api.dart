import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiCall extends StatelessWidget {
  const ApiCall({super.key});

  Future<dynamic> loadJsonData() async {
    final request = http.Request(
        'GET',
        Uri.parse(
            'https://api.nasa.gov/planetary/apod?api_key=G9Q1Oz2ueHhaYV0Mn8aVYeFYo3qrt9N0zZcvq0Qo'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(await response.stream.bytesToString());
      print(jsonResponse);
      return jsonResponse;
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var jsonResp = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300, // Ajusta el ancho de la imagen
                height: 300, // Ajusta la altura de la imagen
                child: Image.network(
                  jsonResp['hdurl'] ??
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print("Error loading image: $error");
                    return Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(jsonResp['title'] ?? 'No title'),
            ],
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
