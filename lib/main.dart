import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Reusable_card.dart';
import 'package:bmi_calculator/Icon_content.dart';
import 'Constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  Male,
  Female,
}
Gender selectedGender;
int height = 180;
class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR APP'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(child: Row(
            children:<Widget> [
              Expanded(
                child:ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.Male;
                    });
                  },
                    cardColor:(selectedGender==Gender.Male)?cardActiveColor:cardInactiveColor,
                  cardChild:IconContent(icon:FontAwesomeIcons.mars,gender: "MALE")
              ),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.Female;
                      });
                    },
                    cardColor: selectedGender==Gender.Female?cardActiveColor:cardInactiveColor,
                    cardChild:IconContent(icon:FontAwesomeIcons.venus,gender: "FEMALE")),),
            ],
          )),
          Expanded(child: ReusableCard(cardColor: cardActiveColor,
          cardChild:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text(
                'HEIGHT',
                style: labelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children:<Widget> [
                  Text(
                    height.toString(),
                    style: numbersTextStyle,
                  ),
                  Text(
                    'cm',
                    style: labelTextStyle,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 100,
                  max: 220,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                    setState(() {
                     height=newValue.round();
                    });
                  },

                ),
              )

            ],
          )),),
          Expanded(child: Row(
            children:<Widget> [
              Expanded(child: ReusableCard(cardColor: cardActiveColor),),
              Expanded(child: ReusableCard(cardColor: cardActiveColor),),
            ],
          )),
          Container(
            color:bottonContainerColor,
            width:double.infinity,
            height:80.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}


