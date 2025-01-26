import 'package:dapp/src/feauture/profile/cubit/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfilecubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoding) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSucess) {
            return Scaffold(
              body: Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    accountName: Text(
                      state.data.profileModel.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(state.data.profileModel.email),
                    currentAccountPicture: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(state.data.profileModel.profileImage),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person,
                              color: Colors.blueAccent),
                          title: const Text("Profile"),
                          onTap: () {
                            // Navigate to Profile Screen
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.security, color: Colors.green),
                          title: const Text("National ID"),
                          subtitle: Text(
                              state.data.profileModel.nationalId.toString()),
                        ),
                        const Divider(),
                        ListTile(
                          leading:
                              const Icon(Icons.settings, color: Colors.orange),
                          title: const Text("Settings"),
                          onTap: () {
                            // Navigate to Settings
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.exit_to_app, color: Colors.red),
                          title: const Text("Logout"),
                          onTap: () {
                            // Handle Logout
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("Failed to load profile"));
          }
        },
      ),
    );
  }
}
