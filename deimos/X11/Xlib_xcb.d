module deimos.X11.Xlib_xcb;
import deimos.XCB.xcb;
import deimos.X11.Xlib;
//import deimos.X11.Xfuncproto;

extern (C) nothrow:

xcb_connection_t* XGetXCBConnection(Display* dpy);

enum XEventQueueOwner
{
    XlibOwnsEventQueue = 0,
    XCBOwnsEventQueue
}

void XSetEventQueueOwner(Display* dpy, XEventQueueOwner owner);
