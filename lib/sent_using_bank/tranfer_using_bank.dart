import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/constant/colours.dart';
import 'package:projectapp/sent_using_bank/submited_slip.dart';

class TranferUsingBank extends StatefulWidget {
  const TranferUsingBank({super.key});

  @override
  State<TranferUsingBank> createState() => _TranferUsingBankState();
}

class _TranferUsingBankState extends State<TranferUsingBank> {
  @override
  final TextEditingController notesControllerbank = TextEditingController();
  final TextEditingController amountControllerbank = TextEditingController();
  bool isButtonEnabledbank = false;

  Future<void> saveAmount(String amount) async {
    final doc = FirebaseFirestore.instance.collection('transactionsbank').doc();
    await doc.set({
      'amount': amount,
      'note': notesControllerbank.text,
      'date': DateTime.now().toIso8601String(),
    });
  }

  void proceedToTransfer() async {
    final amount = amountControllerbank.text;

    if (amount.isNotEmpty) {
      await saveAmount(amount);

      // Navigate to the success screen with the amount
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubmitedSlip(amount: amount,),
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
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TranferUsingBank()));
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Center(
            child: Text(
          "Transfer through Bank",
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
                        backgroundImage: AssetImage('assets/image/bank_1.png'),
                      ),
                      title: Text("Karolina McMillan"),
                      subtitle: Text("••••• •••• 80901"),
                      trailing: Icon(
                        Icons.edit_note,
                        size: 30,
                        color: btn,
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //     builder: (context) => ContactToTranfer()));
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
                                controller: amountControllerbank,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isButtonEnabledbank = value.isNotEmpty &&
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
                            controller: notesControllerbank,
                            decoration: InputDecoration(
                              hintText: "Payment for Lunch",
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
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: isButtonEnabledbank
                              ? () {
                                  proceedToTransfer();
                                  // Handle transfer action here
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isButtonEnabledbank ? btntxt : Colors.grey,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 90),
                          ),
                          child: Text(
                            'Proceed to Transfer',
                            style: TextStyle(
                              color: isButtonEnabledbank
                                  ? Colors.white
                                  : Colors.black,
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
