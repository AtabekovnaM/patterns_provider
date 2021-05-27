import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class CreateViewModel extends ChangeNotifier {

  var isLoading = false;
  List<Post> items = new List();

  void apiPostCreate(Post post) async{
      isLoading = true;
      notifyListeners();

      var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
      isLoading = false;
      notifyListeners();
  }
}