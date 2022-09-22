import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/widgets/responsive_widget.dart';

import '../../../observables/create_ad_store/create_ad_store.dart';
import 'image_dialog.dart';
import 'image_source_modal.dart';

class ImagesField extends StatelessWidget {
  const ImagesField(this.createAdStore, {Key? key}) : super(key: key);

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createAdStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 250,
          child: Observer(builder: (_) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: createAdStore.images.length < 6
                  ? createAdStore.images.length + 1
                  : 6,
              itemBuilder: (context, index) {
                if (createAdStore.images.isEmpty) {
                  return GestureDetector(
                    onTap: () {
                      if (Platform.isAndroid) {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => ImageSourceModal(onImageSelected),
                        );
                      } else {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (_) => ImageSourceModal(onImageSelected),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: ResponsiveWidget.sizeWidth(context) - 16,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (index == createAdStore.images.length)
                  // ignore: curly_braces_in_flow_control_structures
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected),
                          );
                        } else {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: ResponsiveWidget.sizeWidth(context) / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                else {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      8,
                      16,
                      index == 4 ? 8 : 0,
                      16,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                            image: createAdStore.images[index],
                            onDelete: () =>
                                createAdStore.images.removeAt(index),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: ResponsiveWidget.sizeWidth(context) - 50,
                        child: createAdStore.images[index] is File
                            ? Image.file(
                                createAdStore.images[index],
                                fit: BoxFit.fitWidth,
                              )
                            : Image(
                                image: CachedNetworkImageProvider(
                                    createAdStore.images[index]),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                  );
                }
              },
            );
          }),
        ),
        Observer(builder: (_) {
          if (createAdStore.imagesError != null) {
            return Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                createAdStore.imagesError!,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.red,
                    ),
              ),
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
