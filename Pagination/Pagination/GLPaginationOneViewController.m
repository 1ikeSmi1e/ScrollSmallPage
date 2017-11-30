//
//  GLPaginationOneViewController.m
//  Pagination
//
//  Created by Allen Hsu on 12/14/14.
//  Copyright (c) 2014 Glow, Inc. All rights reserved.
//

#import "GLPaginationOneViewController.h"
#import "Utils.h"

#define BUBBLE_DIAMETER     200.0
#define BUBBLE_PADDING      20.0

@interface GLPaginationOneViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewWidthConstraint;

@end

@implementation GLPaginationOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupPages];
}

- (void)setupPages
{
    int totalNum = 3;
    
    self.scrollViewWidthConstraint.constant = BUBBLE_DIAMETER + BUBBLE_PADDING;
//    [self.contentWidthConstraint autoRemove];
//    self.contentWidthConstraint = [self.contentView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.scrollView withMultiplier:totalNum];
    [self.contentWidthConstraint setValue:@(totalNum) forKey:@"multiplier"];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    self.scrollView.backgroundColor = [UIColor redColor];
//    self.contentView.backgroundColor = [UIColor blueColor];
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat y = (self.scrollView.frame.size.height - BUBBLE_DIAMETER) / 2.0;
    for (int i = 0; i < totalNum; ++i) {
        CGFloat x = BUBBLE_PADDING / 2.0 + i * (BUBBLE_DIAMETER + BUBBLE_PADDING);
        CGRect frame = CGRectMake(x, y, BUBBLE_DIAMETER, BUBBLE_DIAMETER);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"#%d", i];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = UIColorFromRGB(0x5a62d2);
        if (i==1) {
            label.backgroundColor = [UIColor redColor];
        }else if (i==2){
            label.backgroundColor = [UIColor yellowColor];
        }
        label.layer.cornerRadius = frame.size.width / 2.0;
        label.layer.masksToBounds = YES;
        label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
        [self.contentView addSubview:label];
//        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1.f, self.view.bounds.size.height)];
//        line.backgroundColor = [UIColor blueColor];
//        [self.view addSubview:line];
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1.f, self.view.bounds.size.height)];
    line.center = self.view.center;
    line.backgroundColor = [UIColor blueColor];
    [self.view addSubview:line];
}

- (IBAction)didClickTouchTest:(id)sender {
    NSLog(@"Button works");
}

@end
