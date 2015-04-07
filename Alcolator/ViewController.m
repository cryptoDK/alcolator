//
//  ViewController.m
//  Alcolator
//
//  Created by badassdave on 4/6/15.
//  Copyright (c) 2015 John Appleseed. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UITextFieldDelegate>


@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;

@end

@implementation ViewController


- (void)loadView {
    // Allocate and initialize the all-encompassing view
    self.view = [[UIView alloc] init];
    
    // Allocate and initialize each of our views and the gesture recognizer
    UITextField *textField = [[UITextField alloc] init];
    UISlider *slider = [[UISlider alloc] init];
    UILabel *label = [[UILabel alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    
    // Add each view and the gesture recognizer as the view's subviews
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addGestureRecognizer:tap];
    
    // Assign the views and gesture recognizer to our properties
    self.beerPercentTextField = textField;
    self.beerCountSlider = slider;
    self.resultLabel = label;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
}


- (void)viewDidLoad
{
    // Calls the superclass's implementation
    [super viewDidLoad];
    
    self.beerPercentTextField.textColor = [UIColor redColor];
    self.calculateButton.backgroundColor = [UIColor redColor];
    self.calculateButton.tintColor = [UIColor blackColor];
    self.beerCountSlider.tintColor = [UIColor redColor];
    self.beerPercentTextField.backgroundColor = [UIColor whiteColor];
    
    [self.beerPercentTextField setFont:[UIFont fontWithName:@"Arial" size:20]];
    self.calculateButton.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:20];
    
    
    // Set our primary view's background color to lightGrayColor
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    // Tells the text field that `self`, this instance of `BLCViewController` should be treated as the text field's delegate
    self.beerPercentTextField.delegate = self;
    
    // Set the placeholder text
    self.beerPercentTextField.placeholder = NSLocalizedString(@"% Alcohol Content Per Beer", @"Beer percent placeholder text");
    
    // Tells `self.beerCountSlider` that when its value changes, it should call `[self -sliderValueDidChange:]`.
    // This is equivalent to connecting the IBAction in our previous checkpoint
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    // Set the minimum and maximum number of beers
    self.beerCountSlider.minimumValue = 1;
    self.beerCountSlider.maximumValue = 10;
    
    // Tells `self.calculateButton` that when a finger is lifted from the button while still inside its bounds, to call `[self -buttonPressed:]`
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Set the title of the button
    [self.calculateButton setTitle:NSLocalizedString(@"Calculate!", @"Calculate command") forState:UIControlStateNormal];
    
    // Tells the tap gesture recognizer to call `[self -tapGestureDidFire:]` when it detects a tap.
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];
    
    // Gets rid of the maximum number of lines on the label
    self.resultLabel.numberOfLines = 0;
}


- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    
    CGFloat viewWidth = 320;
    CGFloat padding = 50;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;
    
    self.beerPercentTextField.frame = CGRectMake(padding, padding, itemWidth, itemHeight);
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding, bottomOfTextField + padding, itemWidth, itemHeight);
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding, bottomOfSlider + padding, itemWidth, itemHeight * 4);
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding, bottomOfLabel + padding, itemWidth, itemHeight);




}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidChange:(UITextField *)sender {
    // SAME CODE AS BEFORE
}

- (void)sliderValueDidChange:(UISlider *)sender {
    // SAME CODE AS BEFORE
}

- (void)buttonPressed:(UIButton *)sender {
    // SAME CODE AS BEFORE
}

- (void)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    // SAME CODE AS BEFORE
}





@end
