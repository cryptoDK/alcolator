//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by badassdave on 4/7/15.
//  Copyright (c) 2015 John Appleseed. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController


- (instancetype) init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Whiskey", nil);
        [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -18)];
    }
    return self;
}



- (void) viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.241 green:0.425 blue:0.714 alpha:1]; /*#bdecb6*/
    
}


- (void)buttonPressed:(UIButton *)sender;
{
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;  // a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4;  // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];

    self.resultLabel.tintColor = [UIColor redColor];
    self.resultLabel.text = resultText;
}

@end
