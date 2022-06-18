// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../UIs/views/chats_view.dart';

class Routes {
  static const String chatsView = '/';
  static const all = <String>{
    chatsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.chatsView, page: ChatsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    ChatsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChatsView(),
        settings: data,
      );
    },
  };
}
