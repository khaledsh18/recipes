import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:recipes/core/api/api_consumer.dart';
import 'package:recipes/core/api/end_point.dart';
import 'package:recipes/core/error/failures.dart';

class HttpConsumer extends ApiConsumer {
  final http.Client client;

  HttpConsumer({required this.client});

  @override
  Future getRecipes() async {
    final uri = Uri.parse(Endpoint.recipesUrl);
    final response = await client.get(
      uri,
      headers: {
        'x-rapidapi-key': 'e3815ccaa9msh264a255cf27c395p1d605ejsn52b54049d9e5',
        'x-rapidapi-host': 'tasty.p.rapidapi.com'
      },
    );
    if (response.statusCode == 200) {
      return _handleResponseAsJson(response);
    } else {
      return ServerFailure();
    }
  }

  dynamic _handleResponseAsJson(Response response) {
    return jsonDecode(response.body.toString());
  }

  @override
  Future searchRecipes(String path) async {
    final perfix = _pathToPerfix(path);
    final uri = Uri.parse('${Endpoint.searchUrl}$perfix');
    final response = await client.get(
      uri,
      headers: {
        'x-rapidapi-key': 'e3815ccaa9msh264a255cf27c395p1d605ejsn52b54049d9e5',
        'x-rapidapi-host': 'tasty.p.rapidapi.com'
      },
    );
    if (response.statusCode == 200) {
      return _handleResponseAsJson(response);
    } else {
      return ServerFailure();
    }
  }

  String _pathToPerfix(String path) {
    return path.replaceAll(' ', '%20');
  }
}
