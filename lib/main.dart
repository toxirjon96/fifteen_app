import '../../tic_tac_toe_library.dart';

void main() {
  runApp(
    const ProviderScope(child: GameHome()),
  );
}

class GameHome extends StatelessWidget {
  const GameHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fifteen",
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      home: const ConfigurationPage(),
    );
  }
}
