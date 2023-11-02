import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_1/screens/home/home_screen.dart';

// ignore: must_be_immutable
class FlashDealPage extends StatelessWidget {
  var images = [
    "assets/FlashDeal/FlashDeal1.jpeg",
    "assets/FlashDeal/FlashDeal2.jpeg",
    "assets/FlashDeal/FlashDeal3.jpeg",
    "assets/FlashDeal/FlashDeal4.jpeg",
    "assets/FlashDeal/FlashDeal5.jpeg",
    "assets/FlashDeal/FlashDeal6.jpeg",
    "assets/FlashDeal/FlashDeal7.jpeg",
    "assets/FlashDeal/FlashDeal8.jpeg",
    "assets/FlashDeal/FlashDeal9.jpeg",
    "assets/FlashDeal/FlashDeal10.jpeg"
  ];
  var cac = [4, 4, 4, 2, 2, 2, 2, 4, 2, 2];
  var mac = [4, 4, 3, 4, 2, 3, 1, 4, 2, 2];

  FlashDealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 50, 50, 50),
          leading: CupertinoButton(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
          actions: [
            CupertinoButton(
                child: const Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              children: List.generate(
                  10,
                  (index) => StaggeredGridTile.count(
                        crossAxisCellCount: cac[index],
                        mainAxisCellCount: mac[index],
                        child: Card(
                          color:
                              Colors.primaries[index % Colors.primaries.length],
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
            ),
          ),
        ));
  }
}
