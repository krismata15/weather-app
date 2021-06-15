import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool type = true;

  @override
  Widget build(BuildContext context) {
    Color baseColor = type ? Colors.white : Colors.black;
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: baseColor,
              displayColor: baseColor,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: baseColor,
            ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.touch_app,
              ),
              onPressed: () {
                setState(() {
                  type = !type;
                });
              },
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: type
                  ? [
                      Colors.indigo,
                      Colors.indigoAccent,
                    ]
                  : [
                      Colors.lightBlueAccent,
                      Colors.blueAccent,
                    ],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              /*style: TextStyle(
                                //color: Colors.white,
                                fontSize: 42.0,
                                fontWeight: FontWeight.bold,
                              ),*/
                              style: GoogleFonts.openSans(
                                fontSize: 42.0,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(text: 'Caracas, '),
                                TextSpan(
                                  text: 'VE',
                                  style: TextStyle(
                                    fontSize: 36,
                                  ),
                                ),
                                // TextSpan(text: ' Mundito ')
                              ],
                            ),
                          ),
                          /*Text(
                            'Caracas, ',
                            style: TextStyle(
                              //color: Colors.white,
                              fontSize: 42.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'VE',
                              style: TextStyle(
                                //color: Colors.white,
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),*/
                        ],
                      ),
                      Text(
                        '14 de junio del 2021',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: baseColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Text(
                    ' 22°',
                    style: TextStyle(
                      fontSize: 150.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Despejado',
                    style: TextStyle(
                      fontSize: 28.0,
                      //color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          //color: Colors.white,
                        ),
                        Text(
                          '12°',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up_sharp,
                          size: 30,
                          //color: Colors.white,
                        ),
                        Text(
                          '25°',
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherCard(),
                        WeatherCard(),
                        WeatherCard(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.28;
    return Container(
      width: cardWidth,
      height: 190,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            //width: 200.0,
            //height: 200.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Martes 18',
                ),
                /*Text(
                  '17 sep',
                ),*/
                SizedBox(
                  height: 14,
                ),
                Icon(
                  Icons.wb_sunny_outlined,
                  size: 60,
                  //color: Colors.white,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  ' 30°',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'Despejado',
                  style: TextStyle(
                    fontSize: 15.0,
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
