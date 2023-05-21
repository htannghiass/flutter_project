import 'package:flutter/material.dart';

class Addbutton extends StatelessWidget {
  const Addbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('nhan mua');
      },
      child: const Image(
        image: AssetImage('icon/add.png'),
        height: 15,
        width: 15,
      ),
    );
  }
}
