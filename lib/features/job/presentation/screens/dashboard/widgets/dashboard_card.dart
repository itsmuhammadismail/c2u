import 'package:c2u/features/job/presentation/screens/dashboard/widgets/card_model.dart';
import 'package:c2u/resources/colors.dart';
import 'package:c2u/resources/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardCard extends StatelessWidget {
  final CardModel card;

  const DashboardCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.name,
                        style: const TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          card.value == null
                              ? CircularProgressIndicator(color: card.color)
                              : Text(
                                  card.value.toString(),
                                  style: kHeading1.copyWith(
                                    color: card.color,
                                  ),
                                ),
                          const Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: -8,
                  right: -8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: card.color,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(20),
                    width: 70,
                    height: 70,
                    child: SvgPicture.asset(card.icon),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
