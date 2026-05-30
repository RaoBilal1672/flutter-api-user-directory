import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserTile extends StatefulWidget {

  final UserModel user;
  final VoidCallback onTap;

  const UserTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  State<UserTile> createState() =>
      _UserTileState();
}

class _UserTileState
    extends State<UserTile> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTapDown: (_) {

        setState(() {
          isPressed = true;
        });
      },

      onTapUp: (_) {

        setState(() {
          isPressed = false;
        });

        widget.onTap();
      },

      onTapCancel: () {

        setState(() {
          isPressed = false;
        });
      },

      child: AnimatedContainer(

        duration:
        const Duration(milliseconds: 250),

        curve: Curves.easeInOut,

        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration: BoxDecoration(

          color: const Color(0xFF0A0E27),

          borderRadius:
          BorderRadius.circular(18),

          border: Border.all(

            color: isPressed
                ? const Color(0xFF22D3EE)
                : const Color(0xFF334155),

            width: 2,
          ),

          boxShadow: [

            BoxShadow(

              color: isPressed
                  ? const Color(0xFF00D4FF)
                  .withOpacity(0.9)
                  : const Color(0xFF00D4FF)
                  .withOpacity(0.08),

              blurRadius:
              isPressed ? 30 : 6,

              spreadRadius:
              isPressed ? 4 : 1,
            ),

            BoxShadow(

              color: isPressed
                  ? const Color(0xFFC700FF)
                  .withOpacity(0.8)
                  : const Color(0xFFC700FF)
                  .withOpacity(0.05),

              blurRadius:
              isPressed ? 35 : 4,

              spreadRadius:
              isPressed ? 3 : 0,
            ),
          ],
        ),

        child: ListTile(

          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),

          leading: CircleAvatar(

            radius: 26,

            backgroundColor:
            const Color(0xFFC700FF),

            child: Text(

              widget.user.name[0]
                  .toUpperCase(),

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          title: Text(

            widget.user.name,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          subtitle: Padding(

            padding:
            const EdgeInsets.only(top: 6),

            child: Text(

              widget.user.email,

              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 14,
              ),
            ),
          ),

          trailing: const Icon(

            Icons.arrow_forward_ios,

            color: Color(0xFF22D3EE),
            size: 18,
          ),
        ),
      ),
    );
  }
}