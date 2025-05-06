
import 'package:flutter/material.dart';

class FancyScrollAppBar extends StatefulWidget {
  @override
  _FancyScrollAppBarState createState() => _FancyScrollAppBarState();
}

class _FancyScrollAppBarState extends State<FancyScrollAppBar>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  bool showBigAppBar = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 🔹 Animation setup
    _animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

    _scaleAnimation =
        Tween<double>(begin: 0.95, end: 1).animate(_animationController);

    // 🔹 Scroll listener
    _controller.addListener(() {
      double max = _controller.position.maxScrollExtent;
      double current = _controller.offset;

      if (current > max - 100 && !showBigAppBar) {
        setState(() => showBigAppBar = true);
        _animationController.forward(); // Fade-in & Zoom
      }

      if (current < max - 150 && showBigAppBar) {
        setState(() => showBigAppBar = false);
        _animationController.reverse(); // Fade-out & Zoom-out
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          // 🔹 SliverAppBar with animation
          SliverAppBar(

            floating: true,
            snap: true,
            pinned: false,
            expandedHeight: 200,
            flexibleSpace: showBigAppBar
                ? FlexibleSpaceBar(
              title: FadeTransition(
                opacity: _fadeAnimation,
                child: Text("Animated AppBar"),
              ),
              background: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.network(
                    'https://plus.unsplash.com/premium_photo-1695055513545-c13fa9363ad6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1NHx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
                : null,
          ),

          // 🔸 Info Text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '⬆️ Scroll up → AppBar hide\n⬇️ Scroll down → toolbar\n⬇️ একদম নিচে → Full AppBar (Fade + Zoom)',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // 🔸 Scroll List
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
