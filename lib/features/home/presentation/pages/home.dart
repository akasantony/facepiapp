import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _appBarTitle = "My Gifs";
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  Widget _appBarBuilder() {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text(_appBarTitle),
      bottom: TabBar(
          indicatorColor: Colors.orangeAccent,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.gif),
            ),
            Tab(
              icon: Icon(Icons.collections),
            ),
          ]),
    );
  }

  Widget _bodyBuilder() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(241, 39, 17, 1),
                  Color.fromRGBO(245, 175, 25, 1)
                ])),
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.56,
                child:
                TabBarView(controller: _tabController, children: <Widget>[
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        padding: const EdgeInsets.all(4.0),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children: <String>[
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                        ].map((String url) {
                          return GridTile(
                              child: Image.network(url, fit: BoxFit.cover));
                        }).toList()),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        padding: const EdgeInsets.all(4.0),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children: <String>[
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                          'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg',
                        ].map((String url) {
                          return GridTile(
                              child: Image.network(url, fit: BoxFit.cover));
                        }).toList()),
                  )
                ])),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.2,
              child: Card(
                  elevation: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              child: RawMaterialButton(
                                elevation: 0,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/captureface');
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.red,
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 200,
                              child: ListView(
                                padding: const EdgeInsets.all(5),
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                      height: 40,
                                      width: 40,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                      ) ,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 30,
                              child: RawMaterialButton(
                                elevation: 0,
                                onPressed: () {},
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          height: 60,
                          child: FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
//                            Navigator.pushNamed(context, '/home');
                            },
                            child: Text(
                              "Create GIF",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                side:
                                BorderSide(color: Colors.deepOrangeAccent)),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(),
      body: _bodyBuilder(),
    );
  }
}
