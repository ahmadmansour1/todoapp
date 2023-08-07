import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/2_Application/core/appcongig.dart';
import 'package:todoapp/2_Application/core/go_router_observer.dart';
import 'package:todoapp/2_Application/pages/create_todo_collection/create_todo_collection_page.dart';
import 'package:todoapp/2_Application/pages/create_todo_entry/creae_todo_entry_page.dart';
import 'package:todoapp/2_Application/pages/dashboard/dashboard_page.dart';
import 'package:todoapp/2_Application/pages/detail/widget/detail_page.dart';
import 'package:todoapp/2_Application/pages/home/bloc/navigation_cubit.dart';
import 'package:todoapp/2_Application/pages/home/home_page.dart';
import 'package:todoapp/2_Application/pages/overview/overview_page.dart';
import 'package:todoapp/2_Application/pages/settings/settings_page.dart';
import 'package:todoapp/2_Application/pages/task/task_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorRoot =
GlobalKey<NavigatorState>(debugLabel: 'shell');
const String basePath = '/home';
final route = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '$basePath/${DashboardPage.pageConfig.name}',
    observers: [
      GoRouterObserver()
    ],
    routes: [
      GoRoute(
          name: SettingsPage.pageConfig.name,
          path: '$basePath/settings',
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
      ShellRoute(
          navigatorKey: _shellNavigatorRoot,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
                name: HomePage.pageConfig.name,
                path: '/home/:tab',
                builder: (context, state) =>
                    HomePage(
                      key: state.pageKey,
                      tab: state.pathParameters['tab'] ?? '',
                    ))
          ]),


      GoRoute(path: '$basePath/overview/${CreateToDoCollectionPage.pageConfig.name}' ,
      name: CreateToDoCollectionPage.pageConfig.name,
        builder: (context , state) => Scaffold(
          appBar: AppBar(title: Text('ToDo Collection'),),
          body: CreateToDoCollectionPage.pageConfig.child,
        )
      ),
      GoRoute(path: '$basePath/overview/${CreateTodoEntryPage.pageConfig.name}' ,
          name: CreateTodoEntryPage.pageConfig.name ,
          builder: (context , state) => Scaffold(appBar: AppBar(title: const Text('Create ToDo Entry'),),
            body: CreateTodoEntryPage.pageConfig.child,
          )
      ),
      GoRoute(
          name: DetailsPage.pageConfig.name,
          path: '$basePath/overview/:collectionId',
          builder: (context, state) {
            return BlocListener<NavigationCubit, NavigationCubitState>(
              listenWhen: (prev , current) => prev.isSecondBodyIsDisplayed != current.isSecondBodyIsDisplayed,
              listener: (context, state) {
                if(context.canPop() && (state.isSecondBodyIsDisplayed ?? false)) {
                  context.pop();
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('details'),
                  leading: BackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context
                            .goNamed(HomePage.pageConfig.name, pathParameters: {
                          'tab': OverviewPage.pageConfig.name,
                        });
                      }
                    },
                  ),
                ),
                body: TodoDetailedProvider(
                  collectionId: CollectionId.fromUinqueString(
                      state.pathParameters['collectionId']!),
                ),
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
//       GoRoute(path: '/home/task',
//       builder: (context , state ){
// return TaskPage();
// }),
    ]);
