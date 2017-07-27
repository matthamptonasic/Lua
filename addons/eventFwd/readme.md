eventFwd
======
Forwards registered events and data to a connected 3rd party program through a network socket.
This allows 3rd party programs to take advantage of Windower's (amazing) hooks.

**__Example:__**
    Your 3rd party program (using windowerhelper.dll) can register with eventFwd the "chat message" event.
	Every time the Windower chat message event fires, the 'message', 'mode', 'sender', and 'gm' arguments 
	are sent to your program to be used just like they would be in LUA.

### Registering an event

### Returned data format

### Setting up the socket server in .net

### Registering the server with eventFwd
The addon simply needs to know the socket number the server is listening on.
This is done by sending:

```//lua invoke eventFwd setSocketPort iPortNb```

Where `iPortNb` is the port of the listening socket.

### Unregistering an event

### 
