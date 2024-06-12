import 'package:flutter/material.dart';
import 'package:okculuk_federasyonu/src/views/profileScreen/widgets/ClubsScreen.dart';
import 'package:okculuk_federasyonu/src/views/profileScreen/widgets/OldScoresScreen.dart';

import '../../models/User.dart';
import '../../services/auth_service.dart';
import '../loginScreen/LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/profileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = _fetchUser();
  }

  Future<User?> _fetchUser() async {
    final AuthService authService = AuthService();
    return await authService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();

    return Material(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              AppBar(
                title:
                    const Text('Profil', style: TextStyle(color: Colors.white)),
                elevation: 2.0,
                centerTitle: true,
                backgroundColor: Colors.blue,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder<User?>(
                future: _userFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Text("Kullanıcı adı yüklenemedi");
                  } else {
                    final user = snapshot.data!;
                    return Text(user.name);
                  }
                },
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OldScoresScreen()),
                          );
                        },
                        child: const Text(
                          'Eski Skorlar',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClubsScreen()),
                          );
                        },
                        child: const Text(
                          'Kulüpler',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          _showLogoutDialog(context, _authService);
                        },
                        child: const Text(
                          'Çıkış Yap',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthService authService) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Çıkış Yap'),
          content: const Text('Oturumu kapatmak istediğinizden emin misiniz?'),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Çıkış Yap'),
              onPressed: () async {
                await authService.logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
