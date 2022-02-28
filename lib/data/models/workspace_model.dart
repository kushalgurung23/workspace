import 'package:workspace/data/models/feature_model.dart';

class WorkSpace {
  final String image, name, distance, priceDuration;
  final int price;
  bool isFavorite;
  final List<Feature> features;

  WorkSpace(
      {required this.image,
      required this.name,
      required this.distance,
      required this.price,
      required this.isFavorite,
      required this.priceDuration,
      required this.features});
}
