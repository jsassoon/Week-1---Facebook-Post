//
//  postViewController.m
//  Week 1 - Facebook Post
//
//  Created by Josh Sassoon on 6/23/14.
//  Copyright (c) 2014 youtubeux. All rights reserved.
//

#import "postViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface postViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *navBar;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *text;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UIImageView *tabBar;
@property (weak, nonatomic) IBOutlet UIImageView *commentBar;
@property (weak, nonatomic) IBOutlet UIButton *pictureButton;

@end

@implementation postViewController

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
 
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(15, 28, 275, 158)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    
    NSString *text = @"From collarless shirts to high-waisted pants, #Her's costume designer, Casey Storm, explains how he created his fashion looks for the future: http://bit.ly/1jV9zM8";
    
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
    
    label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
    
    NSRange range = [label.text rangeOfString:@"me"];
    [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in a substring
    
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"#Her's" options:NSCaseInsensitiveSearch];
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];
    
    [self.text addSubview:label];
    
    self.blueView.backgroundColor = [UIColor whiteColor];
    self.blueView.alpha = 0.8;
    
    self.blueView.layer.borderColor = [UIColor grayColor].CGColor;
    self.blueView.layer.borderWidth = .5;
    
    self.blueView.layer.cornerRadius = 2;
    
    self.blueView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.blueView.layer.shadowOffset = CGSizeMake(0, 4);
    self.blueView.layer.shadowOpacity = 0.1;
    self.blueView.layer.shadowRadius = 2;
    
    self.postImage.layer.shadowColor = [UIColor blackColor].CGColor;
    self.postImage.layer.shadowOffset = CGSizeMake(0, 4);
    self.postImage.layer.shadowOpacity = 0.1;
    self.postImage.layer.shadowRadius = 2;
}

- (IBAction)onButton:(id)sender {
    UIViewController *vc = [[postViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; 
    
    // vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // Fade
    // vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; // Flip
    // vc.modalTransitionStyle = UIModalTransitionStylePartialCurl; // Curl
    
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
