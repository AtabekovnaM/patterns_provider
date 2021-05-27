import 'package:flutter/material.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/pages/create_page.dart';
import 'package:patterns_provider/pages/update_page.dart';
import 'package:patterns_provider/viewmodel/home_view_model.dart';
import 'package:patterns_provider/views/item_of_post.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  void openUpdatePage(Post post) async {

    var result = await Navigator.pushNamed(context, UpdatePage.id, arguments: {
      "id": post.id,
      "title": post.title,
      "body": post.body,
      "userId": post.userId
    });
    if (result != null) {
      var done = (result as Map)["data"];
      if (done == "Done") {
        viewModel.apiPostList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Provider"),
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<HomeViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(viewModel, viewModel.items[index],
                        (post) {
                      openUpdatePage(post);
                    });
                  },
                ),
                viewModel.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, CreatePage.id);
          },
          child: Icon(Icons.add),
        ));
  }
}
