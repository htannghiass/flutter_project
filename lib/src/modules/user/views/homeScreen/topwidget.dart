import 'package:fashion/model/imageDto.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class Topwidget extends StatefulWidget {
  List<ImageDto> listImage;
  Topwidget({super.key, required this.listImage});

  @override
  _TopwidgetState createState() => _TopwidgetState();
}

class _TopwidgetState extends State<Topwidget> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: AssetImage(widget.listImage[index].path),
          fit: BoxFit.cover,
        );
      },
      itemCount: 3,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    );
  }
}
