import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/WeatherBloc.dart';
import '../model/WeatherModel.dart';

class body extends StatefulWidget {
  body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  Weather? w;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     w=BlocProvider.of<WeatherCubit>(context).w;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
              color: Color(0xff050521),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("${w!.location.name} / ${w!.location.country}",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
                SizedBox(height: 15,),
                Center(child: Image.network("https:${w!.current.condition.toJson()["icon"]}",height: 250,width: 250,fit: BoxFit.fill,)),
                Center(child: Text("${w!.current.tempC}"+" C",style: TextStyle(fontSize: 45,color: Colors.grey))),
                SizedBox(height: 15,),
                Center(child: Text("   ${w!.current.condition.toJson()["text"]}",style: TextStyle(fontSize: 25,color: Colors.grey))),
              ],
            ),
          ),
        ),
        Text("Daily Forecast",style: TextStyle(fontSize: 25,color: Colors.white),),
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white.withOpacity(0),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(child: Image.network("https:${w!.forecast.forecastday[index].day.condition.toJson()["icon"]}",height: 70,width: 70,fit: BoxFit.fill,)),
                          Text("${DateFormat.E().format(w!.forecast.forecastday[index].date)}",style: TextStyle(color: Colors.white),),
                          Text("${w!.forecast.forecastday[index].day.maxtempC}C / ${w!.forecast.forecastday[index].day.mintempC}C",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
