import 'package:flutter/material.dart';
import 'package:kart_zip/global/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final List<ProfileMenuItem> menuItems = [
    ProfileMenuItem(icon: Icons.history, title: 'Geçmiş Sürüşlerim'),
    ProfileMenuItem(icon: Icons.local_offer, title: 'Kampanyalar'),
    ProfileMenuItem(icon: Icons.local_activity, title: 'Promosyon kodu'),
    ProfileMenuItem(icon: Icons.directions_car, title: 'Sürüş Kılavuzu'),
    ProfileMenuItem(icon: Icons.share, title: 'Paylaş'),
    ProfileMenuItem(icon: Icons.info, title: 'Hakkımızda'),
    ProfileMenuItem(icon: Icons.mail, title: 'Bizimle iletişime geç'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Image.asset(
              "assets/mlogo.png",
              height: 39,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: BgGreen,
                  size: 35,
                )),
            actions: [
              InkWell(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.notifications_none,
                      color: BgGreen,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Container(
                width: 20,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: AssetImage("assets/mlogo.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text("Hoş geldin Burak",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("+90 (555) 213 36 70",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 35,
                            width: 164,
                            color: Colors.transparent,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: BgGreen,
                                  side: BorderSide(color: BgGreen),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Profili İncele",
                                  style: TextStyle(
                                      color: BgGreen,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final menuItem = menuItems[index];
                      return ListTile(
                        leading: Icon(
                          menuItem.icon,
                          color: BgGreen,
                        ),
                        title: Text(menuItem.title),
                        onTap: () {
                          print(menuItem.title);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Text(
                    "Bizi buradan takip edin",
                    style: TextStyle(fontSize: 15),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.facebook))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class ProfileMenuItem {
  final IconData icon;
  final String title;

  ProfileMenuItem({required this.icon, required this.title});
}
