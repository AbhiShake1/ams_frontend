import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/repositories/repository_providers.dart';
import '../drawer/drawer.dart';
import '../drawer/name_provider.dart';

class WeeklyRoutine extends ConsumerWidget {
  const WeeklyRoutine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Weekly Routine'),
          elevation: 0.0,
        ),
        drawer: const MainDrawer(),
        body: FutureBuilder<String?>(
            future: ref.watch(routineRepositoryRef).getRoutine(
                ref.watch(prefRef('uid_key')).whenOrNull(data: (d) => d)),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final List routine = jsonDecode(snapshot.data!);
              return ListView(
                children: List.generate(
                    routine.length, (index) => Text(routine[index].toString())),
              );
            }));
  }
}
