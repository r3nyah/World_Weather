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

class nextDaysPanel extends StatefulWidget {
  final Weather weatherData;
  const nextDaysPanel({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  @override
  State<nextDaysPanel> createState() => _nextDaysPanelState();
}

class _nextDaysPanelState extends State<nextDaysPanel> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      height: screensize.height/5,
      width: double.infinity,
      child: ListView.builder(
        itemCount: widget.weatherData.nextDays.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: screensize.width/3,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.network(
                        widget.weatherData.nextDays[index].iconUrl
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 20,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.weatherData.nextDays[index].day,
                        style: GoogleFonts.rubik(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                    ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget
                                    .weatherData.nextDays[index].maxTemp.c
                                    .toString(),
                                style: GoogleFonts.rubik(
                                    fontSize: 30, color: Colors.white)),
                            TextSpan(
                                text: "°C",
                                style: GoogleFonts.rubik(
                                    fontSize: 15, color: selectedColor))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}