import 'package:flutter/material.dart';

class LoadingOverview extends StatelessWidget {
  const LoadingOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator.adaptive());
  }
}
