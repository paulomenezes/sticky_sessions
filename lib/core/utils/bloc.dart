import 'dart:async';

abstract class Bloc<T> {
  T model;

  final _streamController = StreamController<T>.broadcast();

  Stream<T> get stream => _streamController.stream;

  Bloc({required this.model});

  void dispose() {
    _streamController.close();
  }

  void emit() {
    _streamController.sink.add(model);
  }
}
