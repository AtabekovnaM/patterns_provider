import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';
import 'package:patterns_provider/viewmodel/create_view_model.dart';


class CreatePage extends StatefulWidget {
  static final String id = "create_page";
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  CreateViewModel viewModel = CreateViewModel();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 90),
          child: Text("Add Post"),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
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
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: bodyController,
                    decoration: InputDecoration(
                      hintText: "Body",
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
                      onPressed: (){
                        String title = titleController.text;
                        String body = bodyController.text;
                        viewModel.apiPostCreate(Post(title: title,body: body));
                      },
                      color: Colors.blue,
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

         viewModel.isLoading? Center(
            child: CircularProgressIndicator(),
          ): SizedBox.shrink(),
        ],
      ),
    );
  }
}