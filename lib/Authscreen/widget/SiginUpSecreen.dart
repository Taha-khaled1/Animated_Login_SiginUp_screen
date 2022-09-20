import 'package:flutter/material.dart';

import '../../constant.dart';
import 'SignUpForm.dart';

class SiginUpSecreen extends StatelessWidget {
  const SiginUpSecreen({
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
      left: isShowsiginUp ? size.width * 0.12 : size.width * 0.87,
      child: Container(
        color: signup_bg,
        child: SignUpForm(),
      ),
    );
  }
}
