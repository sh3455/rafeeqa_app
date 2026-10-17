import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafeeqa/features/setup/presentations/manger/setup_cubit.dart';
import 'package:rafeeqa/features/setup/presentations/pages/widgets/setup_baby_body.dart';

class SetupBabyView extends StatefulWidget {
  const SetupBabyView({super.key});

  @override
  State<SetupBabyView> createState() => _SetupBabyViewState();
}

class _SetupBabyViewState extends State<SetupBabyView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SetupCubit>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetupBabyBody(),
    );
  }
}