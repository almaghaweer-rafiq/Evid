//
//  MovieViewController.h
//  EVid
//
//  Created by Raja on 12/21/17.
//  Copyright © 2017 ghulamrasool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IJKFFMoviePlayerController.h"
#import "IJKMediaControl.h"

@interface MovieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) IJKFFMoviePlayerController  *movie;
@property(nonatomic,strong) IBOutlet IJKMediaControl *mediaControl;
- (IBAction)liveVideoButtonClicked:(id)sender;

@end
