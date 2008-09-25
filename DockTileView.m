#import "DockTileView.h"

@implementation DockTileView
@synthesize image;

- (void) setImage:(NSImage*)_image
{
    if (image != _image) {
        [image release];
        image = [_image retain];
        [self setNeedsDisplay:YES];
    }
}

- (void) drawRect:(NSRect)rect 
{
    [[NSColor clearColor] set];
    NSRectFill(rect);
    NSRect fromRect = NSMakeRect(0, 0, [image size].width, [image size].height);
    [image drawInRect:rect fromRect:fromRect operation:NSCompositeSourceOver fraction:1.0];
}

@end
