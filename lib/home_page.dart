import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _controllerTab = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: TabBar(
              controller: _controllerTab,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.amberAccent,
              indicatorColor: Colors.amberAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: DotIndicator(color: Colors.amberAccent, radius: 4),
              tabs: const [
                Tab(
                  text: "Meus products",
                ),
                Tab(
                  text: "Outros mais",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
              controller: _controllerTab,
              children: const [
                Text("primeiro"),
                Text("Segundo"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DotIndicator extends Decoration {
  final Color color;
  double radius;
  DotIndicator({Key? key, required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotIndicator(color: color, radius: radius);
  }
}

class _DotIndicator extends BoxPainter {
  final Color color;
  double radius;
  _DotIndicator({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset newOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + newOffset, radius, _paint);
  }
}
