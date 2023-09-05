import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/appcongig.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static   const pageConfig = PageConfig(
    icon: Icons.settings,
    name: 'settings',
    child: SettingsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
