#import "HiddenPhotosCC.h"

NSUserDefaults *preferences;

@implementation HiddenPhotosCC

- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

- (UIColor *)selectedColor {
	return [UIColor systemRedColor];
}

- (BOOL)isSelected {
  return [[preferences valueForKey:@"HiddenAlbumVisible"] boolValue];
}

- (void)setSelected:(BOOL)selected {
  [preferences setValue:@(selected) forKey:@"HiddenAlbumVisible"];
  CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (__bridge CFStringRef)@"com.apple.mobileslideshow.PreferenceChanged", NULL, NULL, YES);

  [super refreshState];
}

@end

%ctor {
  preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.apple.mobileslideshow"];
}