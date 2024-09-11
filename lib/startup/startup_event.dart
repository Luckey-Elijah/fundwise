abstract class StartUpEvent {}

class InitializeStartUpEvent extends StartUpEvent {
  InitializeStartUpEvent([this.duration]);

  final Duration? duration;
}
