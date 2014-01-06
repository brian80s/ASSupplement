//
//  ASApp.m
//  BusOnline
//
//  Created by Kowloon on 13-11-12.
//  Copyright (c) 2013年 Goome. All rights reserved.
//

#import "ASApp.h"

@implementation ASApp

+ (ASApp *)shareApp{
    static ASApp *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (NSURL *)downloadURL{
    return [NSURL URLWithString:@"http://t.gpsoo.net/edd"];
//    return [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%d?mt=8",kAppleID]];
}

- (NSURL *)androidDownloadURL{
    return [NSURL URLWithString:@"http://t.gpsoo.net/abc"];
//    return [NSURL URLWithString:@"http://download.goome.net/coomix/android/BusOnline.apk"];
}

- (NSURL *)commentURL{
    NSString *url = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",
                     kAppleID];
    if (SystemVersionGreaterThanOrEqualTo7) {
        url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%d",kAppleID];
    }
    return [NSURL URLWithString:url];
}

- (NSString *)localVersion{
    NSString *version = [kUD objectForKey:@"version"];
    return version;
}

- (NSString *)appVersion{
    NSString *retVal = @"";
	NSString *file = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:file];
	retVal = [NSString stringWithFormat:@"%@",[dict objectForKey:@"CFBundleVersion"]];
	[dict release];
    
	return retVal;
}

- (NSString *)appName{
    return @"酷米客公交";
}

@end
