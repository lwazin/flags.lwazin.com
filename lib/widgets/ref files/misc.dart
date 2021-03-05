import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flags_web/services/Provider.dart';
import 'package:flags_web/widgets/Common.dart';
import 'package:flags_web/widgets/parallex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Activities extends StatelessWidget {
  ScrollController _rrectController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Column(
      children: [
        (MediaQuery.of(context).size.width > 1300)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.asset(
                            "assets/images/quads2.jpeg",
                            height: 400,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ACTIVITIES",
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
                            """Looking for things to do in Rustenburg? Ten Flags is the place to be. Ten Flags welcomes you on a rainy or sunny day! Brimming with a kids area, massage parlour and more, our huge home has become one of the most beloved in the city! A place of pure excitement!

With a variety of activities that enhance both physical and mental health, Ten Flags provides an incredible list of family or team-building experiences.""",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.asset(
                            "assets/images/quads2.jpeg",
                            height: 400,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Container(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ACTIVITIES",
                              textAlign: TextAlign.center,
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
                            """Looking for things to do in Rustenburg? Ten Flags is the place to be. Ten Flags welcomes you on a rainy or sunny day! Brimming with a kids area, massage parlour and more, our huge home has become one of the most beloved in the city! A place of pure excitement!

With a variety of activities that enhance both physical and mental health, Ten Flags provides an incredible list of family or team-building experiences.""",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
        Container(
          height: 20,
        ),
        Container(
          width: (MediaQuery.of(context).size.width < 700)
              ? MediaQuery.of(context).size.width
              : 1200,
          height: (MediaQuery.of(context).size.width < 700) ? 400 : 600,
          child: (MediaQuery.of(context).size.width < 700)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: activities.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: GestureDetector(
                        onTap: () {
                          settings.switchAdImage(activities[index]['image']);
                          settings.switchAd();
                        },
                        child: Container(
                          child: Opacity(
                            opacity: 0.8,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Image.asset(
                                activities[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          width: 500.0,
                          // height: 100.0,
                        ),
                      ),
                    ),
                  ),
                )
              : DraggableScrollbar.rrect(
                  controller: _rrectController,
                  alwaysVisibleScrollThumb: true,
                  child: StaggeredGridView.countBuilder(
                    controller: _rrectController,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 4,
                    itemCount: activities.length,
                    itemBuilder: (BuildContext context, int index) => ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: GestureDetector(
                        onTap: () {
                          settings.switchAdImage(activities[index]['image']);
                          settings.switchAdRequirement(false);
                          settings.switchAd();
                        },
                        child: Container(
                          child: Opacity(
                            opacity: 0.8,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Image.asset(
                                activities[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(
                            (MediaQuery.of(context).size.width < 700)
                                ? 3
                                : (MediaQuery.of(context).size.width < 800)
                                    ? 2
                                    : 1,
                            (MediaQuery.of(context).size.width < 700)
                                ? 1
                                : (MediaQuery.of(context).size.width < 800)
                                    ? index.isEven
                                        ? 2
                                        : 1
                                    : index.isEven
                                        ? 1
                                        : 1),
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                ),
        ),
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              // height: 600,
              // width: MediaQuery.of(context).size.width,

              child: (MediaQuery.of(context).size.width > 800)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          child: Image.asset(
                            "assets/images/chef.jpg",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 1.5,
                          ),
                        ),
                        Container(
                          height: 600,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RESTAURANTS",
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
                              Container(
                                height: 10,
                              ),
                              Container(
                                width: 500,
                                child: Text(
                                  """If you’re looking for meals bursting with distinctive stateside flavours then take a seat in on of our restaurants, with good music playing in the background while you prepare yourself for a taste sensation!

We’ve created carefully curated menues to help food lovers choose their favourite meals. Whether you’re looking for a chesanyama, Hallal Restaurant and Beverages Hub, at Ten Flags restaurant you’ll be able to find the best options here.""",
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
                              ),
                              Container(
                                height: 60,
                              ),
                              Text(
                                "BRANDS ASSOCIATED WITH US",
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
                              Image.asset("assets/images/Brands.jpg")
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/chef.jpg",
                              fit: BoxFit.cover,
                              width: 700,
                            ),
                          ),
                        ),
                        Container(
                          // height: 600,
                          // width: 700,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Text(
                                "RESTAURANTS",
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
                              Container(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 600,
                                  child: Text(
                                    """If you’re looking for meals bursting with distinctive stateside flavours then take a seat in on of our restaurants, with good music playing in the background while you prepare yourself for a taste sensation!

We’ve created carefully curated menues to help food lovers choose their favourite meals. Whether you’re looking for a chesanyama, Hallal Restaurant and Beverages Hub, at Ten Flags restaurant you’ll be able to find the best options here.""",
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
                                ),
                              ),
                              Container(
                                height: 30,
                              ),
                              Text(
                                "BRANDS ASSOCIATED WITH US",
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
                              Image.asset("assets/images/Brands.jpg")
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ),
          (MediaQuery.of(context).size.width < 800)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ACTIVITIES",
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
                )
              : Text(""),
          (MediaQuery.of(context).size.width < 800)
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 600,
                    child: Text(
                      "With both in and outdoor activities, any time is perfect to visit Ten Flags Theme Park. From go-karts & quad bikes to arcade games & an ice skating rink.. There's something for the family and groups of friends!",
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
                  ),
                )
              : Text(""),
          Opacity(
            opacity: .8,
            child: Container(
              // height: 500,
              // width: MediaQuery.of(context).size.width,

              child: (MediaQuery.of(context).size.width > 1360)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/Paint.jpg",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width / 3.5,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            "assets/images/Spin.jpg",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/Paint.jpg",
                              fit: BoxFit.cover,
                              width: 700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/Spin.jpg",
                              fit: BoxFit.cover,
                              width: 700,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          (MediaQuery.of(context).size.width > 800)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ACTIVITIES",
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
                )
              : Text(""),
          (MediaQuery.of(context).size.width > 800)
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 600,
                    child: Text(
                      "With both in and outdoor activities, any time is perfect to visit Ten Flags Theme Park. From go-karts & quad bikes to arcade games & an ice skating rink.. There's something for the family and groups of friends!",
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
                  ),
                )
              : Text(""),
          myMap(),
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Container(
      child: (MediaQuery.of(context).size.width > 1000)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: .0),
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            "assets/images/before.jpg",
                            width: 500,
                            height: 800,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/Ten-Flags-Theme-Park-Rustenburg-Icon-1024x1024-1.png",
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ABOUT US, TEN FLAGS",
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
                        """The Ten Flags Theme Park provides adventure, enjoyment and memories that last a lifetime. With it's name inspired by the Founder's vision to build 10 parks, Ten Flags is conctantly building itself into a bigger and better experience for all people from all walks of life! 
                  
We are proud to say that we have the biggest ice rink in the country if not Africa. We have various attractions and activities that open up opportunities to discover new hobbies and career options. We have catered for all classes and groups of people from friends, couple, individuals and families. For our adrenaline lovers we have two Italian super cars ready to take you out on our specially built race track for a heart racing experience you’ll never forget. Our helicopter is ready to take anyone out on journey into the skies where freedom and limitless possibilities is what we leave you feeling.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 30,
                      ),
                      Text(
                        "BRANDS ASSOCIATED WITH US",
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
                      Image.asset("assets/images/Brands.jpg"),
                      Text(
                        "CONTACT US",
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
                      Container(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.deepOrange,
                                  ),
                                  Text(
                                    """info@tenflagsthemepark.co.za""",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.deepOrange,
                                  ),
                                  Text(
                                    """(014)-941-0823""",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.deepOrange,
                              ),
                              Text(
                                """Farm Karussel
572 Rex Road
Rustenburg
0300""",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(5),
                //       child: Image.asset(
                //         "assets/images/Ten-Flags-Theme-Park-Rustenburg-Icon-1024x1024-1.png",
                //         width: 200,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Ten-Flags-Theme-Park-Rustenburg-Icon-1024x1024-1.png",
                  width: 200,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: .0),
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            "assets/images/before.jpg",
                            width: 700,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 600,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ABOUT US, TEN FLAGS",
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
                        """The Ten Flags Theme Park provides adventure, enjoyment and memories that last a lifetime. With it's name inspired by the Founder's vision to build 10 parks, Ten Flags is conctantly building itself into a bigger and better experience for all people from all walks of life! 
                  
We are proud to say that we have the biggest ice rink in the country if not Africa. We have various attractions and activities that open up opportunities to discover new hobbies and career options. We have catered for all classes and groups of people from friends, couple, individuals and families. For our adrenaline lovers we have two Italian super cars ready to take you out on our specially built race track for a heart racing experience you’ll never forget. Our helicopter is ready to take anyone out on journey into the skies where freedom and limitless possibilities is what we leave you feeling.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 20,
                      ),
                      Text(
                        "BRANDS ASSOCIATED WITH US",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/Brands.jpg"),
                      ),
                      Container(
                        height: 20,
                      ),
                      Text(
                        "CONTACT US",
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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: 0.8,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  "assets/images/vr.jpg",
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 600,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        child: CommentBox(2),
                        width: 400,
                      ),
                      Container(
                        width: 300,
                        height: 1,
                        color: Colors.deepOrange,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.deepOrange,
                                  ),
                                  Text(
                                    """info@tenflagsthemepark.co.za""",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.deepOrange,
                                  ),
                                  Text(
                                    """(014)-941-0823""",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.deepOrange,
                              ),
                              Text(
                                """Farm Karussel
572 Rex Road
Rustenburg
0300""",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                      )
                    ],
                  ),
                )
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(5),
                //       child: Image.asset(
                //         "assets/images/Ten-Flags-Theme-Park-Rustenburg-Icon-1024x1024-1.png",
                //         width: 200,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
    );
  }
}

class Bonfire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Text("Bonfire"),
      ),
    );
  }
}

