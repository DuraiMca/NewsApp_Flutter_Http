import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/Album.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=3052f1e3660241cba0ec272c73025d49'));

  if (response.statusCode == 200) {
    
    return Album.fromJson(jsonDecode(response.body));
  } else {
   
    throw Exception('Failed to load album');
  }
}