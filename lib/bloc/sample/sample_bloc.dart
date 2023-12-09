import 'dart:async';

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  final StreamController _inputController = StreamController();
  StreamSink get input => _inputController.sink;

  final StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;
  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((e) {
      if (e == "add") {
        _counter++;
      } else {
        _counter--;
      }
      _sinkOut.add(_counter);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
