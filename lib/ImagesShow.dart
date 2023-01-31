import 'package:flutter/material.dart';

import 'models/Album.dart';

// ignore: must_be_immutable
class ImagesShow extends StatelessWidget {
  List<Articles> tagItemsvalue = <Articles>[];

  ScrollController _controller = new ScrollController();
  ImagesShow(this.tagItemsvalue, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(), // new
          // controller: _controller,

          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: tagItemsvalue.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
               
             clipBehavior: Clip.antiAlias,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    
                     
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.network(
                            tagItemsvalue.elementAt(index).urlToImage!,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Text(
                                  tagItemsvalue.elementAt(index).title!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
          }),
    );
  }
}
