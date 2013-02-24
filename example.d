// Compile with:
// rdmd -L-lX11 example.d

import deimos.X11.X, deimos.X11.Xlib;
import std.stdio;

int main()
{;
	Display *display = XOpenDisplay(null);
	if (!display) {
		writeln("XOpenDisplay failed");
		return 1;
	}

	Window window = XCreateSimpleWindow(
		display,
		DefaultRootWindow(display),        	//parent window
		0, 0, 323, 200,						//x, y, width, height
		0, 0, 0xFF_FF_FF                	//border_width, boder_color, back_color
	);

    XMapWindow(display, window);
    XRaiseWindow(display, window);
    XStoreName(display, window, cast(char*) "Example window");
	XSelectInput(display, window, EventMask.ExposureMask);

	XGCValues values;
	GC gc = XCreateGC(display,
		window,
		GCMask.GCForeground,
		&values
	);

	Atom wmDeleteMessage = XInternAtom(display, cast(char*) "WM_DELETE_WINDOW", Bool.False);
	XSetWMProtocols(display, window, &wmDeleteMessage, 1);

	bool running = true;
	while (running) {
		XEvent event;
		KeySym keySym;
		while (XPending(display)) {
			XNextEvent(display, &event);
			switch (event.type)
			{
			case EventType.ClientMessage:
				running = false;
				break;
			case EventType.Expose:
				XDrawString(display, window, gc, 10, 16, cast(char*)"Hello world !", 13);
				break;
			default:
			}
		}
	}

    XUnmapWindow(display, window);
    XDestroyWindow(display, window);
    XCloseDisplay(display);
	return 0;
}

