import 'dart:developer';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/views/home_screen.dart';
import 'package:quiz/views/win_screen.dart';


class Changes extends ChangeNotifier{
  bool hasBeen1 = true;
  bool hasBeen2 = true;
  bool hasBeen3 = true;
  bool hasBeen4 = true;
  int number=1;
  int markFromProvider =0;

  void colorChangeofFirstButton(){
    hasBeen1 = !hasBeen1;
    if(hasBeen1==false){
      hasBeen2=true;
      hasBeen3=true;
      hasBeen4=true;

    notifyListeners();

  }

}

  void colorChangeofSecondButton(){
    hasBeen2 = !hasBeen2;
    if(hasBeen2==false){
      hasBeen1=true;
      hasBeen3=true;
      hasBeen4=true;

      notifyListeners();

    }

  }
  void colorChangeofThredButton(){
    hasBeen3 = !hasBeen3;
    if(hasBeen3==false){
      hasBeen2=true;
      hasBeen1=true;
      hasBeen4=true;

      notifyListeners();

    }

  }

  void colorChangeofFourButton(){
    hasBeen4 = !hasBeen4;
    if(hasBeen4==false){
      hasBeen2=true;
      hasBeen3=true;
      hasBeen1=true;

      notifyListeners();

    }

  }



void buttonColorRemoving(){
  hasBeen1=true;
  hasBeen2=true;
  hasBeen3=true;
  hasBeen4=true;
}

void indexNumberAdding(){
    number++;

    notifyListeners();
}
  void indexNumberlessing(){
    if(number>1) {
      number--;
    }
    notifyListeners();
  }

  void markAddingFunction (){
    if(number==1){
      if(hasBeen2==false){
        markFromProvider++;
      }

    }
    if(number==2){
      if(hasBeen3==false){
        markFromProvider++;
      }

    }
    if(number==3){
      if(hasBeen3==false){
        markFromProvider++;
      }

    }
    if(number==4){
      if(hasBeen4==false){
        markFromProvider++;
      }

    }
    if(number==5){
      if(hasBeen4==false){
        markFromProvider++;
      }

    }
    if(number==6){
      if(hasBeen3==false){
        markFromProvider++;
      }

    }
    if(number==7){
      if(hasBeen1==false){
        markFromProvider++;
      }

    }
    if(number==8){
      if(hasBeen2==false){
        markFromProvider++;
      }

    }
    notifyListeners();
}
  void backTofirst(){
    number=1;

    notifyListeners();
  }
  void backToZeromark(){
    markFromProvider=0;

    notifyListeners();
  }


 }