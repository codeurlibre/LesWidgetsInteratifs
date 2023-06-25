import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class InteractifPage extends StatefulWidget {
  const InteractifPage({super.key});

  @override
  State<InteractifPage> createState() => _InteractifPageState();
}

class _InteractifPageState extends State<InteractifPage> {
  // String password = "";
  Color _backgroundColor = Colors.white;
  Color colorText = Colors.black;
  bool _textButtonPress = false;
  IconData myIcon = Icons.favorite;
  String username = "";
  bool switchValue = true;
  Color colorIcon = Colors.pink;
  Color colorOulined = Colors.amber;
  double sliderValue = 5;
  late TextEditingController controller;
  GlobalKey<FormState> myKey = GlobalKey<FormState>();
  dynamic usernameData = "";
  bool checkValue = true;
  Map<String, bool> courses = {
    "Oignon": false,
    "Tomate": false,
    "Poulet": true
  };
  int _radioValue = 0;
  Map<String, int> sexes = {"Masculin": 0, "Feminin": 1};
  DateTime _initialDate = DateTime.now();
  TimeOfDay _initialTime = TimeOfDay(hour: 12, minute: 00);

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: colorIcon,
        title: Text(
            // switchValue ? controller.text : ""
            // controller.text
            updateTextAppbar()
            // style: TextStyle(color: _colorText),
            ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
          TextButton(
            onPressed: updateAppBar,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "TextButton",
                style: TextStyle(
                    color: colorText,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: colorIcon),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: _initialDate,
                          firstDate: DateTime(2002),
                          lastDate: DateTime(2025))
                      .then((value) => {
                            if (value != null && value != _initialDate)
                              {
                                setState(() {
                                  _initialDate = value;
                                })
                              }
                          });
                },
                child: Text("$_initialDate")),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: colorIcon),
              onPressed: () {
                showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 00, minute: 00))
                    .then((value) => {
                          if (value != null && value != _initialTime)
                            {
                              setState(() {
                                _initialTime = value;
                              })
                            }
                        });
              },
              child: Text("$_initialTime")),
          Text("${_initialTime.hour}h : ${_initialTime.minute}mn"),
          IconButton(
            onPressed: updateIcon,
            icon: Icon(myIcon),
            color: colorIcon,
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: myKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      // onChanged: (value) {
                      //   setState(() {
                      //     prenom = value;
                      //   });
                      // },

                      // onSubmitted: (value) {
                      //   setState(() {
                      //     username = value;
                      //   });
                      // },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter valaible username !";
                        } else if (value.length <= 3) {
                          return "Nom trop court";
                        }
                        return "";
                      },
                      onSaved: (newValue) {
                        usernameData = newValue;
                      },
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      cursorColor: colorIcon,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorIcon)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorIcon)),
                        suffixIcon: Icon(
                          Icons.people_alt_outlined,
                          color: colorIcon,
                        ),
                        border: OutlineInputBorder(
                            // borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Username",
                        labelStyle: TextStyle(color: colorIcon),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter valaible password !";
                      } else if (value.length <= 9) {
                        return "Password must be >=10 in length";
                      }
                      return "";
                    },
                    controller: controller,
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (newValue) {
                      //   setState(() {
                      //     passwordData = newValue;
                      //   });
                    },
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    cursorColor: colorIcon,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorIcon)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorIcon)),
                      suffixIcon: Icon(
                        Icons.key,
                        color: colorIcon,
                      ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: colorIcon),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorIcon),
                        onPressed: () {
                          myKey.currentState!.validate();
                        },
                        child: const Text("Sign In")),
                  ),
                  Text(switchValue ? controller.text : ""),
                  Switch(
                    activeColor: colorIcon,
                    inactiveThumbColor: Colors.amber,
                    inactiveTrackColor: Colors.amber[300],
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                        colorIcon = colorIcon == Colors.pink
                            ? Colors.amber
                            : Colors.pink;
                        colorOulined = colorOulined == Colors.amber
                            ? Colors.pink
                            : Colors.amber;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Slider(
                        activeColor: colorIcon,
                        inactiveColor: colorOulined,
                        min: 0,
                        max: 10,
                        value: sliderValue,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                      Text(
                        "${sliderValue.toInt()}",
                        style: TextStyle(
                            color: colorIcon,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  Checkbox(
                      activeColor: colorIcon,
                      value: checkValue,
                      onChanged: (value) {
                        setState(() {
                          checkValue = value ?? false;
                        });
                      }),
                  check(),
                  sexeCheck()

                  //
                ]),
              ))
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorIcon,
        onPressed: updateColors,
        child: Icon(
          Icons.build,
          color: colorOulined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // updateColorIcon(){
  //   setState(() {
  //     switchValue?colorIcon:Colors
  //   });
  // }

  // Row radioCheck() {
  //   List<Widget> valueIndex = [];
  //   for (var i = 0; i < 2; i++) {
  //     Widget r = Radio(
  //       value: i,
  //       groupValue: _radioValue,
  //       onChanged: (value) {
  //         setState(() {
  //           _radioValue = value as int;
  //         });
  //       },
  //     );
  //     valueIndex.add(r);
  //   }
  //   return Row(children: valueIndex);
  // }

  Row sexeCheck() {
    List<Widget> sexeW = [];
    sexes.forEach((sexe, sValue) {
      Widget s = Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: [
            Radio(
              // activeColor: colorIcon,
              fillColor: MaterialStatePropertyAll(colorIcon),
              value: sValue,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value as int;
                });
              },
            ),
            Text(
              sexe,
              style: TextStyle(color: colorText),
            )
          ],
        ),
      );
      sexeW.add(s);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sexeW,
    );
  }

  Column check() {
    List<Widget> items = [];
    // Color itemColor = Colors.white;
    courses.forEach((item, isCheck) {
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: TextStyle(color: colorText),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Checkbox(
              // checkColor: colorIcon,
              // activeColor: colorIcon,
              fillColor: MaterialStatePropertyAll(colorIcon),
              // side: BorderSide(color: colorText),
              value: isCheck,
              onChanged: (value) {
                setState(() {
                  courses[item] = value ?? false;
                });
              },
            ),
          )
        ],
      );
      items.add(row);
    });

    return Column(
      children: items,
    );
  }

  updateIcon() {
    setState(() {
      myIcon =
          (myIcon == Icons.favorite) ? Icons.favorite_border : Icons.favorite;
    });
  }

  // Icon icon(myIcon, Color color) {
  //   return Icon(
  //     myIcon,
  //     color: color,
  //   );
  // }

  updateAppBar() {
    setState(() => _textButtonPress = !_textButtonPress);
  }

  String updateTextAppbar() {
    return _textButtonPress ? "Les intéractifs" : "AppBar";
  }

  updateColors() {
    setState(() {
      _backgroundColor =
          (_backgroundColor == Colors.white) ? Colors.black : Colors.white;

      colorText = (colorText == Colors.black) ? Colors.white : Colors.black;
      // print("$_backgroundColor");
    });
  }
}
