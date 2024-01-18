import 'package:fpdart/fpdart.dart';
import 'package:reddit_video_screen_assignment_task/core/error_handling/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
