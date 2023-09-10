// import 'dart:html';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_meals/Form/bloc/form_bloc.dart';
import 'package:internshala_meals/bloc/bloc/mail_bloc_bloc.dart';

import 'Form/ui/formui.dart';
import 'features/MealDisplay.dart';

void main() {
  runApp(MyApp());
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MailBlocBloc>(
          create: (context) => MailBlocBloc(),
        ),
        BlocProvider<FormBloc>(
          create: (context) => FormBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('MY APP'),
          ),
          body: HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text('Assignment 1'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewScreen(),
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyForm(),
              ),
            );
          },
          child: Text('Assignment 2'),
        ),
        ElevatedButton(
          child: Text('Assignment 3'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AudioScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music section"),
        backgroundColor: Colors.black,
      ),
      body: ElevatedButton(
        child: Text(
          'Start Music',
        ),
        onPressed: () {
          AssetsAudioPlayer.newPlayer().open(
            Audio("assets/sample.mp3"),
            autoStart: true,
            showNotification: true,
          );
        },
      ),
    );
  }
}
