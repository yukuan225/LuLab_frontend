import 'package:flutter/material.dart';

import 'home_product_apply.dart';
import '../../common/widget/webview.dart';

//import '../../common/utils/utils.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final String product;
  final String applyurl = "https://www.jianshu.com/p/96a9a38413a5";

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: Browser(url: widget.product),
          ),
          GestureDetector(
            child: Container(
              color: Colors.blue,
              height: 100,
              child: const Text("点击申请"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductApply(
                    product: widget.applyurl,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
