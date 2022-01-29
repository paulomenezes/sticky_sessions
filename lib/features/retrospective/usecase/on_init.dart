import 'package:sticky_sessions/features/retrospective/data/retrospective_repository.dart';
import 'package:sticky_sessions/core/utils/usecase.dart';
import 'package:sticky_sessions/models/session.dart';

class OnInit extends UseCase<String, List<Session>?> {
  RetrospectiveRepository repository = RetrospectiveRepositoryImpl();

  @override
  Future<List<Session>?> execute(String param) {
    return repository.onInit(param);
  }
}
