package com.controller.before;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ValidateCodeController {
	private char code[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
			'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
			'z'};
	private static final int WIDTH = 60;
	private static final int HEIGHT = 25;
	private static final int LENGTH = 4;
	//处理验证码请求
	@RequestMapping("/validateCode")
	public void validateCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 设置响应报头信息
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 设置响应的MIME类型
		response.setContentType("image/jpeg");

		BufferedImage bufferedImage = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);
		Font mFont = new Font("Arial", Font.TRUETYPE_FONT, 15);
		Graphics graphics = bufferedImage.getGraphics();
		Random rd = new Random();

		// 设置背景颜色
		graphics.setColor(new Color(rd.nextInt(50) + 200, rd.nextInt(50) + 200, rd
				.nextInt(50) + 200));
		graphics.fillRect(0, 0, WIDTH, HEIGHT);

		// 设置字体
		graphics.setFont(mFont);

		// 画边框
		graphics.setColor(Color.black);
		graphics.drawRect(0, 0, WIDTH - 1, HEIGHT - 1);

		// 随机产生的验证码
		String result = "";
		for (int i = 0; i < LENGTH; ++i) {
			result += code[rd.nextInt(code.length)];
		}
		HttpSession se = request.getSession();
		se.setAttribute("code", result);

		// 画验证码
		for (int i = 0; i < result.length(); i++) {
			graphics.setColor(new Color(rd.nextInt(200), rd.nextInt(200), rd
					.nextInt(200)));
			graphics.drawString(result.charAt(i) + "", 14 * i + 2, 20);
		}

		// 随机产生3个干扰线
		for (int i = 0; i < 3; i++) {
			graphics.setColor(new Color(rd.nextInt(200), rd.nextInt(200), rd
					.nextInt(200)));
			int x1 = rd.nextInt(WIDTH);
			int x2 = rd.nextInt(WIDTH);
			int y1 = rd.nextInt(HEIGHT);
			int y2 = rd.nextInt(HEIGHT);
			graphics.drawLine(x1, y1, x2, y2);
		}

		// 释放图形资源
		graphics.dispose();
		try {
			OutputStream os = response.getOutputStream();

			// 输出图像到页面
			ImageIO.write(bufferedImage, "JPEG", os);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
