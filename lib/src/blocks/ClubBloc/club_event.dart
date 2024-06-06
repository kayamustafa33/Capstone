// src/blocks/club_bloc/club_event.dart
import 'package:equatable/equatable.dart';

abstract class ClubEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchClubs extends ClubEvent {}
