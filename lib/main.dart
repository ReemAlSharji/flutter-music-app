import 'package:music_app/musicapp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DesignApp());

class DesignApp extends StatefulWidget {
  const DesignApp({super.key});

  @override
  State<DesignApp> createState() => _DesignAppState();
}

class _DesignAppState extends State<DesignApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PlayMusic(),
      theme: ThemeData(fontFamily: 'Andika-Regular'),
      debugShowCheckedModeBanner: false,
    );
  }
}
