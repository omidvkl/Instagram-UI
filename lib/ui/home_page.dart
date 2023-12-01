import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _photos =
  List.generate(15, (index) => 'assets/images/profile_${index + 1}.jpg');
  final int postCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: postCount + 1, // +1 به خاطر بخش داستان‌ها
        itemBuilder: (context, index) {
          if (index == 0) {
            // بخش داستان‌ها در اولین آیتم
            return _buildStories();
          } else {
            // بخش پست‌ها
            return _buildPostItem(index - 1); // -1 به خاطر بخش داستان‌ها
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Instagram',
        style: TextStyle(color: Colors.black, fontFamily: 'Billabong', fontSize: 30.0),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_box_outlined, color: Colors.black),
          onPressed: () {/* ... */},
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.black),
          onPressed: () {/* ... */},
        ),
        IconButton(
          icon: const Icon(Icons.message_outlined, color: Colors.black),
          onPressed: () {/* ... */},
        ),
      ],
    );
  }

  Widget _buildStories() {
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _photos.length, // تعداد داستان‌ها
        itemBuilder: (context, index) {
          return _buildStoryItem(index);
        },
      ),
    );
  }

  Widget _buildStoryItem(int index) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Colors.red.shade200,
            ),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(_photos[index]), // استفاده از AssetImage
          ),
        ),
        const SizedBox(height: 4),
        Text('Story $index'), // نمایش متن بر اساس index
      ],
    );
  }

  Widget _buildPostItem(int index) {
    String caption = "This is a sample caption for post $index";
    String numberOfComments = "View all 128 comments";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
               CircleAvatar(
                backgroundImage: AssetImage(_photos[index]),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'username',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'location',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ),
        Image.asset(_photos[index],fit: BoxFit.cover), // تصویر پست
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {/* ... */},
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {/* ... */},
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {/* ... */},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Liked by person1, person2, and others',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        // اضافه کردن کپشن و کامنت‌ها
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            caption,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              // عملیات برای نمایش همه کامنت‌ها
            },
            child: Text(
              numberOfComments,
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ),
        ),
        // اضافه کردن یک فیلد برای افزودن کامنت
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_13.jpg'),
                radius: 15,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (String value) {
                    // عملیات برای ذخیره کامنت
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
