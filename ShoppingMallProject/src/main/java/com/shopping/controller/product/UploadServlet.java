package com.shopping.controller.product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shopping.dao.ProductDao;
import com.shopping.model.Product;

@MultipartConfig
@WebServlet("/product/uploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "uploads"; 
	private ProductDao productDao = new ProductDao();
    
    public UploadServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = getServletContext().getRealPath("/static");

		if (realPath == null) {
		    throw new RuntimeException("웹 애플리케이션의 실제 경로를 가져올 수 없습니다.");
		}

		String uploadPath = realPath;
		if (uploadPath.contains(".metadata")) {
		    uploadPath = uploadPath.split("\\\\.metadata")[0];
		}

		uploadPath += File.separator + "ShoppingMallProject" + File.separator + "src" + File.separator + "main" +  File.separator + "webapp" + File.separator +  UPLOAD_DIR;

        // 업로드 디렉토리가 없으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        List<String> imgList = new ArrayList<String>();
        int loop = 0;
        try {
            // 여러 개의 파일을 처리하는 경우
            for (Part filePart : request.getParts()) {
                // 'img'라는 name 속성으로 파일이 전달된 경우만 처리
                if ("img".equals(filePart.getName())) {
                	if(loop >= 3) {
                		break;
                	}
                	
                    // 파일의 원본 이름을 얻음
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                    // 파일이 업로드될 경로 (고유한 이름을 사용하여 덮어쓰지 않도록 함)
                    String filePath = uploadPath + File.separator + fileName;

                    // 파일을 해당 경로에 저장
                    filePart.write(filePath);

                    // 파일이 저장된 후 응답 메시지
                    response.getWriter().println("파일 업로드 성공: " + fileName);
                    imgList.add(fileName);
                    
                    loop++;
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("파일 업로드 실패: " + e.getMessage());
        }
        
        System.out.println(imgList);
        
        String imgPath = "localhost:" + System.getProperty("server.port") + "/ShoppingMallProject/";
        
        String img1 = "";
        String img2 = "";
        String img3 = "";
        
        if(imgList.size() > 2) {
        	img3 = imgPath + UPLOAD_DIR + "/" + imgList.get(2);
        } if(imgList.size() > 1) {
        	img2 = imgPath + UPLOAD_DIR + "/" + imgList.get(1);
        } if(imgList.size() > 0) {
        	img1 = imgPath + UPLOAD_DIR + "/" + imgList.get(0);
        }
        
        System.out.println(img1);
        System.out.println(img2);
        System.out.println(img3);
        
        // 이미지 저장 실패
        if(img1.isEmpty()) {
        	response.sendRedirect("/ShoppingMallProject/main");
        }
        
        Product product = createProduct(request, img1, img2, img3);
        System.out.println(product);
		
		boolean success = productDao.insertProduct(product);
		
		// 상품 데이터 저장실패
		if(!success) {
			response.sendRedirect("/ShoppingMallProject/main");
		}
		
		response.sendRedirect("/ShoppingMallProject/product/manage");
    }
	
	private Product createProduct(HttpServletRequest request, String img1, String img2, String img3) {
		Long categoryId = Long.parseLong(request.getParameter("categoryId"));
		String productName = request.getParameter("productName");
		double price = Double.valueOf(request.getParameter("price"));
		double quantity = Double.valueOf(request.getParameter("quantity"));
		String brand = request.getParameter("brand");
		String description = request.getParameter("description");
		
		Product product = new Product();
		product.setCategoryId(categoryId);
		product.setName(productName);
		product.setImg1(img1);
		product.setImg2(img2);
		product.setImg3(img3);
		product.setPrice(price);
		product.setQuantity(quantity);
		product.setBrand(brand);
		product.setDescription(description);
		
		return product;
	}
}
