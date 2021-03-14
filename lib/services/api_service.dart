import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_restapi_app/services/api.dart';

class APIServices {
  final API api;
  APIServices(this.api);

  Future<String> getAccessToken() async {
    final response = await http.post(api.tokenUri(),
        headers: {'Authorization': 'Basic ${api.apiKey}'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];

      if (accessToken != null) {
        return accessToken;
      }

      print(
          'Request ${api.tokenUri().toString()} failed\nResponse: ${response.statusCode}, ${response.reasonPhrase}');
      throw response;
    }
  }

  Future<int> getEndpointData(
      {@required String accessToken, @required EndPoint endpoint}) async {
    final uri = api.endpointUri(endpoint);
    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      if (data.isNotEmpty) {
        final Map<String, dynamic> endpointData = data[0];
        final String responseJsonKeys = _responseJsonKeys[endpoint];
        final int result = endpointData[responseJsonKeys];
        if (result != null) {
          print("getEndpointData -> $result");
          return result;
        }
      }

      print(
          'Request ${api.tokenUri().toString()} failed\nResponse: ${response.statusCode}, ${response.reasonPhrase}');
      throw response;
    }
  }

  static Map<EndPoint, String> _responseJsonKeys = {
    EndPoint.cases: "cases",
    EndPoint.casesSuspected: "data",
    EndPoint.casesConfirmed: "data",
    EndPoint.deaths: "data",
    EndPoint.recovered: "data",
  };
}
