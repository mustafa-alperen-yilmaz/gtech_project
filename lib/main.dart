import 'package:flutter/material.dart';
import 'package:gtech_project/Fetch/Fetch.dart';
import 'package:gtech_project/InsideOfDatas/InsideOfDatas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Gtech Academy ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // define the variables
  String appBarTitle = " Gtech Academy ";
  String message =
      "wait for a while (10 sec.) if list does not seem it will be empty";
  String hyphen = " -- ";
  // this list keeping the removed indexes
  List<int> removeIndex = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: FutureBuilder(
          future: datasFetch(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = snapshot.data[index].id.toString() +
                      hyphen +
                      snapshot.data[index].title;
                  if (removeIndex.contains(index)) {
                    return Container();
                  } else {
                    return ListTile(
                      title: Text(title),
                      // if user click the element it will goes to detail of element which was clicked
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InsideOfDetails(snapshot.data[index])));
                      },
                      // if user press longer the element it will be removed
                      onLongPress: () {
                        removeIndex.add(index);
                        setState(() {});
                      },
                    );
                  }
                },
              );
            } else {
              // error message
              return Container(
                color: Colors.blue,
                child: Text(
                  message,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
