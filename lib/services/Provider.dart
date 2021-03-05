import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings with ChangeNotifier, DiagnosticableTreeMixin {
  String _navCurrent = 'Home';
  String _adImage = "";
  bool _ad = true;
  bool _networkOrAsset = true;
  bool _upgrade = true;
  DocumentSnapshot _advertSettings;

  DocumentSnapshot get advertSettings => _advertSettings;

  void newAdvertMap(DocumentSnapshot value) {
    _advertSettings = value;
    notifyListeners();
  }

  String get navCurrent => _navCurrent;

  void newNav(String value) {
    _navCurrent = value;
    notifyListeners();
  }

  bool get ad => _ad;

  void switchAd() {
    _ad = !_ad;
    notifyListeners();
  }

  bool get networkOrAsset => _networkOrAsset;

  void switchAdRequirement(bool value) {
    _networkOrAsset = value;
    notifyListeners();
  }

  bool get upgrade => _upgrade;

  void switchUpgrade() {
    _upgrade = !_upgrade;
    notifyListeners();
  }

  String get adImage => _adImage;

  void switchAdImage(String image) {
    _adImage = image;
    notifyListeners();
  }
}
