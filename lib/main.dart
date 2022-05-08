import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/cubit/app_cubit_logics.dart';
import 'package:pizza/cubit/app_cubits.dart';
import 'package:pizza/pages/home_page.dart';
import 'package:pizza/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider<AppCubits>(
        create: (_) => AppCubits(
          dataServices: DataServices()
        ),
        child: AppCubitLogics(),
         
      ),
    ); 
  }
}



