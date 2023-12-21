import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: XylophoneApp(),
    );
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Soundpool pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  List<int> _soundIds = [];
  @override
  void initState() {
    super.initState();
    initSoundPool();
  }

  Future<void> initSoundPool() async {
    _soundIds = await Future.wait(['do1', 're', 'mi', 'fa', 'sol', 'la', ' si', 'do2'].map((e) {
      return rootBundle.load('assets/$e').then((value) => pool.load(value));
    }));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: gunban('도', Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: gunban('레', Colors.orange),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: gunban('미', Colors.deepOrangeAccent),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: gunban('파', Colors.cyan),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: gunban('솔', Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 56.0),
            child: gunban('라', Colors.purple),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: gunban('시', Colors.indigo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 72.0),
            child: gunban('도', Colors.red),
          ),
        ],
      ),
    );
  }

  Widget gunban(String text, Color color) {
    return Container(
      width: 50,
      height: double.infinity,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
