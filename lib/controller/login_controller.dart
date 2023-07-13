import 'dart:convert';
import 'package:dreamhrms/model/login_model.dart';
import 'package:dreamhrms/repository/login_repository.dart';
import 'package:dreamhrms/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/HttpHelper.dart';
import '../services/api_service.dart';
import '../widgets/encrypt_decrypt.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.put(LoginController());
  static final HttpHelper _http = HttpHelper();
  var repository=LoginRepository();

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

  login() async {
    var data={
      "email_id":"saranya@dreamguys.com",
      "password":"123456"
    };
    // var body={
    //    "request_data":  await LibSodiumAlgorithm().encryptionMessage(data)
    // };
    // print("Encrypted Body: $body");
    LoginModel? loginModel;
    var response = await _http.multipartPostData(
        url: "${Api.login}",
        encrypt:await LibSodiumAlgorithm().encryptionMessage(data),
        auth: false);
    print('sucess =====$response');
   
  }


}
