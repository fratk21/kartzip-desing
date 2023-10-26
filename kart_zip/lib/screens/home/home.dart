import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kart_zip/screens/profile/profile.dart';

import '../../global/colors.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
                bottom: MediaQuery.of(context).size.height / 2 - 20,
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profile(),
                              ));
                        },
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
                )),
            Positioned(
                top: MediaQuery.of(context).size.height - 60,
                left: MediaQuery.of(context).size.width / 2 - 90,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: BgGreen,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    height: 30,
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Alanı Tara",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
