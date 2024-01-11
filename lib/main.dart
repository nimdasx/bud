import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var xcurrent = WordPair.random();

  void getNext() {
    xcurrent = WordPair.random();
    notifyListeners();
  }

  var xfavorites = <WordPair>[];

  void xToggleFavorite() {
    if (xfavorites.contains(xcurrent)) {
      xfavorites.remove(xcurrent);
    } else {
      xfavorites.add(xcurrent);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var xappState = context.watch<MyAppState>();
    var xpair = xappState.xcurrent;

    IconData icon;
    if (xappState.xfavorites.contains(xpair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('A random AWESOME idea:'),
            BigCard(ypair: xpair),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    xappState.xToggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      print('button pressed!');
                      xappState.getNext();
                    },
                    child: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.ypair,
  });

  final WordPair ypair;

  @override
  Widget build(BuildContext context) {
    final xtheme = Theme.of(context);
    final xstyle = xtheme.textTheme.displayMedium!.copyWith(
      color: xtheme.colorScheme.onPrimary,
    );
    return Card(
      color: xtheme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          ypair.asLowerCase,
          style: xstyle,
          semanticsLabel: "${ypair.first} ${ypair.second}",
        ),
      ),
    );
  }
}
