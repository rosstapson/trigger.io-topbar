//
//  topbar_Delegate.m
//  Forge
//
//  Created by Connor Dunn on 15/03/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "topbar_Delegate.h"

extern UINavigationBar *topbar;

@implementation topbar_Delegate

- (topbar_Delegate*) initWithId:(NSString *)newId {
	if (self = [super init]) {
		callId = newId;
		// "retain"
		me = self;
	}	
	return self;
}


- (void) clicked {
    if ([callId isEqualToString:@"back"] && NSClassFromString(@"WKWebView") && [[ForgeApp sharedApp] useWKWebView]) {
        WKWebView *webView = (WKWebView*)[[ForgeApp sharedApp] webView];
        if ([webView canGoBack]) {
            [webView goBack];
        }
        
    } else if ([callId isEqualToString:@"back"]) {
        UIWebView *webView = (UIWebView*)[[ForgeApp sharedApp] webView];
        if ([webView canGoBack]) {
            [webView goBack];
        }
        
    } else {
        NSString *eventName = [NSString stringWithFormat:@"topbar.buttonPressed.%@", callId];
        [[ForgeApp sharedApp] event:eventName withParam:[NSNull null]];
    }
}
- (void) releaseDelegate {
    me = nil;
}

@end
