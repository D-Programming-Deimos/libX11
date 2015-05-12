module deimos.X11.extensions.XI;

//import std.string : string;
import core.stdc.config;

/* Definitions used by the server, library and client */

enum sz_xGetExtensionVersionReq            = 8;
enum sz_xGetExtensionVersionReply          = 32;
enum sz_xListInputDevicesReq               = 4;
enum sz_xListInputDevicesReply             = 32;
enum sz_xOpenDeviceReq                     = 8;
enum sz_xOpenDeviceReply                   = 32;
enum sz_xCloseDeviceReq                    = 8;
enum sz_xSetDeviceModeReq                  = 8;
enum sz_xSetDeviceModeReply                = 32;
enum sz_xSelectExtensionEventReq           = 12;
enum sz_xGetSelectedExtensionEventsReq     = 8;
enum sz_xGetSelectedExtensionEventsReply   = 32;
enum sz_xChangeDeviceDontPropagateListReq  = 12;
enum sz_xGetDeviceDontPropagateListReq     = 8;
enum sz_xGetDeviceDontPropagateListReply   = 32;
enum sz_xGetDeviceMotionEventsReq          = 16;
enum sz_xGetDeviceMotionEventsReply        = 32;
enum sz_xChangeKeyboardDeviceReq           = 8;
enum sz_xChangeKeyboardDeviceReply         = 32;
enum sz_xChangePointerDeviceReq            = 8;
enum sz_xChangePointerDeviceReply          = 32;
enum sz_xGrabDeviceReq                     = 20;
enum sz_xGrabDeviceReply                   = 32;
enum sz_xUngrabDeviceReq                   = 12;
enum sz_xGrabDeviceKeyReq                  = 20;
enum sz_xGrabDeviceKeyReply                = 32;
enum sz_xUngrabDeviceKeyReq                = 16;
enum sz_xGrabDeviceButtonReq               = 20;
enum sz_xGrabDeviceButtonReply             = 32;
enum sz_xUngrabDeviceButtonReq             = 16;
enum sz_xAllowDeviceEventsReq              = 12;
enum sz_xGetDeviceFocusReq                 = 8;
enum sz_xGetDeviceFocusReply               = 32;
enum sz_xSetDeviceFocusReq                 = 16;
enum sz_xGetFeedbackControlReq             = 8;
enum sz_xGetFeedbackControlReply           = 32;
enum sz_xChangeFeedbackControlReq          = 12;
enum sz_xGetDeviceKeyMappingReq            = 8;
enum sz_xGetDeviceKeyMappingReply          = 32;
enum sz_xChangeDeviceKeyMappingReq         = 8;
enum sz_xGetDeviceModifierMappingReq       = 8;
enum sz_xSetDeviceModifierMappingReq       = 8;
enum sz_xSetDeviceModifierMappingReply     = 32;
enum sz_xGetDeviceButtonMappingReq         = 8;
enum sz_xGetDeviceButtonMappingReply       = 32;
enum sz_xSetDeviceButtonMappingReq         = 8;
enum sz_xSetDeviceButtonMappingReply       = 32;
enum sz_xQueryDeviceStateReq               = 8;
enum sz_xQueryDeviceStateReply             = 32;
enum sz_xSendExtensionEventReq             = 16;
enum sz_xDeviceBellReq                     = 8;
enum sz_xSetDeviceValuatorsReq             = 8;
enum sz_xSetDeviceValuatorsReply           = 32;
enum sz_xGetDeviceControlReq               = 8;
enum sz_xGetDeviceControlReply             = 32;
enum sz_xChangeDeviceControlReq            = 8;
enum sz_xChangeDeviceControlReply          = 32;
enum sz_xListDevicePropertiesReq           = 8;
enum sz_xListDevicePropertiesReply         = 32;
enum sz_xChangeDevicePropertyReq           = 20;
enum sz_xDeleteDevicePropertyReq           = 12;
enum sz_xGetDevicePropertyReq              = 24;
enum sz_xGetDevicePropertyReply            = 32;

immutable char* INAME = "XInputExtension";

immutable char* XI_KEYBOARD    = "KEYBOARD";
immutable char* XI_MOUSE       = "MOUSE";
immutable char* XI_TABLET      = "TABLET";
immutable char* XI_TOUCHSCREEN = "TOUCHSCREEN";
immutable char* XI_TOUCHPAD    = "TOUCHPAD";
immutable char* XI_BARCODE     = "BARCODE";
immutable char* XI_BUTTONBOX   = "BUTTONBOX";
immutable char* XI_KNOB_BOX    = "KNOB_BOX";
immutable char* XI_ONE_KNOB    = "ONE_KNOB";
immutable char* XI_NINE_KNOB   = "NINE_KNOB";
immutable char* XI_TRACKBALL   = "TRACKBALL";
immutable char* XI_QUADRATURE  = "QUADRATURE";
immutable char* XI_ID_MODULE   = "ID_MODULE";
immutable char* XI_SPACEBALL   = "SPACEBALL";
immutable char* XI_DATAGLOVE   = "DATAGLOVE";
immutable char* XI_EYETRACKER  = "EYETRACKER";
immutable char* XI_CURSORKEYS  = "CURSORKEYS";
immutable char* XI_FOOTMOUSE   = "FOOTMOUSE";
immutable char* XI_JOYSTICK    = "JOYSTICK";

/* Indices into the versions[] array (XExtInt.c). Used as a index to
 * retrieve the minimum version of XI from _XiCheckExtInit */
