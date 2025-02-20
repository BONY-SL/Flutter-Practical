
void main() {
  double distance = 25.0; 
  double speed = 40.0;     

  double timeInHours = distance / speed;

  double timeInMinutes = timeInHours * 60;
  print("Time taken to reach the office: ${timeInMinutes} minutes");
}
