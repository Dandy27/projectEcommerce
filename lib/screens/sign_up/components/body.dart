import 'package:flutter/material.dart';
import 'package:projectecommerce/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/success.png', height: SizeConfig.screenHeight * 0.04,)
      ],
    );
  }
}
