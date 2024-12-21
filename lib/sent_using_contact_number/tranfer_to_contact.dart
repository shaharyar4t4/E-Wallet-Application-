import 'package:flutter/material.dart';
import 'package:projectapp/constant/colours.dart';
import 'package:projectapp/sent_using_contact_number/contact_to_tranfer.dart';

class TranferToContact extends StatefulWidget {
  const TranferToContact({super.key});

  @override
  State<TranferToContact> createState() => _TranferToContactState();
}

class _TranferToContactState extends State<TranferToContact> {
  final TextEditingController seachController = TextEditingController();
  final List<Map<String, String>> contacts = [
    {
      "name": "Abdul Mustakim",
      "phone": "+62 12345678910",
      "image": "assets/image/image_1.png"
    },
    {
      "name": "Akiko Minami",
      "phone": "+62 12345678910",
      "image": "assets/image/image_2.png"
    },
    {
      "name": "Alexandria Putri",
      "phone": "+62 12345678910",
      "image": "assets/image/image_3.png"
    },
    {
      "name": "Ali Hakim",
      "phone": "+62 12345678910",
      "image": "assets/image/image_4.png"
    },
    {
      "name": "Bagas Budi",
      "phone": "+62 12345678910",
      "image": "assets/image/image_5.png"
    },
    {
      "name": "Bagus Ramadhan",
      "phone": "+62 12345678910",
      "image": "assets/image/image_6.png"
    },
    {
      "name": "Bambang Ikhsan",
      "phone": "+62 12345678910",
      "image": "assets/image/image_7.png"
    },
    {
      "name": "Berliana Sarah",
      "phone": "+62 12345678910",
      "image": "assets/image/image_8.png"
    },
    {
      "name": "Chelsea Tanjung",
      "phone": "+62 12345678910",
      "image": "assets/image/image_9.png"
    },
  ];

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
      body: Container(
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
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Row(
                  children: [
                    Container(
                      width: 290,
                      child: TextField(
                        controller: seachController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: "Search Phone Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add,
                      size: 30,
                      color: btn,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  "All Contact",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage(contact['image']!),
                      ),
                      title: Text(contact['name']!),
                      subtitle: Text(contact['phone']!),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactToTranfer()));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
