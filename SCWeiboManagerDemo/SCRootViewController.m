//
//  SCRootViewController.m
//  SCWeiboManagerDemo
//
//  Created by Singro on 6/4/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import "SCRootViewController.h"

#import "SCWeiboManager.h"

@interface SCRootViewController ()

@property (nonatomic, strong) UIButton *authorizeButton;
@property (nonatomic, strong) UIButton *imageUploadButton;

@end

@implementation SCRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.authorizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    self.authorizeButton.backgroundColor = [UIColor colorWithRed:0.075 green:0.660 blue:1.000 alpha:1.000];
    [self.authorizeButton addTarget:self action:@selector(authorize) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.authorizeButton];
    
    self.imageUploadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.imageUploadButton setTitle:@"Upload" forState:UIControlStateNormal];
    self.imageUploadButton.backgroundColor = [UIColor colorWithRed:0.075 green:0.660 blue:1.000 alpha:1.000];
    [self.imageUploadButton addTarget:self action:@selector(uploadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imageUploadButton];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    
    self.authorizeButton.frame = (CGRect){60, 200, 200, 60};
    self.imageUploadButton.frame = (CGRect){60, 380, 200, 60};
    
}

-(void)authorize {
    
    [[SCWeiboManager manager] authorizeToWeiboSuccess:^(WBBaseResponse *response) {
        NSLog(@"success");
    } failure:^(NSError *error) {
        NSLog(@"failed");
    }];
    
}

- (void)uploadImage {
    
    UIImage *image = [UIImage imageNamed:@"image"];
    [[SCWeiboManager manager] sendWeiboWithText:@"hahahah" image:image Success:^(NSDictionary *responseDict) {
        NSLog(@"success:\n%@", responseDict);
    } failure:^(NSError *error) {
        NSLog(@"failure:\n%@", [error description]);
    }];
    
}

@end
