// Compile with:
// rdmd -L-lX11 example.d

import deimos.X11.X, deimos.X11.Xlib;
import std.stdio;

int main()
{
    Display *display = XOpenDisplay(null);
    if (!display)
    {
        writeln("XOpenDisplay failed");
        return 1;
    }

    int screen = DefaultScreen(display);

    Window window = XCreateSimpleWindow(
        display,
        DefaultRootWindow(display),     //parent window
        0, 0, 323, 200, 0,              //x, y, width, height, border_width
        BlackPixel(display, screen),    //border_color
        WhitePixel(display,screen)      //back_color
    );

    XStoreName(display, window, cast(char*) "Example window");
    XSelectInput(display, window, ExposureMask);
    XMapWindow(display, window);

    Atom wmDeleteMessage = XInternAtom(display, cast(char*) "WM_DELETE_WINDOW", False);
    XSetWMProtocols(display, window, &wmDeleteMessage, 1);

    GC gc = DefaultGC(display, screen);

    bool running = true;
    while (running)
    {
        XEvent event;
        KeySym keySym;
        while (XPending(display))
        {
            XNextEvent(display, &event);
            switch (event.type)
            {
            case ClientMessage:
                if (cast(Atom) event.xclient.data.l[0] == wmDeleteMessage)
                {
                    running = false;
                }
                break;

            case Expose:
                XDrawString(display, window, gc, 10, 16, cast(char*) "Hello world !", 13);
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
