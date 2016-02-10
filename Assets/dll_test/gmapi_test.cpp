#define GMAPI_NO_D3D
#include <gmapi.h>
#include <windows.h>
#define DLLEXPORT extern "C" __declspec(dllexport)
#define grumpy_monkey extern "C" __declspec(dllexport)

gm::CGMAPI* gmapi;

BOOL WINAPI DllMain( HINSTANCE aModuleHandle, int aReason, int aReserved ) {
  switch ( aReason ) {
    case DLL_PROCESS_ATTACH: {
      // Initialization
      unsigned long result = 0;
      gmapi = gm::CGMAPI::Create( &result );

      // Check the result
      if ( result != gm::GMAPI_INITIALIZATION_SUCCESS ) {
        MessageBox( 0, "Unable to initialize GMAPI.", 0, MB_SYSTEMMODAL | MB_ICONERROR );
        return FALSE;
      }

      break;
    }

    case DLL_PROCESS_DETACH:
      // Release from memory & deinitialize GMAPI
      gmapi->Destroy();
      break;
  }

  return TRUE;
}

DLLEXPORT double Multiply(double a, double b) {
	return a * b;
}
DLLEXPORT double MsgBox(char* caption, char* message) {
	MessageBox(0, message, caption, MB_OK);
	return 0;
}

double grumpy_monkey(){
	instance_create()
}
