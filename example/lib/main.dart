import 'package:easycartanimation/easycartanimation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyExample());
}

class MyExample extends StatelessWidget {
  const MyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EasyCartAnimationExamplePage(),
    );
  }
}


class EasyCartAnimationExamplePage extends StatefulWidget {
  const EasyCartAnimationExamplePage({super.key});

  @override
  State<EasyCartAnimationExamplePage> createState() =>
      _EasyCartAnimationExamplePageState();
}

class _EasyCartAnimationExamplePageState
    extends State<EasyCartAnimationExamplePage> {
  final GlobalKey _key = GlobalKey();
  Offset? _endOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) {
      // Get the location of the "shopping cart"
      _endOffset = (_key.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Easy cart Animation'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Easy Cart Animation $index',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              OverlayEntry? overlayEntry0 =
                                  OverlayEntry(builder: (_) {
                                RenderBox box =
                                    context.findRenderObject() as RenderBox;
                                var offset = box.localToGlobal(Offset.zero);
                                return EasyCartAnimation(
                                  startPosition: _endOffset,
                                  endPosition: offset,
                                  height: 14,
                                  width: 14,
                                  color: Colors.blue,
                                  dxCurveAnimation: 55,
                                  dyCurveAnimation: 250,
                                  opacity: 0.5,
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(overlayEntry0);
                              // wait for the animation to end
                              Future.delayed(const Duration(milliseconds: 800),
                                  () {
                                overlayEntry0!.remove();
                                overlayEntry0 = null;
                              });
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              OverlayEntry? overlayEntry =
                                  OverlayEntry(builder: (_) {
                                RenderBox box =
                                    context.findRenderObject() as RenderBox;
                                var offset = box.localToGlobal(Offset.zero);
                                return EasyCartAnimation(
                                  startPosition: offset,
                                  endPosition: _endOffset,
                                  height: 14,
                                  width: 14,
                                  color: Colors.blue,
                                  dxCurveAnimation: 250,
                                  dyCurveAnimation: 50,
                                  opacity: 0.5,
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(overlayEntry);
                              // wait for the animation to end
                              Future.delayed(const Duration(milliseconds: 800),
                                  () {
                                overlayEntry!.remove();
                                overlayEntry = null;
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              itemCount: 100,
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
            height: 60,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.shop_two,
                    key: _key,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
