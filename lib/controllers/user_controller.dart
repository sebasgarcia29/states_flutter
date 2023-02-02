import 'package:get/get.dart';
import 'package:states/models/usuario.dart';

class UserController extends GetxController {
  RxBool existUser = false.obs;
  Rx<User> user = User().obs;

  int get professionsCount => user.value.professions!.length;

  void loadUser(User pUser) {
    existUser.value = true;
    user.value = pUser;
  }

  void changeAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String professsion) {
    user.update((val) {
      val!.professions = [...?val.professions, professsion];
    });
  }
}
