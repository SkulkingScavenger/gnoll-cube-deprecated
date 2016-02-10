#include <windows.h>
#define DLLEXPORT extern "C" __declspec(dllexport)

DLLEXPORT double Multiply(double a, double b) {
	return a * b;
}
DLLEXPORT double MsgBox(char* caption, char* message) {
	MessageBox(0, message, caption, MB_OK);
	return 0;
}
