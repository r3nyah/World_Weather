import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_weather/Src/Constants.dart';
import 'package:world_weather/Src/Weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Src/WeatherPanel.dart';
import 'Src/nextDaysPanel.dart';
import 'Src/otherDetailPage.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Weather parseWeather(String cevap){
    return Weather.fromJson(json.decode(cevap));
  }
  String city = "Jakarta";
  Future<Weather> weatherShow() async {
    var url = Uri.parse("https://weatherdbi.herokuapp.com/data/weather/$city");
    var cvp = await http.get(url);
    return parseWeather(cvp.body);
  }

  late Future<Weather>future;
  @override
  void initState(){
    future = weatherShow();
    super.initState();
  }
  var searchText=TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          title: isSearching
              ? Container(
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: TextField(
              onSubmitted: (value) => setState(() {
                city = value;
                future = weatherShow();
                isSearching = false;
              }),
              controller: searchText,
              style: GoogleFonts.rubik(fontSize: 15, color: Colors.white),
              decoration: InputDecoration(
                hintStyle:
                GoogleFonts.rubik(fontSize: 15, color: Colors.white),
                hintText: 'Search your city',
                suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      city = searchText.text;
                      future = weatherShow();
                      isSearching = false;
                    }),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          )
              : Text("Weather Forecast",
              style: GoogleFonts.rubik(fontSize: 20, color: Colors.white)),
          actions: [
            Visibility(
              visible: isSearching ? false : true,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: Icon(Icons.search)),
            )
          ],
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Weather>(
                future: future,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeatherPanel(
                          weatherData: snapshot.data!,
                        ),
                        otherDetailPage(weatherData: snapshot.data!),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Next 7 Days",
                            style: GoogleFonts.rubik(
                                fontSize: 15, color: selectedColor),
                          ),
                        ),
                        nextDaysPanel(
                          weatherData: snapshot.data!,
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                          "ERROR",
                          style: GoogleFonts.rubik(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: selectedColor),
                        ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
