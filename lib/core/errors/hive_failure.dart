import 'package:rafeeqa/core/errors/failure.dart';

class LocalSetUpFailure extends Failure {
  const LocalSetUpFailure({required super.message});

  factory LocalSetUpFailure.emptyData() {
    return const LocalSetUpFailure(message: 'No vaccination data found.');
  }

  factory LocalSetUpFailure.unknown() {
    return const LocalSetUpFailure(message: 'Something went wrong.');
  }
}
