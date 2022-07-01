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

class WeatherPanel extends StatefulWidget {
  final Weather weatherData;
  const WeatherPanel({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  @override
  State<WeatherPanel> createState() => _WeatherPanelState();
}

class _WeatherPanelState extends State<WeatherPanel> {
  @override
  Widget build(BuildContext context) {
    var display = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(25)
        ),
        height: display.height/3,
        width: display.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                right: 25,
                left: 25
              ),
              child: Row(
                children: [
                  Text(
                    'Today',
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 30
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.weatherData.currentConditions.dayhour,
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 25,
                left: 25,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.weatherData.currentConditions.temp.c.toString(),
                          style: GoogleFonts.rubik(
                            fontSize: 70,
                            color: Colors.white
                          ),
                        ),
                        TextSpan(
                          text: '°C',
                          style: GoogleFonts.rubik(
                            fontSize: 70,
                            color: selectedColor,
                          )
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Image.network(
                    widget.weatherData.currentConditions.iconUrl,
                    scale: 0.5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 25,
                left: 25,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Icon(
                    const IconData(
                      0xf193,
                      fontFamily: 'MaterialIcons',
                    ),
                    color: selectedColor,
                  ),
                  Expanded(
                    child: Text(
                      widget.weatherData.region,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rubik(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
