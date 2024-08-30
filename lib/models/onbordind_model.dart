import 'package:mars/core/image_app.dart';
import 'package:mars/data/onbordeing_data.dart';

class OnbordindModel {
  List<OnbordeingData> onbordeingList = [
    // Sava data model onbording 1
    OnbordeingData(
      imageSrc: imageApp.onbordingOrder,
      titel: "onbording_order_titel_1",
      description: "onbording_order_description_1",
    ),

    // Sava data model ondording 2
    OnbordeingData(
      imageSrc: imageApp.onbordingBrand,
      titel: "onbording_order_titel_2",
      description: "onbording_order_description_2",
    ),

    // Sava data model onbording 3
    OnbordeingData(
      imageSrc: imageApp.onbordingOffers,
      titel: "onbording_order_titel_3",
      description: "onbording_order_description_3",
    ),

    // Sava data model onbording 4
    OnbordeingData(
      imageSrc: imageApp.onbordingShopping,
      titel: "onbording_order_titel_4",
      description: "onbording_order_description_4",
    ),
  ];
}

OnbordindModel onbordindModel = OnbordindModel();
