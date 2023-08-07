import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingTodoEntryItem extends StatelessWidget {
  const LoadingTodoEntryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Shimmer(
        color: Theme.of(context).colorScheme.onBackground,
        child: const Text('loading'),

      ),
    );
  }
}
