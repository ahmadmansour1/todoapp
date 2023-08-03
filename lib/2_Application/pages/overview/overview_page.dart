import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/appcongig.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});
  static   const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'overview',
    child: OverviewPage(),
  );

  @override
  Widget build(BuildContext context) {
    return  Container(color: Colors.grey,);
  }
}
