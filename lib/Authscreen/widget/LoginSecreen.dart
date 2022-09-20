import 'package:flutter/material.dart';

import '../../constant.dart';
import 'LoginForm.dart';

class LoginSecreen extends StatelessWidget {
  const LoginSecreen({
    Key? key,
    required this.size,
    required this.isShowsiginUp,
  }) : super(key: key);

  final Size size;
  final bool isShowsiginUp;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: defaultDuration,
      height: size.height,
      width: size.width * 0.88,
      left: isShowsiginUp ? size.width * 0.76 : 0,
      child: Container(
        color: login_bg,
        child: LoginForm(),
      ),
    );
  }
}
