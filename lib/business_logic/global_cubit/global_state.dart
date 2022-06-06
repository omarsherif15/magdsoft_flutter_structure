part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class ChangeLocalToArState extends GlobalState{}
class ChangeLocalToEnState extends GlobalState{}
