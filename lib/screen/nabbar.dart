import 'package:flutter/material.dart';
import 'package:projectapp/constant/colours.dart';
import 'package:projectapp/screen/home.dart';

class Nabbar extends StatefulWidget {
  const Nabbar({super.key});

  @override
  State<Nabbar> createState() => _NabbarState();
}

class _NabbarState extends State<Nabbar> {

  int currentvalue =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentvalue,
        onTap: (value){
          setState(() {
            currentvalue = value;
          });
        },
        selectedItemColor: btntxt,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.reorder),label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code),label: "QR Code"),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
      ),
    );
  }

  getCurrentView() {
    if(currentvalue  == 0){
      return Home();
    }else if(currentvalue  == 1){
      // return chatVeiw();
    } else if(currentvalue  == 2){
      // return Signup();
    } else {
      return Container(
        child: Center(child: Text("No Fav", style: TextStyle(fontSize: 20),)),
      );
    }

  }
}
