import 'package:sof_app/data/sof/sof_answer_data.dart';
import 'package:sof_app/data/sof/sof_answer_data_mock.dart';
import 'package:sof_app/data/sof/sof_answer_data_prod.dart';
import 'package:sof_app/data/sof/sof_post_data.dart';
import 'package:sof_app/data/sof/sof_post_data_mock.dart';
import 'package:sof_app/data/sof/sof_post_data_prod.dart';

enum Flavor {
  MOCK, PROD
}

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  SofAnswersRepository get sofAnswersRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockSofAnswersRepository();
      default:
        return ProdSofAnswersRepository();
    }
  }

  SofPostsRepository get sofPostsRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockSofPostsRepository();
      default:
        return ProdSofPostsRepository();
    }
  }
}