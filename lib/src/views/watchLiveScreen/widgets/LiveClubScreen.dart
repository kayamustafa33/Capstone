import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocks/ClubBloc/club_bloc.dart';
import '../../../blocks/ClubBloc/club_state.dart';
import '../../widgets/Clubs.dart';

class LiveClubScreen extends StatelessWidget {
  const LiveClubScreen({super.key});
  static const String routeName = "/liveClubScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kulüpler", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<ClubBloc, ClubState>(
        builder: (context, state) {
          if (state is ClubLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ClubLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: state.clubs.length,
              itemBuilder: (context, index) {
                final club = state.clubs[index];
                return clubsWidget(context, club);
              },
            );
          } else if (state is ClubError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No clubs available'));
          }
        },
      ),
    );
  }
}
