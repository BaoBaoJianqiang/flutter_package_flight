class MovieDetailWrapper {
  int isError;
  int errorType;
  String errorMessage;
  Result result;

  MovieDetailWrapper({this.isError, this.errorType, this.errorMessage, this.result});

  MovieDetailWrapper.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    errorType = json['errorType'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['errorType'] = this.errorType;
    data['errorMessage'] = this.errorMessage;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  int movieId;
  String movieName;

  Result({this.movieId, this.movieName});

  Result.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    movieName = json['movieName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    data['movieName'] = this.movieName;
    return data;
  }
}