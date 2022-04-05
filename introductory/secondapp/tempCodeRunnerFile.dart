
void main() {
  //Loops are very similar to those seen in Java.
  print("----------------------------------");
  for (int i = 0; i < 10; i++)
    print(i);
  print("----------------------------------");
  int i = 0;
  while (i < 25)
    print(i++);
  print("----------------------------------");
  i = 0;
  do {
    print(i++);
  } while (i < 25);
  print("----------------------------------");
  List<int> values = [10, 90, 123, 567, 78, 34, 55, 111];
  for (int c in values)
    print(c);
  print("----------------------------------");
  for (int i = 0; i <= 1000; i++)
    if (i.isEven)
      print(i);
}