import 'package:flutter/material.dart';
import 'package:bhuvan_bmi_calc/constants.dart';
import 'results_page.dart';
import 'package:bhuvan_bmi_calc/components/calculate_button.dart';
import 'package:bhuvan_bmi_calc/components/calculator_brain.dart';
import 'package:bhuvan_bmi_calc/components/reuseable_card.dart';
import 'package:bhuvan_bmi_calc/components/round_icon_button.dart';
import 'package:bhuvan_bmi_calc/components/icon_contents.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:gender_selection/gender_selection.dart";

enum Gender {
  male,
  female,
}

class UserInput {
  int cms = 0;
  int kg = 0;

  void setHeightInCms(int cms) {
    this.cms = cms;
  }

  void setWeightInKg(int kg) {
    this.kg = kg;
  }

  String getWeightInLbs() {
    double lb = kg * 2.20462;
    return lb.toStringAsFixed(1);
  }

  String getHeightInInches() {
    double ht = cms * 0.393701;
    return ht.toStringAsFixed(1);
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  UserInput userInput = new UserInput();
  int heightInCms = 168;
  int weightInKg = 70;
  String weightInLbs = '132.3';
  String heightInInches = '31.5';
  int age = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bhuvan's BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? Color(activeColor)
                          : Color(inactiveColor),
                      cardChild: iconContents(
                        icon: FontAwesomeIcons.male,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? Color(activeColor)
                            : Color(inactiveColor),
                        cardChild: iconContents(
                          icon: FontAwesomeIcons.female,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: ReusableCard(
                  color: Color(activeColor),
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Spacer(),
                          Text(
                            weightInKg.toString(),
                            style: numberTextStyle,
                          ),
                          Text(
                            'KGs',
                            style: labelTextStyle,
                          ),
                          Spacer(),
                          Text(
                            weightInLbs.toString(),
                            style: numberTextStyle,
                          ),
                          Text(
                            'LBs',
                            style: labelTextStyle,
                          ),
                          Spacer(),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          value: weightInKg.toDouble(),
                          min: 25.0,
                          max: 100.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              weightInKg = newValue.round();
                              userInput.setWeightInKg(weightInKg);
                              weightInLbs = userInput.getWeightInLbs();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: ReusableCard(
                color: Color(activeColor),
                cardChild: Column(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'Height',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Spacer(),
                        Text(
                          heightInCms.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                        Spacer(),
                        Text(
                          heightInInches.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'in',
                          style: labelTextStyle,
                        ),
                        Spacer(),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: heightInCms.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            heightInCms = newValue.round();
                            userInput.setHeightInCms(heightInCms);
                            heightInInches = userInput.getHeightInInches();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: ReusableCard(
                color: Color(activeColor),
                cardChild: Column(
                  children: <Widget>[
                    Text(
                      'Age',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'years',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: age.toDouble(),
                        min: 9.0,
                        max: 100.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            age = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

//            Expanded(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: ReusableCard(
//                      color: Color(activeColor),
//                      cardChild: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            'Weight (kg)',
//                            style: labelTextStyle,
//                          ),
//                          Text(
//                            weightInKg.toString(),
//                            style: numberTextStyle,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              RoundIconButton(
//                                icon: FontAwesomeIcons.plus,
//                                onPressed: () {
//                                  setState(() {
//                                    weightInKg++;
//                                  });
//                                },
//                              ),
//                              SizedBox(width: 10),
//                              RoundIconButton(
//                                icon: FontAwesomeIcons.minus,
//                                onPressed: () {
//                                  setState(() {
//                                    weightInKg--;
//                                  });
//                                },
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    child: ReusableCard(
//                      color: Color(activeColor),
//                      cardChild: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            'Age',
//                            style: labelTextStyle,
//                          ),
//                          Text(
//                            age.toString(),
//                            style: numberTextStyle,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              RoundIconButton(
//                                icon: FontAwesomeIcons.plus,
//                                onPressed: () {
//                                  setState(() {
//                                    age++;
//                                  });
//                                },
//                              ),
//                              SizedBox(width: 10),
//                              RoundIconButton(
//                                icon: FontAwesomeIcons.minus,
//                                onPressed: () {
//                                  setState(() {
//                                    age--;
//                                  });
//                                },
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
            CalculateButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calcBrain =
                    CalculatorBrain(height: heightInCms, weight: weightInKg);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calcBrain.calculation(),
                      resultText: calcBrain.results(),
                      interpretation: calcBrain.interpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
