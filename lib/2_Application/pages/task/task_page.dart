import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../core/appcongig.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);
  static   const pageConfig = PageConfig(
    icon: Icons.task,
    name: 'task',
    child: TaskPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      // child: Column(
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         context.push('/home/settings');
      //       },
      //       child: const Text('Go settings'),
      //     ),
      //     TextButton(
      //         onPressed: () {
      //           context.push('/home/start');
      //         },
      //         child: const Text('go to start'))
      //   ],
      // ),


    );
  }
  }

