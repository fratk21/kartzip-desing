import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:kart_zip/screens/home/home.dart';

import '../../global/colors.dart';

class registermail extends StatefulWidget {
  const registermail({super.key});

  @override
  State<registermail> createState() => _registermailState();
}

class _registermailState extends State<registermail> {
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
                    "E-posta adresinizi girin",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 75, 82, 1)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Kayıt işlemini tamamlamak için lütfen gerekli bilgileri doğru ve eksiksiz bir şekilde giriniz.",
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
                        child: TextField()),
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
                                    text:
                                        'KartZip hakkında en son gelişmeler ve\nkampanyalardan haberdar olmak istiyorum',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: BgGreen,
                                        fontWeight: FontWeight.w500)),
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
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 72,
                    width: MediaQuery.of(context).size.width,
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
                              builder: (context) => home(),
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
          )),
        ),
      ),
    );
  }
}
