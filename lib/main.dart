import 'package:bloc_rest_api/bloc_rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network/dto/feature_collection_dto.dart';
import 'views/loader.dart';

void main() {
  // Specify the base url
  // ApiConfig.baseUrl = "https://jsonplaceholder.typicode.com/";
  // Specify base header for response
  // ApiConfig.header = {"Content-Type": "application/json"};
  // runApp(const App());
  runApp(const MyApp());
}

// https://pub.dev/packages/bloc_rest_api/example
class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RequestCubit<FeatureCollectionDto>(
            fromMap: (json) => FeatureCollectionDto.fromJson(json),
          ),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earthquakes',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        highlightColor: Colors.blue,
      ),
      home: const Loader(),
    );
  }
}
