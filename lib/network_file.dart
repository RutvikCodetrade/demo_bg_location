import 'dart:convert';

import 'album_model.dart';
import 'package:http/http.dart' as http;

Future<Album?> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("FETCH ALBUM CALLED ${jsonDecode(response.body)}");
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("api error");
  }
}
