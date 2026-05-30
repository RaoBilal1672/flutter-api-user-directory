import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/api_service.dart';
import '../widgets/user_tile.dart';
import 'profile_screen.dart';

class UserScreen extends StatefulWidget {

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() =>
      _UserScreenState();
}

class _UserScreenState
    extends State<UserScreen> {

  late Future<List<UserModel>> futureUsers;

  @override
  void initState() {

    super.initState();

    futureUsers = ApiService.fetchUsers();
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

          'Users',

          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: FutureBuilder<List<UserModel>>(

        future: futureUsers,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(

              child: CircularProgressIndicator(
                color: Color(0xFF00D4FF),
              ),
            );
          }

          if (snapshot.hasError) {

            return Center(

              child: Text(

                snapshot.error.toString(),

                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }

          final users = snapshot.data!;

          return ListView.builder(

            itemCount: users.length,

            itemBuilder: (context, index) {

              final user = users[index];

              return UserTile(

                user: user,

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) =>
                          ProfileScreen(
                            user: user,
                          ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}