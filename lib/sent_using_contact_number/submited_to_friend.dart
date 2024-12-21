import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectapp/constant/colours.dart';
import 'package:projectapp/screen/nabbar.dart';

class SubmitedToFriend extends StatefulWidget {
  final String amountbank;
  const SubmitedToFriend({required this.amountbank, Key? key}) : super(key: key);

  @override
  State<SubmitedToFriend> createState() => _SubmitedToFriendState();
}

class _SubmitedToFriendState extends State<SubmitedToFriend> {
  @override
  Widget build(BuildContext context) {
    final currentDateTime = DateTime.now();
    final formattedDate = DateFormat('MMMM d, yyyy').format(currentDateTime);
    final formattedTime = DateFormat('hh:mm a').format(currentDateTime);

    // Parse the amount to double
    final double parsedAmount = double.tryParse(widget.amountbank) ?? 0.0;
    final double totalPayment = parsedAmount + 2.0;
    return Scaffold(
      backgroundColor: btntxt,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/icon1.png'),
            Center(
              child: Container(
                width: 320,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Transfer Successful",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF04ba62),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("Your transaction was successful"),
                    const SizedBox(height: 20),
                    Text(
                      'Rp ${parsedAmount.toStringAsFixed(2)}', // Display formatted amount
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/image/image_1.png'),
                        ),
                        title: const Text("Abdul Mustakim"),
                        subtitle: const Text("+62 12345678910"),
                      ),
                    ),
                    const Text(
                      "Transaction Details",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Payment",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Rp ${parsedAmount.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            formattedTime,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Reference Number",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "QOIU-0012-ADFE-2234",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Fee",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Rp 2.0",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Payment",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: btntxt),
                          ),
                          Text(
                            'Rp ${totalPayment.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18, color: btntxt),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Share',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: btn,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // Adjust the radius as needed
                  side: const BorderSide(color: Colors.white, width: 2), // White border
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Nabbar()));
              },
              child: const Text('Back to Home', style: TextStyle(color: btntxt)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
