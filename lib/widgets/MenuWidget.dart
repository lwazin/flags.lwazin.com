import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flags_web/services/Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);

    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (MediaQuery.of(context).size.width > 800) {
                settings.switchAdImage(settings.advertSettings["main"]);
                settings.switchAdRequirement(true);
                settings.switchAd();
              } else {
                launchURL() async {
                  const url = 'https://web.facebook.com/tenflagz/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                }

                launchURL();

                launchURL2() async {
                  const url = 'https://www.instagram.com/tenflagsthemepark/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                }

                launchURL2();
              }
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Image.asset(
                'assets/images/Ten-Flags-Theme-Park-Rustenburg-Icon-1024x1024-1.png',
                height: 100,
                width: 100,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (settings.navCurrent == "Home")
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Home",
                              style: GoogleFonts.juliusSansOne(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 2),
                            child: Container(
                              height: 2,
                              width: 40,
                              color: Colors.deepOrange,
                            ),
                          )
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        settings.newNav("Home");
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Home",
                            style: GoogleFonts.juliusSansOne(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              (settings.navCurrent == "Activities")
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Activities",
                              style: GoogleFonts.juliusSansOne(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 2,
                              width: 40,
                              color: Colors.deepOrange,
                            ),
                          )
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        settings.newNav("Activities");
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Activities",
                            style: GoogleFonts.juliusSansOne(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              (settings.navCurrent == "About")
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "About Us",
                              style: GoogleFonts.juliusSansOne(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 2,
                              width: 40,
                              color: Colors.deepOrange,
                            ),
                          )
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        settings.newNav("About");
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "About Us",
                            style: GoogleFonts.juliusSansOne(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
