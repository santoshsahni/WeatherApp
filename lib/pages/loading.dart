import 'package:flutter/material.dart';
import 'package:weatherforcast/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String city="greater noida";
  String temp;
  String hum;
  String air_speed;
  String des;
  String main;
  String icon;


  void startApp(String city) async
  {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value" : temp,
      "hum_value" : hum,
      "air_speed_value" : air_speed,
      "des_value" : des,
      "main_value" : main,
      "icon_value" : icon,
      "city_value" : city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print("this is init state in loading dart file");
  }

  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context).settings.arguments;
    if(search?.isNotEmpty??false)
      {
        city = search['searchText'];
      }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/icon.png", height: 200, width: 200,),
            SizedBox(height: 15,),
            Text("Weather App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Made By Santosh Sahni",
              style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            SpinKitWave(
              color: Colors.black,
              size: 60.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
