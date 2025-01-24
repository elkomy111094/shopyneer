import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/no_data_widget.dart';
import 'package:shopyneer/features/contracts/cubit/contracts_cubit.dart';
import 'package:shopyneer/features/contracts/widgets/contract_widget.dart';
import 'package:shopyneer/features/mainLayout/main_layout.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:size_config/size_config.dart';

import '../../config/localization/loc_keys.dart';
import '../../config/theme/colors.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  int selectedTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContractsCubit>()
        ..getContractsDataWithDataBase(0), // Pass the bloc to the provider
      child: BlocBuilder<ContractsCubit, ContractsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              routeName: Loc.contracts(),
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
                        color: greyEE,
                        // Border color
                        strokeWidth: 1,
                        // Width of the border
                        dashPattern: const [3, 3],
                        // Length of the dash and space between dashes
                        borderType: BorderType.RRect,
                        // Rounded border
                        radius: const Radius.circular(10),
                        // Rounded corners radius
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
                                          BlocProvider.of<ContractsCubit>(
                                                  context)
                                              .getContractsDataWithDataBase(0);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        decoration: BoxDecoration(
                                          color: selectedTypeIndex == 0
                                              ? Theme.of(context).primaryColor
                                              : greyF9,
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                        ),
                                        child: Center(
                                          child: Text(
                                            Loc.active(),
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
                                          BlocProvider.of<ContractsCubit>(
                                                  context)
                                              .getContractsDataWithDataBase(1);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        decoration: BoxDecoration(
                                          color: selectedTypeIndex == 1
                                              ? Theme.of(context).primaryColor
                                              : greyF9,
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                        ),
                                        child: Center(
                                          child: Text(
                                            Loc.expired(),
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
                if (state is LoadingContractsState)
                  const Expanded(
                    child: Center(
                      child: LoadingWidget(),
                    ),
                  ),
                if (state is ErrorContractsState)
                  Expanded(
                    child: NoDataWidget(
                      title: Loc.noContracts(),
                      externalWidget: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 30.w),
                      ),
                    ),
                  ),
                if (state is LoadedContractsState)
                  Expanded(
                    child: AnimationLimiter(
                      child: ListView.separated(
                        itemCount: state.contractsResponseModel.data.length,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 20.w,
                        ),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: ContractWidget(
                                  contract:
                                      state.contractsResponseModel.data[index],
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
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
