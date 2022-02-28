import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workspace/data/models/workspace_model.dart';
import 'package:workspace/logic/controllers/home_controller.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';
import 'package:workspace/presentation/widgets/top_app_bar.dart';
import 'package:workspace/presentation/widgets/workspace_container.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(
          context: context,
          toolBarHeight: SizeConfig.defaultSize * 10,
          useLeading: false,
          elevation: 5,
          shadowColor: const Color(0x00000000).withOpacity(0.1),
          titleWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defaultSize * 2),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.defaultSize / 3,
                      left: SizeConfig.defaultSize),
                  child: Text(
                    'Current location',
                    style: TextStyle(
                        color: const Color(0xFF979797),
                        fontSize: SizeConfig.defaultSize * 1.2,
                        fontFamily: 'SofiaPro400'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.defaultSize),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/location.svg"),
                      Padding(
                        padding:
                            EdgeInsets.only(left: SizeConfig.defaultSize * 1.2),
                        child: Text(
                          "Boston, USA",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.defaultSize * 1.6,
                              fontFamily: 'SofiaPro500'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          useTrailingGesture: false,
          trailingWidget: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize * 1.5,
                    top: SizeConfig.defaultSize * 2),
                child: GestureDetector(
                  child: SvgPicture.asset("assets/svg/notification.svg",
                      height: SizeConfig.defaultSize * 2),
                  onTap: () {},
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize * 1.5,
                    top: SizeConfig.defaultSize * 2),
                child: GestureDetector(
                  child: SvgPicture.asset("assets/svg/lines.svg",
                      height: SizeConfig.defaultSize * 2),
                  onTap: () {},
                ),
              ),
            )
          ],
          flexibleSpace: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 5))
            ]),
          )),
      body: Consumer<HomeController>(
        builder: (context, data, child) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.defaultSize * 2.5,
                    bottom: SizeConfig.defaultSize * 2.5),
                height: SizeConfig.defaultSize * 4,
                child: ListView.builder(
                  itemCount: data.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? SizeConfig.defaultSize * 2 : 0,
                          right: SizeConfig.defaultSize * 2),
                      child: ButtonTheme(
                        child: TextButton(
                          onPressed: () {
                            data.changeLabel(selectedLabel: index);
                          },
                          child: Text(
                            data.categories[index]['label'],
                            style: TextStyle(
                                fontFamily: 'SofiaPro400',
                                fontSize: SizeConfig.defaultSize * 1.4,
                                color: data.selectedLabel == index
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF929292)),
                          ),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: data.selectedLabel == index
                                  ? const Color(0xFF0B0B0B)
                                  : const Color(0xFFF9F9F9)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize * 2),
                      height: SizeConfig.defaultSize * 7,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(
                            color: const Color(0xFFEBEBEB),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.defaultSize * 1.5),
                            child:
                                SvgPicture.asset('assets/svg/blue_circle.svg'),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.defaultSize * 1.5),
                              child: Text(
                                'A programmer is nearby you. Would you like to connect?',
                                style: TextStyle(
                                    fontFamily: 'SofiaPro500',
                                    fontSize: SizeConfig.defaultSize * 1.5,
                                    height: 1.2),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize * 2,
                    ),
                    ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: data.workspaceList.length,
                        itemBuilder: (context, index) {
                          final List<WorkSpace> list = data.workspaceList;
                          return Padding(
                            padding: EdgeInsets.fromLTRB(
                                SizeConfig.defaultSize * 2,
                                0,
                                SizeConfig.defaultSize * 2,
                                SizeConfig.defaultSize * 2.6),
                            child: WorkSpaceContainer(
                                onTap: () {},
                                favoriteOntap: () {
                                  data.changeFavoriteStatus(
                                      workspace: list[index]);
                                },
                                image: list[index].image,
                                name: list[index].name,
                                distance: list[index].distance,
                                price: list[index].price,
                                isFavorite: list[index].isFavorite,
                                priceDuration: list[index].priceDuration,
                                features: list[index].features),
                          );
                        })
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
