import 'package:flutter/material.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';
import 'package:workspace/presentation/views/login_screen.dart';
import 'package:workspace/presentation/widgets/rectangular_button.dart';

class UserIntro extends StatelessWidget {
  static const String id = '/';

  const UserIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/dark_workspace.jpg"),
                fit: BoxFit.fill)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1.5),
          child: Stack(
            children: [
              Center(
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Abhaya600',
                        letterSpacing: 0.5
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "Finding a "),
                        TextSpan(
                            text: "Workspace ",
                            style: TextStyle(color: Colors.orange)),
                        TextSpan(
                            text:
                                "has never been so easy! You are only few steps away from your workspace."),
                      ]),
                ),
              ),
              Positioned(
                bottom: SizeConfig.defaultSize * 20,
                child: RectangularButton(
                  text: "I'M LOOKING FOR A WORKSPACE",
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  height: SizeConfig.defaultSize * 5.5,
                  width: mediaQuery.size.width - SizeConfig.defaultSize * 3,
                ),
              ),
              Positioned(
                bottom: SizeConfig.defaultSize * 12,
                child: RectangularButton(
                  text: "I'M A WORKSPACE OWNER",
                  onPress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  textColor: Colors.white,
                  buttonColor: Colors.transparent,
                  height: SizeConfig.defaultSize * 5.5,
                  width: mediaQuery.size.width - SizeConfig.defaultSize * 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
