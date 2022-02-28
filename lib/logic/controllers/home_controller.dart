import 'package:flutter/cupertino.dart';
import 'package:workspace/data/models/feature_model.dart';
import 'package:workspace/data/models/workspace_model.dart';

class HomeController extends ChangeNotifier {
  List<Map> categories = [
    {
      'label': "All",
    },
    {
      'label': "Cafe",
    },
    {
      'label': "Library",
    },
    {
      'label': "Restaurant",
    },
    {
      'label': "Park",
    },
    {
      'label': "Co-space",
    },
  ];

  int selectedLabel = 0;

  void changeLabel({required int selectedLabel}) {
    this.selectedLabel = selectedLabel;
    notifyListeners();
  }

  List<WorkSpace> workSpaces = [
    WorkSpace(
        image: "assets/images/top.jpg",
        name: "Downtown Workspace",
        distance: "882 kilometers away",
        price: 900,
        isFavorite: false,
        priceDuration: "month",
        features: [
          Feature(
              featureName: 'Health & Safety',
              image: "assets/svg/health.svg",
              containerColor: const Color(0xFF407BFF).withOpacity(0.1)),
          Feature(
              featureName: '🎨  Most visits by designers',
              containerColor: const Color(0xFFFE8D80).withOpacity(0.1)),
          Feature(
              featureName: '5.0 (7)',
              image: "assets/svg/star.svg",
              containerColor: const Color(0xFFF5BE16).withOpacity(0.1)),
        ]),
    WorkSpace(
        image: "assets/images/bottom.jpg",
        name: "Downtown Workspace",
        distance: "882 kilometers away",
        price: 900,
        isFavorite: true,
        priceDuration: "month",
        features: [
          Feature(
              featureName: 'Health & Safety',
              image: "assets/svg/health.svg",
              containerColor: const Color(0xFF407BFF).withOpacity(0.1)),
          Feature(
              featureName: '🎨  Most visits by designers',
              containerColor: const Color(0xFFFE8D80).withOpacity(0.1)),
          Feature(
              featureName: '5.0 (7)',
              image: "assets/svg/star.svg",
              containerColor: const Color(0xFFF5BE16).withOpacity(0.1)),
        ]),
  ];

  List<WorkSpace> get workspaceList => List.from(workSpaces);

  void changeFavoriteStatus({required WorkSpace workspace}) {
    if (workspace.isFavorite == true) {
      workspace.isFavorite = false;
    } else {
      workspace.isFavorite = true;
    }
    notifyListeners();
  }
}
