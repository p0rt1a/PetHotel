import 'package:app/constants/palette.dart';
import 'package:app/models/demo/comment_demo.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key, required this.comment});
  final Comment comment;

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.comment.ownerImage),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.comment.owner,
                          style: TextStyle(color: HexColor(dark), fontSize: 16),
                        ),
                        const SizedBox(width: 4),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          elevation: 3,
                          color: Colors.red.shade500,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_purple500_outlined,
                                  color: Colors.yellow,
                                  size: 14,
                                ),
                                Text(
                                  widget.comment.rate.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(color: HexColor(primary), width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          child: Text(
                            widget.comment.date,
                            style: TextStyle(
                              color: HexColor(primary),
                              fontSize: 12,
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              widget.comment.body,
              style: TextStyle(color: HexColor(dark), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
