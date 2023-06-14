import 'package:crud/Controllers/user_controller.dart';
import 'package:crud/View/add_page.dart';
import 'package:flutter/material.dart';
import 'package:crud/View/update_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Application"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPage()),
                    );
                  },
                  child: const Text('Add User')),
            ),
            Container(
              height: 650,
              child: FutureBuilder(
                future: UserController().getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(child: Text('Loading...'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: Image.network(
                            snapshot.data[i].avatar,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Id:'),
                                  Text(snapshot.data[i].id),
                                  Text('  '),
                                  Text('Name:'),
                                  Text(snapshot.data[i].name),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdatePage(
                                              id: snapshot.data[i].id
                                                  .toString(),
                                            )),
                                  );
                                },
                                child: Text('Update'),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  UserController()
                                      .deleteUser(snapshot.data[i].id);
                                  setState(() {});
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
