import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/auth_provider/auth_provider.dart';
import '../assignments/assignments.dart';
import '../calender/calendar.dart';
import '../home/home.dart';
import '../login/login.dart';
import '../notices/notices.dart';
import '../profile/profile.dart';
import '../progress/progress.dart';
import '../weeklyroutine/weeklyroutine.dart';
import 'name_provider.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xff0129ba),
              ),
            ),
            accountName: Consumer(
                builder: (context, ref, child) => Text(ref
                    .watch(prefRef('uid_key'))
                    .maybeWhen(orElse: () => '', data: (d) => d ?? ''))),
            accountEmail: Consumer(
                builder: (context, ref, child) => Text(ref
                    .watch(prefRef('uid_key'))
                    .maybeWhen(orElse: () => '', data: (d) => d ?? ''))),
            onDetailsPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
          ListTile(
            title: const Text('Home'),
            trailing: const Icon(Icons.home),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          ListTile(
            title: const Text('Weekly Routine'),
            trailing: const Icon(Icons.schedule),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WeeklyRoutine()));
            },
          ),
          ListTile(
            title: const Text('Assignments'),
            trailing: const Icon(Icons.assignment),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Assignments()));
            },
          ),
          ListTile(
            title: const Text('Calendar'),
            trailing: const Icon(Icons.date_range),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Calendar()));
            },
          ),
          ListTile(
            title: const Text('Notices'),
            trailing: const Icon(Icons.assessment),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Notices()));
            },
          ),
          ListTile(
            title: const Text('Progress'),
            trailing: const Icon(Icons.grade),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Progress()));
            },
          ),
          ListTile(
            title: const Text('Feedbacks'),
            trailing: const Icon(Icons.feedback),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () {
              ProviderScope.containerOf(context).read(authRef.notifier).logout();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Mylogin()));
            },
          ),
        ],
      ),
    );
  }
}
