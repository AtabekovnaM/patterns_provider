import 'package:flutter/foundation.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class UpdateViewModel extends ChangeNotifier {
  var isLoading = false;
  var post = Post();

  Future<bool> apiPostUpdate() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    print("Response: $response");
    isLoading = false;
    notifyListeners();

    return response != null;
  }
}
