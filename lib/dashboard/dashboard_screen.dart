import 'package:flutter/material.dart';

import 'components/body_dashboard.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Covid 2019"),
        backgroundColor: Colors.black87,
      ),
      body: BodyDashboard(),
    );
  }
}
