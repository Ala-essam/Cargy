import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  // Updated list with 'isRead' field
  final List<Map<String, dynamic>> _groups = [
    {
      'name': 'Toyota Corolla',
      'lastMessage':
          'I’m stuck with a flat tire on my Toyota Corolla near the 7th Circle in Amman. Does anyone have a spare or tools to help?',
      'time': '3:40 PM',
      'unreadCount': 50,
      'image': 'assets/logos/toyota.png',
      'isRead': false, // Unread
    },
    {
      'name': 'Hyundai Tucson',
      'lastMessage': 'Click to join......',
      'time': '3:40 PM',
      'unreadCount': 0,
      'image': 'assets/logos/hyundai.png',
      'isRead': true, // Read
    },
    {
      'name': 'Tesla Model 3',
      'lastMessage':
          'The central locking system on my Tesla Model 3 stopped working. Could this be a...',
      'time': '3:40 PM',
      'unreadCount': 3,
      'image': 'assets/logos/tesla.png',
      'isRead': false, // Unread
    },
    {
      'name': 'BMW X5',
      'lastMessage':
          'My BMW X5 needs some serious interior cleaning. Anyone know a good detailing service?',
      'time': '3:40 PM',
      'unreadCount': 1,
      'image': 'assets/logos/bmw.png',
      'isRead': false, // Unread
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showSearchDialog(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _groups.length,
        itemBuilder: (context, index) {
          final group = _groups[index];
          final bool isRead = group['isRead'];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  group['image'],
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(
                group['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Text(
                group['lastMessage'],
                style: TextStyle(
                  fontSize: 14,
                  color: isRead ? Colors.grey : Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    group['time'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (group['unreadCount'] > 0)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        group['unreadCount'].toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                _markAsRead(index);
                _navigateToGroupChat(context, group);
              },
            ),
          );
        },
      ),
    );
  }

  void _markAsRead(int index) {
    setState(() {
      _groups[index]['isRead'] = true;
      _groups[index]['unreadCount'] = 0;
    });
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search Communities'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Search for a community...',
            ),
            onChanged: (value) {},
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToGroupChat(BuildContext context, Map<String, dynamic> group) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupChatPage(group: group),
      ),
    );
  }
}

// Group Chat Page (Placeholder)
class GroupChatPage extends StatelessWidget {
  final Map<String, dynamic> group;

  const GroupChatPage({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group['name']),
      ),
      body: Center(
        child: Text('Chat for ${group['name']}'),
      ),
    );
  }
}
