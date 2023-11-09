import 'package:auto_route/auto_route.dart';
import 'package:flight_tracker/core/constant/responsive.dart';
import 'package:flight_tracker/core/theme/colors.dart';
import 'package:flight_tracker/features/main_screen/presentation/bloc/main_bloc.dart';
import 'package:flight_tracker/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/connectivity/connectivity_widget.dart';
import '../../../../core/toast.dart';
import '../widgets/app_drawer.dart';
import '../widgets/planes_sheet.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainBloc mainBloc = getIt<MainBloc>();
  @override
  void initState() {
    loadMarkerIcon();
    mainBloc.add(const DetermineCurrentLocationEvent());
    super.initState();
  }

  void loadMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/icons/airport.png',
    ).then((icon) {
      mainBloc.markerIcon = icon;
    });
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void dispose() {
    _advancedDrawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: kcLightPrimary,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: AppDrawer(drawerController: _advancedDrawerController),
      child: Scaffold(
        body: ConnectivityWidget(
          child: Center(
            child: BlocConsumer<MainBloc, MainState>(
              bloc: mainBloc,
              listener: (context, state) {
                if (state is DetermineCurrentLocationLoading) {
                  context.loaderOverlay.show();
                }
                if (state is DetermineCurrentLocationIsDisabled) {
                  context.loaderOverlay.hide();
                  showSnackMsg(context, state.message, color: kcYellow);
                }
                if (state is DetermineCurrentLocationPermissionDenied) {
                  context.loaderOverlay.hide();
                  showSnackMsg(context, state.message, color: kcYellow);
                }
                if (state is DetermineCurrentLocationPermissionDeniedForever) {
                  context.loaderOverlay.hide();
                  showSnackMsg(context, state.message, color: kcRed);
                }
                if (state is DetermineCurrentLocationError) {
                  context.loaderOverlay.hide();
                  showSnackMsg(context, state.message, color: kcRed);
                }
                if (state is GetAirportsError) {
                  showSnackMsg(context, state.message, color: kcRed);
                }
                if (state is GetAirportsSuccess) {
                  showSnackMsg(context, 'Airports loaded successfully');
                }
                if (state is DetermineCurrentLocationSuccess) {
                  context.loaderOverlay.hide();
                  mainBloc.gmc!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(mainBloc.latitude, mainBloc.longitude),
                        zoom: 9,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: mainBloc.cameraPosition,
                  markers: mainBloc.markers,
                  onMapCreated: (GoogleMapController controller) {
                    mainBloc.gmc = controller;
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: _handleMenuButtonPressed,
                tooltip: 'drawer',
                backgroundColor: kcWhite,
                child: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        color: kcPrimary,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  mainBloc.add(const GetAirplanesEvent());
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      useRootNavigator: true,
                      backgroundColor: kcLightPrimary,
                      enableDrag: true,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter myState) =>
                                  Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70),
                                child: PlanesSheet(),
                              ),
                              Positioned(
                                  top: 0,
                                  width: Responsive.screenWidth(context),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: kcPrimary,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              width: 1, color: kcPrimary),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              width: 1, color: kcPrimary),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              width: 1, color: kcPrimary),
                                        ),
                                        fillColor: kcWhite,
                                        filled: true,
                                      ),
                                      controller: mainBloc.searchController,
                                      onChanged: (value) {
                                        mainBloc.add(SearchAirplanesEvent());
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        );
                      });
                },
                backgroundColor: kcSuccess,
                tooltip: 'planes',
                child: const Icon(Icons.airplanemode_active),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  mainBloc.add(const DetermineCurrentLocationEvent());
                },
                backgroundColor: kcSuccess,
                tooltip: 'current location',
                child: const Icon(Icons.location_on_outlined),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
