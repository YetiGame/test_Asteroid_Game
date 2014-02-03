//
//  Shader.fsh
//  AsteroidsClone
//
//  Created by Kozlov Nikita on 01.02.14.
//  Copyright (c) 2014 Kozlov Nikita. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
