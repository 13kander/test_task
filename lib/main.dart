import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:test_task/components/components.dart';
import 'package:test_task/repositories/data_repository.dart';
import 'package:test_task/screens/catalog_screen.dart';
import 'package:test_task/services/data_service.dart';

import 'bloc/data_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterStatusbarManager.setColor(ProjectColor.appBarBackground,
          animated: true)
      .whenComplete(() async =>
          await FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT)
              .whenComplete(() => runApp(MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            DataBloc(dataRepository: DataRepository(dataService: DataService()))
              ..add(FetchData()),
        child: CatalogScreen(),
      ),
    );
  }
}
