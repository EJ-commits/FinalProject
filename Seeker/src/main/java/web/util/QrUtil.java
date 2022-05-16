package web.util;

import java.awt.image.BufferedImage;
import java.io.UnsupportedEncodingException;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
=======
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
>>>>>>> chat
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

<<<<<<< HEAD
import web.service.face.ReserveService;



public class QrUtil {

	@Autowired
	static ReserveService resService;	
	
	public static BufferedImage makeQR(String content) throws UnsupportedEncodingException, WriterException {
	
	content = new String(content.getBytes("UTF-8"), "ISO-8859-1");
	QRCodeWriter qrCodeWriter = new QRCodeWriter();
	BitMatrix matrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, 400, 400);
//	MatrixToImageConfig config = new MatrixToImageConfig(0x9fd09d ,0xffffff);
=======
public class QrUtil {

	public static BufferedImage makeQR(String context) throws UnsupportedEncodingException, WriterException {
	
	context = new String(context.getBytes("UTF-8"), "ISO-8859-1");
	QRCodeWriter qrCodeWriter = new QRCodeWriter();
	BitMatrix matrix = qrCodeWriter.encode(context, BarcodeFormat.QR_CODE, 400, 400);
	MatrixToImageConfig config = new MatrixToImageConfig(0x9fd09d ,0xffffff);
>>>>>>> chat
	BufferedImage qrCode = MatrixToImageWriter.toBufferedImage(matrix);
	
	return qrCode;
		
	}

	
}
