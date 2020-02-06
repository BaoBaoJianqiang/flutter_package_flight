import 'package:flutter/material.dart';
import 'package:flutter_package_network/remote_service.dart';

import 'movie_detail_wrapper.dart';

import 'package:flutter_package_network/network.dart';
import 'dart:convert';

class Page11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<String> _loadAAsset() async {
      return await DefaultAssetBundle.of(context).loadString('packages/flutter_package_flight/assets/network_flight.json');
    }

    Future getData() async {
      String jsonString = await _loadAAsset();
      final jsonResponse = json.decode(jsonString);
      Network network = new Network.fromJson(jsonResponse);

      if(RemoteService.urlDataList == null)
        RemoteService.urlDataList = new List<dynamic>();

      RemoteService.urlDataList.addAll(network.urlData);
    }

    getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('机票'),
      ),
      body: new ListView(
          children : <Widget>[
            Container(
                width: 160.0,
                height: 20.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'page11_1');
                  },
                  child: Text('机票页面1'),
                )
            ),
            Container(
                width: 160.0,
                height: 20.0,
                child: RaisedButton(
                  onPressed: () {
                    String data = '{"isError":1, "errorType":2, "errorMessage":"403 forbidden", "result": {}}';
                    Navigator.pushNamed(context, 'page12_1', arguments: data);
                  },
                  child: Text('酒店页面1'),
                )
            ),
            Container(
                width: 160.0,
                height: 20.0,
                child: RaisedButton(
                  onPressed: () {
                    getMovieDetail();
                  },
                  child: Text('getMovieDetail'),
                )
            )
          ]
      ),
    );
  }

  Future getMovieDetail() async {
    Map<String, String> params = new Map<String, String>();
    params["movieName"] = "来着 星星的你";
    params["movieId"] = "1";

    await RemoteService.instance.invoke('getMovieDetail',
        params: params,
        onSuccess:onGetMovieDetailSuccess,
        onFail: onNetworkFail);
  }

  void onGetMovieDetailSuccess(dynamic decodeBody) {
    MovieDetailWrapper wrapper = MovieDetailWrapper.fromJson(decodeBody);
    String message = wrapper.result.movieName;
    print(message);
  }

  void onNetworkFail(String errorMessage) {
    print(errorMessage);
  }
}