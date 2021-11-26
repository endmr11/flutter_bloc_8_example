import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kullanimi3/bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomeBloc homeBloc = HomeBloc();
  bool isLoading = false;
  int sayi = 0;
  @override
  void initState() {
    homeBloc.add(StartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => homeBloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeLoadingState) {
                    isLoading = false;
                    homeBloc.add(IncrementEvent(sayi));
                  } else if (state is HomeLoadedState) {
                    sayi = state.sayi;
                    isLoading = true;
                  }
                },
                child: Center(child: isLoading ? Text(sayi.toString()) : const CircularProgressIndicator()),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  sayi++;
                  homeBloc.add(IncrementEvent(sayi));
                },
                child: const Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
