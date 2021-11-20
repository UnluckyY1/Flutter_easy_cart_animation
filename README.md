# 🎬Easy Cart Animation

Easy Cart Animation provides you an easy animated widget when adds a product to your cart.


![](https://i.imgur.com/YANxnu4.gif)

## Installation



```bash
dependencies:
  easycartanimation: ^1.0.0
```

## Usage

```dart
Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              var _overlayEntry = OverlayEntry(builder: (_) {
                                RenderBox box = context.findRenderObject();
                                var offset = box.localToGlobal(Offset.zero);
                                return EasyCartAnimation(
                                  startPosition:offset , //animation Start Point
                                  endPosition: _endOffset,//animation End Point
                                  height: 14,
                                  width: 14,
                                  color: Colors.blue,
                             // you can play around with this number for curve animation
                             // 0 means no curves
                                  dxCurveAnimation: 50, 
                                  dyCurveAnimation: 250,
                                  opacity: 0.5,
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(_overlayEntry);
                              // wait for the animation to end
                              Future.delayed(Duration(milliseconds: 800), () {
                                _overlayEntry.remove();
                                _overlayEntry = null;
                              });
                            },
                          );
                        },
                      ),
```
## Full Example

```dart
import 'package:easycartanimation/easycartanimation.dart';
import 'package:flutter/material.dart';


class EasyCartAnimationExamplePage extends StatefulWidget {
  @override
  _EasyCartAnimationExamplePageState createState() => _EasyCartAnimationExamplePageState();
}

class _EasyCartAnimationExamplePageState extends State<EasyCartAnimationExamplePage> {
  GlobalKey _key = GlobalKey();
  Offset _endOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) {
      // Get the location of the "shopping cart"
      _endOffset = (_key.currentContext.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Easy cart Animation'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Easy Cart Animation $index',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              var _overlayEntry = OverlayEntry(builder: (_) {
                                RenderBox box = context.findRenderObject();
                                var offset = box.localToGlobal(Offset.zero);
                                return EasyCartAnimation(
                                  startPosition: _endOffset,
                                  endPosition: offset,
                                  height: 14,
                                  width: 14,
                                  color: Colors.blue,
                                  dxCurveAnimation: 50,
                                  dyCurveAnimation: 250,
                                  opacity: 0.5,
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(_overlayEntry);
                              // wait for the animation to end
                              Future.delayed(Duration(milliseconds: 800), () {
                                _overlayEntry.remove();
                                _overlayEntry = null;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              var _overlayEntry = OverlayEntry(builder: (_) {
                                RenderBox box = context.findRenderObject();
                                var offset = box.localToGlobal(Offset.zero);
                                return EasyCartAnimation(
                                  startPosition: offset, //animation Start Point
                                  endPosition: _endOffset, //Animation end Point
                                  height: 14,
                                  width: 14,
                                  color: Colors.blue,
                                  dxCurveAnimation: 250,
                                  dyCurveAnimation: 50,
                                  opacity: 0.5,
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(_overlayEntry);
                              // wait for the animation to end
                              Future.delayed(Duration(milliseconds: 800), () {
                                _overlayEntry.remove();
                                _overlayEntry = null;
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
                  padding: EdgeInsets.only(left: 20),
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

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.




Made in 🇹🇳 Tunisia 🇹🇳 with Love 🥰🥰🥰🥰






