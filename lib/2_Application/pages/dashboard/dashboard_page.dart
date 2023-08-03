import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/2_Application/core/appcongig.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static   const pageConfig = PageConfig(
    icon: Icons.dashboard,
    name: 'dashboard',
    child: DashboardPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green,);
  }
}
