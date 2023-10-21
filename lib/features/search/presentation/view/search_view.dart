import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/features/search/data/repos/search_repo.dart';

import 'package:my_bookly/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:my_bookly/features/search/presentation/view_model/search/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) => SearchCubit(ServiceLocator.getIt<Search>()),
      child: const SearchViewBody(),
    )));
  }
}
