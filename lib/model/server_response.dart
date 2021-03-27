

class ServerResponse{
  bool success;
  String message;
  bool isNetworkError;
  String otherParams;
  // ServerResponse({this.success, this.message});
  ServerResponse({this.success = false, this.message = 'Network error, Try again', this.isNetworkError=false, this.otherParams = ''});

}