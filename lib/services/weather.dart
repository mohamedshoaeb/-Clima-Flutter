
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '006102d3586569b71ece961b2207a66f';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {


  Future<dynamic> getCitynWether(String cityName) async{
    Location location = Location();
    await location.getLocation();


    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWether() async{
    Location location = Location();
    await location.getLocation();


    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'π©git init';
    } else if (condition < 400) {
      return 'π§';
    } else if (condition < 600) {
      return 'βοΈ';
    } else if (condition < 700) {
      return 'βοΈ';
    } else if (condition < 800) {
      return 'π«';
    } else if (condition == 800) {
      return 'βοΈ';
    } else if (condition <= 804) {
      return 'βοΈ';
    } else {
      return 'π€·β';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s π¦ time';
    } else if (temp > 20) {
      return 'Time for shorts and π';
    } else if (temp < 10) {
      return 'You\'ll need π§£ and π§€';
    } else {
      return 'Bring a π§₯ just in case';
    }
  }
}
