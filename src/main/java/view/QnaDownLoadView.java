package view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import dao.manager2DAO;

//�ٿ�ε� â���� ���� ���� ��������
public class QnaDownLoadView extends AbstractView{

	
		private manager2DAO man2Dao;
		public QnaDownLoadView() {
			System.out.println("QNA download view");
		}
	
		
		public void setMan2Dao(manager2DAO man2Dao) {
			this.man2Dao=man2Dao;
		}


		@Override
		protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			
				int q_num=Integer.parseInt(request.getParameter("q_num"));
				//System.out.println("num::  "+num);
				//System.out.println("model.num:"+model.get("num"));
				String root=request.getSession().getServletContext().getRealPath("/");
				//root+"temp/"
				
				
				String saveDirectory=root+"temp"+File.separator;
		
				String q_image=man2Dao.getFile(q_num);
				String fileName=q_image.substring(q_image.indexOf("_")+1);//���� ���ϸ�
				
				
			
				//���ϸ��� �ѱ��϶� ���ڵ� �۾��� �Ѵ�.
				String str=URLEncoder.encode(fileName,"UTF-8");
				
				str=str.replaceAll("\\+", "%20");
					//������ Ÿ��  �����Դϴ�. �̺κ���
				response.setContentType("application/octet-stream");
				
				//�ٿ�ε�â�� ������ ���ϸ��� ������
				response.setHeader("Content-Disposition", "attachment;filename="+str+";");
				
				//������ ����� ������ �о�� Ŭ���̾�Ʈ�� ������ش�.
				FileCopyUtils.copy(new FileInputStream(new File(saveDirectory,q_image)),response.getOutputStream()); 
				
		}
		
}//end class

