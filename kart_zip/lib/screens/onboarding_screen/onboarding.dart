import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kart_zip/global/colors.dart';
import 'package:kart_zip/screens/register_screens/register_screen.dart';

const LatLng currentlocal = LatLng(25.1193, 55.3773);

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  static const _initialcameraposition =
      CameraPosition(target: LatLng(37, -122), zoom: 11);

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Konum servislerinin etkin olup olmadığını kontrol et
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Konum servisleri etkin değilse, kullanıcıyı yönlendir veya bir hata mesajı göster
      return;
    }

    // Konum erişim izinlerini kontrol edin
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Kullanıcı konum erişim iznini reddettiyse, kullanıcıyı yönlendir veya bir hata mesajı göster
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Kullanıcı sonsuza kadar konum erişim iznini reddetti.
      return;
    }

    // Konum bilgilerini al
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Konum bilgileri
    double latitude = position.latitude;
    double longitude = position.longitude;

    print('Latitude: $latitude');
    print('Longitude: $longitude');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/mlogo.png",
          height: 39,
        ),
        leading: InkWell(
          onTap: () {},
          child: Image.asset("assets/menu.png"),
        ),
        actions: [
          IconButton(
              iconSize: 39,
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialcameraposition,
              trafficEnabled: true,
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 2 - 190,
                left: MediaQuery.of(context).size.height / 2 - 55,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: BgGreen),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/ayar.png"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: BgGreen),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/konum.png"),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // x, y koordinatları
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "KartZip'e hoş geldiniz",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Siz de kjhgfhvhsjadhjgsavdhasvdjhvasljhasvdghcsajdvhasjd",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 72,
                    width: 181,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(
                              112, 112, 112, 1), // Arka plan rengi
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => register_screen(),
                              ));
                        },
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 72,
                    width: 181,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BgGreen, // Arka plan rengi
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // radius
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
