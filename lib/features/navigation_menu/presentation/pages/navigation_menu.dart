import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/create_post/presentation/pages/create_post.dart';
import 'package:take_my_tym/features/home/presentation/pages/home_page.dart';
import 'package:take_my_tym/features/message/presentation/pages/messages_page.dart';
import 'package:take_my_tym/features/money/presentation/pages/money_page.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/bloc/navigation_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer/drawer_navigation_menu.dart';
import 'package:take_my_tym/features/profile/presentation/pages/profile_page.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final _screen = [
    const HomePage(),
    const MessagePage(),
    const CreatePostPage(),
    const MoneyPage(),
    const ProfilePage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    log('build');
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerNavBar(),
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            switch (state) {
              case HomeState():
                return SafeArea(child: _screen[0]);
              case MessageState():
                return SafeArea(child: _screen[1]);
              case MoneyState():
                return SafeArea(child: _screen[3]);
              case ProfileState():
                return SafeArea(child: _screen[4]);
              default:
                return SafeArea(child: _screen[0]);
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
          return NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (value) {
              final navigationBloc = BlocProvider.of<NavigationBloc>(context);

              if (value == 0) {
                _index = value;
                navigationBloc.add(HomePageNavigation());
              } else if (value == 1) {
                _index = value;
                navigationBloc.add(MessagePageNavigation());
              } else if (value == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePostPage()));
              } else if (value == 3) {
                _index = value;
                navigationBloc.add(MoneyPageNavigation());
              } else if (value == 4) {
                _index = value;
                navigationBloc.add(ProfilePageNavigation());
              }
            },
            destinations: [
              NavigationDestination(
                icon: Icon(_index == 0 ? IconlyBold.home : IconlyLight.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  _index == 1 ? IconlyBold.message : IconlyLight.message,
                ),
                label: 'Message',
              ),
              NavigationDestination(
                icon: Icon(
                  _index == 2
                      ? IconlyBold.plus
                      : IconlyLight.plus,
                ),
                label: 'Create',
              ),
              NavigationDestination(
                icon: Icon(
                  _index == 3 ? IconlyBold.wallet : IconlyLight.wallet,
                ),
                label: 'Money',
              ),
              NavigationDestination(
                icon: Icon(
                  _index == 4 ? IconlyBold.profile : IconlyLight.profile,
                ),
                label: 'Profile',
              ),
            ],
          );
        }),
      ),
    );
  }
}
