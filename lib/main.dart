import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/WeatherBloc.dart';
import 'View/home.dart';

void main() {
  runApp( WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>WeatherCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),);
  }
}


