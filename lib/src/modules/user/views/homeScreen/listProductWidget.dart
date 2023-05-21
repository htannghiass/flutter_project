import 'package:fashion/model/productDto.dart';
import 'package:fashion/src/common/components/productItemWidget.dart';
import 'package:flutter/material.dart';

class ListProductWidget extends StatefulWidget {
  List<ProductDto> listproduct;
  String title;
  ListProductWidget({super.key, required this.listproduct, required this.title});

  @override
  _ListProductWidgetState createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  Widget build(BuildContext context) {
    List<ProductItemWidget> listProductSaleWidget =
        widget.listproduct.map((e) => ProductItemWidget(product: e)).toList();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.2,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: listProductSaleWidget),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Divider(
            height: 1,
            color: Color.fromARGB(255, 146, 143, 143),
          ),
        )
      ],
    );
  }
}
