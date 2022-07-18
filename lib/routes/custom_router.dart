import 'package:auto_route/auto_route.dart';
import 'package:twoh/view/home_view.dart';
import 'package:twoh/view/machine_detail_view.dart';


@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: MachineDetailView),
])
class $AppRouter {}
