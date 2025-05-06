import 'package:flutter/material.dart';

class CustomScrollExample extends StatefulWidget {
  @override
  State<CustomScrollExample> createState() => _CustomScrollExampleState();
}

class _CustomScrollExampleState extends State<CustomScrollExample> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          /// 🔹 ছোট AppBar, স্ক্রল করলেই দেখা যাবে
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 56,
            floating: true,
            snap: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Animated UI'),
              background: Image.network(
                'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-9c369a3fd3ffbc4b8a2f50c5820f6c4ae0e5ff14cdad3ab4fd8c0b3e6f2531b3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// ✅ Fixed Header — always stays top while scrolling
          SliverPersistentHeader(
            pinned: true,
            delegate: _FixedHeaderDelegate(
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  '👋 Scroll and tap to see the animations!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              height: 60,
            ),
          ),

          /// 🔸 Grid Cards
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final isTapped = tappedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tappedIndex = isTapped ? -1 : index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: isTapped
                            ? Colors.teal[200]
                            : Colors.teal[100 * ((index % 8) + 1)],
                        borderRadius: BorderRadius.circular(isTapped ? 24 : 16),
                        boxShadow: isTapped
                            ? [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ]
                            : [],
                      ),
                      child: Center(
                        child: Text(
                          'Grid ${index + 1}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 6,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
            ),
          ),

          /// 🔸 Divider
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(thickness: 2),
            ),
          ),

          /// 🔸 List Items with animation
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 500),
                tween: Tween(begin: 0, end: 1),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 30 * (1 - value)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue.shade300,
                              child: Text('${index + 1}'),
                            ),
                            title: Text('Animated List ${index + 1}'),
                            subtitle: Text('With fade-in & slide animation'),
                            trailing: Icon(Icons.arrow_forward_ios, size: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ এই class টি header fix করার জন্য
class _FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _FixedHeaderDelegate({required this.child, this.height = 60});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
