import 'dart:math';
import 'package:flutter/material.dart';
import 'package:login/Authscreen/widget/socalbutten.dart';
import '../constant.dart';
import 'widget/LoginSecreen.dart';
import 'widget/LogoWidget.dart';
import 'widget/SiginUpSecreen.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controlle;
  late Animation<double> animationtext;
  inet() {
    controlle = AnimationController(
      duration: defaultDuration,
      vsync: this,
    );

    animationtext = Tween<double>(
      begin: 0,
      end: 90,
    ).animate(controlle);
  }

  @override
  void initState() {
    super.initState();
    inet();
  }

  @override
  void dispose() {
    super.dispose();
    controlle.dispose();
  }

  updteview() {
    setState(() {
      isShowsiginUp = !isShowsiginUp;
      print(isShowsiginUp);
    });
    isShowsiginUp ? controlle.forward() : controlle.reverse();
  }

  bool isShowsiginUp = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: login_bg,
      body: AnimatedBuilder(
        animation: controlle,
        builder: (context, child) {
          return Stack(
            children: [
              LoginSecreen(size: size, isShowsiginUp: isShowsiginUp),
              SiginUpSecreen(size: size, isShowsiginUp: isShowsiginUp),
              LogoWidget(isShowsiginUp: isShowsiginUp, size: size),
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                left: 0,
                right: isShowsiginUp ? -size.width * 0.06 : size.width * 0.06,
                bottom: size.height * 0.10,
                child: SocalButtns(),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                left: isShowsiginUp ? 0 : size.width * 0.44 - 80,
                bottom:
                    isShowsiginUp ? size.height / 2 - 80 : size.height * 0.3,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isShowsiginUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Transform.rotate(
                    angle: isShowsiginUp
                        ? (0 - animationtext.value) * pi / 180
                        : (animationtext.value) * pi / 180,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => updteview(),
                      child: Container(
                        // height: 300,
                        padding: EdgeInsets.all(defpaultPadding * 0.7),

                        width: 160,
                        child: Text(
                          'LOG IN',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                right: isShowsiginUp ? size.width * 0.44 - 80 : 0,
                bottom:
                    isShowsiginUp ? size.height / 2 - 80 : size.height * 0.3,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: !isShowsiginUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Transform.rotate(
                    angle: !isShowsiginUp
                        ? (90 - animationtext.value) * pi / 180
                        : (90 - animationtext.value) * pi / 180,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => updteview(),
                      child: Container(
                        padding: EdgeInsets.all(defpaultPadding * 0.7),
                        width: 160,
                        child: Text(
                          'SIGN In',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
