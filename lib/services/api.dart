import 'package:covid_restapi_app/services/api_keys.dart';
import 'package:flutter/material.dart';

class API {
  final String apiKey;
  API({@required this.apiKey});

  factory API.sanbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() => Uri(scheme: 'https', host: host, path: 'token');
}
