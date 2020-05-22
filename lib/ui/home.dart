import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch (value){
          case 0:
          _finalResult = calculateWeight(_weightController.text,0.06);
          break;
          case 1:
          _finalResult = calculateWeight(_weightController.text,0.38);
          break;
          case 2:
          _finalResult = calculateWeight(_weightController.text,0.91);

      }

      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: new Text("Weight on planet X",
        style: new TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(image: new AssetImage("images/space.jpg"),
          fit: BoxFit.cover),
        ),

        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset("images/planet.png",
              height: 200,
              width: 200,
              color: Colors.white,
            ),

            new Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new Stack(
                   children: <Widget>[
                     new Container(
                       width: 500,
                       height: 60,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15.0),
                         color: Colors.white,
                       ),



                     ),
                     new TextField(

                       cursorColor:  Colors.white,
                       controller: _weightController,
                       keyboardType: TextInputType.number,
                       decoration: new InputDecoration(

                           focusColor: Colors.white,
                           fillColor: Colors.white,
                           labelText: 'Your Weight on Earth',
                           hintText: "kgs",
                           icon: new Icon(Icons.accessibility_new,
                             color: Colors.black,
                             size: 35,)
                       ),
                     ),
                   ],

                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Radio<int>(value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged,
                      activeColor: Colors.white,),
                      new Text(
                        "Pluto",
                        style: new TextStyle(
                          color: Colors.white
                        ),
                      ),
                      new Radio<int>(value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged,
                        activeColor: Colors.white,
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(
                            color: Colors.white
                        ),
                      ),
                      new Radio<int>(value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged,
                        activeColor: Colors.white,),
                      new Text(
                        "Venus",
                        style: new TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(20.0)),
                  new Container(
                    height: 60,
                    width: 220,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      image:new DecorationImage(image: new AssetImage("images/space.jpg"),
                          fit: BoxFit.cover) ,
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white
                    ),

                    child: new Text(
                      _weightController.text.isEmpty ? "Enter Weight": "$_finalResult kgs",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),),

                  ),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight)>0)
    {
      return int.parse(weight) * multiplier;
    }
    else{
      print("Wrong");

      return int.parse("180") * 0.38;
    }
  }
}
