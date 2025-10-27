import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String? avatarUrl;
  final bool isTyping;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    this.avatarUrl,
    this.isTyping = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Avatar on left if NOT me
          if (!isMe && avatarUrl != null)
            CommonImageView(
              height: 40,
              url: avatarUrl!,
              width: 40,
              radius: 200,
            ),

          // CircleAvatar(radius: 14, backgroundImage: NetworkImage(avatarUrl!)),
          const SizedBox(width: 6),

          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: isMe ? kSecondaryBlue : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16).copyWith(
                  bottomRight: isMe ? Radius.zero : const Radius.circular(16),
                  topLeft: isMe ? const Radius.circular(16) : Radius.zero,
                ),
              ),
              child: isTyping
                  ? const Text(
                      "Typing....",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  : Text(
                      message,
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black87,
                        fontSize: 14,
                      ),
                    ),
            ),
          ),

          const SizedBox(width: 6),

          // Avatar on right if ME
          if (isMe && avatarUrl != null)
            CommonImageView(
              height: 40,
              url: avatarUrl!,
              width: 40,
              radius: 200,
            ),
        ],
      ),
    );
  }
}
