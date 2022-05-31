import 'dart:async';

import 'package:example/module.dart';
import 'package:flutter/material.dart';
import 'package:meteor/meteor.dart';

class Am {
  Am();
}

void main() {
  runApp(OneModuleApp(module: AppModule(), child: MyApp()));
  // meteorRun(module: AppModule(), child: const MyApp());
}

class AppModule extends OneModule {
  @override
  get binds => [
        //OneBind<Am>.singleton((i) => Am()),
      ];
}

// class MyModule extends MModule {
//   @override
//   get routes => [
//         StackRoute(
//           path: '/',
//           child: (_, __) => SettingPage(),
//           routes: [
//             ModuleRoute(path: 'user', module: UserModule()),
//           ],
//         ),
//       ];
// }

// class UserModule extends MModule {
//   @override
//   get routes => [
//         StackRoute(
//           path: 'me',
//           child: (_, __) => MePage(),
//         ),
//       ];
// }

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //Meteor.to.pushNamed('/user/me');
    //Modular.to.pushNamed("/me/user");
    //print("ccccc ${one.get<int>().hashCode}");
    print("ccccc ${one.get<Am>().hashCode}");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _counter = ++_counter;
                });
              },
              child: Text("+"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '设置',
            ),
            MaterialButton(
              onPressed: () {
                // Meteor.to.pushNamed("/user/me");
              },
              child: Text("个人中心"),
            )
          ],
        ),
      ),
    );
  }
}

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '我的页面',
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("回到首页"),
            ),
            MaterialButton(
              onPressed: () {
                //print(Meteor.to.current.name);
              },
              child: Text("当前路由"),
            ),
            MaterialButton(
              onPressed: () {
                //print(Meteor.to.root.name);
              },
              child: Text("根路由"),
            )
          ],
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '找不到页面',
            ),
            MaterialButton(
              onPressed: () {
                //Meteor.to.pop();
              },
              child: Text("返回"),
            ),
          ],
        ),
      ),
    );
  }
}

class RootModule extends Module {
  @override
  get routes => [
        ChildRoute(
          '/',
          child: (_, __) => MyHomePage(
            title: "home",
          ),
          children: [
            ChildRoute("/me", child: (_, __) => SettingPage(), children: [
              ChildRoute("/user", child: (_, __) => MePage()),
            ]),
          ],
        )
      ];
}

// class AppModule extends Module {
//   @override
//   get binds => [Bind.factory<int>((i) => 10)];
//
//   @override
//   get routes => [
//         ChildRoute(
//           '/',
//           child: (_, __) => RootPage(),
//           children: [
//             ChildRoute('/home', child: (_, __) => MyHomePage(title: "Home"), transition: TransitionType.noTransition),
//             ChildRoute('/setting', child: (_, args) {
//               return SettingPage();
//             }, guards: [AuthGuard()], transition: TransitionType.noTransition),
//             WildcardRoute(child: (_, __) => NotFoundPage(), transition: TransitionType.noTransition),
//           ],
//         ),
//         // ChildRoute(
//         //   '/setting',
//         //   child: (_, args) {
//         //     return SettingPage();
//         //   },
//         //   guards: [AuthGuard()],
//         // ),
//         ChildRoute(
//           '/notAuth',
//           child: (_, __) => NotFoundPage(),
//         ),
//         // RedirectRoute('/redirect', to: '/setting'),
//         //ModuleRoute('/user', module: UserModule(), guards: [AuthGuard()]),
//       ];
// }

// class RootPage extends StatelessWidget {
//   const RootPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(child: RouterOutlet()),
//           Row(
//             children: [
//               Expanded(
//                 child: MaterialButton(
//                   onPressed: () {
//                     Meteor.to.navigate('/home');
//                   },
//                   child: Text("Home"),
//                 ),
//               ),
//               Expanded(
//                 child: MaterialButton(
//                   onPressed: () {
//                     Meteor.to.navigate('/setting');
//                   },
//                   child: Text("Setting"),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class UserModule extends Module {
//   @override
//   get routes => [
//         ChildRoute(
//           '/me',
//           child: (_, __) => MePage(),
//         ),
//       ];
// }
//
// class AuthGuard extends RouteGuard {
//   AuthGuard({super.redirectTo});
//
//   @override
//   FutureOr<bool> check(String path, MeteorRoute route) async {
//     await Meteor.to.pushNamed('/notAuth');
//     return false;
//   }
// }
