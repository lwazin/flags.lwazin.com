import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flags_web/services/Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoBar extends StatefulWidget {
  @override
  _InfoBarState createState() => _InfoBarState();
}

class _InfoBarState extends State<InfoBar> {
  bool showBubble = true;
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 200,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showBubble = !showBubble;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/worker.png",
                  width: 200,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: (showBubble) ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 150.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/bubble.png",
                    width: 200,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                settings.switchUpgrade();
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
        ),
      ),
    );
  }
}

class myMap extends StatefulWidget {
  @override
  _myMapState createState() => _myMapState();
}

class _myMapState extends State<myMap> {
  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.width > 1360)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    launchURL() async {
                      const url =
                          'https://www.google.com/maps/place/Ten+Flags+Theme+Park/@-25.7597643,27.3470005,16z/data=!4m5!3m4!1s0x1ebe0590ef207d85:0x2a69f977da6948f1!8m2!3d-25.7632235!4d27.3458203';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    launchURL();
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("PLAN YOUR VISIT TODAY!",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                              letterSpacing: 0,
                              fontSize: 15,
                            ))),
                      ),
                      Opacity(
                        opacity: 0.8,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 400,
                              width: 700,
                              // width: MediaQuery.of(context).size.width,

                              child: Image.asset(
                                "assets/images/myMap.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "ANY FEEDBACK??",
                                  // textAlign: TextAlign.left,
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[600],
                                      letterSpacing: 0,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                """A few aspects of The Park are being upgraded or added.. to make your experience unique, here at Ten Flags of course! Feel free to suggest a few things or simply thank the team, using the box below..""",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    letterSpacing: 0,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CommentBox(1),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  launchURL() async {
                    const url =
                        'https://www.google.com/maps/place/Ten+Flags+Theme+Park/@-25.7597643,27.3470005,16z/data=!4m5!3m4!1s0x1ebe0590ef207d85:0x2a69f977da6948f1!8m2!3d-25.7632235!4d27.3458203';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }

                  launchURL();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PLAN YOUR VISIT TODAY!",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[600],
                            letterSpacing: 0,
                            fontSize: 15,
                          ))),
                    ),
                    Opacity(
                      opacity: 0.8,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 400,
                              // width: MediaQuery.of(context).size.width,

                              child: Image.asset(
                                "assets/images/myMap.png",
                                width: 700,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 20,
              ),
              Container(
                height: 10,
              ),
              (MediaQuery.of(context).size.width < 700)
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "ANY FEEDBACK??",
                                      // textAlign: TextAlign.left,
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[600],
                                          letterSpacing: 0,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    """A few aspects of The Park are being upgraded or added.. to make your experience unique, here at Ten Flags of course! Feel free to suggest a few things or simply thank the team, using the box below..""",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        letterSpacing: 0,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CommentBox(2),
                        ],
                      ),
                    )
                  : Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 600,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "ANY FEEDBACK??",
                                        // textAlign: TextAlign.left,
                                        style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[600],
                                            letterSpacing: 0,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      """A few aspects of The Park are being upgraded or added.. to make your experience unique, here at Ten Flags of course! Feel free to suggest a few things or simply thank the team, using the box below..""",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          letterSpacing: 0,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CommentBox(1),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          );
  }
}

class CommentBox extends StatefulWidget {
  int option;

  CommentBox(this.option);
  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final _formKey = GlobalKey<FormState>();
  bool comment = false;
  bool email = false;
  bool name = false;
  String commentText = "";
  String nameText = "";
  String emailText = "";

