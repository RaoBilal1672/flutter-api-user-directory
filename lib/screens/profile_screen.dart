import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {

  final UserModel user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  Widget buildInfoBox(
      String title,
      String value,
      ) {

    return Container(

      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 18,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: const Color(0xFF11162F),

        borderRadius:
        BorderRadius.circular(18),

        border: Border.all(
          color: const Color(0xFF22D3EE),
          width: 1.5,
        ),

        boxShadow: [

          BoxShadow(
            color: const Color(0xFF00D4FF)
                .withOpacity(0.15),

            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(

              color: Color(0xFF94A3B8),

              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          Text(

            value,

            style: const TextStyle(

              color: Colors.white,

              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF0A0E27),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF0A0E27),

        elevation: 0,

        title: const Text(

          'Profile',

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Container(

              padding: const EdgeInsets.all(4),

              decoration: BoxDecoration(

                shape: BoxShape.circle,

                border: Border.all(
                  color: const Color(0xFF00D4FF),
                  width: 3,
                ),

                boxShadow: [

                  BoxShadow(
                    color: const Color(0xFF00D4FF)
                        .withOpacity(0.6),

                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: CircleAvatar(

                radius: 52,

                backgroundColor:
                const Color(0xFFC700FF),

                child: Text(

                  user.name[0],

                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            buildInfoBox(
              "Name",
              user.name,
            ),

            buildInfoBox(
              "Email",
              user.email,
            ),

            buildInfoBox(
              "Phone",
              user.phone,
            ),

            buildInfoBox(
              "Website",
              user.website,
            ),
          ],
        ),
      ),
    );
  }
}