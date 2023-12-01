import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final List<String> _photos = List.generate(
      30, (index) => 'assets/search_images/image_${index + 1}.jpg');

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: const [
            Tab(text: 'Top'),
            Tab(text: 'Accounts'),
            Tab(text: 'Tags'),
            Tab(text: 'Places'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent(), // Top tab content
          AccountsTab(),      // Accounts tab content
          _buildTabContent(), // Tags tab content
          _buildTabContent(), // Places tab content
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    // نمونه‌ای از نحوه نمایش محتوای هر تب، اینجا با استفاده از GridView
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // تعداد ستون‌ها در هر ردیف
        crossAxisSpacing: 2, // فاصله افقی بین عکس‌ها
        mainAxisSpacing: 2, // فاصله عمودی بین عکس‌ها
      ),
      itemCount: _photos.length, // تعداد کل عکس‌ها، باید با داده‌های واقعی جایگزین شود
      itemBuilder: (context, index) {
        return Image.asset(_photos[index], fit: BoxFit.cover);
      },
    );
  }
}

class AccountsTab extends StatelessWidget {
  final List<String> _photos = List.generate(
      30, (index) => 'assets/search_images/image_${index + 1}.jpg');
  @override
  Widget build(BuildContext context) {
    // اینجا می‌توانید یک لیست از اکانت‌ها را تعریف کنید یا از یک API برای دریافت اطلاعات استفاده کنید.
    final List<Map<String, dynamic>> accounts = [
      {
        'username': 'stationcdrkelly',
        'name': 'Scott Kelly',
        'followers': '1M followers',
        'profilePic': 'assets/profile1.jpg',
      },
      // اضافه کردن سایر اکانت‌ها ...
    ];

    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        var account = accounts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(_photos[index]),
          ),
          title: Text(account['username']),
          subtitle: Text(account['name']),
          trailing: Text(account['followers']),
          onTap: () {
            // عملکردی که می‌خواهید بعد از ضربه زدن روی اکانت انجام شود
          },
        );
      },
    );
  }
}
