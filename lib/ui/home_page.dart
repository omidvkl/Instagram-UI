import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _photos =
      List.generate(15, (index) => 'assets/images/profile_${index + 1}.jpg');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          leading: const Icon(Icons.camera_alt, color: Colors.black),
          title: const Text(
            'instagram',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Billabong', fontSize: 30),
          ),
          actions: const [
            Icon(Icons.tv, color: Colors.black),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.send, color: Colors.black),
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            _buildProfileSection(),
            TabBar(
              // TabBar را اینجا قرار می‌دهیم
              controller: _tabController,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPhotoGrid(),
                  const Center(child: Text('Second Tab View')),
                ],
              ),
            ),
          ],
        )
        // bottomNavigationBar: _buildBottomNavigationBar(),
        );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                'assets/images/profile_1.jpg',
                width: 72,
                height: 72,
              )),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatisticItem('Posts', '1,487'),
                    _buildStatisticItem('Followers', '898'),
                    _buildStatisticItem('Following', '1,310'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfileButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      // این گزینه اجازه می‌دهد GridView فقط فضای لازم برای نمایش محتوا را اشغال کند
      physics: const BouncingScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: _photos.length,
      itemBuilder: (context, index) {
        return Image.asset(_photos[index], fit: BoxFit.cover);
      },
    );
  }

  Widget _buildStatisticItem(String label, String count) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildProfileButton() {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: const Text('Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
    );
  }

}
