Future<String> fetchData(){
  return Future.delayed(Duration(seconds:2), () => "Data fetched");
}

void main() {

  print("Start");

  fetchData().then((value) {
    print(value);
  });

  print("End");

}