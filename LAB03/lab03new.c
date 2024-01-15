int read(int __fd, const void *__buf, int __n){
  int bytes;
  __asm__ __volatile__(
    "mv a0, %1           # file descriptor\n"
    "mv a1, %2           # buffer \n"
    "mv a2, %3           # size \n"
    "li a7, 63           # syscall read (63) \n"
    "ecall \n"
    "mv %0, a0"
    : "=r"(bytes)  // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
  );
  return bytes;
}
 
void write(int __fd, const void *__buf, int __n){
  __asm__ __volatile__(
    "mv a0, %0           # file descriptor\n"
    "mv a1, %1           # buffer \n"
    "mv a2, %2           # size \n"
    "li a7, 64           # syscall write (64) \n"
    "ecall"
    :   // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
  );
}

void intToBin(int num) {
  char buffer[40];
  buffer[0] = '0';
  buffer[1] = 'b';

  int quociente = 1;
  int resto;
  int marcador = 2;
  while (quociente != 0) {
    resto = num % 2;
    buffer[marcador] = resto;
    
  }

}

int pot(int base, int expoente) {
  int n = 1;
  for (int i = 0; i < expoente; i++) {
    n *= expoente;
  }
  return n;
}

int hexToInt(str* str, int n) {
  int num = 0;
  for (int i = n-1; i >= 2; i--) {
    num += str[i] * pot(16, n-i-1);
  }
  return num;
}
 
int main()
{
  char str[20];
  int n = read(0, str, 20);

  if (str[0] == '0' && str[1] == 'x') {
    int num = hexToInt(str, n);
    intToBin(num);
  }

  write(1, str, n);
  return 0;
}
 
void _start(){
  main();
}
