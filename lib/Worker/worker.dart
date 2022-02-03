import 'package:http/http.dart';
import 'dart:convert';
class worker{
  //constructor
  worker({this.location})
  {
    location = this.location;
  }

  String location;
  String temp;
  String humidity;
  String air_speed;
  String description;
  String main;
  String icon;

 Future<void> getData() async
  {
    try {
      Response response = await get(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=4dc452984ad205ef5df0231a53ca7a6f");
      Map data = jsonDecode(response.body);

      //getting temp, humidity
      Map main_data = data['main'];
      double getTemp = main_data['temp']-273.15;

      String getHumidity = main_data['humidity'].toString();

      //getting air speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed']*18/5;

      //getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_desc = weather_main_data['main'];
      String getDesc = weather_main_data['description'];
       icon = weather_main_data['icon'].toString();

      //assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_desc;
    } catch(e)
    {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "03n";
    }

  }
}