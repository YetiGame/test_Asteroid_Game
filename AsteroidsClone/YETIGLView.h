//
//  YETIGLView.h
//  AsteroidsClone
//
//  Created by Kozlov Nikita on 03.02.14.
//  Copyright (c) 2014 Kozlov Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface YETIGLView : UIView {
    
@private
    /* The pixel dimensions of the backbuffer */
    GLint backingWidth;
    GLint backingHeight;
    
    EAGLContext *context;
    GLuint viewRenderbuffer, viewFramebuffer;
    GLuint depthRenderbuffer;
    
    int m_shaderProgram;
    int m_a_positionHandle;
    int m_a_colorHandle;
    int m_u_mvpHandle;
    
    float m_angle;
    
    NSTimer *animationTimer;
    NSTimeInterval animationInterval;
    
}

@property NSTimeInterval animationInterval;

- (void)startAnimation;
- (void)stopAnimation;
- (void)drawView;


@end
