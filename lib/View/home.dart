import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/View/Error.dart';
import 'package:weather/bloc/WeatherBloc.dart';
import 'package:weather/bloc/WeatherState.dart';
import 'package:weather/View/body.dart';
import 'package:weather/collection/WeatherDio.dart';
import 'package:weather/View/load.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff050521),
      ),
      backgroundColor: Color(0xff050521),
      body: SafeArea(
        child: BlocBuilder<WeatherCubit,WeatherState>(builder: (context,state){
          if(state is LoadingState ){
            return load();
          }
          else if (state is DoneState){
            return body();
          }
          else{
            return error();
          }
        })
      ),
    );
  }
}
