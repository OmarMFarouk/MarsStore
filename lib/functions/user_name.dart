import 'package:mars/controllers/input_text_controller.dart';

String extractFirstName() {
  int spaceIndex = inputTextController.userNameController.text.indexOf(' ');
  if (spaceIndex != -1) {
    return inputTextController.userNameController.text.substring(0, spaceIndex);
  } else {
    return inputTextController.userNameController.text;
  }
}
