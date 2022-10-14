import 'package:dart_frog/dart_frog.dart';
import 'package:learn_dart_frog/src/in_memory_data_source.dart';
import 'package:learn_dart_frog/src/sign_up_data_source.dart';

// THIS IS NOT USED
// IF YOU USE /SIGNUP

final data = InMemoryDataSource();
Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
        provider<SignUpDataSource>(
          (_) => data,
        ),
      );
}
