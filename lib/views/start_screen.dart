import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:quiz/views/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
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
       child: Scaffold(
         appBar: AppBar(backgroundColor: Colors.white,
             elevation: 0,
             leading: IconButton(
           icon: const Icon(
             Icons.arrow_back_outlined,color: Colors.black,
           ),
           onPressed: () {
             setState(() {
               showDialog<String>(
                   context: context,
                   builder: (BuildContext context) => AlertDialog(
                     title: const Text('Do you want exit'),
                     content: const Text('Press Ok to Exit'),
                     actions: <Widget>[
                       TextButton(
                         onPressed: () => Navigator.pop(context, 'Cancel'),
                         child: const Text('Cancel'),
                       ),
                       TextButton(
                         onPressed: () =>  exit(0),
                         //Navigator.pushNamed(context, 'hp'),
                         child: const Text('OK',style: TextStyle(color: Colors.red)),
                       ),
                     ],
                   ));


             });
           },



         )),
       body: Column(
        children: [
          Container(
            width: 415,
              height: 500,
              color: Colors.white,

              child: Center(child:
              Text("    Welcome To The App \n Increase Your Knowledge",
                  style: GoogleFonts.mulish(fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black)
              )
              )
          ),

          SizedBox(
            width: 250,
            height: 80,
            child: ElevatedButton(
                   child: Text('Start Now'),
                 style: ElevatedButton.styleFrom(
                   primary: Colors.green,
               ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));

              },
            ),
          ),
        ],

    ),


   ),
     ),


    );
  }
}
