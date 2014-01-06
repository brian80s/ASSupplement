//
//  ASApp.h
//  BusOnline
//
//  Created by Kowloon on 13-11-12.
//  Copyright (c) 2013年 Goome. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAppleID 789568297

@interface ASApp : NSObject

+ (ASApp *)shareApp;

- (NSURL *)downloadURL;

- (NSURL *)androidDownloadURL;

- (NSURL *)commentURL;

- (NSString *)localVersion;

- (NSString *)appVersion;

- (NSString *)appName;

@end
