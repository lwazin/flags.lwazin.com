import 'package:flags_web/services/Provider.dart';
import 'package:flags_web/widgets/ref%20files/misc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: (settings.navCurrent == "Activities")
                ? Activities()
                : (settings.navCurrent == "Home")
                    ? Home()
                    : (settings.navCurrent == "About")
                        ? About()
                        : (settings.navCurrent == "Bonfire")
                            ? Bonfire()
                            : IgnorePointer(
                                ignoring: true,
                                child: Container(),
                              ),
          ),
        ),
      ),
    );
  }
}
