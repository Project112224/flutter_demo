import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/start/start_cubit.dart';
import '../../util/app_font_config.dart';
import '../../models/get_it_model.dart';
import '../../util/router/page_name.dart';
import '../../util/router/router_provider.dart';
import '../../util/alert.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) async => await context.read<StartCubit>().initSetting());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StartCubit, StartInitial>(
        builder: (context, state) {
          if (state.jailBroken) {
            showDialog(
                context: context,
                builder: (context) => const JailBrokenDialog());
            return const SizedBox();
          }

          if (state.isLoading) {
            _setFontSize();
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => getIt<RouterProvider>().pushPage(
                PageName.homePage,
                context,
                pushAndReplace: true,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  _setFontSize() {
    final fontConfig = getIt<AppFontConfig>();
    fontConfig.screen = MediaQuery.of(context).size;
  }
}
