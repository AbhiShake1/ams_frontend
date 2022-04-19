import 'dart:convert';

import 'package:ams/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/repositories/repository_providers.dart';
import '../drawer/drawer.dart';
import '../drawer/name_provider.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num totalMarks = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Progress'),
        elevation: 0.0,
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<String?>(
        future: context.read(progressRepositoryRef).getProgress(
              context
                  .read(prefRef('uid_key'))
                  .maybeWhen(orElse: () => '', data: (d) => d ?? ''),
            ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final Map progresses = jsonDecode(snapshot.data!);
          return ListView(
            children: [
              ...List.generate(
                progresses.keys.length,
                (index) {
                  totalMarks += progresses.values.elementAt(index)?['marks'] ?? 0;
                  return Text(
                      '${progresses.keys.elementAt(index)}: ${progresses.values.elementAt(index)}');
                },
              ),
              Text('Final marks: ${totalMarks / progresses.keys.length}')
            ],
          );
        },
      ),
    );
  }
}
