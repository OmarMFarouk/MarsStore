import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/User_model.dart';
import '../../services/api/User_api.dart';
import '../../src/app_shared.dart';
import 'user_states.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  late UserModel userModel;
  TextEditingController emailCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  // TextEditingController passwordCont = TextEditingController();
  String pickedImage = '';

  fetchUserData() async {
    emit(UserLoading());
    await UserApi().fetchUserData().then((response) {
      if (response['success'] == true) {
        userModel = UserModel.fromJson(response);
        localUserData = userModel;

        emit(UserSuccess(msg: response['message']));
      } else if (response['success'] == false) {
        emit(UserFail(msg: response['message']));
      } else {
        UserFail(msg: 'No Internet Connection');
      }
    });
  }

  void pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      pickedImage = image.path;
    }
    emit(UserLoading());
  }

  updateUserData() async {
    emit(UserLoading());
    await UserApi()
        .updateUserData(
            address: addressCont.text.trim(),
            phone: phoneCont.text.trim(),
            email: emailCont.text.trim(),
            path: pickedImage)
        .then((response) async {
      if (response['success'] == true) {
        await AppShared.localStorage
            .setString('credential', emailCont.text.trim());
        CachedNetworkImage.evictFromCache(localUserData.userinfo!.image!);
        pickedImage = '';
        emit(UserInitial());
        fetchUserData();
      } else if (response['success'] == false) {
        emit(UserFail(msg: response['message']));
      } else {
        UserFail(msg: 'No Internet Connection');
      }
    });
  }
}

late UserModel localUserData;
