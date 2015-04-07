//
//  ViewController.h
//  Alcolator
//
//  Created by badassdave on 4/6/15.
//  Copyright (c) 2015 John Appleseed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UILabel *resultLabel;
@property (weak, nonatomic) UISlider *beerCountSlider;

- (void)buttonPressed:(UIButton *)sender;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end

