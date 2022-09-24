import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final String name, duration;
  final bool isActive;

  const SubscriptionCard({
    super.key,
    required this.name,
    required this.duration,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  '\$',
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const Text(
                '100',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '/every $duration',
                  style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: isActive
                    ? const Color(0xFF7A83CD)
                    : const Color(0xFF7A83CD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
              child: Text(
                isActive ? 'ACTIVE' : 'UPGRADE',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
