import 'package:dio/dio.dart';
import 'package:weather/model/WeatherModel.dart';

class WeatherDio{
  Future<Weather> getdata()async{
    var dio=Dio();
    var response=await dio.get("https://api.weatherapi.com/v1/forecast.json",
       queryParameters:  {
      'key':"377eb30777da408eb7c173103252101",
       'q':  "Cairo",
       'days':"6",
       'aqi':"no",
       'alerts':"no"
       },
    );
    Weather w=Weather.fromJson(response.data);
    print(w.location.name);
    return w;
  }
}