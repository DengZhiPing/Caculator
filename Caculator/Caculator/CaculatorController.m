//
//  CaculatorController.m
//  FightingTask
//
//  Created by dengzhiping on 2016/11/7.
//  Copyright © 2016年 szkl. All rights reserved.
//

#import "CaculatorController.h"

typedef NS_ENUM(NSInteger,Operator){
    OperatorAdd = 0,
    OperatorSubtract,
    OperatorMutiply,
    OperatorDivide,
};

@interface CaculatorController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLable;
@property (weak, nonatomic) IBOutlet UIButton *ACButton; //AC
@property (weak, nonatomic) IBOutlet UIButton *AddSubtractButton;//+/_
@property (weak, nonatomic) IBOutlet UIButton *PercentageButton;//%
@property (weak, nonatomic) IBOutlet UIButton *SevenButton;//7
@property (weak, nonatomic) IBOutlet UIButton *EightButton;//8
@property (weak, nonatomic) IBOutlet UIButton *NineButton;//9
@property (weak, nonatomic) IBOutlet UIButton *DevideButton;// /
@property (weak, nonatomic) IBOutlet UIButton *FourButton;//4
@property (weak, nonatomic) IBOutlet UIButton *FiveButton;//5
@property (weak, nonatomic) IBOutlet UIButton *SixButton;//6
@property (weak, nonatomic) IBOutlet UIButton *OneButton;//1
@property (weak, nonatomic) IBOutlet UIButton *TwoButton;//2
@property (weak, nonatomic) IBOutlet UIButton *ThreeButton;//3
@property (weak, nonatomic) IBOutlet UIButton *ZeroButton;//0
@property (weak, nonatomic) IBOutlet UIButton *DecimalPointButton;//.
@property (weak, nonatomic) IBOutlet UIButton *EqualButton;//=
@property (weak, nonatomic) IBOutlet UIButton *multiplyButton;//*
@property (weak, nonatomic) IBOutlet UIButton *SubtractButton;//-
@property (weak, nonatomic) IBOutlet UIButton *AddButton;//+


@property (nonatomic, retain) NSMutableString *numberStr;
@property (nonatomic, strong) NSMutableArray *numberArray;
@end

@implementation CaculatorController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.numberStr = [[NSMutableString alloc] initWithCapacity:40];
    self.numberArray = [NSMutableArray array];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ACButton:(id)sender {
    [self.numberStr deleteCharactersInRange:NSMakeRange(0, _numberStr.length)];
    [self.numberLable setText:@"0"];
    
}
- (IBAction)AddSubtractButton:(id)sender {
}
- (IBAction)PercentageButton:(id)sender {
}

- (IBAction)SevenButton:(id)sender {
    [self.numberStr appendString:@"7"];
    [self.numberLable setText:self.numberStr];
}

