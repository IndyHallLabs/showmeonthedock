#import "ShowMeOnTheDock.h"
#import "DockTileView.h"

@implementation ShowMeOnTheDock

- (void) applicationWillFinishLaunching:(NSNotification*)notification
{
    dockTile = [[NSApplication sharedApplication] dockTile];
    NSRect frame = NSMakeRect(0, 0, dockTile.size.width, dockTile.size.height);
    dockTileView = [[DockTileView alloc] initWithFrame:frame];
    [dockTile setContentView:dockTileView];
}

- (BOOL) application:(NSApplication*)application openFile:(NSString*)fileName
{
    NSImage* image = [[NSImage alloc] initWithData:[NSData dataWithContentsOfFile:fileName]];
    if (image) {
        dockTileView.image = image;
        [dockTile display];
        [image release];
        return YES;
    } else {
        return NO;
    }
}

@end
