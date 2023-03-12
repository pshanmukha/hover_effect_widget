import 'package:flutter/material.dart';
import 'package:hover_effect_widget/on_hover_custom.dart';
import 'package:hover_effect_widget/on_hover_text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final texts = [
    'Sachin',
    'Rohit',
    'Dhoni',
    'Virat',
    'Ashwin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hover Effect"),
      ),
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnHoverCustom(
            hoveredTransform: Matrix4.identity()
              ..translate(8, 8, 0)
              ..scale(1.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple, width: 4),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  "Hover on me",
                  style: TextStyle(
                    fontSize: 64,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            separatorBuilder: (content, index) => const Divider(),
            itemCount: texts.length,
            itemBuilder: (context, index) {
              return Center(
                child: OnHoverText(
                    hoveredTransform: Matrix4.identity()
                      ..translate(8, 0, 0)
                      ..scale(1.1),
                    builder: (isHovered) {
                      return Text(
                        texts[index],
                        style: TextStyle(
                          fontSize: 64,
                          color: isHovered ? Colors.purple : Colors.white,
                        ),
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
