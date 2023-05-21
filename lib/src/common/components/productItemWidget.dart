import 'package:fashion/model/productDto.dart';
import 'package:flutter/material.dart';
import 'addbutton.dart';

class ProductItemWidget extends StatefulWidget {
  ProductDto product;
  ProductItemWidget({super.key, required this.product});

  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.5,
      // padding: const EdgeInsets.only(left: 5, right: 5),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 223, 221, 221),
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(7), topLeft: Radius.circular(7)),
            child: Image(
              image: AssetImage(widget.product.path),
              width: MediaQuery.of(context).size.width / 3.0,
              height: MediaQuery.of(context).size.width / 2.5,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.product.type == 2
                    ? RowStartNonIcon(widget.product.name)
                    : RowStartIcon(widget.product.name, widget.product.type),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    widget.product.category,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                widget.product.type == 3
                    ? RowEndSale(widget.product.price.toString(),
                        widget.product.priceDiscount.toString())
                    : RowEnd(widget.product.price.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget RowEndSale(String price, String discountPrice) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: RichText(
          text: TextSpan(
            text: discountPrice.toString(),
            style: const TextStyle(
              color: Colors.red,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red, // Màu sắc của gạch ngang
              decorationThickness: 2.0, // Độ dày của gạch ngang
            ),
          ),
          textAlign: TextAlign.start,
        ),
      ),
      const Expanded(flex: 1, child: Addbutton()),
      Expanded(
        flex: 1,
        child: Text(
          price.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ),
    ],
  );
}

Widget RowEnd(String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Expanded(flex: 1, child: SizedBox()),
      const Expanded(flex: 1, child: Addbutton()),
      Expanded(
        flex: 1,
        child: Text(
          price.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ),
    ],
  );
}

Widget IconProduct(String path) {
  return Container(
    alignment: Alignment.centerRight,
    child: Image(
      image: AssetImage(path),
      height: 18,
      width: 18,
    ),
  );
}

Widget RowStartNonIcon(String name) {
  return Container(
    child: Text(
      name.length > 20 ? name.substring(0, 17) + '...' : name,
      softWrap: true,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    ),
  );
}

Widget RowStartIcon(String name, int type) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 7,
        child: Text(
          name.length > 20 ? name.substring(0, 17) + '...' : name,
          softWrap: true,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        flex: 3,
        child: type == 3
            ? IconProduct('icon/sale.png')
            : type == 1
                ? IconProduct('icon/new.png')
                : Container(),
      )
    ],
  );
}
