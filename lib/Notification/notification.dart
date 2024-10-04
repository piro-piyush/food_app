import 'package:flutter/material.dart';

class Notifications {
  String description;
  String time;

  Notifications({
    required this.description,
    required this.time,
  });
}

List<Notifications> notificationList = [
  Notifications(description: "Discount of 25% on pizza this Wednesday", time: "2 min ago"),
  Notifications(description: "Buy 1 get 1 free on all burgers!", time: "10 min ago"),
  Notifications(description: "Free delivery on orders above \$30 today!", time: "30 min ago"),
  Notifications(description: "Flash sale! 50% off on all desserts for the next hour", time: "1 hour ago"),
  Notifications(description: "Limited time offer: 20% off on all pasta dishes", time: "2 hours ago"),
  Notifications(description: "Exclusive offer: Free drink with every sandwich purchase", time: "3 hours ago"),
];

class NotificationContent extends StatefulWidget {
  final VoidCallback onNotificationUpdate; // Define the callback

  const NotificationContent({Key? key, required this.onNotificationUpdate}) : super(key: key);

  @override
  State<NotificationContent> createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    notificationList.clear(); // Clear all items in the list
                    widget.onNotificationUpdate(); // Notify the HomeScreen to update
                  });
                },
                child: const Text(
                  "Remove all",
                  style: TextStyle(
                    fontSize: 17.8,
                    fontFamily: "sofia_Medium_pro",
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFE724C),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFE724C),
                    decorationThickness: 2,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: notificationListBuilder(),
          ),
        ],
      ),
    );
  }

  Widget notificationListBuilder() {
    return notificationList.isEmpty
        ? Center(
      child: Text(
        "No notifications yet!",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[600],
        ),
      ),
    )
        : ListView.builder(
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        final notification = notificationList[index];

        return Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 5.0),
          child: Container(
            height: 85,
            margin: const EdgeInsets.only(bottom: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: const Color(0xFFF2EAEA),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          notification.description,
                          style: const TextStyle(
                            fontSize: 18.8,
                            fontFamily: "sofia_Medium_pro",
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF111719),
                          ),
                          overflow: TextOverflow.ellipsis, // This will add '...' if the text is too long
                          softWrap: true, // Enable wrapping
                          maxLines: 2, // Allow the text to wrap to a maximum of 2 lines
                        ),
                      ),
                      Text(
                        notification.time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "sofia_Medium_pro",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      notificationList.remove(notification);
                      widget.onNotificationUpdate(); // Notify the HomeScreen to update
                    });
                  },
                  icon: const Icon(Icons.close_sharp),
                  color: const Color(0xFFFE724C),
                  iconSize: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