enum {
    Dont_Check                          = 0,
    XInput_Initial_Release              = 1,
    XInput_Add_XDeviceBell              = 2,
    XInput_Add_XSetDeviceValuators      = 3,
    XInput_Add_XChangeDeviceControl     = 4,
    XInput_Add_DevicePresenceNotify     = 5,
    XInput_Add_DeviceProperties         = 6
}
/* DO NOT ADD TO HERE -> XI2 */

enum {
    XI_Absent                           = 0,
    XI_Present                          = 1
}

enum {
    XI_Initial_Release_Major            = 1,
    XI_Initial_Release_Minor            = 0
}

enum {
    XI_Add_XDeviceBell_Major            = 1,
    XI_Add_XDeviceBell_Minor            = 1
}

enum {
    XI_Add_XSetDeviceValuators_Major    = 1,
    XI_Add_XSetDeviceValuators_Minor    = 2
}

enum {
    XI_Add_XChangeDeviceControl_Major   = 1,
    XI_Add_XChangeDeviceControl_Minor   = 3
}

enum {
    XI_Add_DevicePresenceNotify_Major   = 1,
    XI_Add_DevicePresenceNotify_Minor   = 4
}

enum {
    XI_Add_DeviceProperties_Major       = 1,
    XI_Add_DeviceProperties_Minor       = 5
}

enum {
    DEVICE_RESOLUTION                   = 1,
    DEVICE_ABS_CALIB                    = 2,
    DEVICE_CORE                         = 3,
    DEVICE_ENABLE                       = 4,
    DEVICE_ABS_AREA                     = 5
}

enum NoSuchExtension           = 1;

enum COUNT                     = 0;
enum CREATE                    = 1;

enum NewPointer                = 0;
enum NewKeyboard               = 1;

enum XPOINTER                  = 0;
enum XKEYBOARD                 = 1;

enum UseXKeyboard              = 0xFF;

enum {
    IsXPointer                          = 0,
    IsXKeyboard                         = 1,
    IsXExtensionDevice                  = 2,
    IsXExtensionKeyboard                = 3,
    IsXExtensionPointer                 = 4
}

enum {
    AsyncThisDevice                     = 0,
    SyncThisDevice                      = 1,
    ReplayThisDevice                    = 2,
    AsyncOtherDevices                   = 3,
    AsyncAll                            = 4,
    SyncAll                             = 5
}

enum : int {
    FollowKeyboard            = 3,
    RevertToFollowKeyboard    = 3
}

enum : c_long {
    DvAccelNum             = (1 << 0),
    DvAccelDenom           = (1 << 1),
    DvThreshold            = (1 << 2),

    DvKeyClickPercent      = (1<<0),
    DvPercent              = (1<<1),
    DvPitch                = (1<<2),
    DvDuration             = (1<<3),
    DvLed                  = (1<<4),
    DvLedMode              = (1<<5),
    DvKey                  = (1<<6),
    DvAutoRepeatMode       = (1<<7),

    DvString               = (1 << 0),

    DvInteger              = (1 << 0)
}

enum : c_ulong {
    DeviceMode                          = (1 << 0),
    Relative                            = 0,
    Absolute                            = 1
}

enum : c_ulong {
    ProximityState                      = (1 << 1),
    InProximity                         = (0 << 1),
    OutOfProximity                      = (1 << 1)
}

enum AddToList                 = 0;
enum DeleteFromList            = 1;

enum {
    KeyClass                            = 0,
    ButtonClass                         = 1,
    ValuatorClass                       = 2,
    FeedbackClass                       = 3,
    ProximityClass                      = 4,
    FocusClass                          = 5,
    OtherClass                          = 6,
    AttachClass                         = 7
}

enum {
    KbdFeedbackClass                    = 0,
    PtrFeedbackClass                    = 1,
    StringFeedbackClass                 = 2,
    IntegerFeedbackClass                = 3,
    LedFeedbackClass                    = 4,
    BellFeedbackClass                   = 5
}

enum {
    _devicePointerMotionHint            = 0,
    _deviceButton1Motion                = 1,
    _deviceButton2Motion                = 2,
    _deviceButton3Motion                = 3,
    _deviceButton4Motion                = 4,
    _deviceButton5Motion                = 5,
    _deviceButtonMotion                 = 6,
    _deviceButtonGrab                   = 7,
    _deviceOwnerGrabButton              = 8,
    _noExtensionEvent                   = 9
}

enum _devicePresence           = 0;

enum _deviceEnter              = 0;
enum _deviceLeave              = 1;

/* Device presence notify states */
enum {
    DeviceAdded                         = 0,
    DeviceRemoved                       = 1,
    DeviceEnabled                       = 2,
    DeviceDisabled                      = 3,
    DeviceUnrecoverable                 = 4,
    DeviceControlChanged                = 5
}

/* XI Errors */
enum {
    XI_BadDevice                        = 0,
    XI_BadEvent                         = 1,
    XI_BadMode                          = 2,
    XI_DeviceBusy                       = 3,
    XI_BadClass                         = 4
}

/*
 * Make XEventClass be a CARD32 for 64 bit servers.  Don't affect client
 * definition of XEventClass since that would be a library interface change.
 * See the top of X.h for more _XSERVER64 magic.
 *
 * But, don't actually use the CARD32 type.  We can't get it defined here
 * without polluting the namespace.
 */
version(X86_64){
    uint XEventClass;
}
else{
    c_ulong XEventClass;
}

/*******************************************************************
 *
 * Extension version structure.
 *
 */

struct XExtensionVersion{
    int     present;
    short   major_version;
    short   minor_version;
}
