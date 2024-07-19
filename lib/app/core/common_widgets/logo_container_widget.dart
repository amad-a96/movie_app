import 'package:flutter/material.dart';

class LogoContainerWidget extends StatelessWidget {
  const LogoContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 93,
        width: 77,
        child: Image(
          image: AssetImage(
            'assets/logo/logo.png',
          ),
          fit: BoxFit.cover,
        )
        //  SvgPicture.asset(
        //   'assets/logo/logo.svg',
        //   color: Colors.white,
        // ),
        );
  }
}
