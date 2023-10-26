import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kart_zip/global/colors.dart';
import 'package:kart_zip/screens/register_screens/requestno.dart';

class register_screen extends StatefulWidget {
  const register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  TextEditingController _phonecontroller = TextEditingController();
  final _controller00 = ValueNotifier<bool>(false);
  final _controller01 = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BgGreen,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/esc.png"),
          ),
          title: Image.asset(
            "assets/logo.png",
            height: 200,
          ),
          centerTitle: true,
          actions: [Container()],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "Telefon numaranızı girin",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 75, 82, 1)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Lütfen kayıt olmak için telefon numaranızı doğrulayın. Doğrulama işlemi için size bir SMS gönderilecektir.",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 75, 82, 1)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        initialValue: PhoneNumber(isoCode: 'TR'),
                        textFieldController: _phonecontroller,
                        inputBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Şartlar ve Koşullar',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: BgGreen,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                  text: "'ı kabul ediyorum",
                                  style: TextStyle(
                                      color: Colors
                                          .black, // Rengi değiştirilen kısım
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          AdvancedSwitch(
                            height: 20,
                            width: 50,
                            controller: _controller00,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Gizlilik Politikası',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: BgGreen,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                  text: "'nı kabul ediyorum",
                                  style: TextStyle(
                                      color: Colors
                                          .black, // Rengi değiştirilen kısım
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          AdvancedSwitch(
                            height: 20,
                            width: 50,
                            controller: _controller01,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "VEYA",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(54, 127, 192, 1),
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          Text(
                            "Facebook ile giriş",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(221, 75, 57, 1),
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.g_mobiledata,
                            color: Colors.white,
                          ),
                          Text(
                            "Google ile giriş",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 72,
                        width: 134,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(
                                  112, 112, 112, 1), // Arka plan rengi
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15), // radius
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Geri",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 72,
                        width: 225,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BgGreen, // Arka plan rengi
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => requestno(),
                                ));
                          },
                          label: Text(
                            "Devam",
                            style: TextStyle(fontSize: 16),
                          ),
                          icon: Icon(Icons.arrow_forward_outlined),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
