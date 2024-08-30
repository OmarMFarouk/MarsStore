import 'package:mars/data/prodict_data.dart';

class ShoesModel {
  List<ProdictData> shoesList = [
    ProdictData(
      prodctImage: [
        "assets/images/wallpaper-image.jpg",
        "assets/images/wallpaper-image.jpg",
      ],
      prdctTitel: "titel prodact 4",
      prodctDescription: "Description fot proct 4",
      prodctDetlails:
          " Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora vitae corrupti ut repellendus, non molestias!",
      prodctPrice: 968,
    ),
    ProdictData(
      prodctImage: [
        "assets/images/wallpaper-image.jpg",
        "assets/images/wallpaper-image.jpg",
        "assets/images/wallpaper-image.jpg",
      ],
      prdctTitel: "titel prodact 5",
      prodctDescription: "Description fot proct 5",
      prodctDetlails:
          " Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora vitae corrupti ut repellendus, non molestias!",
      prodctPrice: 253,
    ),
  ];
}

ShoesModel shoesModel = ShoesModel();
