import 'package:flutter/material.dart';

import '../../data/models/database.dart';
import 'brand_logo.dart';

class AllStores extends StatelessWidget {
  final Size size;
  final ThemeData themeData;
  final void Function(int?) onStoreSelected;
  final int? selectedStore;

  const AllStores({
    Key? key,
    required this.size,
    required this.themeData,
    required this.onStoreSelected,
    required this.selectedStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: stores.map((store) {
            final isSelected = selectedStore == store.storeId;

            return GestureDetector(
              onTap: () {
                onStoreSelected(
                  isSelected ? null : store.storeId,
                ); // Toggle selection
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  children: [
                    buildBrandLogo(
                      Image.asset(
                        store.storeImage,
                        height: size.width * 0.1,
                        width: size.width * 0.15,
                        fit: BoxFit.fill,
                      ),
                      size,
                      themeData,
                    ),
                    SizedBox(height: 5),
                    Text(
                      store.storeName,
                      style: themeData.textTheme.caption!.copyWith(
                        color: isSelected
                            ? themeData.primaryColor
                            : themeData.secondaryHeaderColor,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
