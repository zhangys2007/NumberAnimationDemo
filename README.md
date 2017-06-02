# NumberAnimationDemo
iOS实现数字变化的动画效果
一、使用UICountingLabel

1. 初始化

UICountingLabel 继承 UILabel, 初始化和 UILabel 一样, 如下:

UICountingLabel* myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
[self.view addSubview:myLabel];
2. 设置文本样式

可以这样设置:

myLabel.format = @"%d";
也可以使用 block设置:

myLabel.formatBlock = ^NSString* (CGFloat value) {    
    NSInteger years = value / 12;
    NSInteger months = (NSInteger)value % 12;
    if (years == 0) {
        return [NSString stringWithFormat: @"%ld months", (long)months];
    }
    else {
        return [NSString stringWithFormat: @"%ld years, %ld months", (long)years, (long)months];
    }
};
3. 设置变化范围及动画时间

[myLabel countFrom:50 to:100 withDuration:5.0f];
就这么简单!

二、实例效果

1. 整数样式数字的变化

代码如下:

UICountingLabel *myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel.frame)+1, 280, 45)];
myLabel.textAlignment = NSTextAlignmentCenter;
myLabel.font = [UIFont fontWithName:@"Avenir Next" size:48];
myLabel.textColor = [UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
[self.view addSubview:myLabel];
//设置格式
myLabel.format = @"%d";
//设置变化范围及动画时间
[self.myLabel countFrom:0
                         to:100
               withDuration:1.0f];
效果图如下:


整数样式
2. 浮点数样式数字的变化

代码如下:

UICountingLabel *myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel.frame)+1, 280, 45)];
myLabel.textAlignment = NSTextAlignmentCenter;
myLabel.font = [UIFont fontWithName:@"Avenir Next" size:48];
myLabel.textColor = [UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
[self.view addSubview:myLabel];
//设置格式
myLabel.format = @"%.2f";
//设置变化范围及动画时间
[self.myLabel countFrom:0.00
                         to:3198.23
               withDuration:1.0f];
效果图如下:


浮点数样式
3. 带有千分位分隔符的浮点数样式

由于UICountingLabel没有这种样式, 所以稍微需要修改一下UICountingLabel文件.
首先在UICountingLabel.h头文件中增加一个属性, 如下图:


添加positiveFormat属性

接着在UICountingLabel.m文件里面- (void)setTextValue:(CGFloat)value方法中添加如下代码:


添加此段代码
这样UICountingLabel就可以实现这种样式了.

下面开始实现这种样式, 代码如下:

UICountingLabel *myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel.frame)+1, 280, 45)];
myLabel.textAlignment = NSTextAlignmentCenter;
myLabel.font = [UIFont fontWithName:@"Avenir Next" size:48];
myLabel.textColor = [UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
[self.view addSubview:myLabel];
//设置格式
myLabel.format = @"%.2f";
//设置分隔符样式
myLabel.positiveFormat = @"###,##0.00";
//设置变化范围及动画时间
[self.myLabel countFrom:0.00
                    to:3048.64
          withDuration:1.0f];
效果图如下:


带有千分位分隔符的浮点数
