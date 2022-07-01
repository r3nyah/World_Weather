import 'package:flutter/material.dart';
import 'package:world_weather/Src/Constants.dart';
import 'package:world_weather/Src/Weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_weather/Src/Weather.dart';
import 'package:flutter/material.dart';
import 'package:world_weather/Src/Constants.dart';


class otherDetailPage extends StatefulWidget {
  final Weather weatherData;
  const otherDetailPage({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  @override
  State<otherDetailPage> createState() => _otherDetailPageState();
}

class _otherDetailPageState extends State<otherDetailPage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: screensize.height/10,
        width: screensize.width,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    WeatherIcons.strong_wind,
                    color: selectedColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.weatherData.currentConditions.wind.km.toString()+' Km/h',
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    WeatherIcons.humidity,
                    color: selectedColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.weatherData.currentConditions.humidity,
                    style: GoogleFonts.rubik(
                      fontSize:15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    WeatherIcons.rain,
                    color: selectedColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.weatherData.currentConditions.precip,
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
