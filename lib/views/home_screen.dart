import 'dart:io';




import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';



import '../controller/provider.dart';

import '../utilities/question_answer_list.dart';
import 'fail_screen.dart';
import 'start_screen.dart';
import 'win_screen.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _hasBeenPressed1 = true;

  bool _hasBeenPressed2 = true;

  bool _hasBeenPressed3 = true;

  bool _hasBeenPressed4 = true;

  int num = 1;

  int mark = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => exit(0)));
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
      child: Consumer<Changes>(builder: (context, provider, child) {
        _hasBeenPressed1 = provider.hasBeen1;
        _hasBeenPressed2 = provider.hasBeen2;
        _hasBeenPressed3 = provider.hasBeen3;
        _hasBeenPressed4 = provider.hasBeen4;
        num = provider.number;
        mark = provider.markFromProvider;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Center(
                child: Text("Quiz       ",
                    style: GoogleFonts.mulish(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                provider.indexNumberlessing();

                if (num <= 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Startpage()));
                }
              },
            ),
          ),
          body: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 68,
                  height: 35,

                  child: Center(
                    child: Text('$num/8',
                        style: GoogleFonts.mulish(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  //number

                  margin: EdgeInsets.fromLTRB(27, 35, 294, 00),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(4, 4), //(x,y)
                          blurRadius: 6,
                        ),
                      ]),
                ),
                Container(
                  height: 200,
                  //q
                  width: 320,
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(00, 17, 00, 00),
                  child: ListTile(
                    title: Text(q[provider.number],
                        style: GoogleFonts.mulish(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                ),
                Container(
                  height: 2, //line
                  width: 343,
                  color: Colors.black12,
                  margin: EdgeInsets.fromLTRB(00, 00, 00, 00),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.question_mark_outlined),
                  margin: EdgeInsets.fromLTRB(00, 35, 00, 00),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          //???
                          color: Colors.grey,
                          offset: Offset(4, 4), //(x,y)
                          blurRadius: 6,
                        ),
                      ]),
                ),
                Container(
                  width: 370,
                  height: 20,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(110, 0, 00, 00),
                  margin: EdgeInsets.fromLTRB(00, 5, 00, 00),
                  child: Text("Choose an answer",
                      style: GoogleFonts.mulish(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black38)),
                ),
                Container(
                  width: 415,
                  height: 400,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(00, 10, 00, 00),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofFirstButton();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: provider.hasBeen1
                                    ? Colors.blue
                                    : Colors.black, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                )),
                            child: Row(
                              children: [
                                Text("A",
                                    style: GoogleFonts.mulish(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white54)),
                                Container(
                                  margin: EdgeInsets.fromLTRB(100, 00, 00, 00),
                                  child: Text(a[provider.number],
                                      style: GoogleFonts.mulish(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white)),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 200,
                        height: 15,
                      ),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofSecondButton();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: provider.hasBeen2
                                    ? Colors.blue
                                      : Colors.black, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                )),
                            child: Row(
                              children: [
                                Text("B",
                                    style: GoogleFonts.mulish(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white54)),
                                Container(
                                  margin: EdgeInsets.fromLTRB(100, 00, 00, 00),
                                  child: Text(b[provider.number],
                                      style: GoogleFonts.mulish(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white)),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 200,
                        height: 15,
                      ),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofThredButton();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: provider.hasBeen3
                                    ? Colors.blue
                                    : Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                )),
                            child: Row(
                              children: [
                                Text("C",
                                    style: GoogleFonts.mulish(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white54)),
                                Container(
                                  margin: EdgeInsets.fromLTRB(100, 00, 00, 00),
                                  child: Text(c[provider.number],
                                      style: GoogleFonts.mulish(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white)),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 200,
                        height: 15,
                      ),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofFourButton();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: provider.hasBeen4
                                    ? Colors.blue
                                    : Colors.black, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                )),
                            child: Row(
                              children: [
                                Text("D",
                                    style: GoogleFonts.mulish(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white54)),
                                Container(
                                  margin: EdgeInsets.fromLTRB(100, 00, 00, 00),
                                  child: Text(d[provider.number],
                                      style: GoogleFonts.mulish(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white)),
                                )
                              ],
                            )),
                      ),
                      Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.fromLTRB(260, 30, 00, 00),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    provider.markAddingFunction();
                                    print(provider.markFromProvider);
                                    if (provider.number >= 8) {
                                      if (provider.markFromProvider > 4) {
                                        Navigator.push(
                                     context,
                                            MaterialPageRoute(
                                                builder: (context) => Winpage(
                                                    markFromWinpage: provider.markFromProvider)));
                                      } else if (provider.markFromProvider <= 4) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Failpage(markFromFailpage: mark)));
                                      }
                                    } else {
                                      provider.indexNumberAdding();
                                      provider.buttonColorRemoving();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(18.0),
                                      elevation: 10,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.blue,
                                      // Background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      )),
                                  child: Row(
                                    children: [
                                      Text("Next  "),
                                      Icon(Icons.arrow_forward)
                                    ],
                                  ))
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
