import 'package:flutter/material.dart';
import 'package:signapp/signpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int genderRadio, handRadio;
  String gender = "", handChoice = "", age = "";

  @override
  void initState() {
    super.initState();
    genderRadio = 0;
    handRadio = 0;
  }

  setGenderChoice(int val) {
    setState(() {
      genderRadio = val;
      val == 1 ? gender = "Erkek" : "Kadın";
    });
  }

  setHandChoice(int val) {
    setState(() {
      handRadio = val;
      val == 1 ? handChoice = "Sağ" : handChoice = "Sol";
    });
  }

  saveParticipant(int val) {
    if (handChoice == "" || gender == "" || age == "") {
      AlertDialog alert = AlertDialog(
        title: Text("Hata!"),
        content:
            Text("Eksik bilgi girişi yaptınız, lütfen tüm bilgileri girin."),
        actions: [
          TextButton(
            child: Text("Tamam"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    } else {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => SignPage(),
        settings: RouteSettings(
          arguments: val
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/signApp_bg.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken)),
          )),
          Center(
            child: Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: screenSize.height * 0.05),
                        child: Text(
                          "İmza Kayıt Yazılımı",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Katılımcı No: 0",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: screenSize.height * 0.05,
                          bottom: screenSize.height * 0.01),
                      child: Divider(
                        height: 5,
                        thickness: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Cinsiyet Seçimi",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: screenSize.height * 0.01,
                            bottom: screenSize.height * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: genderRadio,
                                  onChanged: (int val) {
                                    setGenderChoice(val);
                                  },
                                  activeColor: Colors.black,
                                ),
                                Text(
                                  "Erkek",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: genderRadio,
                                  onChanged: (int val) {
                                    setGenderChoice(val);
                                  },
                                  activeColor: Colors.black,
                                ),
                                Text(
                                  "Kadın",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: screenSize.height * 0.01),
                      child: Divider(
                        height: 5,
                        thickness: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Yaş",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white60,
                          ),
                          child: TextField(
                            onChanged: (context) {
                              setState(() {
                                if (context != null) {
                                  age = context;
                                }
                              });
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Yaşınızı Giriniz"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: screenSize.height * 0.01),
                      child: Divider(
                        height: 5,
                        thickness: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "El Seçimi",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: screenSize.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: handRadio,
                                  onChanged: (int val) {
                                    setHandChoice(val);
                                  },
                                  activeColor: Colors.black,
                                ),
                                Text(
                                  "Sağ El",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: handRadio,
                                  onChanged: (int val) {
                                    setHandChoice(val);
                                  },
                                  activeColor: Colors.black,
                                ),
                                Text(
                                  "Sol El",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: screenSize.height * 0.01),
                      child: Divider(
                        height: 5,
                        thickness: 2,
                        color: Colors.grey,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenSize.width * 0.01,
                      right: screenSize.width * 0.05,
                      bottom: screenSize.height * 0.03,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            saveParticipant(20);
                          },
                          child: Text("20 İmza"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            saveParticipant(50);
                          },
                          child: Text("50 İmza"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            saveParticipant(100);
                          },
                          child: Text("100 İmza"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
