import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kart_zip/screens/register_screens/regsiterage.dart';

import '../../global/colors.dart';

class requestno extends StatefulWidget {
  const requestno({super.key});

  @override
  State<requestno> createState() => _requestnoState();
}

class _requestnoState extends State<requestno> {
  int _secondsRemaining = 60;
  bool _isCounting = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    if (!_isCounting) {
      _isCounting = true;
      _updateCountdown();
    }
  }

  void _updateCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        _updateCountdown();
      } else {
        _isCounting = false;
      }
    });
  }

  void _resetCountdown() {
    setState(() {
      _secondsRemaining = 60;
      _isCounting = false;
    });
  }

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
          title: Text("Telefon numaranızı doğrulayın"),
          centerTitle: true,
          actions: [Container()],
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Telefon numaranızı doğrulayın",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(76, 75, 82, 1)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Lütfen telefonunuza gelen doğrulama kodunu girin. Kodun size gelmesi birkaç dakika sürebilir.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(76, 75, 82, 1)),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4)
                            ],
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Kodu tekrar gönder ($_secondsRemaining)"),
                        IconButton(
                            onPressed: _resetCountdown,
                            icon: Icon(Icons.refresh))
                      ],
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
                                borderRadius:
                                    BorderRadius.circular(15), // radius
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => registerage(),
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
            ),
          ),
        ),
      ),
    );
  }
}
