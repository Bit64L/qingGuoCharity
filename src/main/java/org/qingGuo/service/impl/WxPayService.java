package org.qingGuo.service.impl;


import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;


@Service
public class WxPayService {
    private String basePath = "/Users/Lwx/Workspace/usst/qingGuoCharity/upload/";
    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;


    public String generateQrcode(String codeurl) {
        File foldler = new File(basePath + "qrcode");
        if (!foldler.exists()) {
            foldler.mkdirs();
        }

        String f_name = codeurl.hashCode() + ".png";
        try {
            File f = new File(basePath + "qrcode", f_name);
            FileOutputStream fio = new FileOutputStream(f);
            MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
            Map hints = new HashMap();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8"); //设置字符集编码类型
            BitMatrix bitMatrix = null;
            bitMatrix = multiFormatWriter.encode(codeurl, BarcodeFormat.QR_CODE, 300, 300, hints);
            BufferedImage image = toBufferedImage(bitMatrix);
            //输出二维码图片流
            ImageIO.write(image, "png", fio);
            return ("/qingguo/upload/qrcode/" + f_name);
        } catch (Exception e1) {
            e1.printStackTrace();
            return null;
        }
    }

    public static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
            }
        }
        return image;
    }
}
