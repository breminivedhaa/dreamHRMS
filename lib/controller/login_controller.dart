import 'dart:convert';
import 'package:dreamhrms/model/login_model.dart';
import 'package:dreamhrms/repository/login_repository.dart';
import 'package:dreamhrms/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/HttpHelper.dart';
import '../services/api_service.dart';
import '../services/utils.dart';
import '../widgets/encrypt_decrypt.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.put(LoginController());
  static final HttpHelper _http = HttpHelper();
  var repository=LoginRepository();
  late LoginModel loginModel;
  TextEditingController userEmail=TextEditingController();
  TextEditingController password=TextEditingController();


  @override
  void onInit() {
    super.onInit();
    loginInit();

  }

  loginInit(){
    userEmail.text="";
    password.text="";
  }
  BuildContext? context = Get.context;
  final box=GetStorage();
  var token;
  login() async {
    userEmail.text="saranya@dreamguys.com";
    password.text="123456";
    var body = {"email_id": userEmail.text, "password": password.text};
    var response = await _http.multipartPostData(
        url: "${Api.login}",
        encryptMessage: await LibSodiumAlgorithm().encryptionMessage(body),
        auth: false);
    print("controller ${response}");
    if(response['code']=="200"){
      loginModel = LoginModel.fromJson(response);
      box.write("Token", "${loginModel.data?.original?.tokenType} ${loginModel.data?.original?.accessToken}");
      token = box.read('Token');
      print("Login token $token");
      UtilService().showToast(context,"success",message:response['message'].toString());
    }else{
      UtilService().showToast(context,"error",message:response['code'].toString());
    }
    print('success =====$response');
  }

  storeToLocalDevice({required Map body}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    body.forEach((i, value) {
      print('index=$i, value=$value');
      prefs.setString(i, value);
    });
  }
}
