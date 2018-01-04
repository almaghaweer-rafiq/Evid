//
//  IntermediateVidController.m
//  EVid
//
//  Created by Raja on 12/27/17.
//  Copyright © 2017 ghulamrasool. All rights reserved.
//

#import "IntermediateVidController.h"
#import "IJKMoviePlayerViewController.h"

@interface IntermediateVidController ()

@end

@implementation IntermediateVidController

BOOL isMovieStopping = false ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void ) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:true] ;
	
	NSURL *url = [[NSURL alloc] initWithString:@"rtmp://83.110.58.121:1935/live360p/"];
	// NSURL *url = [[NSURL alloc] initWithString:@"rtmp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov"];
	if (!isMovieStopping) {
		isMovieStopping = true;
		[IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
			//            [self.navigationController popViewControllerAnimated:NO];
		}];
		
	}
	else {
			isMovieStopping = false;
			[self.navigationController popToRootViewControllerAnimated:YES] ;
	}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
