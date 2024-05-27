import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/club_service.dart';
import 'club_event.dart';
import 'club_state.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final ClubService clubService;

  ClubBloc({required this.clubService}) : super(ClubInitial());

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    if (event is FetchClubs) {
      yield ClubLoading();
      try {
        final clubs = await clubService.fetchClubs();
        yield ClubLoaded(clubs);
      } catch (e) {
        yield ClubError(e.toString());
      }
    }
  }
}
