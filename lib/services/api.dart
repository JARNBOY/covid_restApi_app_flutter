import 'package:covid_restapi_app/services/api_keys.dart';
import 'package:flutter/material.dart';

enum EndPoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  final String apiKey;
  API({@required this.apiKey});

  factory API.sanbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() => Uri(scheme: 'https', host: host, path: 'token');

  Uri endpointUri(EndPoint endpoint) =>
      Uri(scheme: 'https', host: host, path: _paths[endpoint]);

  static Map<EndPoint, String> _paths = {
    EndPoint.cases: "case",
    EndPoint.casesSuspected: "casesSuspected",
    EndPoint.casesConfirmed: "casesConfirmed",
    EndPoint.deaths: "deaths",
    EndPoint.recovered: "recovered",
  };
}
