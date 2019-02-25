package com.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageUtil {
    //1.定义变量保存变量生成后的验证码字符串
    static String code="";
    //2.生成验证码
    public static String createcode(){
        //为了防止每次进来验证码进行拼接，与原来的验证码重新拼接了，在进入循环之前再次置空
        code="";
        String a = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 4; i++) {
            int index = (int)(Math.random()*62);
            char b = a.charAt(index);
            code=code+b;
        }
       return code;
    }

    //查看已经生成的验证码
    public static String getCode(){
        return code;
    }


    //3.生成图片
    public static BufferedImage createimage() {
        BufferedImage bi = new BufferedImage(100,30,BufferedImage.TYPE_INT_RGB);
        //1.得到一个画布
        Graphics g = bi.getGraphics();
        //2.添加背景颜色
        g.setColor(Color.yellow);
        g.fillRect(0,0,100,30);

        //添加干扰线
        for (int i = 0; i < 10; i++) {
            Random r = new Random();
            int red = r.nextInt(256);
            int green = r.nextInt(256);
            int blue = r.nextInt(256);
            Color c = new Color(red,green,blue);
            g.setColor(c);
            int x1 = r.nextInt(101);
            int y1 = r.nextInt(31);
            int x2 = r.nextInt(101);
            int y2 = r.nextInt(31);
            g.drawLine(x1,y1,x2,y2);//画干扰线
            //g.drawOval(x1,y1,x2,y2);//画干扰椭圆
        }
        //3.添加文字
        g.setColor(Color.blue);
        g.setFont(new Font("楷体",Font.BOLD,30));

        String str = getCode();


        //将文字填充到画板中
        g.drawString(str,15,25);


        //5.关闭画布
        g.dispose();

        return bi;
    }
}