- (IBAction)EightButton:(id)sender {
    [self.numberStr appendString:@"8"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)NineButton:(id)sender {
    [self.numberStr appendString:@"9"];
    [self.numberLable setText:self.numberStr];
}

- (IBAction)FourButton:(id)sender {
    [self.numberStr appendString:@"4"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)FiveButton:(id)sender {
    [self.numberStr appendString:@"5"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)SixButton:(id)sender {
    [self.numberStr appendString:@"6"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)OneButton:(id)sender {
    [self.numberStr appendString:@"1"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)TwoButton:(id)sender {
    [self.numberStr appendString:@"2"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)ThreeButton:(id)sender {
    [self.numberStr appendString:@"3"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)ZeroButton:(id)sender {
    if ([self.numberLable.text isEqualToString:@"0"]) {
        return;
    }
    [self.numberStr appendString:@"0"];
    [self.numberLable setText:self.numberStr];
}
- (IBAction)PointButton:(id)sender {
    if ([self.numberStr containsString:@"."]) {
        return;
    }
    
    if ([self.numberLable.text isEqualToString:@"0"]) {
        [self.numberStr appendFormat:@"0."];
        [self.numberLable setText:self.numberStr];
        return;
    }
    
    [self.numberStr appendString:@"."];
    [self.numberLable setText:self.numberStr];
    
}
- (IBAction)EqualButton:(id)sender {
    if ( [self.numberStr containsString:@"+"]) {
        
        [self.numberLable setText:[self resultString:self.numberStr parentStringType:OperatorAdd]];
       
    }else if([self.numberStr containsString:@"-"]){
        
        [self.numberLable setText:[self resultString:self.numberStr parentStringType:OperatorSubtract]];
        
    }else if ([self.numberStr containsString:@"×"]) {
        
        [self.numberLable setText:[self resultString:self.numberStr parentStringType:OperatorMutiply]];

    }else if ([self.numberStr containsString:@"÷"]) {
        
        [self.numberLable setText:[self resultString:self.numberStr parentStringType:OperatorDivide]];
    }else {
        
        [self.numberLable setText:@"0"];
     }
    
    [self.numberStr deleteCharactersInRange:NSMakeRange(0, _numberStr.length)];
    
}

- (IBAction)multiplyButton:(id)sender {
    if ([self.numberStr containsString:@"+"] || [self.numberStr containsString:@"-"] ||[self.numberStr containsString:@"÷"] || [self.numberLable.text isEqualToString:@"0."]  ) {
        return;
    }
    
    if (![self.numberStr containsString:@"×"]) {
        [self.numberStr appendString:@"×"];
        [self.numberLable setText:self.numberStr];
    }
}
- (IBAction)SubtractButton:(id)sender {
    
    if ([self.numberStr containsString:@"+"] || [self.numberStr containsString:@"×"] ||[self.numberStr containsString:@"÷"]  || [self.numberLable.text isEqualToString:@"0."] ) {
        return;
    }
    if (![self.numberStr containsString:@"-"]) {
        [self.numberStr appendString:@"-"];
        [self.numberLable setText:self.numberStr];
    }
}
- (IBAction)AddBUtton:(id)sender {
    if ([self.numberStr containsString:@"-"] || [self.numberStr containsString:@"×"] ||[self.numberStr containsString:@"÷"]  || [self.numberLable.text isEqualToString:@"0."] ) {
        return;
    }
    if (![self.numberStr containsString:@"+"]) {
        [self.numberStr appendString:@"+"];
        [self.numberLable setText:self.numberStr];
    }
}

- (IBAction)DevideButton:(id)sender {
    
    if ([self.numberStr containsString:@"+"] || [self.numberStr containsString:@"×"] ||[self.numberStr containsString:@"-"]  || [self.numberLable.text isEqualToString:@"0."] ) {
        return;
    }
    
    if (![self.numberStr containsString:@"÷"]) {
        [self.numberStr appendString:@"÷"];
        [self.numberLable setText:self.numberStr];
    }
}

- (NSString *)resultString:(NSString *)parentString parentStringType:(Operator )operatorType {
    
    switch (operatorType) {
        case 0:
        {
            NSArray *numSubStrArray = [parentString componentsSeparatedByString:@"+"];
            return numSubStrArray.count==2?[NSString stringWithFormat:@"%.2f",[numSubStrArray.firstObject floatValue] + [numSubStrArray.lastObject floatValue]]:@"erro";
 
        }
            break;
        case 1:
        {
            NSArray *numSubStrArray = [parentString componentsSeparatedByString:@"-"];
            return numSubStrArray.count==2?[NSString stringWithFormat:@"%.2f",[numSubStrArray.firstObject floatValue] - [numSubStrArray.lastObject floatValue]]:@"erro";
 
        }
            break;
        case 2:
        {
            NSArray *numSubStrArray = [parentString componentsSeparatedByString:@"×"];
            return numSubStrArray.count==2?[NSString stringWithFormat:@"%.2f",[numSubStrArray.firstObject floatValue] * [numSubStrArray.lastObject floatValue]]:@"erro";

        }
            break;
            
        default:{
            NSArray *numSubStrArray = [parentString componentsSeparatedByString:@"÷"];
            return numSubStrArray.count==2?[NSString stringWithFormat:@"%.2f",[numSubStrArray.firstObject floatValue] / [numSubStrArray.lastObject floatValue]]:@"erro";

        }
            break;
    }

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
