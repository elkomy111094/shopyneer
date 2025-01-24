import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/no_data_widget.dart';
import 'package:shopyneer/features/mainLayout/main_layout.dart';
import 'package:shopyneer/features/visits/cubit/visits_cubit.dart';
import 'package:shopyneer/features/visits/widgets/visit_widget.dart';

import 'package:size_config/size_config.dart';

import '../../config/theme/colors.dart';


class VisitsPage extends StatefulWidget {
  const VisitsPage({super.key});

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> {
  int selectedTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VisitsCubit>()
        ..getVisitsDataWithDataBase(0), // Pass the bloc to the provider
      child: BlocBuilder<VisitsCubit, VisitsState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            routeName: Loc.visits(),
            onBackPressed: () {
              moveToSelectedIndex(0, context);
            },
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    // Toggle Buttons for Active and Completed
                    Gap(
                      26.h,
                    ),
                    DottedBorder(
                      color: greyEE, // Border color
                      strokeWidth: 1, // Width of the border
                      dashPattern: const [
                        3,
                        3
                      ], // Length of the dash and space between dashes
                      borderType: BorderType.RRect, // Rounded border
                      radius:
                          const Radius.circular(10), // Rounded corners radius
                      child: Container(
                        width: double.infinity, // Container width
                        height: 60.h, // Container height
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(3.h),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Active Button
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTypeIndex = 0;
                                        BlocProvider.of<VisitsCubit>(context)
                                            .getVisitsDataWithDataBase(0);
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      decoration: BoxDecoration(
                                        color: selectedTypeIndex == 0
                                            ? Theme.of(context).primaryColor
                                            : greyF9,
                                        borderRadius:
                                            BorderRadius.circular(10.h),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Loc.previousVisits(),
                                          style: TextStyle(
                                            color: selectedTypeIndex == 0
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                // Completed Button
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTypeIndex = 1;
                                        BlocProvider.of<VisitsCubit>(context)
                                            .getVisitsDataWithDataBase(1);
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      decoration: BoxDecoration(
                                        color: selectedTypeIndex == 1
                                            ? Theme.of(context).primaryColor
                                            : greyF9,
                                        borderRadius:
                                            BorderRadius.circular(10.h),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Loc.upcomingVisits(),
                                          style: TextStyle(
                                            color: selectedTypeIndex == 1
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(
                      24.h,
                    ),
                    // Contract Details Card
                  ],
                ),
              ),
              if (state is VisitsLoadingState)
                const Expanded(child: LoadingWidget()),
              if (state is VisitsErrorState)
                Expanded(
                  child: NoDataWidget(
                    title: Loc.noVisits(),
                    externalWidget: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 30.w),
                    ),
                  ),
                ),
              if (state is VisitsLoadedState)
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.separated(
                      itemCount: state.visitsResponseModel.data.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 20.w,
                      ),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: VisitWidget(
                                visit: state.visitsResponseModel.data[index],
                                isFinished:
                                    selectedTypeIndex == 0 ? false : true,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Gap(24.h);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
