import 'package:http/http.dart' as http;
import 'dart:convert';
import 'entry.dart';

class HttpConnection {
  static const String staticUrl = 'https://todoapp-api.apps.k8s.gu.se';
  static const String apiKey = '3d3e4e74-dfe8-47d6-9fa4-be183c40cc6c';

  static Future<List> fetchData() async {
    http.Response response =
        await http.get(Uri.parse('$staticUrl/todos?key=$apiKey'));

    return jsonDecode(response.body);
  }

  static Future<List> postEntry(String entryText) async {
    http.Response response = await http.post(
      Uri.parse('$staticUrl/todos?key=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{'title': entryText, 'done': false}),
    );

    return jsonDecode(response.body);
  }

  static Future<List> deleteEntry(String id) async {
    http.Response response =
        await http.delete(Uri.parse('$staticUrl/todos/$id?key=$apiKey'));

    return jsonDecode(response.body);
  }

  static Future<List> updateEntry(
      String id, String entryText, bool? done) async {
    http.Response response = await http.put(
      Uri.parse('$staticUrl/todos/$id?key=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{'title': entryText, 'done': done}),
    );
    return jsonDecode(response.body);
  }
}
