import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:ketch4n/features/home/home_page.dart';
// import 'package:ketch4n/data/viewModels/home_page_vm.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => HexaIconsVM()),
      ],
      child: MaterialApp(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
            // brightness: Brightness.dark,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
