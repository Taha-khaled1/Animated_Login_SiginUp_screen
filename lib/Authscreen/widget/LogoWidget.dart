import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    required this.isShowsiginUp,
    required this.size,
  }) : super(key: key);

  final bool isShowsiginUp;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      left: 0,
      right: isShowsiginUp ? -size.width * 0.06 : size.width * 0.06,
      top: size.height * 0.10,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white60,
        child: AnimatedSwitcher(
          duration: defaultDuration,
          child: isShowsiginUp
              ? SvgPicture.asset(
                  'assets/animation_logo.svg',
                  color: signup_bg,
                )
              : SvgPicture.asset(
                  'assets/animation_logo.svg',
                  color: login_bg,
                ),
        ),
      ),
    );
  }
}
