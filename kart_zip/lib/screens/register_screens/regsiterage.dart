import 'package:flutter/material.dart';
import 'package:kart_zip/screens/register_screens/registermail.dart';

import '../../global/colors.dart';

class registerage extends StatefulWidget {
  const registerage({super.key});

  @override
  State<registerage> createState() => _registerageState();
}

class _registerageState extends State<registerage> {
  DateTime? _selectedDate; // Kullanıcının seçtiği tarihi tutmak için değişken
  TextEditingController _agecontroller = TextEditingController();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _agecontroller.text =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agecontroller.text = "Doğum Tarihinizi Girin";
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
          title: Text("Kayıt ol"),
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
                    Row(
                      children: [
                        Text(
                          "Kaç yaşındasın?",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(76, 75, 82, 1)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Kayıt işlemini tamamlamak için lütfen gerekli bilgileri doğru ve eksiksiz bir  şekilde giriniz.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(76, 75, 82, 1)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Doğum Tarihi",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(76, 75, 82, 1)),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: TextField(
                              controller: _agecontroller,
                              enabled: false,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                      ),
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
                                builder: (context) => registermail(),
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
            ),
          ),
        ),
      ),
    );
  }
}
