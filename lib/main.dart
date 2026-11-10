
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusConnect',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4267D5),
        ),
      ),

      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      appBar: AppBar(
        title: const Text(
          'CampusConnect',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: const Color(0xFF4267D5),
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Lost something?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Find your belongings with your campus community.',
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ReportScreen(),
                        ),
                      );
                    },

                    child: const Text('Report an Item'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Explore Items',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _categoryCard(
                    context,
                    'Lost Items',
                    Icons.search,
                    Colors.orange,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _categoryCard(
                    context,
                    'Found Items',
                    Icons.inventory_2_outlined,
                    Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _itemCard(
              'Blue Water Bottle',
              'Central Library',
              Icons.water_drop,
            ),

            _itemCard(
              'Black Wallet',
              'College Canteen',
              Icons.account_balance_wallet,
            ),

            _itemCard(
              'Wireless Earphones',
              'Computer Lab',
              Icons.headphones,
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),

          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            label: 'Report',
          ),

          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          Icon(icon, color: color, size: 35),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _itemCard(String title, String location, IconData icon) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),

        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text(location),

        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Item'),
      ),

      body: const Center(
        child: Text(
          'Report Item Screen',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
