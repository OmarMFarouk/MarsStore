import 'package:flutter/material.dart';
import 'package:mars/models/products_model.dart';
import 'package:mars/screens/detlails_screen.dart';
import 'package:mars/widgets/card_prodct.dart';

class CustomViewProdicts extends StatelessWidget {
  const CustomViewProdicts({
    super.key,
    required this.productsList,
  });
  final List<Product?>? productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        // mainAxisSpacing: 2,
        // crossAxisSpacing: 5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productsList!.length,
      itemBuilder: (context, index) => CardProdct(
        productId: productsList![index]!.id!,
        isBookmarked: productsList![index]!.isBookmarked!,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetlailsScreen(
              productSized: productsList![index]!.productSized!,
              isBookmarked: productsList![index]!.isBookmarked!,
              productId: productsList![index]!.id!,
              productImages: productsList![index]!.productimage!,
              descriptionProdact: productsList![index]!.productsubtitle!,
              titelProcat: productsList![index]!.productname!,
              price: productsList![index]!.productprice!,
              detlailsText: productsList![index]!.productdescription!,
            ),
          ),
        ),
        prodctImage: productsList![index]!.productimage![0],
        prodctTitel: productsList![index]!.productname!,
        price: productsList![index]!.productprice!,
      ),
    );
  }
}
