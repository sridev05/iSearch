// lib/screens/records_screen.dart
import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> criminalRecords = [
      {
        'id': 'CR001',
        'name': 'John Doe',
        'case': 'Criminal Case #1',
        'date': '2025-02-18',
        'status': 'Ongoing',
        'details': 'Theft and burglary charges',
        'lastUpdated': '2 hours ago',
        'severity': 'High',
        'location': 'New York, NY'
      },
      {
        'id': 'CR002',
        'name': 'Jane Smith',
        'case': 'Criminal Case #2',
        'date': '2025-02-17',
        'status': 'Closed',
        'details': 'Assault charges',
        'lastUpdated': '1 day ago',
        'severity': 'Medium',
        'location': 'Los Angeles, CA'
      },
      {
        'id': 'CR003',
        'name': 'Robert Johnson',
        'case': 'Criminal Case #3',
        'date': '2025-02-16',
        'status': 'Under Review',
        'details': 'Fraud investigation',
        'lastUpdated': '3 days ago',
        'severity': 'High',
        'location': 'Chicago, IL'
      },
      {
        'id': 'CR004',
        'name': 'Maria Garcia',
        'case': 'Criminal Case #4',
        'date': '2025-02-15',
        'status': 'Pending',
        'details': 'Cybercrime investigation',
        'lastUpdated': '5 days ago',
        'severity': 'Medium',
        'location': 'Miami, FL'
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Criminal Records',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Showing all cases. Tap on a case for more details.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: criminalRecords.length,
                  itemBuilder: (context, index) {
                    final record = criminalRecords[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          backgroundColor: _getStatusColor(record['status']).withOpacity(0.2),
                          child: Text(record['name'].substring(0, 1)),
                        ),
                        title: Text(record['name']),
                        subtitle: Text(record['case']),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDetailRow('Status', record['status']),
                                _buildDetailRow('Date', record['date']),
                                _buildDetailRow('Location', record['location']),
                                _buildDetailRow('Severity', record['severity']),
                                _buildDetailRow('Details', record['details']),
                                _buildDetailRow('Last Updated', record['lastUpdated']),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      icon: const Icon(Icons.edit),
                                      label: const Text('Edit'),
                                      onPressed: () {},
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton.icon(
                                      icon: const Icon(Icons.delete),
                                      label: const Text('Delete'),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 1),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ongoing':
        return Colors.blue;
      case 'closed':
        return Colors.green;
      case 'under review':
        return Colors.orange;
      case 'pending':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}