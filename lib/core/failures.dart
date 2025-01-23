import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message; // 添加 message 属性

  const Failure({this.message = ''}); // 添加 message 参数

  @override
  List<Object> get props => [message]; // 将 message 添加到 props 中
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({String message = '服务器错误'}) : super(message: message);
}

class DeviceIdFailure extends Failure {
  const DeviceIdFailure({String message = '无法获取设备 ID'})
      : super(message: message);
}
