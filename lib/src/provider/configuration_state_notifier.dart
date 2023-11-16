import '../../tic_tac_toe_library.dart';

class ConfigurationStateNotifier extends StateNotifier<int> {
  ConfigurationStateNotifier() : super(3);

  void setValue(int value) {
    state = value;
  }
}

final configurationProvider =
    StateNotifierProvider<ConfigurationStateNotifier, int>(
  (ref) => ConfigurationStateNotifier(),
);
