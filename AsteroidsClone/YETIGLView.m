//
//  YETIGLView.m
//  AsteroidsClone
//
//  Created by Kozlov Nikita on 03.02.14.
//  Copyright (c) 2014 Kozlov Nikita. All rights reserved.
//

#import "YETIGLView.h"

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>
#include <OpenGLES/ES2/gl.h>


#define USE_DEPTH_BUFFER 0



bool ReadFile(uint8_t* buffer, int bufferSize, NSString* filename)
{
    memset(buffer, 0, bufferSize);
    
    NSString* pathStr = [[NSString alloc] initWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], filename];
    const char* path = [pathStr cStringUsingEncoding:NSASCIIStringEncoding];
    FILE* fin = fopen(path, "ra");
    if (fin == NULL)
        return false;
    [pathStr release];
    
    fread(buffer, 1, bufferSize, fin);
    
    fclose(fin);
    return true;
}




int LoadShader (GLenum type, const uint8_t* source)
{
    const unsigned int shader = glCreateShader(type);
    if (shader == 0)
        return 0;
    
    glShaderSource(shader, 1, (const GLchar**)&source, NULL);
    glCompileShader(shader);
    
    int success;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &success);
    if (success == 0)
    {
        char errorMsg[2048];
        glGetShaderInfoLog(shader, sizeof(errorMsg), NULL, errorMsg);
        printf("Compile error: %s\n", errorMsg);
        glDeleteShader(shader);
        return 0;
    }
    
    return shader;
}




@implementation YETIGLView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
