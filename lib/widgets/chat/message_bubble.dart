import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      this.message, this.userName, this.userImage, this.isMe, this.msgKey,
      {Key? key})
      : super(key: key);

  final Key msgKey;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe
                    ? Colors.grey[300]
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  // topLeft: isMe ? const Radius.circular(0) : const Radius.circular(14),
                  // topRight: isMe ? const Radius.circular(14) : const Radius.circular(0),
                  // bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(14),
                  // bottomLeft: isMe ? const Radius.circular(14) : const Radius.circular(0),
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(14),
                  bottomLeft: isMe
                      ? const Radius.circular(14)
                      : const Radius.circular(0),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          top: 0,
          left: !isMe ? 120 : null,
          right: isMe ? 120 : null,
        ),
      ],
    );
  }
}
