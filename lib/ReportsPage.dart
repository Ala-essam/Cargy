import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'UPCOMING'),
              Tab(text: 'PAST'),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFBD112C), // Red color
          ),
        ),
        body: const TabBarView(
          children: [
            // Ongoing Reports Tab
            OngoingReportsTab(),
            // Past Reports Tab
            PastReportsTab(),
          ],
        ),
      ),
    );
  }
}

// Ongoing Reports Tab
class OngoingReportsTab extends StatelessWidget {
  const OngoingReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReportCard(
            status: 'On Hold',
            bookingId: '123456789',
            service: 'Basic Service',
            workshop: 'The First Step Workshop',
            date: '9th Jan 2021, Monday',
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Handle "Book Again" action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBD112C), // Red color
                ),
                child: const Text(
                  'BOOK AGAIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Past Reports Tab
class PastReportsTab extends StatelessWidget {
  const PastReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReportCard(
            status: 'COMPLETED',
            bookingId: '123456789',
            service: 'Basic Service',
            workshop: 'The First Step Workshop',
            date: '9th Jan 2021, Monday',
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Handle "Book Again" action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBD112C), // Red color
                ),
                child: const Text(
                  'BOOK AGAIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Helper method to build a report card
Widget _buildReportCard({
  required String status,
  required String bookingId,
  required String service,
  required String workshop,
  required String date,
  required List<Widget> actions,
}) {
  return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 16,
                    color: status == 'COMPLETED' ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Booking ID: $bookingId',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              service,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              workshop,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            //Text(
            //'DATE: $date',
            //style: const
          ])));
}
