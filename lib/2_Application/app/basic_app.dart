import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoapp/2_Application/core/routes.dart';
import 'package:todoapp/2_Application/pages/home/bloc/navigation_cubit.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: MaterialApp.router(
        title: 'To-Do-App',
        localizationsDelegates: const[
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData.from(useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange,
                brightness: Brightness.light
            )
        ),
        darkTheme: ThemeData.from(useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange,

            )
        ),
        routerConfig: route,


      ),
    );
  }
}
