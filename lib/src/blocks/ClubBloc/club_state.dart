// src/blocks/club_bloc/club_state.dart
import 'package:equatable/equatable.dart';
import '../../models/Club.dart';

abstract class ClubState extends Equatable {
  @override
  List<Object> get props => [];
}

class ClubInitial extends ClubState {}

class ClubLoading extends ClubState {}

class ClubLoaded extends ClubState {
  final List<Club> clubs;

  ClubLoaded({required this.clubs});

  @override
  List<Object> get props => [clubs];
}

class ClubError extends ClubState {
  final String message;

  ClubError({required this.message});

  @override
  List<Object> get props => [message];
}
