module deimos.X11.extensions.scrnsaver;

/*
 * Copyright (c) 1992  X Consortium
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of the X Consortium shall not be
 * used in advertising or otherwise to promote the sale, use or other dealings
 * in this Software without prior written authorization from the X Consortium.
 *
 * Author:  Keith Packard, MIT X Consortium
 */

import deimos.X11.X;
import deimos.X11.Xlib;
import deimos.X11.extensions.saver;

private import core.stdc.config;

extern (C) nothrow:

struct XScreenSaverNotifyEvent {
    int type;               /* of event */
    c_ulong serial;         /* # of last request processed by server */
    Bool send_event;        /* true if this came frome a SendEvent request */
    Display *display;       /* Display the event was read from */
    Window window;          /* screen saver window */
    Window root;            /* root window of event screen */
    int state;              /* ScreenSaverOff, ScreenSaverOn, ScreenSaverCycle*/
    int kind;               /* ScreenSaverBlanked, ...Internal, ...External */
    Bool forced;            /* extents of new region */
    Time time;              /* event timestamp */
}

struct XScreenSaverInfo {
    Window  window;         /* screen saver window - may not exist */
    int   state;            /* ScreenSaverOff, ScreenSaverOn, ScreenSaverDisabled*/
    int   kind;             /* ScreenSaverBlanked, ...Internal, ...External */
    c_ulong til_or_since;   /* time til or since screen saver */
    c_ulong idle;           /* total time since last user input */
    c_ulong eventMask;      /* currently selected events for this client */
}

// _XFUNCPROTOBEGIN

extern Bool XScreenSaverQueryExtension (
    Display*    /* display */,
    int*        /* event_base */,
    int*        /* error_base */
);

extern Status XScreenSaverQueryVersion (
    Display*    /* display */,
    int*        /* major_version */,
    int*        /* minor_version */
);

extern XScreenSaverInfo *XScreenSaverAllocInfo ();

extern Status XScreenSaverQueryInfo (
    Display*            /* display */,
    Drawable            /* drawable */,
    XScreenSaverInfo*   /* info */
);

extern void XScreenSaverSelectInput (
    Display*    /* display */,
    Drawable    /* drawable */,
    c_ulong     /* eventMask */
);

extern void XScreenSaverSetAttributes (
    Display*                /* display */,
    Drawable                /* drawable */,
    int                     /* x */,
    int                     /* y */,
    uint                    /* width */,
    uint                    /* height */,
    uint                    /* border_width */,
    int                     /* depth */,
    uint                    /* class */,
    Visual *                /* visual */,
    c_ulong                 /* valuemask */,
    XSetWindowAttributes *  /* attributes */
);

extern void XScreenSaverUnsetAttributes (
    Display*    /* display */,
    Drawable    /* drawable */
);

extern Status XScreenSaverRegister (
    Display*    /* display */,
    int         /* screen */,
    XID         /* xid */,
    Atom        /* type */
);

extern Status XScreenSaverUnregister (
    Display*    /* display */,
    int         /* screen */
);

extern Status XScreenSaverGetRegistered (
    Display*    /* display */,
    int         /* screen */,
    XID*        /* xid */,
    Atom*       /* type */
);

extern void XScreenSaverSuspend (
    Display*    /* display */,
    Bool        /* suspend */
);

// _XFUNCPROTOEND
