import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/2_Application/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final route = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/Home/start',
    observers: [
      GoRouterObserver()
    ],
    routes: [
      GoRoute(
          path: '/Home/settings',
          builder: (context, state) {
            return Container(
              color: Colors.amber,
              child: Column(
                children: [
                  ElevatedButton(
                    child: const Text('Go Back'),
                    onPressed: () {
                      context.push('/home/start');
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.push('/home/settings');
                        }
                      },
                      child: const Text('go back'))
                ],
              ),
            );
          }),
      GoRoute(
          path: '/Home/start',
          builder: (context, state) {
            return Container(
              color: Colors.grey,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.push('/home/tasks');
                    },
                    child: const Text('Go Home'),
                  ),
                  TextButton(
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.push('/home/start');
                        }
                      },
                      child: Text('go back'))
                ],
              ),
            );
          }),
      GoRoute(path: '/home/tasks',
      builder: (context , state ){
        return Container(
          color: Colors.green,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.push('/home/settings');
                },
                child: const Text('Go settings'),
              ),
              TextButton(
                  onPressed: () {
                    context.push('/home/start');
                  },
                  child: const Text('go to start'))
            ],
          ),


        );
}
      )
    ]);
