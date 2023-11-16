import '../../tic_tac_toe_library.dart';

class GameStateNotifier extends StateNotifier<List<int>> {
  GameStateNotifier() : super([]);
  int _counter = 0;

  void fillList(int count) {
    _counter = 0;
    List<int> tempList = [];
    for (int i = 1; i <= count * count; i++) {
      if (i == count * count) {
        tempList.add(0);
      } else {
        tempList.add(i);
      }
    }

    tempList.shuffle();
    state = tempList;
  }

  void move(int index, int element, int count) {
    List<int> tempList = [];
    int emptyIndex = -1;
    for (int i = 0; i < state.length; i++) {
      if (state[i] == 0) {
        emptyIndex = i;
        break;
      }
    }
    int difference = (index - emptyIndex).abs();
    bool isTrickyMove = (index ~/ count == emptyIndex ~/ count);

    if ((difference == 1 && isTrickyMove) || difference == count) {
      for (int i = 0; i < state.length; i++) {
        if (i == emptyIndex) {
          tempList.add(element);
        } else if (i == index) {
          tempList.add(0);
        } else {
          tempList.add(state[i]);
        }
      }
      _counter++;
      state = tempList;
    }
  }

  bool isEndGame(int count) {
    for (int i = 1; i < count * count; i++) {
      if (state[i - 1] != i) {
        return false;
      }
    }
    return true;
  }

  int get tryCount => _counter;
}

final gameProvider = StateNotifierProvider<GameStateNotifier, List<int>>(
  (ref) => GameStateNotifier(),
);
