import 'package:get/get.dart';

final postController = Get.put(PostController());

class PostController extends GetxController {
  String caption = " ";

  addCaption(String post) {
    caption = post;
    update();
  }

  String getCaption() {
    return caption;
  }
}
