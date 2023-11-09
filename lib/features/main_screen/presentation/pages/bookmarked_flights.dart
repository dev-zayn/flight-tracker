import 'package:auto_route/auto_route.dart';
import 'package:flight_tracker/core/theme/colors.dart';
import 'package:flight_tracker/features/_components/responsive_text_widget.dart';
import 'package:flight_tracker/features/main_screen/presentation/bloc/main_bloc.dart';
import 'package:flight_tracker/features/main_screen/presentation/widgets/flight_card.dart';
import 'package:flight_tracker/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BookmarkedFlightsPage extends StatelessWidget {
  const BookmarkedFlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = getIt<MainBloc>();
    return Scaffold(
      backgroundColor: kcLightPrimary,
      appBar: AppBar(
        title: const AppText('Bookmarked Flights'),
        centerTitle: true,
        backgroundColor: kcLightPrimary,
        elevation: 0,
      ),
      body: BlocBuilder<MainBloc, MainState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView.builder(
            itemCount: bloc.bookmarked.length,
            itemBuilder: (context, index) {
              return FlightCard(
                airplane: bloc.bookmarked[index],
              );
            },
          );
        },
      ),
    );
  }
}
