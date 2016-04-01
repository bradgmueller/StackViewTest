//
//  TableViewCell.h
//  StackViewTest
//
//  Created by Bradley Mueller on 4/1/16.
//  Copyright © 2016 Cellaflora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic) BOOL indent;
@property (nonatomic) BOOL showSeparator;
@property (nonatomic) BOOL showButton1;
@property (nonatomic) BOOL showButton2;
@property (nonatomic) BOOL showInfoButton;

@end

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *leftInsetView;
@property (weak, nonatomic) IBOutlet UIView *separatorView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIView *button1Container;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIView *button2Container;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UIView *infoContainerCompact;
@property (weak, nonatomic) IBOutlet UIButton *infoCompact;
@property (weak, nonatomic) IBOutlet UIView *infoContainerRegular;
@property (weak, nonatomic) IBOutlet UIButton *infoRegular;

@property (nonatomic, strong) RowObject *rowObject;

@end
