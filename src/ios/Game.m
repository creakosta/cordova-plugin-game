//
//  Game.m
//  Detonate
//
//  Created by Marco Piccardo on 04/02/11.
//  Copyright 2011 Eurotraining Engineering. All rights reserved.
//
/*
 *  Modified and Updated
 *
 *  Copyright 2014 Wizcorp Inc. http://www.wizcorp.jp
 *  Author Ally Ogilvie
 */
//Copyright (c) 2014 Sang Ki Kwon (Cranberrygame)
//Email: cranberrygame@yahoo.com
//Homepage: http://www.github.com/cranberrygame
//License: MIT (http://opensource.org/licenses/MIT)

#import "Game.h"
#import <Cordova/CDVViewController.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface Game ()
@property (nonatomic, retain) GKLeaderboardViewController *leaderboardController;
@property (nonatomic, retain) GKAchievementViewController *achievementsController;
@end

@implementation Game

- (void)setUp:(CDVInvokedUrlCommand *)command {

}

- (void)login:(CDVInvokedUrlCommand *)command {
    
    //[self.commandDelegate runInBackground:^{//cranberrygame
        [[GKLocalPlayer localPlayer] setAuthenticateHandler: ^(UIViewController *viewcontroller, NSError *error) {
/*
            //already logged in
            if ([GKLocalPlayer localPlayer].authenticated) {
			
				NSString *playerID = [GKLocalPlayer localPlayer].playerID;
				NSString *displayName = [GKLocalPlayer localPlayer].displayName;
				
				NSDictionary* playerDetail = @{
					@"playerId":playerID,
					@"playerDisplayName":displayName
				};
						
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            }
            else if (viewcontroller != nil) {
                CDVViewController *vc = (CDVViewController *)[super viewController];
                [vc presentViewController:viewcontroller animated:YES completion:^{
                }];
            }
            else {
                // Called the second time with result
                if (error != nil) {	
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                }
                else {
					NSString *playerID = [GKLocalPlayer localPlayer].playerID;
					NSString *displayName = [GKLocalPlayer localPlayer].displayName;
					
					NSDictionary* playerDetail = @{
						@"playerId":playerID,
						@"playerDisplayName":displayName
					};
							
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];		
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];	
                }
            }
*/
///*
            //It turns out that you need to go to Settings>Game Center and manually enable Sandbox.
            //http://stackoverflow.com/questions/25916055/application-is-not-recognized-by-game-center-after-building-with-xcode-6-0-1
            if (viewcontroller != nil) {
                
                //UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"1" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                //[alert1 show];
                
                CDVViewController *vc = (CDVViewController *)[super viewController];
                [vc presentViewController:viewcontroller animated:YES completion:^{
                }];
            }
            else {
                //already logged in
                if ([GKLocalPlayer localPlayer].authenticated) {
                    
                    //UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"2" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    //[alert2 show];
                    
                    NSString *playerID = [GKLocalPlayer localPlayer].playerID;
                    NSString *displayName = [GKLocalPlayer localPlayer].alias;
                    
                    NSDictionary* playerDetail = @{
                                                   @"playerId":(playerID ?: @""),
                                                   @"playerDisplayName":(displayName ?: @"")
                                                   };
                    
                    CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
                    //[pr setKeepCallbackAsBool:YES];
                    [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                    //CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                    //[pr setKeepCallbackAsBool:YES];
                    //[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                }
                else {
                    
                    //UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"3" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    //[alert3 show];
                    
                    // Called the second time with result
                    if (error != nil) {
                        // UIAlertView was removed here: on recent iOS versions
                        // -[UIAlertView initWithFrame:] throws an NSException and
                        // crashes the app (SIGABRT) when Game Center auth fails.
                        // The error is passed to the JS error callback instead.
                        NSLog(@"[Game] Game Center authentication failed: %@", error);

                        //CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                        //[pr setKeepCallbackAsBool:YES];
                        //[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                        CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                        //[pr setKeepCallbackAsBool:YES];
                        [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                    }
                    else {
                        NSString *playerID = [GKLocalPlayer localPlayer].playerID;
                        NSString *displayName = [GKLocalPlayer localPlayer].alias;
                        
                        NSDictionary* playerDetail = @{
                                                       @"playerId":(playerID ?: @""),
                                                       @"playerDisplayName":(displayName ?: @"")
                                                       };
                        
                        CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
                        //[pr setKeepCallbackAsBool:YES];
                        [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                        //CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                        //[pr setKeepCallbackAsBool:YES];
                        //[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                    }
                }
            }
//*/
        }];
    //}];//cranberrygame
}

- (void)logout:(CDVInvokedUrlCommand *)command {
    //Unfortunately, this takes the user outside your app.
    //http://stackoverflow.com/questions/9995576/how-to-show-game-centers-player-profile-view
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"gamecenter:/me/account"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"gamecenter:/me/signout"]];
}

// Scales the image to exactly size x size pixels (aspect fill, centered crop).
- (UIImage *)resizedPlayerImage:(UIImage *)image toPixelSize:(CGFloat)size {
    CGSize target = CGSizeMake(size, size);
    UIGraphicsImageRendererFormat *format = [UIGraphicsImageRendererFormat preferredFormat];
    format.scale = 1.0;      // 1 point = 1 pixel, so the result is exactly size x size px
    format.opaque = NO;      // keep transparency

    CGFloat srcW = image.size.width * image.scale;
    CGFloat srcH = image.size.height * image.scale;
    CGFloat ratio = MAX(size / srcW, size / srcH);
    CGFloat drawW = srcW * ratio;
    CGFloat drawH = srcH * ratio;
    CGRect drawRect = CGRectMake((size - drawW) / 2.0, (size - drawH) / 2.0, drawW, drawH);

    UIGraphicsImageRenderer *renderer = [[[UIGraphicsImageRenderer alloc] initWithSize:target format:format] autorelease];
    return [renderer imageWithActions:^(UIGraphicsImageRendererContext *context) {
        [image drawInRect:drawRect];
    }];
}

- (void)getPlayerImage:(CDVInvokedUrlCommand *)command {
    // Returns the player's avatar as a base64 data URL
    // ("data:image/png;base64,..."), instead of a path to a file
    // in the app's Documents folder.
    // Optional argument 0: size in pixels, e.g. "128" or 128 -> 128x128 PNG.
    // Without it, the photo is returned in the size Game Center provides.

    // Clean up the file cached by older versions of the plugin.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *oldCachedImage = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"user.jpg"];
    [[NSFileManager defaultManager] removeItemAtPath:oldCachedImage error:nil];

    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if (!localPlayer.authenticated) {
        CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Player is not authenticated"];
        [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        return;
    }

    // Accepts a number (128) or a numeric string ("128"). 0 = no resizing.
    id sizeArg = [command argumentAtIndex:0 withDefault:nil];
    NSInteger requestedSize = 0;
    if ([sizeArg isKindOfClass:[NSNumber class]] || [sizeArg isKindOfClass:[NSString class]]) {
        requestedSize = [sizeArg integerValue];
    }
    if (requestedSize < 0) requestedSize = 0;
    if (requestedSize > 2048) requestedSize = 2048;

    // Small source photo is enough for small avatars; otherwise take the large one.
    GKPhotoSize photoSize = (requestedSize > 0 && requestedSize <= 64) ? GKPhotoSizeSmall : GKPhotoSizeNormal;

    [localPlayer loadPhotoForSize:photoSize withCompletionHandler:^(UIImage *photo, NSError *error) {
        CDVPluginResult* pr = nil;
        if (photo != nil) {
            UIImage *result = (requestedSize > 0)
                ? [self resizedPlayerImage:photo toPixelSize:(CGFloat)requestedSize]
                : photo;
            NSData *data = UIImagePNGRepresentation(result);
            if (data != nil) {
                NSString *dataUrl = [@"data:image/png;base64," stringByAppendingString:[data base64EncodedStringWithOptions:0]];
                pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:dataUrl];
            } else {
                pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Could not encode player photo"];
            }
        } else {
            NSString *message = (error != nil) ? [error localizedDescription] : @"Player has no photo";
            NSLog(@"[Game] getPlayerImage failed: %@", message);
            pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
        }
        [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
    }];
}

- (void)getPlayerScore:(CDVInvokedUrlCommand *)command {
 	NSString *leaderboardId = [command.arguments objectAtIndex:0];
    
	//http://stackoverflow.com/questions/21591123/how-to-get-local-player-score-from-game-center
	GKLeaderboard *leaderboard = [[GKLeaderboard alloc] init];
  	leaderboard.identifier = leaderboardId;
	[leaderboard loadScoresWithCompletionHandler: ^(NSArray *scores, NSError *error) {
		if (error) {
			NSLog(@"%@", error);
			
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
		}
		else if (scores) {
			GKScore *s = leaderboard.localPlayerScore;
			NSLog(@"Local player's score: %lld", s.value);
			
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"%lld", s.value]];
 			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
		}
	}];
}

- (void)submitScore:(CDVInvokedUrlCommand *)command {

    //[self.commandDelegate runInBackground:^{//cranberrygame
		NSString *leaderboardId = [command.arguments objectAtIndex:0];
        int64_t score = [[command.arguments objectAtIndex:1] integerValue];
		
		GKScore *s = [[GKScore alloc] initWithLeaderboardIdentifier: leaderboardId];
        s.value = score;
        s.context = 0;
			
		[GKScore reportScores:@[s] withCompletionHandler: ^(NSError *error) {
            if (error != nil)
            {				
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            }
            else
            {
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			}
		}];
    //}];//cranberrygame
}

- (void)showLeaderboard:(CDVInvokedUrlCommand *)command {
/*
    //runtime error
    //[self.commandDelegate runInBackground:^{//cranberrygame
        if ( self.leaderboardController == nil ) {
            self.leaderboardController = [[GKLeaderboardViewController alloc] init];
            self.leaderboardController.leaderboardDelegate = self;//
        }
        self.leaderboardController.category = (NSString *) [command.arguments objectAtIndex:0];
        CDVViewController *vc = (CDVViewController *)[super viewController];
        [vc presentViewController:self.leaderboardController animated:YES completion: ^{
        }];
    //}];//cranberrygame
*/
///*
    //https://github.com/leecrossley/cordova-plugin-game-center/blob/master/src/ios/GameCenter.m
    NSString *leaderboardId = (NSString *) [command.arguments objectAtIndex:0];
    
    if (@available(iOS 14.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithLeaderboardID:leaderboardId playerScope:GKLeaderboardPlayerScopeGlobal timeScope:GKLeaderboardTimeScopeAllTime];
        
        gameCenterController.gameCenterDelegate = self;
        [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
    }
    else
    {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        if (gameCenterController != nil)
        {
            gameCenterController.gameCenterDelegate = self;
            
            if (leaderboardId.length > 0)
            {
                gameCenterController.leaderboardIdentifier = leaderboardId;
            }
 
            gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
            
            [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
        }
        else
        {
        }
    }
//*/
}

- (void)showLeaderboards:(CDVInvokedUrlCommand *)command {
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
        [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
    }
    else
    {
    }
}

- (void)unlockAchievement:(CDVInvokedUrlCommand *)command {
    //[self.commandDelegate runInBackground:^{//cranberrygame
		NSString *achievementId = [command.arguments objectAtIndex:0];
				
		GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: achievementId];
		if (achievement)
		{
			achievement.percentComplete = 100;
			achievement.showsCompletionBanner = YES;
			
			[achievement reportAchievementWithCompletionHandler: ^(NSError *error)
			{
				 if (error != nil)
				 {
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				} 
				 else {
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					

				 }
			}];
		}
    //}];//cranberrygame
}

- (void)incrementAchievement:(CDVInvokedUrlCommand *)command {
    //[self.commandDelegate runInBackground:^{//cranberrygame
		NSString *achievementId = [command.arguments objectAtIndex:0];
		NSString *stepsOrPercent = [command.arguments objectAtIndex:1];
		float stepsOrPercentFloat = [stepsOrPercent floatValue];
				
		GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: achievementId];
		if (achievement)
		{
			achievement.percentComplete = stepsOrPercentFloat;
			
			[achievement reportAchievementWithCompletionHandler: ^(NSError *error)
			{
				 if (error != nil)
				 {
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				} 
				 else {
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					

				 }
			}];
		}
    //}];//cranberrygame
}

- (void)showAchievements:(CDVInvokedUrlCommand *)command {//cranberrygame
    //[self.commandDelegate runInBackground:^{
        // GKAchievementViewController is deprecated; use GKGameCenterViewController.
        GKGameCenterViewController *gameCenterController = [[[GKGameCenterViewController alloc] init] autorelease];
        if (gameCenterController != nil) {
            gameCenterController.gameCenterDelegate = self;
            gameCenterController.viewState = GKGameCenterViewControllerStateAchievements;
            [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
        }
    //}];//cranberrygame
}

- (void) resetAchievements:(CDVInvokedUrlCommand*)command;
{
    [GKAchievement resetAchievementsWithCompletionHandler: ^(NSError *error)
    {
         if (error != nil)
         {
			 
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];			 
         } else {
			CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];				 
         }
	}];    
}

//GKLeaderboardViewControllerDelegate
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController {
/*
    CDVViewController *vc = (CDVViewController *)[super viewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
*/
	[viewController dismissViewControllerAnimated:YES completion:nil];
}

//GKAchievementViewControllerDelegate
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController {
/*
    CDVViewController* vc = (CDVViewController *)[super viewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
*/
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

//GKGameCenterControllerDelegate
- (void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    self.leaderboardController = nil;
    self.achievementsController = nil;
    
    [super dealloc];
}

- (void) isAccessPointAvailable:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* pluginResult = nil;
    if (@available(iOS 14.0, *)) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:true];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:false];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void) modifyAccessPoint:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* pluginResult = nil;
    if (@available(iOS 14.0, *)) {

        NSDictionary* options = [command argumentAtIndex:0 withDefault:[NSNull null]];
        if ((NSNull *)options == [NSNull null])
        {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:false];
        }
        else
        {
            NSString* position = nil;

            position = [options objectForKey:@"location"];
            if (position && [position length] > 0) {

                if ([position isEqualToString:@"TOP_LEFT"]) {
                    [GKAccessPoint shared].location = GKAccessPointLocationTopLeading;
                }
                else if ([position isEqualToString:@"TOP_RIGHT"]) {
                    [GKAccessPoint shared].location = GKAccessPointLocationTopTrailing;
                }
                else if ([position isEqualToString:@"BOTTOM_LEFT"]) {
                    [GKAccessPoint shared].location = GKAccessPointLocationBottomLeading;
                }
                else if ([position isEqualToString:@"BOTTOM_RIGHT"]) {
                    [GKAccessPoint shared].location = GKAccessPointLocationBottomTrailing;
                }
            }

            NSString* highlights = nil;
            highlights = [options objectForKey:@"showHighlights"];
            if (highlights && [highlights length] > 0) {
                [GKAccessPoint shared].showHighlights = [highlights boolValue];
            }

            NSString* active = nil;
            active = [options objectForKey:@"active"];
            if (active && [active length] > 0) {
                [GKAccessPoint shared].active = [active boolValue];
            }

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:true];
        }
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:false];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showDashboard:(CDVInvokedUrlCommand *)command {
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        
        gameCenterController.viewState = GKGameCenterViewControllerStateDashboard;
        
        [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
    }
}

- (void)showProfile:(CDVInvokedUrlCommand *)command {
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        
        gameCenterController.viewState = GKGameCenterViewControllerStateLocalPlayerProfile;
        
        [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
    }
}

@end
