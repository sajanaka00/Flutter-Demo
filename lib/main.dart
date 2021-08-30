import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  final dbRef = FirebaseDatabase.instance.reference();

  TextEditingController accNumController = new TextEditingController();
  TextEditingController receiverAccNumController = new TextEditingController();
  TextEditingController reEnterReceiverAccNumController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0)
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  bottom: 50
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 65
                      ),
                      child: Text("Fund Transfer (M-M)", style: TextStyle(color: Colors.white, fontSize: 16),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 120,
                  bottom: 35,
                  left: 25,
                  right: 25
                ),
                child: Material(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text("Account Number", style: TextStyle(fontSize: 14.0),),
                        SizedBox(height: 10),
                        TextField(
                          controller: accNumController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '67588881',
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(fontSize: 14.0)
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Receiver Account Number", style: TextStyle(fontSize: 14.0),),
                        SizedBox(height: 10),
                        TextField(
                          controller: receiverAccNumController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Receiver Account Number',
                            // prefixText: '675',
                              prefixIcon: Container(
                                color: Colors.black12,
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  child: Text("675"),
                                ),
                              ),
                            isDense: true,
                              contentPadding: EdgeInsets.all(15),
                              prefixStyle: TextStyle(backgroundColor: Colors.black12),
                              hintStyle: TextStyle(fontSize: 14.0)
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Re-Enter Receiver Account Number", style: TextStyle(fontSize: 14.0),),
                        SizedBox(height: 10),
                        TextField(
                          controller: reEnterReceiverAccNumController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Receiver Account Number',
                            prefixIcon: Container(
                              color: Colors.black12,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Text("675"),
                              ),
                            ),
                            isDense: true,
                              contentPadding: EdgeInsets.all(15),
                              prefixStyle: TextStyle(backgroundColor: Colors.black12),
                              hintStyle: TextStyle(fontSize: 14.0)
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Amount", style: TextStyle(fontSize: 14.0),),
                        SizedBox(height: 10),
                        TextField(
                          controller: amountController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Amount',
                            isDense: true,
                              contentPadding: EdgeInsets.all(12),
                              hintStyle: TextStyle(fontSize: 14.0)
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: this.checkboxValue,
                              onChanged: (bool value) {
                                setState(() {
                                  this.checkboxValue = value;
                                });
                                },
                            ),
                            Text("I agree to the Terms and Conditions", style: TextStyle(fontSize: 15.0),)
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: RaisedButton(
                              child: Text("Proceed", style: TextStyle(color: Colors.white, fontSize: 16)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              onPressed: () {
                                proceedData();
                              },
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  void proceedData() {
    dbRef.child("1").set({
      'Account Number': accNumController.text,
      'Receiver Account Number': '675' + receiverAccNumController.text,
      'Amount': amountController.text
    });

    clearTextInput();
  }

  void clearTextInput() {
    accNumController.clear();
    receiverAccNumController.clear();
    reEnterReceiverAccNumController.clear();
    amountController.clear();
  }

}