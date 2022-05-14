import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/cubit/app_cubit_states.dart';
import 'package:pizza/cubit/app_cubits.dart';
import 'package:bloc/bloc.dart';
import 'package:pizza/pages/home_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
         if (state is HomePageState) {
          return Container(
            
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => BlocProvider.of<AppCubits>(context).getData(),
                    child: Image.asset("images/cheese_burst_l.jpg",
                    fit: BoxFit.fitHeight,
                    
                    )
                    ),
                    Text("click on the image to start app")
                ],
              )
            ),
          );
        }
        
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
            
          );
        }
        if (state is LoadedState) {
          return PizzaHome();
        } else {
          return Center(child: Text("gone"));
        }
      },
    ));
  }
}
