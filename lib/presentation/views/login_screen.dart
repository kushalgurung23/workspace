import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workspace/logic/controllers/login_controller.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';
import 'package:workspace/presentation/views/home_screen.dart';
import 'package:workspace/presentation/widgets/rectangular_button.dart';
import 'package:workspace/presentation/widgets/rounded_text_form_field.dart';
import 'package:workspace/presentation/widgets/top_app_bar.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: topAppBar(
          context: context,
          elevation: 0,
          useTrailingGesture: true,
          leadingFirstIcon: const Icon(CupertinoIcons.back),
          leadingFirstOnPress: () {
            Navigator.of(context).pop();
          },
          secondGestureWidget: Text(
            'JOIN AS GUEST',
            style: TextStyle(
                color: const Color(0xFF979797),
                fontFamily: 'Abyssinica400',
                fontSize: SizeConfig.defaultSize * 1.5),
          ),
          secondGestureOnPress: () {}),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQueryData.size.height,
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1.5),
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
          child: Consumer<LoginController>(
            builder: (context, data, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 6),
                  Text('Hey 👋',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize * 3.3,
                          fontFamily: 'Aclonica400')),
                  Text('Welcome',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize * 3.3,
                          fontFamily: 'Aclonica400')),
                  SizedBox(height: SizeConfig.defaultSize * 1.6),
                  Text('Login to existing account or create a new one.',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize * 1.5,
                          fontFamily: 'Abyssinica400',
                          color: const Color(0xFF979797))),
                  SizedBox(height: SizeConfig.defaultSize * 2.5),
                  RoundedTextFormField(
                      obscureText: false,
                      textEditingController: data.emailTextController,
                      hintText: 'example@gmail.com',
                      onChanged: (value) {}),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  RoundedTextFormField(
                      obscureText: true,
                      textEditingController: data.passwordTextController,
                      onChanged: (value) {},
                      hintText: 'Password'),
                  SizedBox(
                    height: SizeConfig.defaultSize * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text('Forget Password?',
                            style: TextStyle(
                                fontSize: SizeConfig.defaultSize * 1.5,
                                fontFamily: 'Abyssinica400',
                                color: const Color(0xFF979797))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 3,
                  ),
                  RectangularButton(
                    onPress: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    text: 'LOGIN',
                    textColor: Colors.white,
                    buttonColor: const Color(0xFF000000),
                    width: double.infinity,
                    height: SizeConfig.defaultSize * 5.5,
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 6),
                  Center(
                    child: Text('OR LOGIN WITH',
                        style: TextStyle(
                            fontSize: SizeConfig.defaultSize * 1.4,
                            fontFamily: 'Abhaya600',
                            color: const Color(0xFF979797))),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: SvgPicture.asset("assets/svg/google.svg"),
                        onTap: () {},
                      ),
                      SizedBox(width: SizeConfig.defaultSize * 2),
                      InkWell(
                        child: SvgPicture.asset("assets/svg/linkedIn.svg"),
                        onTap: () {},
                      ),
                    ],
                  ),
                  //SizedBox(height: SizeConfig.defaultSize * 3,)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
