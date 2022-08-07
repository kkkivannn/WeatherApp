import 'package:equatable/equatable.dart';

abstract class MyAppState extends Equatable {
  const MyAppState();
  @override
  List<Object?> get props => [];
}

class MyAppEmptyState extends MyAppState {
  @override
  List<Object?> get props => [];
}

class MyAppNotEmptyState extends MyAppState {
  @override
  List<Object?> get props => [];
}
