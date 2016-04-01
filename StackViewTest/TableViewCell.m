//
//  TableViewCell.m
//  StackViewTest
//
//  Created by Bradley Mueller on 4/1/16.
//  Copyright © 2016 Cellaflora. All rights reserved.
//

#import "TableViewCell.h"

@implementation RowObject

@end

@implementation TableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    
    [self updateInfoButtonState];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.rowObject = nil;
    
    self.titleLabel.text = nil;
    self.detailLabel.text = nil;
    
    self.leftInsetView.hidden = YES;
    self.separatorView.hidden = NO;
    self.button1Container.hidden = YES;
    self.button2Container.hidden = YES;
    
    [self updateInfoButtonState];
}

- (void)setRowObject:(RowObject *)rowObject
{
    _rowObject = rowObject;
    
    if (_rowObject != nil)
    {
        self.titleLabel.text = rowObject.title;
        
        NSMutableArray *text = [[NSMutableArray alloc] init];
        if (rowObject.indent) [text addObject:@"Indent"];
        if (rowObject.showSeparator) [text addObject:@"Separator"];
        if (rowObject.showButton1) [text addObject:@"Like"];
        if (rowObject.showButton2) [text addObject:@"Share"];
        if (rowObject.showInfoButton) [text addObject:@"Info"];
        self.detailLabel.text = [text componentsJoinedByString:@" - "];
        
        self.leftInsetView.hidden = !rowObject.indent;
        self.separatorView.hidden = !rowObject.showSeparator;
        self.button1Container.hidden = !rowObject.showButton1;
        self.button2Container.hidden = !rowObject.showButton2;
        
        [self updateInfoButtonState];
    }
}

- (void)updateInfoButtonState
{
    if (self.rowObject == nil)
    {
        self.infoContainerCompact.hidden = YES;
        self.infoContainerRegular.hidden = YES;
        return;
    }
    
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact)
    {
        self.infoContainerCompact.hidden = !self.rowObject.showInfoButton;
        self.infoContainerRegular.hidden = YES;
    }
    else
    {
        self.infoContainerCompact.hidden = YES;
        self.infoContainerRegular.hidden = !self.rowObject.showInfoButton;
    }
}

@end
