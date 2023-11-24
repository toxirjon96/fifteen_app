import '../../tic_tac_toe_library.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> valueList = ref.watch(gameProvider);
    int count = ref.watch(configurationProvider);
    bool isEndGame = ref.watch(gameProvider.notifier).isEndGame(count);
    int tryCount = ref.watch(gameProvider.notifier).tryCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fifteen"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(gameProvider.notifier).fillList(count);
            },
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
      body: isEndGame
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tabriklaymiz siz yutdingiz!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  Text(
                    "Urinishlar soni: $tryCount",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28,
                        color:
                        Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(gameProvider.notifier).fillList(count);
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 40,
                    ),
                  ),
                ],
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Urinishlar soni: $tryCount",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 100 / count,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: count,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: valueList.length,
                      (ctx, index) => SizedBox.expand(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90 / count),
                            ),
                            backgroundColor: valueList[index] == 0
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                          ),
                          onPressed: () {
                            ref.read(gameProvider.notifier).move(
                                  index,
                                  valueList[index],
                                  count,
                                );
                          },
                          child: Text(
                            valueList[index] == 0 ? '' : '${valueList[index]}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 100 / count,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
