import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workspace/data/models/feature_model.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';
import 'package:workspace/presentation/widgets/workspace_feature.dart';

class WorkSpaceContainer extends StatelessWidget {
  final String image, name, distance, priceDuration;
  final int price;
  final bool isFavorite;
  final List<Feature> features;
  final VoidCallback onTap, favoriteOntap;
  const WorkSpaceContainer(
      {Key? key,
      required this.onTap,
      required this.favoriteOntap,
      required this.image,
      required this.name,
      required this.distance,
      required this.price,
      required this.isFavorite,
      required this.priceDuration,
      required this.features})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: SizeConfig.defaultSize * 22,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(SizeConfig.defaultSize),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(0.5)),
                    child: Center(
                      child: IconButton(
                        onPressed: favoriteOntap,
                        icon: Icon(
                          isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 2.5,
              child: ListView.builder(
                itemCount: features.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WorkspaceFeature(
                    color: features[index].containerColor,
                    widget: features[index].image == null
                        ? Text(
                            features[index].featureName,
                            style: TextStyle(
                                fontFamily: 'Poppins400',
                                fontSize: SizeConfig.defaultSize * 1.15),
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                SvgPicture.asset(features[index].image!),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(features[index].featureName,
                                      style: TextStyle(
                                          fontFamily: 'Poppins400',
                                          fontSize:
                                              SizeConfig.defaultSize * 1.15)),
                                )
                              ]),
                  );
                },
              ),
            ),
            SizedBox(height: SizeConfig.defaultSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,
                    style: TextStyle(
                        fontFamily: 'SofiaPro500',
                        fontSize: SizeConfig.defaultSize * 1.7)),
                Text("\$" + price.toString(),
                    style: TextStyle(
                        fontFamily: 'SofiaPro500',
                        fontSize: SizeConfig.defaultSize * 1.7))
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize * 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  distance,
                  style: TextStyle(
                      fontFamily: 'SofiaPro400',
                      fontSize: SizeConfig.defaultSize * 1.3,
                      color: const Color(0xFF979797)),
                ),
                Text(
                  priceDuration,
                  style: TextStyle(
                      fontFamily: 'SofiaPro400',
                      fontSize: SizeConfig.defaultSize * 1.3,
                      color: const Color(0xFF979797)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
