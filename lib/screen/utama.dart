import 'package:project_akhir/screen/cari.dart';
import 'package:project_akhir/model/cuaca.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cari.dart';
import 'dart:math';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  int temperature_min;
  int temperature_max;
  String ic;
  String cityName;
  String desc;
  String pj;
  int tekanan;
  String pa;
  int kelembapan;
  int laut;
  int angin;
  int lat;
  int long;
  int sunrise;
  int sunset;



  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }
  @override


  void updateUI(dynamic weatherData) {
    setState(
          () {
        if (weatherData == null) {
          temperature = null ;
          ic ='';
          pa = '';
          cityName = 'Tidak Ada Data';
          tekanan = null;
          pj ='-';
          return;
        }
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        double temp_min = weatherData['main']['temp_min'];
        temperature_min = temp_min.toInt();
        double temp_max = weatherData['main']['temp_max'];
        temperature_max = temp_max.toInt();
        double pressure = weatherData['main']['pressure'];
        tekanan = pressure.toInt();
        double humidity = weatherData['main']['humidity'];
        kelembapan = humidity.toInt();
        double sea_level = weatherData['wind']['deg'];
        laut = sea_level.toInt();
        double speed = weatherData['wind']['speed'];
        angin = speed.toInt();
        double latt = weatherData['coord']['lat'];
        lat = latt.toInt();
        double longg = weatherData['coord']['lon'];
        long = longg.toInt();
        double sunr = weatherData['sys']['sunrise'];
        sunrise = sunr.toInt();
        double suns = weatherData['sys']['sunset'];
        sunset = suns.toInt();
        var condition = weatherData['weather'][0]['id'];
        cityName =weatherData['name'];
        pj = weatherData['weather'][0]['description'];
        pa = 'Today Is '+weatherData['weather'][0]['main'];
        ic = weather.getWeatherIcon(condition);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(

      body: Center(

        child: Container(
            height: size.height,
            width: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
        image: DecorationImage(
        image: AssetImage('assets/awal.jpg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
    Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),),
            child: SafeArea(
              child: Stack(
                     children: [
                    SingleChildScrollView(
                      child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(

                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                                horizontal: size.width * 0.05,
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      var weatherData = await weather.getLocationWeather();
                                      updateUI(weatherData);
                                    },
                                    child: Icon(
                                      Icons.near_me,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                  Align(
                                    child: Text(
                                      'Peramal Yahud',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.03,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      String typedName = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return CityScreen();
                                          },
                                        ),
                                      );
                                      if (typedName != null) {
                                        var weatherData =
                                        await weather.getCityWeather(typedName);
                                        updateUI(weatherData);
                                      }
                                    },
                                    child: Icon(
                                      Icons.search ,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                              ),
                              child: Align(
                                child: Text(
                                  '$cityName' ,
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.white : Colors.black,
                                    fontSize: size.height * 0.06,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.005,
                              ),
                              child: Align(
                                child: Text(
                                  '$pa $ic ', //day
                                  style: TextStyle(
                                    color:
                                    isDarkMode ? Colors.white54 : Colors.black54,
                                    fontSize: size.height * 0.035,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                              ),
                              child: Align(
                                child: Text(
                                  '$temperature˚C', //curent temperature
                                  style: TextStyle(
                                    color:
                                    isDarkMode ? Colors.deepPurple : Colors.pink,
                                    fontSize: size.height * 0.1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: size.width * 0.25),
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.005,
                              ),
                              child: Align(
                                child: Text(
                                  '$pj', // weather
                                  style:TextStyle(
                                    color: Colors.white54,
                                    fontSize: size.height * 0.03,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                                bottom: size.height * 0.01,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$temperature_min˚C', // min temperature
                                    style: TextStyle(
                                      color:  Colors.pink,
                                      fontSize: size.height * 0.03,
                                    ),
                                  ),
                                  Text(
                                    '/',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: size.height * 0.03,
                                    ),
                                  ),
                                  Text(
                                    '$temperature_max˚C', //max temperature
                                    style: TextStyle(
                                      color:  Colors.deepPurple,
                                      fontSize: size.height * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30) ),
                                  color: Colors.deepPurple.withOpacity(0.07)
                                ),
                                child: Column(
                                  children: [Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: size.height * 0.01,
                                          left: size.width * 0.03,
                                        ),
                                        child: Text(
                                          'More Detail',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.025,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(size.width * 0.005),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [

                                            detail(
                                              'Tekanan Angin $tekanan',1,1,1,
                                              FontAwesomeIcons.wind,
                                              size,
                                              isDarkMode,
                                            ),
                                            detail(
                                              "Derajat $laut",1,1,1,
                                              FontAwesomeIcons.glideG ,
                                              size,
                                              isDarkMode,
                                            ),
                                            detail(
                                              'Kelembapan $kelembapan ',1,1,1,
                                              FontAwesomeIcons.handHoldingWater,
                                              size,
                                              isDarkMode,
                                            ),
                                            detail(
                                              "Kecepatan Angin $angin",1,1,1,
                                              FontAwesomeIcons.mixcloud,
                                              size,
                                              isDarkMode,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30) ),
                                  color: Colors.deepPurple.withOpacity(0.07)
                                ),
                                child: Column(
                                  children: [Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: size.height * 0.01,
                                        left: size.width * 0.03,
                                      ),
                                    ),
                                  ),
                                    Padding(
                                      padding: EdgeInsets.all(size.width * 0.005),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [

                                            detail(
                                              'Longitude $long',1,1,1,
                                              FontAwesomeIcons.longArrowAltDown,
                                              size,
                                              isDarkMode,
                                            ),
                                            detail(
                                              "Latitude $lat",1,1,1,
                                              FontAwesomeIcons.longArrowAltRight,
                                              size,
                                              isDarkMode,
                                            ),
                                            detail(
                                              'Sunrise $sunrise ',1,1,1,
                                              FontAwesomeIcons.sun,
                                              size,
                                              isDarkMode,
                                            ),
                                            detail(
                                              "Sunset $sunset",1,1,1,
                                              FontAwesomeIcons.moon,
                                              size,
                                              isDarkMode,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  color: Colors.deepPurple.withOpacity(0.07),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: size.height * 0.01,
                                          left: size.width * 0.03,
                                        ),
                                        child: Text(
                                          'Forecast',
                                          style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: size.height * 0.025,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(size.width * 0.005),
                                      child: SingleChildScrollView(
                                       scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            buildForecastToday(
                                              "15:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.cloud,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "16:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.cloudRain,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "17:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.snowflake,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "18:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.cloudMoon,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "19:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.snowflake,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "20:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.snowflake,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "21:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.cloudMoon,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "22:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.moon,
                                              size,
                                              isDarkMode,
                                            ),
                                            buildForecastToday(
                                              "23:00",
                                              Random().nextInt(34),
                                              Random().nextInt(30),
                                              Random().nextInt(100),
                                              FontAwesomeIcons.moon,
                                              size,
                                              isDarkMode,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.02,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  color: Colors.deepPurple.withOpacity(0.07),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: size.height * 0.02,
                                          left: size.width * 0.03,
                                        ),
                                        child: Text(
                                          '7-day forecast',
                                          style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: size.height * 0.025,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(size.width * 0.005),
                                      child: Column(
                                        children: [
                                          buildSevenDayForecast(
                                            "Wed",
                                             Random().nextInt(2),
                                            Random().nextInt(20),
                                            FontAwesomeIcons.sun,
                                            size,
                                            isDarkMode,
                                          ),
                                          buildSevenDayForecast(
                                            "Thu",
                                            Random().nextInt(5),
                                            Random().nextInt(30),
                                            FontAwesomeIcons.cloudRain,
                                            size,
                                            isDarkMode,
                                          ),
                                          buildSevenDayForecast(
                                            "Fri",
                                            Random().nextInt(20),
                                            Random().nextInt(21)+20,
                                            FontAwesomeIcons.sun,
                                            size,
                                            isDarkMode,
                                          ),
                                          buildSevenDayForecast(
                                            "San",
                                            Random().nextInt(20),
                                            Random().nextInt(21)+20,
                                            FontAwesomeIcons.sun,
                                            size,
                                            isDarkMode,
                                          ),
                                          buildSevenDayForecast(
                                            "Sun",
                                            Random().nextInt(20),
                                            Random().nextInt(15)+20,
                                            FontAwesomeIcons.cloud,
                                            size,
                                            isDarkMode,
                                          ),
                                          buildSevenDayForecast(
                                            "Mon",
                                            Random().nextInt(25),
                                            Random().nextInt(7)+26,
                                            FontAwesomeIcons.snowflake,
                                            size,
                                            isDarkMode,
                                          ),
                                          buildSevenDayForecast(
                                            "Tues",
                                            Random().nextInt(3)+22,
                                            Random().nextInt(10)+23,
                                            FontAwesomeIcons.cloudRain,
                                            size,
                                            isDarkMode,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                      ),
                    ),
                  ],
              ),
            ),
          ),

      ),
    );
  }


  }
Widget detail(
    String time, int temp, int wind, int rainChance,
    IconData weatherIcon, size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.all(size.width * 0.025),
    child: Column(
      children: [
        Text(
          time,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.02,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.005,
              ),
              child: FaIcon(
                weatherIcon,
                color: isDarkMode ? Colors.white : Colors.black,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
Widget buildForecastToday(String time, int temp, int wind, int rainChance,
    IconData weatherIcon, size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.all(size.width * 0.025),
    child: Column(
      children: [
        Text(
          time,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.02,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.005,
              ),
              child: FaIcon(
                weatherIcon,
                color: isDarkMode ? Colors.white : Colors.black,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        Text(
          '$temp˚C',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.025,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: FaIcon(
                FontAwesomeIcons.wind,
                color: Colors.grey,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        Text(
          '$wind km/h',
          style: TextStyle(
            color: Colors.grey,
            fontSize: size.height * 0.02,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: FaIcon(
                FontAwesomeIcons.umbrella,
                color: Colors.blue,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        Text(
          '$rainChance %',
          style: TextStyle(
            color: Colors.blue,
            fontSize: size.height * 0.02,
          ),
        ),
      ],
    ),
  );
}

Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
    IconData weatherIcon, size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.all(
      size.height * 0.005,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
              ),
              child: Text(
                time,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.25,
              ),
              child: FaIcon(
                weatherIcon,
                color: isDarkMode ? Colors.white : Colors.black,
                size: size.height * 0.03,
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                ),
                child: Text(
                  '$minTemp˚C',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white38 : Colors.black38,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Text(
                  '$maxTemp˚C',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    ),
  );
}

