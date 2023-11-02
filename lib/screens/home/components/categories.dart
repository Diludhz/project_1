import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_1/screens/home/components/billpage.dart';
import 'package:project_1/screens/home/components/dailygiftpage.dart';
import 'package:project_1/screens/home/components/flashdealpage.dart';
import 'package:project_1/screens/home/components/gamepage.dart';
import 'package:project_1/screens/home/components/morepage.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              switch (categories[index]["text"]) {
                case "Flash Deal":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlashDealPage()),
                  );
                  break;
                case "Bill":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BillPage()),
                  );
                  break;
                case "Game":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                  break;
                case "Daily Gift":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DailyGiftPage()),
                  );
                  break;
                case "More":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MorePage()),
                  );
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
