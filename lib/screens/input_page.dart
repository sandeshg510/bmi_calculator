import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 40;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI Calculator'),
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  carChild: const IconContet(
                    planets: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  carChild: const IconContet(
                    planets: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ),
          ])),
          Expanded(
              child: ReusableCard(
                  colour: kCardColor,
                  carChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'HEIGHT',
                          style: kLabeltextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kNumberTextStyle),
                            const Text(
                              'cm',
                              style: kLabeltextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: const Color(0xFF8D8E98),
                              thumbColor: const Color(0xFFEB1555),
                              overlayColor: const Color(0x29EB1555),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30),
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              )),
                          child: Slider(
                              value: height!.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        )
                      ]))),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  carChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: kLabeltextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'button 1',
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            backgroundColor: kButtonColor,
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: kIconColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                              heroTag: 'button 2',
                              backgroundColor: kButtonColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: kIconColor,
                              )),
                        ],
                      ),
                    ],
                  ),
                  colour: kCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  carChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'AGE',
                        style: kLabeltextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            heroTag: 'button 3',
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            backgroundColor: kButtonColor,
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: kIconColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            heroTag: 'button 4',
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            backgroundColor: kButtonColor,
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: kIconColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  colour: kCardColor,
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI()!,
                            resultText: calc.getResult(),
                            interpretation: calc.getSuggestions(),
                          )));
            },
            child: Container(
              color: kCardColor,
              width: double.infinity,
              height: 60,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
