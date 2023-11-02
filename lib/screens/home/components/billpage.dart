import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screens/home/home_screen.dart';
import 'package:project_1/screens/profile/profile_screen.dart';
import 'package:project_1/size_config.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            CupertinoButton(
                child: const Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                }),
          ],
          leading: CupertinoButton(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            const CreditCardWidget(
              cardNumber: 'XXXX XXXX XXXX 3456',
              cardHolder: 'John Doe',
              expiryDate: '12/24',
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color.fromARGB(255, 254, 59, 0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(19.0), child: card())),
          ]),
        ));
  }

  Column card() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Debit Card Transactions",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
      ),
      const SizedBox(height: 20),
      const Align(
        alignment: Alignment.topRight,
        child: Text(
          "VIEW ALL",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
        ),
      ),
      DebitCardTransactions(),
      const SizedBox(height: 16),
      TotalAmount(),
      const Divider(
        thickness: 3,
        color: Colors.black,
      ),
      const SizedBox(height: 16),
      DebitCardTransactions(),
      TotalAmount(),
      const Divider(
        thickness: 3,
        color: Colors.black,
      ),
      const SizedBox(height: 16),
      DebitCardTransactions(),
      TotalAmount(),
      const Divider(
        thickness: 3,
        color: Colors.black,
      ),
      const SizedBox(height: 16),
      DebitCardTransactions(),
      TotalAmount(),
    ]);
  }

  Row TotalAmount() {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transaction Amount',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            children: [
              Text(
                '\$500.00',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Icon(
                Icons.credit_card, // Replace with the appropriate icon
                size: 28,
                color: Colors.white,
              ),
            ],
          ),
        ]);
  }

  Row DebitCardTransactions() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage("assets/images/AtmTransactionProfile.jpeg"),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe', // Replace with the user's name
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Account Number: XXXX XXXX 9012', // Replace with the account number
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      width: 400,
      height: 230,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 59, 0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card Number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              cardNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 2,
              ),
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card Holder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Expiry Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardHolder,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  expiryDate,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
