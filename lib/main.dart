import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twoh/repository/local_api_repository.dart';
import 'package:twoh/routes/custom_router.gr.dart';
import 'package:twoh/service/local_api.dart';
import 'package:twoh/viewmodel/bloc/machine_data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.amber, // navigation bar color
    statusBarColor: Colors.amber, // status bar color
  ));
  runApp(
    BlocProvider<MachineDataBloc>(
      create: (context) => MachineDataBloc(
        LocalApiRepository(
          LocalApi(),
        ),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Twoh',
      routerDelegate: _appRouter.delegate(),
      theme: themeData(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

  ThemeData themeData() {
    return ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber));
  }
}