List activities = [
  {
    "name": "Paint Ball",
    "image": "assets/images/Paint-Ball-scaled-e1578336716626.jpg"
  },
  {"name": "Ten-Pin Bowling", "image": "assets/images/Ten-Pin-Bowling.jpg"},
  {"name": "Ice Skating", "image": "assets/images/Ice-Skating.jpg"},
  {"name": "Go Karts (On Ice)", "image": "assets/images/Go-Karts-On-ice.jpg"},
  {
    "name": "Go Karts (Off Road)",
    "image": "assets/images/Go-Kart-Off-Road.jpg"
  },
  {"name": "Go Karts (On Road)", "image": "assets/images/Go-Kart-On-Road.jpg"},
  {"name": "Arcade Games", "image": "assets/images/Arcade-Games.jpg"},
  {"name": "Laser Tag", "image": "assets/images/Laser-Tag-scaled.jpg"},
  {
    "name": "LAMBORGHINI & FERRARI RIDES",
    "image": "assets/images/Lamborghini-Ferrari-Rides.jpg"
  },
  {"name": "Helicopter Rides", "image": "assets/images/Helicopter-Rides.jpg"},
  {"name": "Bumper Cars", "image": "assets/images/Bumper-Cars.jpg"},
  {
    "name": "5 A Side Soccer (Turf)",
    "image": "assets/images/5-Aside-Soccer-Turf.jpg"
  },
  {
    "name": "Golf Practice (Nets)",
    "image": "assets/images/Golf-Practice-Nets.jpg"
  },
  {"name": "Foam & Snow Bath", "image": "assets/images/Foam-and-Snow-Bath.jpg"},
  {"name": "Zipline", "image": "assets/images/Zipline.jpg"},
  {"name": "Roller Skating", "image": "assets/images/Roller-Skating.jpg"},
  {"name": "Quad Bikes", "image": "assets/images/Quad-Bikes.jpg"},
  {"name": "Pellet Shooting", "image": "assets/images/Pellet-Shooting.jpg"},
  {"name": "Maze", "image": "assets/images/Maze.jpg"},
  {"name": "Axe Throwing", "image": "assets/images/Axe-Throwing.jpg"},
  {"name": "Archery", "image": "assets/images/Archery.jpg"},
];
