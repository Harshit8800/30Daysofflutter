import 'package:flutter/material.dart';
import 'package:flutter_catalog/ApiService/remote_services.dart';
import 'package:flutter_catalog/models/Post.dart';

class apiScreen extends StatefulWidget {
  const apiScreen({Key? key}) : super(key: key);

  @override
  State<apiScreen> createState() => _HomePageState();
}

class _HomePageState extends State<apiScreen> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    print(posts);

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text(
                    posts![index].body ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
