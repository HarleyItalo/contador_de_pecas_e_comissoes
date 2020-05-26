import 'package:contador_pecas/features/contador_feature/pages/count_page.dart';
import 'package:contador_pecas/features/contador_feature/pages/daily_detail_page.dart';
import 'package:contador_pecas/features/contador_feature/pages/relatory_page.dart';

import 'constants.dart';

var route = {
  main_route: (context) => CountPage(),
  relatory_route: (context) => RelatoryPage(),
  relatory_detail: (context) => DailyDetailPage()
};
