import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nineplus/controllers/post_controller.dart';
import 'package:nineplus/screens/add_post.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Container(
            height: size.height * 0.45,
            color: Colors.blue[200],
            margin: EdgeInsets.only(
              left: size.height * 0.02,
              right: size.height * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("UserName      @username   ",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          GetBuilder<PostController>(
                              init: PostController(),
                              builder: (_) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _.getCaption(),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                );
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.thumb_up,
                                        size: 14,
                                      ))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.comment,
                                      size: 15,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.send_sharp,
                                      size: 15,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      size: 15,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => AddPost()),
                ));
          }),
    );
  }
}