  @override
  Widget build(BuildContext context) {
    fs.FirebaseFirestore firestore = fs.FirebaseFirestore.instance;
    return (widget.option == 1)
        ? Container(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                top: 10.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 600,
                        height: 150,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                commentText = value;
                              });
                              if (value.isEmpty) {
                                setState(() {
                                  comment = false;
                                });
                                return null;
                              }
                              setState(() {
                                comment = true;
                              });
                              return null;
                            },
                            autocorrect: true,
                            maxLength: 380,
                            maxLines: 5,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'What\'s on your mind?'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 225,
                              height: 40,
                              color: Colors.black12,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    nameText = value;
                                  });
                                  if (value.isEmpty) {
                                    setState(() {
                                      name = false;
                                    });
                                    return null;
                                  }
                                  setState(() {
                                    name = true;
                                  });
                                  return null;
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    hintText: 'Name..'),
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 265,
                              height: 40,
                              color: Colors.black12,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    emailText = value;
                                  });
                                  if (value.isEmpty ||
                                      !value.contains("@") ||
                                      !value.contains(".")) {
                                    setState(() {
                                      email = false;
                                    });
                                    return null;
                                  }
                                  setState(() {
                                    email = true;
                                  });
                                  return null;
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    hintText: 'E-Mail Address..'),
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Opacity(
                              opacity: (comment && email && name) ? 1 : 0.6,
                              child: MouseRegion(
                                cursor: (comment && email && name)
                                    ? SystemMouseCursors.click
                                    : SystemMouseCursors.basic,
                                child: GestureDetector(
                                  onTap: () {
                                    DateTime now = new DateTime.now();
                                    if (commentText.isNotEmpty &&
                                        emailText.isNotEmpty &&
                                        nameText.isNotEmpty) {
                                      firestore
                                          .collection("userInputData")
                                          .doc()
                                          .set({
                                        "inputType": "Comment",
                                        "comment": commentText,
                                        "email": emailText,
                                        "name": nameText,
                                        "processed": false,
                                        "time": now
                                      });
                                      print("object");
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(
                                      milliseconds: 200,
                                    ),
                                    width: 90,
                                    height: 40,
                                    color: (comment && email && name)
                                        ? Colors.lime
                                        : Colors.pink[50],
                                    child: Center(
                                      child: Text(
                                        """SEND""",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[600],
                                            letterSpacing: 0,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                top: 10.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          color: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  commentText = value;
                                });
                                if (value.isEmpty) {
                                  setState(() {
                                    comment = false;
                                  });
                                  return null;
                                }
                                setState(() {
                                  comment = true;
                                });
                                return null;
                              },
                              autocorrect: true,
                              maxLength: 380,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'What\'s on your mind?'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              color: Colors.black12,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    nameText = value;
                                  });
                                  if (value.isEmpty) {
                                    setState(() {
                                      name = false;
                                    });
                                    return null;
                                  }
                                  setState(() {
                                    name = true;
                                  });
                                  return null;
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    hintText: 'Name..'),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              color: Colors.black12,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    emailText = value;
                                  });
                                  if (value.isEmpty ||
                                      !value.contains("@") ||
                                      !value.contains(".")) {
                                    setState(() {
                                      email = false;
                                    });
                                    return null;
                                  }
                                  setState(() {
                                    email = true;
                                  });
                                  return null;
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    hintText: 'E-Mail Address..'),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: MouseRegion(
                              cursor: (comment && email && name)
                                  ? SystemMouseCursors.click
                                  : SystemMouseCursors.basic,
                              child: Opacity(
                                opacity: (comment && email && name) ? 1 : 0.6,
                                child: GestureDetector(
                                  onTap: () {
                                    if (comment && email && name) {
                                      DateTime now = new DateTime.now();

                                      if (commentText.isNotEmpty &&
                                          emailText.isNotEmpty &&
                                          nameText.isNotEmpty) {
                                        firestore
                                            .collection("userInputData")
                                            .doc()
                                            .set({
                                          "inputType": "Comment",
                                          "comment": commentText,
                                          "email": emailText,
                                          "name": nameText,
                                          "processed": false,
                                          "time": now
                                        });
                                        print("object");
                                      }
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(
                                      milliseconds: 200,
                                    ),
                                    width: 90,
                                    height: 40,
                                    color: (comment && email && name)
                                        ? Colors.lime
                                        : Colors.pink[50],
                                    child: Center(
                                      child: Text(
                                        """SEND""",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[600],
                                            letterSpacing: 0,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
