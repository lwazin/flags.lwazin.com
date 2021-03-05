import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flags_web/services/Provider.dart';
import 'package:flags_web/widgets/CardWidget.dart';
import 'package:flags_web/widgets/Common.dart';
import 'package:flags_web/widgets/MainWidget.dart';
import 'package:flags_web/widgets/MenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WrapperPage extends StatefulWidget {
  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  final int now = DateTime.now().year;
  bool settingsLoaded = false;
  var savedData;
  Future<Map> GetSettings() async {
    var settings = Provider.of<Settings>(context, listen: true);
    fs.FirebaseFirestore firestore = fs.FirebaseFirestore.instance;
    var ds = await firestore.collection('siteSettings').doc("adverts").get();
    settings.newAdvertMap(ds);
    print(settings.advertSettings["main"]);
    settings.switchAdImage(settings.advertSettings["main"]);
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    if (!settingsLoaded) {
      GetSettings();
      settingsLoaded = true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          (settings.adImage.isEmpty)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Opacity(
                    opacity: 0.1,
                    child: (MediaQuery.of(context).size.width > 1000)
                        ? Transform.rotate(
                            angle: 25,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/Ten-Flags-Theme-Park-Rustenburg-Icon-1024x1024-1.png",
                                height: 500,
                                width: 500,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey[800],
                          ),
                          Container(
                            width: 5,
                          ),
                          Text(
                            "(014)-941-0823",
                            style: GoogleFonts.nobile(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                                letterSpacing: 0,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.grey[800],
                          ),
                          Container(
                            width: 5,
                          ),
                          Text(
                            "info@tenflagsthemepark.co.za",
                            style: GoogleFonts.nobile(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                                letterSpacing: 0,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: CardWidget(
                                            settings.advertSettings["advert1"],
                                          ),
                                        ),
                                        height: 300,
                                        width: 1000,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: CardWidget(
                                          settings.advertSettings["advert2"],
                                        ),
                                        height: 300,
                                        width: 1000,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: CardWidget(
                                          settings.advertSettings["advert3"],
                                        ),
                                        height: 300,
                                        width: 1000,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        MenuWidget(),
                        (MediaQuery.of(context).size.width > 800)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      launchURL() async {
                                        const url =
                                            'https://web.facebook.com/tenflagz/';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      }

                                      launchURL();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, top: 25.0),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Image.asset(
                                          "assets/images/facebook.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      launchURL() async {
                                        const url =
                                            'https://www.instagram.com/tenflagsthemepark/';

                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      }

                                      launchURL();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16.0, top: 25.0),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Image.asset(
                                          "assets/images/instagram.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Text(""),
                      ],
                    ),
                    MainWidget(),
                    // Container(
                    //   height: 30,
                    //   color: Colors.red[50],
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "Copyright © ${now} || Ten Flags Theme Park. All rights reserved.",
                    //         style: GoogleFonts.basic(
                    //           textStyle: TextStyle(
                    //             fontWeight: FontWeight.w700,
                    //             color: Colors.black54,
                    //             letterSpacing: 0,
                    //             fontSize: 10,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  height: 30,
                  color: Colors.red[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Copyright © ${now} || Ten Flags Theme Park. All rights reserved.",
                        style: GoogleFonts.basic(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                            letterSpacing: 0,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          (settings.ad == true)
              ? (MediaQuery.of(context).size.width < 800)
                  ? Text("")
                  : Stack(
                      children: [
                        Container(
                          color: Colors.black54,
                          child: Center(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 1000,
                              child: (settings.networkOrAsset)
                                  ? Image.network(
                                      settings.adImage,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      settings.adImage,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            settings.switchAd();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
              : IgnorePointer(
                  ignoring: true,
                  child: Container(),
                ),
          (settings.upgrade)
              ? (MediaQuery.of(context).size.width < 800)
                  ? Text("")
                  : InfoBar()
              : IgnorePointer(
                  ignoring: true,
                  child: Container(),
                ),
        ],
      ),
    );
  }
}
