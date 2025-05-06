import 'package:flutter/material.dart';

class DelayedAppBarReveal extends StatefulWidget {
  @override
  _DelayedAppBarRevealState createState() => _DelayedAppBarRevealState();
}

class _DelayedAppBarRevealState extends State<DelayedAppBarReveal> {
  ScrollController _controller = ScrollController();
  bool showBigAppBar = false;

  @override
  void initState() {
    super.initState();

    // স্ক্রল করার সময় চেক করবো কত দূর গিয়েছে
    _controller.addListener(() {
      double max = _controller.position.maxScrollExtent;
      double current = _controller.offset;

      // একদম নিচে গেলে বড় AppBar দেখাও
      if (current > max - 100 && !showBigAppBar) {
        setState(() => showBigAppBar = true);
      }

      // নিচ থেকে উপরে উঠলে আবার ছোট করো
      if (current < max - 150 && showBigAppBar) {
        setState(() => showBigAppBar = false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          // 🔹 SliverAppBar - ছোট অবস্থায় শুরু হবে
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            expandedHeight: showBigAppBar ? 200 : 0, // বড় AppBar দেখাবো কিনা
            flexibleSpace: showBigAppBar
                ? FlexibleSpaceBar(
              title: Text("বড় AppBar"),
              background: Image.network(
                'https://flutter.dev/images/flutter-logo-sharing.png',
                fit: BoxFit.cover,
              ),
            )
                : null,
          ),

          // 🔸 উপরের টেক্সট
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '⬆️ Scroll up → AppBar hide\n⬇️ Scroll down → toolbar\n⬇️ একদম নিচে → Full AppBar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // 🔸 নিচের লিস্ট
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                title: Text('আইটেম ${index + 1}'),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

