import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/module/product_detail/provider/product_provider.dart';

class CoffeeSizeRowWidget extends StatelessWidget {
  const CoffeeSizeRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Row(
          children: [
            InkWell(
              onTap: () => provider.changeCoffeeSize(0),
              child: Card(
                surfaceTintColor: Colors.white,
                color: provider.selectedSizeIndex == 0
                    ? MyColors.primary
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MyDimensions.xLarge),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyDimensions.semiLarge,
                      vertical: MyDimensions.light),
                  child: Text(
                    'Small',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                        fontSize: MyDimensions.medium,
                        color:
                        provider.selectedSizeIndex ==
                            0
                            ? Colors.white
                            : MyColors.grey_90),
                  ),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => provider.changeCoffeeSize(1),
              child: Card(
                surfaceTintColor: Colors.white,
                color: provider.selectedSizeIndex == 1
                    ? MyColors.primary
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MyDimensions.xLarge),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyDimensions.semiLarge,
                      vertical: MyDimensions.light),
                  child: Text(
                    'Medium',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                        fontSize: MyDimensions.medium,
                        color:
                        provider.selectedSizeIndex ==
                            1
                            ? Colors.white
                            : MyColors.grey_90),
                  ),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => provider.changeCoffeeSize(2),
              child: Card(
                surfaceTintColor: Colors.white,
                color: provider.selectedSizeIndex == 2
                    ? MyColors.primary
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MyDimensions.xLarge),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyDimensions.semiLarge,
                      vertical: MyDimensions.light),
                  child: Text(
                    'Large',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                        fontSize: MyDimensions.medium,
                        color:
                        provider.selectedSizeIndex ==
                            2
                            ? Colors.white
                            : MyColors.grey_90),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
