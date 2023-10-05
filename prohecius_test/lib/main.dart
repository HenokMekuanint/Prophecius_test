import 'package:flutter/material.dart';
import 'package:prohecius_test/utils/app_dimension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  bool isFormFilled() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty;
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Your real first name is required to create a profile'),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        )));
  }

void showPopupMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Message'),
        content: Text('Your real first name is required to create a profile.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      size: AppDimension.height(30, context),
                    ),
                    Text("Sign Up"),
                    Icon(Icons.question_mark_rounded)
                  ],
                ),

                ])),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width(10, context),
                  vertical: AppDimension.height(5, context)),
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey,
                    height: AppDimension.height(3, context),
                  ),
                  Container(
                    color: Colors.red,
                    height: AppDimension.height(3, context),
                    width: AppDimension.width(30, context),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppDimension.height(40, context)),
              child: Text(
                "What is Your Name ?",
                style: TextStyle(fontSize: AppDimension.height(40, context)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width(20, context),
                  vertical: AppDimension.height(40, context)),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimension.height(10, context),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      hintText: 'First Name', border: InputBorder.none),
                  maxLines: null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.width(20, context),
                  vertical: AppDimension.height(40, context)),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimension.height(10, context),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      hintText: 'Last Name', border: InputBorder.none),
                  maxLines: null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimension.width(220, context),
                  top: AppDimension.height(200, context)),
              child: CircleAvatar(
                radius: AppDimension.height(40, context),
                backgroundColor: isFormFilled() ? Colors.red : Colors.blue,
                child: IconButton(
                    color: Colors.black,
                    onPressed: () {
                       if (!isFormFilled()) {
                      showPopupMessage(context);
                    } else {
                      
                    }
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
