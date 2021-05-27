import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/viewmodel/update_view_model.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  UpdateViewModel viewModel = UpdateViewModel();

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> map =
        ModalRoute.of(context).settings.arguments as Map;

    viewModel.post.id = map["id"];
    viewModel.post.title = map["title"];
    viewModel.post.body = map["body"];
    viewModel.post.userId = map["userId"];

    titleController.text = viewModel.post.title;
    bodyController.text = viewModel.post.body;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 90),
          child: Text("Update Post"),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: viewModel.post.title,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: bodyController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: viewModel.post.body,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 45,
              child: FlatButton(
                onPressed: () async {
                  String title = titleController.text;
                  String body = bodyController.text;
                  viewModel.post.title = title;
                  viewModel.post.body = body;
                  bool isEdited = await viewModel.apiPostUpdate();
                  if (isEdited) {
                    Navigator.of(context).pop({'data': "Done"});
                  }
                },
                color: Colors.blue,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
