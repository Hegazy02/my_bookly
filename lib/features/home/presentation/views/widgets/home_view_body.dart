import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/ListView_bookCard_with_PlayButton.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/new_books_list.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/shimmers/shimmer_new_books_list.dart';

import 'package:my_bookly/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppbar(),
              ListViewBookCardWithPlayButton(),
              SizedBox(
                height: 20,
              ),
              Text(
                "New Books",
                style: Styles.textStyle18,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
          BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              if (state is NewestBooksSuccess) {
                return NewBooksListWidget(
                  booksModels: state.books,
                );
              } else if (state is NewestBooksFailure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text("Error : ${state.errMessage}")),
                );
              } else {
                return const SliverFillRemaining(
                    child: ShimmerNewBooksListWidget());
              }
            },
          )
        ],
      ),
    );
  }
}
