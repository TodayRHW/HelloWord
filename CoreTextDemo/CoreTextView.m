//
//  CoreTextView.m
//  CoreTextDemo
//
//  Created by JackWong on 15/12/29.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import "CoreTextView.h"
#import <CoreText/CoreText.h>

@implementation CoreTextView

- (void)drawText {
    //创建一个可变的属性字符串
    //asldfnlsdkfjalsdkfjaldskfjlasdjf
    NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc] initWithString:@"《见与不见》你见,或者不见我,我就在那里,不悲不喜你念,或者不念我,情就在那里, 不来不去,你爱或者不爱我,爱就在那里,不增不减,你跟,或者不跟我,我的手就在你的手里, 不舍不弃,来我怀里,或者,让我住进你的心里,默然相爱,寂静喜欢"];
    // 1.1.1 设置文字颜色
    [mutableString addAttribute:(id)kCTForegroundColorAttributeName value:(id)[[UIColor redColor] CGColor] range:NSMakeRange(0, 3)];
    // 1.1.2 设置文字的字体
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@" Georgia-Bold", 20, NULL);
    
    [mutableString addAttribute:(id)kCTFontAttributeName value:(__bridge id _Nonnull)(fontRef) range:NSMakeRange(0, mutableString.length)];
    
      CTFontRef fontRef1 = CTFontCreateWithName((CFStringRef)@" Georgia-Bold", 50, NULL);
    [mutableString addAttribute:(id)kCTFontAttributeName value:(__bridge id _Nonnull)(fontRef1) range:NSMakeRange(5, 5)];
    //镂空文字
    [mutableString addAttribute:(id)kCTStrokeWidthAttributeName value:@(5) range:NSMakeRange(10, 3)];
    // 设置镂空文字颜色
    [mutableString addAttribute:(id)kCTStrokeColorAttributeName value:(id)[[UIColor greenColor] CGColor] range:NSMakeRange(10, 3)];
    // 给文字加下划线
    [mutableString addAttribute:(id)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleSingle] range:NSMakeRange(3, 5)];
    // 给文字加双下划线
    [mutableString addAttribute:(id)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleDouble] range:NSMakeRange(7, 8)];
    
    
    // 2.1 设置绘制的 Frame(路径)
    /**
     *  CTFramesetterRef 是 Coretext绘制很重要的一个类,用它来管理所有的字体,颜色属性等和文本显示模块,CTFramesetterCreateWithAttributedString 我们只需要知道他给我们创建一个CTFramesetter
     *
     */
    CTFramesetterRef framesetterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mutableString);
    // 创建绘图路径
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    // 创建绘图的范围
    CGPathAddRect(mutablePath, NULL, CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height - 20));
    // 根据字符串和绘图路径得到 frame
    CTFrameRef frame = CTFramesetterCreateFrame(framesetterRef, CFRangeMake(0, 0), mutablePath, NULL);
    //拿到绘图的上下文对象
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 翻转坐标系

    //让 x,y轴进行移动
    CGContextTranslateCTM(contextRef, 0, self.bounds.size.height);
    //缩放x,y轴,让 y 轴旋转180°
    CGContextScaleCTM(contextRef, 1, -1.0);
    
    CGContextSetTextMatrix(contextRef, CGAffineTransformIdentity);
    
    
    CTFrameDraw(frame, contextRef);
    
    CFRelease(fontRef);
    CFRelease(fontRef1);
    CFRelease(framesetterRef);
    CFRelease(mutablePath);
    CFRelease(frame);
    
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawText];
}


@end
