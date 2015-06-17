//
//  CenterViewController.m
//  Navigation
//
//  Created by Tammy Coron on 1/19/13.
//  Copyright (c) 2013 Tammy L Coron. All rights reserved.
//

#import "CenterViewController.h"

#import "Animal.h"

#define LEFT_PANEL_TAG 2
#define RIGHT_PANEL_TAG 3

@interface CenterViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak) IBOutlet UILabel *imageTitle;
@property (nonatomic, weak) IBOutlet UILabel *imageCreator;

@property (nonatomic, strong) NSMutableArray *imagesArray;

@end

@implementation CenterViewController

#pragma mark -
#pragma mark View Did Load/Unload

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark -
#pragma mark View Will/Did Appear

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

#pragma mark -
#pragma mark View Will/Did Disappear

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark Button Actions

- (IBAction)btnMovePanelRight:(id)sender
{
    UIButton *button = sender;
    switch (button.tag) {
        case 0:
            [self.delegate movePanelToOriginalPosition]; // tell the main view controller to move the panel to original position
            break;
        case 1:
            [self.delegate movePanelRight]; // tell the main view controller to move the panel right
            break;
        default:
            break;
    }
}

- (IBAction)btnMovePanelLeft:(id)sender
{
    UIButton *button = sender;
    switch (button.tag) {
        case 0:
            [self.delegate movePanelToOriginalPosition];
            break;
        case 1:
            [self.delegate movePanelLeft];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark Delagate Method for capturing selected image

/*
 note: typically, you wouldn't create "duplicate" delagate methods, but we went with simplicity.
       doing it this way allowed us to show how to use the #define statement and the switch statement.
*/

- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator
{
    // only change the main display if an animal/image was selected
    if (image)
    {
        self.mainImageView.image = image;
        self.imageTitle.text = [NSString stringWithFormat:@"%@", imageTitle];
        self.imageCreator.text = [NSString stringWithFormat:@"%@", imageCreator];
    }
}

- (void)animalSelected:(Animal *)animal fromPanelWithTag:(NSInteger)tag
{
    // only change the main display if an animal/image was selected
    if (animal)
    {
        [self showAnimalSelected:animal];
        switch (tag) {
            case LEFT_PANEL_TAG:
                self.leftButton.tag = 1;
                [self.delegate movePanelToOriginalPosition];
                break;
            case RIGHT_PANEL_TAG:
                self.rightButton.tag = 1;
                [self.delegate movePanelToOriginalPosition];
                break;
            default:
                break;
        }
    }
}

// setup the imageview with our selected animal
- (void)showAnimalSelected:(Animal *)animalSelected
{
    self.mainImageView.image = animalSelected.image;
    self.imageTitle.text = [NSString stringWithFormat:@"%@", animalSelected.title];
    self.imageCreator.text = [NSString stringWithFormat:@"%@", animalSelected.creator];
}

#pragma mark -
#pragma mark Default System Code

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
