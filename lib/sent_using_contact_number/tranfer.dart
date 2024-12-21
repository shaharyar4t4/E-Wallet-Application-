import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/constant/colours.dart';
import 'package:projectapp/sent_using_bank/tranfer_bank.dart';
import 'package:projectapp/sent_using_contact_number/tranfer_to_friend.dart';


class Tranfer extends StatefulWidget {
  const Tranfer({super.key});

  @override
  State<Tranfer> createState() => _TranferState();
}

class _TranferState extends State<Tranfer> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        'name': 'Alexandria',
        'date': 'Yesterday · 19:12',
        'amount': 600000,
        'image': 'assets/image/Ellipse 16.png',
      },
      {
        'name': 'Immanuel',
        'date': 'May 31, 2023 · 09:13',
        'amount': 200000,
        'image': 'assets/image/Ellipse 17.png',
      },
      {
        'name': 'Maybank - Alex',
        'date': 'May 13, 2023 · 21:54',
        'amount': 745000,
        'image': 'assets/image/Frame 3.png',
      },
      {
        'name': 'Kayshania',
        'date': 'April 27, 2023 · 20:29',
        'amount': 57000,
        'image': 'assets/image/Ellipse 17 (1).png',
      },
      {
        'name': 'BRI - Akhmad',
        'date': 'April 12, 2023 · 04:18',
        'amount': 450000,
        'image': 'assets/image/Frame 3 (1).png',
      },
      {
        'name': 'BRI - Akhmad',
        'date': 'April 12, 2023 · 04:18',
        'amount': 450000,
        'image': 'assets/image/Frame 3 (1).png',
      },
      {
        'name': 'Ibrahimi',
        'date': 'April 12, 2023 · 04:18',
        'amount': 128000,
        'image': 'assets/image/Ellipse 16 (1).png',
      },
    ];
    String formatAmount(int amount) {
      // Format the amount to Indonesian Rupiah format
      return 'Rp ${amount.toString().replaceAllMapped(
            RegExp(r'(\d)(?=(\d{3})+$)'),
            (Match m) => '${m[1]}.',
          )}';
    }

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
          "Transfer",
          style: TextStyle(color: Colors.white),
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
          height: _screenHeight,
          color: btntxt,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30))),
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TranferToFriend()));
                        },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFFf9f5ff),
                              //   color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Icon(
                                Icons.person,
                                color: btntxt,
                                size: 50,
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Transfer to Friends")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 30),
                      child: GestureDetector( onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TranferBank()));
                      },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFFf9f5ff),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Icon(
                                Icons.account_balance,
                                color: btntxt,
                                size: 50,
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Transfer to Bank")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Text(
                    "Latest Transfer",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(transaction['image']),
                        radius: 25,
                      ),
                      title: Text(
                        transaction['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(transaction['date']),
                      trailing: Text(
                        formatAmount(transaction['amount']),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
