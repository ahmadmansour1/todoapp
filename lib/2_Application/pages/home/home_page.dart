import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/2_Application/pages/dashboard/dashboard_page.dart';
import 'package:todoapp/2_Application/pages/overview/overview_page.dart';
import 'package:todoapp/2_Application/pages/task/task_page.dart';

import '../../core/appcongig.dart';
import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key , required String tab})
       :index = tabs.indexWhere((index) => index.name == tab);
   static  const pageConfig = PageConfig(icon: Icons.home, name: 'home');

   final int index;
  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
     TaskPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map((page) =>
          NavigationDestination(icon: Icon(page.icon), label: page.name))
      .toList();

  @override
  Widget build(BuildContext context) {
    void _onTapNavigation(BuildContext context , index)=> context.goNamed
      (HomePage.pageConfig.name , pathParameters: {
        'tab' : HomePage.tabs[index].name
    });
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: AdaptiveLayout(
        //primary and secondory always on mid and big
        primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primary-navigation-medium'),
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              trailing: IconButton(onPressed:(){
                context.go(SettingsPage.pageConfig.name);
              }, icon:Icon(Icons.settings)),
                selectedLabelTextStyle:
                    TextStyle(color: theme.colorScheme.onBackground),
                onDestinationSelected: (index) =>_onTapNavigation(context, index),
                selectedIndex: widget.index,
                destinations: destinations
                    .map((_) => AdaptiveScaffold.toRailDestination(_))
                    .toList()),
          ),

        }),
        bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('primary-Navigation-small'),
            builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
              onDestinationSelected: (value) => _onTapNavigation(context , value),
              destinations: destinations,currentIndex: widget.index),
          ),
        }),
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('small-bottom'),
                builder: (_) => HomePage.tabs[widget.index].child),
          },
        ),
        secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('small'),
            builder: AdaptiveScaffold.emptyBuilder,
          )
        }),
      ),
    ));
  }
}
