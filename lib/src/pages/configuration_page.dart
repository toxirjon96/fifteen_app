import '../../tic_tac_toe_library.dart';

const List<int> values = [3, 4, 5, 6, 7, 8];

class ConfigurationPage extends ConsumerWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int value = ref.watch(configurationProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton(
            value: value,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            items: values
                .map(
                  (e) => DropdownMenuItem<int>(
                    value: e,
                    child: Text(
                      "$e",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                ref.read(configurationProvider.notifier).setValue(value);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  ref.read(gameProvider.notifier).fillList(value);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const GamePage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  backgroundColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Start Game",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
