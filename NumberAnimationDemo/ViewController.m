#import "ViewController.h"
#import "UICountingLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 260, 200, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"点击查看" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonAction{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 260, 200, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"点击查看" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // make one that counts up
    UICountingLabel* myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    myLabel.method = UILabelCountingMethodLinear;
    myLabel.format = @"%d";
    [self.view addSubview:myLabel];
    [myLabel countFrom:1 to:10 withDuration:3.0];
    
    // make one that counts up from 5% to 10%, using ease in out (the default)
    UICountingLabel* countPercentageLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 50, 200, 40)];
    [self.view addSubview:countPercentageLabel];
    countPercentageLabel.format = @"%.1f%%";
    [countPercentageLabel countFrom:5 to:10];
    
    
    
    // count up using a string that uses a number formatter
    UICountingLabel* scoreLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 90, 200, 40)];
    [self.view addSubview:scoreLabel];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    scoreLabel.formatBlock = ^NSString* (CGFloat value)
    {
        NSString* formatted = [formatter stringFromNumber:@((int)value)];
        return [NSString stringWithFormat:@"Score: %@",formatted];
    };
    scoreLabel.method = UILabelCountingMethodEaseOut;
    [scoreLabel countFrom:0 to:10000 withDuration:2.5];
    
    // count up with attributed string
    NSInteger toValue = 100;
    UICountingLabel* attributedLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 130, 200, 40)];
    [self.view addSubview:attributedLabel];
    attributedLabel.attributedFormatBlock = ^NSAttributedString* (CGFloat value)
    {
        NSDictionary* normal = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-UltraLight" size: 20] };
        NSDictionary* highlight = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 20] };
        
        NSString* prefix = [NSString stringWithFormat:@"%d", (int)value];
        NSString* postfix = [NSString stringWithFormat:@"/%d", (int)toValue];
        
        NSMutableAttributedString* prefixAttr = [[NSMutableAttributedString alloc] initWithString: prefix
                                                                                       attributes: highlight];
        NSAttributedString* postfixAttr = [[NSAttributedString alloc] initWithString: postfix
                                                                          attributes: normal];
        [prefixAttr appendAttributedString: postfixAttr];
        
        return prefixAttr;
    };
    [attributedLabel countFrom:0 to:toValue withDuration:2.5];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
