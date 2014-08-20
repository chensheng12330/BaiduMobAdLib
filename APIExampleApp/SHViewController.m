//
//  SHViewController.m
//  APIExampleApp
//
//  Created by sherwin on 14-8-20.
//
//

#import "SHViewController.h"
#import "SHAdHelp.h"

@interface SHViewController ()

@end

@implementation SHViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SHAdHelp *shAdhelp = [[SHAdHelp alloc] initBaiduAdType:0 withFrame:kAdViewPortraitRect delegate:self];
    
    [shAdhelp start];
    
    [self.view addSubview:shAdhelp];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) AdInfo:(id) adObj Event:(ADEvent) event
{
    NSLog(@"Event: %d",event);
}

@end
