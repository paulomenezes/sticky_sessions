import 'package:sticky_sessions/features/home/data/home_repository.dart';
import 'package:sticky_sessions/core/utils/usecase.dart';
import 'package:sticky_sessions/models/meeting.dart';

class OnInit extends UseCase<void, List<Meeting>?> {
  HomeRepository repository = HomeRepositoryImpl();

  @override
  Future<List<Meeting>?> execute([void param]) {
    return repository.onInit();
  }
}
