//
//  MovieViewController.m
//  EVid
//
//  Created by Raja on 12/21/17.
//  Copyright © 2017 ghulamrasool. All rights reserved.
//

#import "MovieViewController.h"
#import "IJKFFMoviePlayerController.h"
#import "IJKMoviePlayerViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	IJKFFMoviePlayerController *c = [IJKFFMoviePlayerController alloc] ;
	[self.view addSubview:c.view];
	//self.view = c.view ;
	//NSURL *url = [[NSURL alloc] initWithString:@"rtmp://83.110.58.121:1935/live360p/"];
	NSURL *url = [[NSURL alloc] initWithString:@"rtmp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov"];
	
	[IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
		//            [self.navigationController popViewControllerAnimated:NO];
	}];

	
	
 }

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	//[self installMovieNotificationObservers];
	
	[self.movie prepareToPlay];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	
	[self.movie shutdown];
	NSLog(@"Shutting down ") ;
	
	//[self removeMovieNotificationObservers];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
//	return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//- (IBAction)onClickMediaControl:(id)sender
//{
//	[self.mediaControl showAndFade];
//}
//
//- (IBAction)onClickOverlay:(id)sender
//{
//	[self.mediaControl hide];
//}
//
//- (IBAction)onClickDone:(id)sender
//{
//	[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//}
//
//
//- (IBAction)onClickPlay:(id)sender
//{
//	[self.movie play];
//	[self.mediaControl refreshMediaControl];
//}
//
//- (IBAction)onClickPause:(id)sender
//{
//	[self.movie pause];
//	[self.mediaControl refreshMediaControl];
//}
//
//- (IBAction)didSliderTouchDown
//{
//	[self.mediaControl beginDragMediaSlider];
//}
//
//- (IBAction)didSliderTouchCancel
//{
//	[self.mediaControl endDragMediaSlider];
//}
//
//- (IBAction)didSliderTouchUpOutside
//{
//	[self.mediaControl endDragMediaSlider];
//}
//
//- (IBAction)didSliderTouchUpInside
//{
//	self.movie.currentPlaybackTime = self.mediaControl.mediaProgressSlider.value;
//	[self.mediaControl endDragMediaSlider];
//}
//
//- (IBAction)didSliderValueChanged
//{
//	[self.mediaControl continueDragMediaSlider];
//}
//
//- (void)loadStateDidChange:(NSNotification*)notification
//{
//	//    MPMovieLoadStateUnknown        = 0,
//	//    MPMovieLoadStatePlayable       = 1 << 0,
//	//    MPMovieLoadStatePlaythroughOK  = 1 << 1, // Playback will be automatically started in this state when shouldAutoplay is YES
//	//    MPMovieLoadStateStalled        = 1 << 2, // Playback will be automatically paused in this state, if started
//
//	IJKMPMovieLoadState loadState = _movie.loadState;
//
//	if ((loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
//		NSLog(@"loadStateDidChange: IJKMPMovieLoadStatePlaythroughOK: %d\n", (int)loadState);
//	} else if ((loadState & IJKMPMovieLoadStateStalled) != 0) {
//		NSLog(@"loadStateDidChange: IJKMPMovieLoadStateStalled: %d\n", (int)loadState);
//	} else {
//		NSLog(@"loadStateDidChange: ???: %d\n", (int)loadState);
//	}
//}
//
//- (void)moviePlayBackDidFinish:(NSNotification*)notification
//{
//	//    MPMovieFinishReasonPlaybackEnded,
//	//    MPMovieFinishReasonPlaybackError,
//	//    MPMovieFinishReasonUserExited
//	int reason = [[[notification userInfo] valueForKey:IJKMPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
//
//	switch (reason)
//	{
//		case IJKMPMovieFinishReasonPlaybackEnded:
//			NSLog(@"playbackStateDidChange: IJKMPMovieFinishReasonPlaybackEnded: %d\n", reason);
//			break;
//
//		case IJKMPMovieFinishReasonUserExited:
//			NSLog(@"playbackStateDidChange: IJKMPMovieFinishReasonUserExited: %d\n", reason);
//			break;
//
//		case IJKMPMovieFinishReasonPlaybackError:
//			NSLog(@"playbackStateDidChange: IJKMPMovieFinishReasonPlaybackError: %d\n", reason);
//			break;
//
//		default:
//			NSLog(@"playbackPlayBackDidFinish: ???: %d\n", reason);
//			break;
//	}
//}
//
//- (void)mediaIsPreparedToPlayDidChange:(NSNotification*)notification
//{
//	NSLog(@"mediaIsPreparedToPlayDidChange\n");
//}
//
//- (void)moviePlayBackStateDidChange:(NSNotification*)notification
//{
//	//    MPMoviePlaybackStateStopped,
//	//    MPMoviePlaybackStatePlaying,
//	//    MPMoviePlaybackStatePaused,
//	//    MPMoviePlaybackStateInterrupted,
//	//    MPMoviePlaybackStateSeekingForward,
//	//    MPMoviePlaybackStateSeekingBackward
//
//	switch (_movie.playbackState)
//	{
//		case IJKMPMoviePlaybackStateStopped: {
//			NSLog(@"IJKMPMoviePlayBackStateDidChange %d: stoped", (int)_movie.playbackState);
//			break;
//		}
//		case IJKMPMoviePlaybackStatePlaying: {
//			NSLog(@"IJKMPMoviePlayBackStateDidChange %d: playing", (int)_movie.playbackState);
//			break;
//		}
//		case IJKMPMoviePlaybackStatePaused: {
//			NSLog(@"IJKMPMoviePlayBackStateDidChange %d: paused", (int)_movie.playbackState);
//			break;
//		}
//		case IJKMPMoviePlaybackStateInterrupted: {
//			NSLog(@"IJKMPMoviePlayBackStateDidChange %d: interrupted", (int)_movie.playbackState);
//			break;
//		}
//		case IJKMPMoviePlaybackStateSeekingForward:
//		case IJKMPMoviePlaybackStateSeekingBackward: {
//			NSLog(@"IJKMPMoviePlayBackStateDidChange %d: seeking", (int)_movie.playbackState);
//			break;
//		}
//		default: {
//			NSLog(@"IJKMPMoviePlayBackStateDidChange %d: unknown", (int)_movie.playbackState);
//			break;
//		}
//	}
//}
//
//#pragma mark Install Movie Notifications
//
///* Register observers for the various movie object notifications. */
//-(void)installMovieNotificationObservers
//{
//	[[NSNotificationCenter defaultCenter] addObserver:self
//											 selector:@selector(loadStateDidChange:)
//												 name:IJKMPMoviePlayerLoadStateDidChangeNotification
//											   object:_movie];
//
//	[[NSNotificationCenter defaultCenter] addObserver:self
//											 selector:@selector(moviePlayBackDidFinish:)
//												 name:IJKMPMoviePlayerPlaybackDidFinishNotification
//											   object:_movie];
//
//	[[NSNotificationCenter defaultCenter] addObserver:self
//											 selector:@selector(mediaIsPreparedToPlayDidChange:)
//												 name:IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification
//											   object:_movie];
//
//	[[NSNotificationCenter defaultCenter] addObserver:self
//											 selector:@selector(moviePlayBackStateDidChange:)
//												 name:IJKMPMoviePlayerPlaybackStateDidChangeNotification
//											   object:_movie];
//}
//
//#pragma mark Remove Movie Notification Handlers
//
///* Remove the movie notification observers from the movie object. */
//-(void)removeMovieNotificationObservers
//{
//	[[NSNotificationCenter defaultCenter]removeObserver:self name:IJKMPMoviePlayerLoadStateDidChangeNotification object:_movie];
//	[[NSNotificationCenter defaultCenter]removeObserver:self name:IJKMPMoviePlayerPlaybackDidFinishNotification object:_movie];
//	[[NSNotificationCenter defaultCenter]removeObserver:self name:IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification object:_movie];
//	[[NSNotificationCenter defaultCenter]removeObserver:self name:IJKMPMoviePlayerPlaybackStateDidChangeNotification object:_movie];
//}
//

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)liveVideoButtonClicked:(id)sender {
}
@end
