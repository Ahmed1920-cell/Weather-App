import 'package:bloc/bloc.dart';
import 'package:weather/bloc/WeatherState.dart';
import 'package:weather/collection/WeatherDio.dart';
import 'package:weather/model/WeatherModel.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit():super(InstialState());
  Weather? w;
  getData() async{
    try {
      emit(LoadingState());
      w=await WeatherDio().getdata();
      emit(DoneState());
    }catch(e){
      emit(ErrorState(error: e.toString()));
    }
  }
}