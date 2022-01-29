import 'package:sticky_sessions/features/session/data/session_repository.dart';
import 'package:sticky_sessions/core/utils/usecase.dart';
import 'package:sticky_sessions/models/sticky.dart';

class OnInit extends UseCase<List<String>, List<Sticky>?> {
  SessionRepository repository = SessionRepositoryImpl();

  @override
  Future<List<Sticky>?> execute(List<String> param) {
    return repository.onInit(param[0], param[1]);
  }
}
