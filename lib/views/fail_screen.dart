import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz/views/home_screen.dart';
import 'package:quiz/views/start_screen.dart';
import 'package:provider/provider.dart';

import '../controller/provider.dart';




class Failpage extends StatelessWidget {
  Failpage({Key? key, required this.markFromFailpage}) : super(key: key);
  int markFromFailpage;

// double per=4/10;
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                insetPadding: EdgeInsets.zero,
                contentTextStyle: GoogleFonts.mulish(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text('Quit Quiz?'),
                content: const Text(
                  'Are you sure you want exit!',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                //actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>exit(0)));
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.red
                        //  backgroundColor: Colors.red
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: Consumer <Changes>(builder: (context, provider, child) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
              title: Center
                (child: Text("Result       ",
                  style: GoogleFonts.mulish(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)
              )
              ), leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined, color: Colors.black,
                ),
                onPressed: () {
                  provider.backTofirst();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Startpage()));
                },

              ),


            ),

            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Frem.png"),
                      fit: BoxFit.cover)),

              child: Column(
                children: [


                  Container(
                    margin: const EdgeInsets.fromLTRB(00, 70, 00, 00),
                    child: CircularPercentIndicator(

                      radius: 80,
                      progressColor: Colors.orange[700],
                      percent: markFromFailpage / 8,
                      reverse: true,
                      animation: true,
                      animationDuration: 1000,
                      lineWidth: 20,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text("$markFromFailpage/8", style: GoogleFonts
                          .mulish(fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    margin: const EdgeInsets.fromLTRB(00, 320, 00, 00),

                    decoration: BoxDecoration(
                        color: Colors.orange[700],
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Center(
                      child: Text("Ooops...!", style: GoogleFonts.mulish(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                    ),
                  ),
                  Container(
                      width: 300,
                      height: 20,
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(00, 15, 00, 00),
                      child: Center(
                          child: InkWell(
                              child: Text('Try again!',
                                  style: GoogleFonts.mulish(fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.lightBlue)),
                              // ignore: avoid_print
                              onTap: () {
                                provider.backTofirst();
                                provider.backToZeromark();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Startpage()));
                              }
                          )
                      )
                  ),


                ],
              ),


            ),


          );

        }
        ),
      ),

    );











  }
}
