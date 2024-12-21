import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/constant/colours.dart';
import 'package:projectapp/sent_using_contact_number/submited_to_friend.dart';

class ContactToTranfer extends StatefulWidget {
  const ContactToTranfer({super.key});

  @override
  State<ContactToTranfer> createState() => _ContactToTranferState();
}

class _ContactToTranferState extends State<ContactToTranfer> {
  final TextEditingController notesController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool isButtonEnabled = false;

  Future<void> saveAmount(String amountbank) async {
    final doc = FirebaseFirestore.instance.collection('transactions').doc();
    await doc.set({
      'amount': amountbank,
      'note': notesController.text,
      'date': DateTime.now().toIso8601String(),
    });
  }

  void proceedToTransfer() async {
    final amountbank = _amountController.text;

    if (amountbank.isNotEmpty) {
      await saveAmount(amountbank);

      // Navigate to the success screen with the amount
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubmitedToFriend(amountbank: amountbank,),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter an amount')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        title: Center(
            child: Text(
          "Transfer to Friend",
          style: TextStyle(color: Colors.white, fontSize: 17),
        )),
        backgroundColor: btntxt,
        actions: [
          Image(image: AssetImage('assets/image/help.png')),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            width: _screenWidth,
            color: btntxt,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Your Balance",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rp 24.321.900",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.wallet,
                              color: btntxt,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Top Up",
                              style: TextStyle(
                                  color: btntxt, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  margin: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/image/image_1.png'),
                      ),
                      title: Text("Abdul Mustakim"),
                      subtitle: Text("+62 12345678910"),
                      trailing: Icon(
                        Icons.edit_note,
                        size: 30,
                        color: btn,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactToTranfer()));
                      },
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(
                            "Set Amount",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rp',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 60,
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                                controller: _amountController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isButtonEnabled = value.isNotEmpty &&
                                        double.tryParse(value) != null;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Notes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(Optional)",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 320,
                          child: TextField(
                            controller: notesController,
                            decoration: InputDecoration(
                              hintText: "Write your notes here",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey[100],
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: btn, // Border color when focused
                                  width: 2.0,
                                ),
                              ),
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: isButtonEnabled
                              ? () {
                                  proceedToTransfer();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isButtonEnabled ? btntxt : Colors.grey,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 90),
                          ),
                          child: Text(
                            'Proceed to Transfer',
                            style: TextStyle(
                              color:
                                  isButtonEnabled ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
