import "package:flutter/material.dart";

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
        "No history yet!",
        style: TextStyle(
        fontSize: 18,
        color: Colors.grey[600],
    ),
    )
    );
  }
}
