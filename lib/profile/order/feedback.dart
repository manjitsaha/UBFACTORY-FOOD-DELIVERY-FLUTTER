import 'package:flutter/material.dart';

class FeedbackEmojiButton extends StatelessWidget {
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  FeedbackEmojiButton({
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
