package com.dzu.util;

import com.dzu.model.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * 文件导出
 * 
 * @ClassName: ExportPerson
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月26日 下午5:55:14
 *
 */
public class ExportPerson {

	/**
	 * 将列表导出Excel @Title: ExportExcel @Description:
	 * TODO(这里用一句话描述这个方法的作用) @param @param lp @param @param fieldids
	 * 参数说明 @return void 返回类型 @throws
	 */
	public static String ExportExcel(List<Person> lp, List<Required> fieldids, List<Property> prolist,
			HttpServletResponse response) {
		try {
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename=export.xls");
			OutputStream out = response.getOutputStream();
			List<LinkedHashMap<String, Object>> result = new ArrayList<LinkedHashMap<String, Object>>();
			String[] headers = new String[fieldids.size() + 1];
			String[] columns = new String[fieldids.size() + 1];
			headers[0] = "所属部门";
			columns[0] = "fbm";
			for (int i = 0; i < fieldids.size(); i++) {
				headers[i + 1] = fieldids.get(i).getFieldname();
				columns[i + 1] = "f" + String.valueOf(fieldids.get(i).getId());
			}
			for (Person p : lp) {
				LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("fbm", p.getDept().getDept_name());
				map.put("f2", p.getXm());
				map.put("f3", p.getXb());
				map.put("f4", p.getCsny());
				map.put("f5", p.getMz());
				map.put("f6", p.getJg());
				map.put("f7", p.getGj());
				map.put("f8", p.getCjgzsj());
				if (p.getDydp().length() > 0)
					map.put("f9", getContentById(prolist, Integer.valueOf(p.getDydp())));
				map.put("f10", p.getDydpjrsj());
				if (p.getDedp().length() > 0)
					map.put("f11", getContentById(prolist, Integer.valueOf(p.getDedp())));
				map.put("f12", p.getDedpjrsj());
				if (p.getZjlb().length() > 0)
					map.put("f14", getContentById(prolist, Integer.valueOf(p.getZjlb())));
				map.put("f15", p.getHwlxjl());
				map.put("f16", p.getHwlxjlgb());
				if (p.getShxjc().length() > 0)
					map.put("f17", getContentById(prolist, Integer.valueOf(p.getShxjc())));
				map.put("f18", p.getRylb());
				map.put("f19", getContentById(prolist, Integer.valueOf(p.getLrdw())));
				map.put("f20", p.getSfzhm());
				map.put("f21", p.getFzdwjzw());
				if (p.getXrjb().length() > 0)
					map.put("f22", getContentById(prolist, Integer.valueOf(p.getXrjb())));
				map.put("f23", p.getRxzsj());
				map.put("f24", p.getRtjsj());
				map.put("f25", p.getZyjszc());
				if (p.getZcjb().length() > 0)
					map.put("f26", getContentById(prolist, Integer.valueOf(p.getZcjb())));
				map.put("f36", p.getZyzzbx());
				map.put("f37", p.getZycjhshyx());
				map.put("f42", p.getTxdz());
				map.put("f43", p.getYzbm());
				map.put("f44", p.getBgdh());
				map.put("f45", p.getSjhm());
				map.put("f46", p.getDzxx());
				map.put("f47", p.getWxhm());
				map.put("f48", p.getQqhm());
				map.put("f49", p.getBz());
				result.add(map);
			}
			// String[] headers=new String[]{"姓名","电话","身份证号"};
			// String[] columns=new String[]{"realname","tel","card_id"};
			ExportExcelUtils.exportExcel("Export", headers, columns, result, out, "");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 导出pdf @Title: ExportPDF @Description:
	 * TODO(这里用一句话描述这个方法的作用) @param @return 参数说明 @return String 返回类型 @throws
	 */
	public static String ExportPDF(String url, Person p, List<Property> prolist) {
		Document doc = new Document(PageSize.A4, 15, 15, 66, 50); // 页面大小和边距
		try {
			BaseFont bfChinese = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);// 设置字体大小位置
			Font FontChinese = new Font(bfChinese, 12, Font.COURIER);
			Font titleChinese = new Font(bfChinese, 18, Font.COURIER);
			Font footChinese = new Font(bfChinese, 10, Font.COURIER);

			// 定义输出位置并把文档对象装入输出对象中
			double x = (Math.random() * 50);
			PdfWriter.getInstance(doc, new FileOutputStream(url + "pdf/printuser.pdf"));
			// 打开文档对象
			doc.open();
			doc.add(new Paragraph(" "));
			Paragraph title = new Paragraph("人员信息", titleChinese);// 抬头
			title.setAlignment(Element.ALIGN_CENTER); // 居中设置
			title.setLeading(1f);// 设置行间距
			doc.add(title);
			doc.add(new Paragraph(" "));
			float[] f = new float[30];
			for (int i = 0; i < 29; i++)
				f[i] = 13;
			f[29] = 100;

			PdfPTable table = new PdfPTable(30);// 创建一个表格
			table.setTotalWidth(f);
			table.setLockedWidth(true);

			table.addCell(createcell("姓名", FontChinese, 3, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getXm(), FontChinese, 6, 1)); // 将单元格加入table中
			table.addCell(createcell("性别", FontChinese, 3, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getXb(), FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell("出生年月", FontChinese, 4, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getCsny(), FontChinese, 9, 1)); // 将单元格加入table中
			Image jpeg = null;
			if (p.getSczp()!=null&&!p.getSczp().equals("") && p.getSczp().length() > 0) {
				String savePath = ServletActionContext.getRequest().getRealPath("");
				String proName = ServletActionContext.getRequest().getContextPath();
				savePath = savePath.substring(0, savePath.length() - proName.length());
				savePath = savePath + "/uploads/";
				jpeg = Image.getInstance(savePath + p.getSczp());
			} else {
				jpeg = Image.getInstance(url + "resources\\images\\defaultuser.png");
			}
			jpeg.scaleAbsolute(100, 135);
			jpeg.setAlignment(Image.MIDDLE);
			PdfPCell cell = new PdfPCell(jpeg); // 创建单元格并加入内容
			cell.setMinimumHeight(20);
			cell.setRowspan(6);
			table.addCell(cell);

			table.addCell(createcell("民族", FontChinese, 3, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getMz(), FontChinese, 6, 1)); // 将单元格加入table中
			table.addCell(createcell("籍贯", FontChinese, 3, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getJg(), FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell("国籍", FontChinese, 4, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getGj(), FontChinese, 9, 1)); // 将单元格加入table中

			table.addCell(createcell("宗教类别", FontChinese, 6, 0)); // 将单元格加入table中
			if (p.getZjlb().length() > 0) {
				table.addCell(createcell(getContentById(prolist, Integer.valueOf(p.getZjlb())), FontChinese, 6, 1)); // 将单元格加入table中
			} else {
				table.addCell(createcell("", FontChinese, 6, 1)); // 将单元格加入table中
			}
			table.addCell(createcell("海外留学", FontChinese, 6, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getHwlxjl(), FontChinese, 3, 1)); // 将单元格加入table中
			table.addCell(createcell("国别", FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell(p.getHwlxjlgb(), FontChinese, 4, 1)); // 将单元格加入table中

			table.addCell(createcell("新的社会阶层", FontChinese, 6, 0)); // 将单元格加入table中
			if (p.getShxjc().length() > 0) {
				table.addCell(createcell(getContentById(prolist, Integer.valueOf(p.getShxjc())), FontChinese, 8, 1)); // 将单元格加入table中
			} else {
				table.addCell(createcell("", FontChinese, 8, 1)); // 将单元格加入table中
			}
			table.addCell(createcell("参加工作时间", FontChinese, 6, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getCjgzsj(), FontChinese, 9, 1)); // 将单元格加入table中

			table.addCell(createcell("身份证号码", FontChinese, 6, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getSfzhm(), FontChinese, 11, 1)); // 将单元格加入table中
			table.addCell(createcell("列入队伍", FontChinese, 6, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getLrdw() == 1 ? "代表人士" : "后备人才", FontChinese, 6, 1)); // 将单元格加入table中

			table.addCell(createcell("人员类别", FontChinese, 5, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getRylb(), FontChinese, 24, 1)); // 将单元格加入table中

			table.addCell(createcell("工作单位及职务", FontChinese, 7, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getFzdwjzw(), FontChinese, 16, 1)); // 将单元格加入table中
			table.addCell(createcell("现任级别", FontChinese, 5, 0)); // 将单元格加入table中
			if (p.getXrjb().length() > 0) {
				table.addCell(createcell(getContentById(prolist, Integer.valueOf(p.getXrjb())), FontChinese, 3, 1)); // 将单元格加入table中
			} else {
				table.addCell(createcell("", FontChinese, 3, 1)); // 将单元格加入table中

			}

			table.addCell(createcell("任现职时间", FontChinese, 5, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getRxzsj(), FontChinese, 6, 1)); // 将单元格加入table中
			table.addCell(createcell("任同级时间", FontChinese, 5, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getRtjsj(), FontChinese, 6, 1)); // 将单元格加入table中
			table.addCell(createcell("专业技术职称", FontChinese, 6, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getZyjszc(), FontChinese, 4, 1)); // 将单元格加入table中

			table.addCell(createcell("通讯地址", FontChinese, 4, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getTxdz(), FontChinese, 12, 1)); // 将单元格加入table中
			table.addCell(createcell("邮政编码", FontChinese, 4, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getYzbm(), FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell("职称级别", FontChinese, 4, 0)); // 将单元格加入table中
			if (p.getZcjb().length() > 0) {
				table.addCell(createcell(getContentById(prolist, Integer.valueOf(p.getZcjb())), FontChinese, 4, 1)); // 将单元格加入table中
			} else {
				table.addCell(createcell("", FontChinese, 4, 1)); // 将单元格加入table中
			}

			table.addCell(createcell("办公电话", FontChinese, 4, 0)); // 将单元格加入table中
			table.addCell(createcell(p.getBgdh(), FontChinese, 6, 1)); // 将单元格加入table中
			table.addCell(createcell("手机号码", FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell(p.getSjhm(), FontChinese, 6, 1)); // 将单元格加入table中
			table.addCell(createcell("电子信箱", FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell(p.getDzxx(), FontChinese, 6, 1)); // 将单元格加入table中

			table.addCell(createcell("微信号码", FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell(p.getWxhm(), FontChinese, 11, 1)); // 将单元格加入table中
			table.addCell(createcell("QQ号码", FontChinese, 4, 1)); // 将单元格加入table中
			table.addCell(createcell(p.getQqhm(), FontChinese, 11, 1)); // 将单元格加入table中

			PdfPTable t = new PdfPTable(4);
			t.addCell(createcell("第一党派", FontChinese, 1, 0)); // 将单元格加入table中
			if (p.getDydp().length() > 0) {
				t.addCell(createcell(getContentById(prolist, Integer.valueOf(p.getDydp())), FontChinese, 1, 0)); // 将单元格加入table中
			} else {
				t.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中

			}
			t.addCell(createcell("加入时间", FontChinese, 1, 0)); // 将单元格加入table中
			t.addCell(createcell(p.getDydpjrsj(), FontChinese, 1, 0)); // 将单元格加入table中
			t.addCell(createcell("第二党派", FontChinese, 1, 0)); // 将单元格加入table中
			if (p.getDedp().length() > 0) {
				t.addCell(createcell(getContentById(prolist, Integer.valueOf(p.getDedp())), FontChinese, 1, 0)); // 将单元格加入table中
			} else {
				t.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中

			}
			t.addCell(createcell("加入时间", FontChinese, 1, 0)); // 将单元格加入table中
			t.addCell(createcell(p.getDedpjrsj(), FontChinese, 1, 0)); // 将单元格加入table中

			PdfPCell cell0 = createcell("党派信息", FontChinese, 4, 0); // 创建单元格并加入内容
			table.addCell(cell0);
			table.addCell(createcell(t, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t1 = new PdfPTable(8);
			t1.addCell(createcell("毕业院校及专业", FontChinese, 2, 0)); // 将单元格加入table中
			t1.addCell(createcell("开始时间", FontChinese, 1, 0)); // 将单元格加入table中
			t1.addCell(createcell("结束时间", FontChinese, 1, 0)); // 将单元格加入table中
			t1.addCell(createcell("取得学历", FontChinese, 1, 0)); // 将单元格加入table中
			t1.addCell(createcell("所获学位", FontChinese, 1, 0)); // 将单元格加入table中
			t1.addCell(createcell("院校类别", FontChinese, 1, 0)); // 将单元格加入table中
			t1.addCell(createcell("最高学历", FontChinese, 1, 0)); // 将单元格加入table中
			for (Education edu : p.getXlxx()) {
				t1.addCell(createcell(edu.getByyxjzy(), FontChinese, 2, 0)); // 将单元格加入table中
				t1.addCell(createcell(edu.getKssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell(edu.getJssj(), FontChinese, 1, 0)); // 将单元格加入table中
				if (edu.getQdxl().length() > 0) {
					t1.addCell(createcell(getContentById(prolist, Integer.valueOf(edu.getQdxl())), FontChinese, 1, 0)); // 将单元格加入table中
				} else {
					t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				}
				t1.addCell(createcell(getPnameById(prolist,edu.getShxw()), FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell(edu.getType(), FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell(edu.getHight() == 1 ? "是" : "否", FontChinese, 1, 0)); // 将单元格加入table中
			}
			if (p.getXlxx().size() < 1) {
				t1.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
				t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t1.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
			}

			PdfPCell cell1 = createcell("学历信息", FontChinese, 4, 0); // 创建单元格并加入内容
			table.addCell(cell1);
			table.addCell(createcell(t1, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t2 = new PdfPTable(5);
			t2.addCell(createcell("开始时间", FontChinese, 1, 0)); // 将单元格加入table中
			t2.addCell(createcell("结束时间", FontChinese, 1, 0)); // 将单元格加入table中
			t2.addCell(createcell("工作单位及职务", FontChinese, 3, 0)); // 将单元格加入table中
			for (Resume res : p.getGzjl()) {
				t2.addCell(createcell(res.getKssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t2.addCell(createcell(res.getJssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t2.addCell(createcell(res.getGzdwjzw(), FontChinese, 3, 0)); // 将单元格加入table中
			}
			if (p.getGzjl().size() < 1) {
				t2.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t2.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				t2.addCell(createcell("", FontChinese, 3, 0)); // 将单元格加入table中
			}

			PdfPCell cell2 = createcell("工作简历", FontChinese, 4, 0);
			table.addCell(cell2); // 将单元格加入table中
			table.addCell(createcell(t2, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t3 = new PdfPTable(8);
			t3.addCell(createcell("各级人大组织名称", FontChinese, 2, 0)); // 将单元格加入table中
			t3.addCell(createcell("届次", FontChinese, 1, 0)); // 将单元格加入table中
			t3.addCell(createcell("组织级别", FontChinese, 1, 0)); // 将单元格加入table中
			t3.addCell(createcell("安排职务", FontChinese, 1, 0)); // 将单元格加入table中
			t3.addCell(createcell("安排时间", FontChinese, 1, 0)); // 将单元格加入table中
			t3.addCell(createcell("备注", FontChinese, 2, 0)); // 将单元格加入table中
			for (Congress con : p.getMqzgjrdapqk()) {
				t3.addCell(createcell(con.getGjrdzzmc(), FontChinese, 2, 0)); // 将单元格加入table中
				t3.addCell(createcell(con.getJc(), FontChinese, 1, 0)); // 将单元格加入table中
				t3.addCell(createcell(getPnameById(prolist,con.getZzjb()), FontChinese, 1, 0)); // 将单元格加入table中
				t3.addCell(createcell(getPnameById(prolist,con.getApzw()), FontChinese, 1, 0)); // 将单元格加入table中
				t3.addCell(createcell(con.getApsj(), FontChinese, 1, 0)); // 将单元格加入table中
				t3.addCell(createcell(con.getBz(), FontChinese, 2, 0)); // 将单元格加入table中
			}
			if (p.getMqzgjrdapqk().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t3.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t3.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t3.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t3.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t3.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t3.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
				}
			}
			PdfPCell cell3 = createcell("目前在各级人大安排情况", FontChinese, 4, 0);
			table.addCell(cell3); // 将单元格加入table中
			table.addCell(createcell(t3, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t4 = new PdfPTable(7);
			t4.addCell(createcell("各级人大组织名称", FontChinese, 2, 0)); // 将单元格加入table中
			t4.addCell(createcell("届次", FontChinese, 1, 0)); // 将单元格加入table中
			t4.addCell(createcell("组织级别", FontChinese, 1, 0)); // 将单元格加入table中
			t4.addCell(createcell("安排职务", FontChinese, 1, 0)); // 将单元格加入table中
			t4.addCell(createcell("安排时间", FontChinese, 1, 0)); // 将单元格加入table中
			t4.addCell(createcell("安排界别", FontChinese, 1, 0)); // 将单元格加入table中

			for (Political pol : p.getMqzgjzxapqk()) {
				t4.addCell(createcell(pol.getGjzxzzmc(), FontChinese, 2, 0)); // 将单元格加入table中
				t4.addCell(createcell(pol.getJc(), FontChinese, 1, 0)); // 将单元格加入table中
				t4.addCell(createcell(getPnameById(prolist,pol.getZzjb()), FontChinese, 1, 0)); // 将单元格加入table中
				t4.addCell(createcell(getPnameById(prolist,pol.getApzw()), FontChinese, 1, 0)); // 将单元格加入table中
				t4.addCell(createcell(pol.getApsj(), FontChinese, 1, 0)); // 将单元格加入table中
				t4.addCell(createcell(getPnameById(prolist,pol.getApjb()), FontChinese, 1, 0)); // 将单元格加入table中

			}
			if (p.getMqzgjzxapqk().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t4.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t4.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t4.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t4.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t4.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t4.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中

				}
			}
			PdfPCell cell4 = createcell("目前在各级政协安排情况", FontChinese, 4, 0);
			table.addCell(cell4); // 将单元格加入table中
			table.addCell(createcell(t4, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t5 = new PdfPTable(5);
			t5.addCell(createcell("组织名称", FontChinese, 2, 0)); // 将单元格加入table中
			t5.addCell(createcell("开始时间", FontChinese, 1, 0)); // 将单元格加入table中
			t5.addCell(createcell("结束时间", FontChinese, 1, 0)); // 将单元格加入table中
			t5.addCell(createcell("安排职务", FontChinese, 1, 0)); // 将单元格加入table中

			for (Situation sit : p.getXrzwqk()) {
				t5.addCell(createcell(sit.getZzmc(), FontChinese, 2, 0)); // 将单元格加入table中
				t5.addCell(createcell(sit.getRzkssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t5.addCell(createcell(sit.getRzjssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t5.addCell(createcell(getPnameById(prolist,sit.getApzw()), FontChinese, 1, 0)); // 将单元格加入table中

			}
			if (p.getXrzwqk().size() < 4) {
				for (int i = 0; i < 4 - p.getXrzwqk().size(); i++) {
					t5.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t5.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t5.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t5.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				}
			}

			PdfPCell cell5 = createcell("目前在民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等任职情况", FontChinese, 4, 0);
			table.addCell(cell5); // 将单元格加入table中
			table.addCell(createcell(t5, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t6 = new PdfPTable(7);
			t6.addCell(createcell("部门单位名称", FontChinese, 2, 0)); // 将单元格加入table中
			t6.addCell(createcell("特约人员（监督员）名称", FontChinese, 3, 0)); // 将单元格加入table中
			t6.addCell(createcell("开始时间", FontChinese, 1, 0)); // 将单元格加入table中
			t6.addCell(createcell("结束时间", FontChinese, 1, 0)); // 将单元格加入table中

			for (Relevant rele : p.getXrygbmqk()) {
				t6.addCell(createcell(rele.getPqbm(), FontChinese, 2, 0)); // 将单元格加入table中
				t6.addCell(createcell(rele.getTyrymc(), FontChinese, 3, 0)); // 将单元格加入table中
				t6.addCell(createcell(rele.getKssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t6.addCell(createcell(rele.getJssj(), FontChinese, 1, 0)); // 将单元格加入table中
			}
			if (p.getXrygbmqk().size() < 3) {
				for (int i = 0; i < 3 - p.getXrygbmqk().size(); i++) {
					t6.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t6.addCell(createcell("", FontChinese, 3, 0)); // 将单元格加入table中
					t6.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t6.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				}
			}
			PdfPCell cell6 = createcell("现任有关部门单位、特约人员（监督员）情况", FontChinese, 4, 0);
			table.addCell(cell6); // 将单元格加入table中
			table.addCell(createcell(t6, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t16 = new PdfPTable(6);
			t16.addCell(createcell("组织名称", FontChinese, 2, 0)); // 将单元格加入table中
			t16.addCell(createcell("任职开始时间", FontChinese, 1, 0)); // 将单元格加入table中
			t16.addCell(createcell("任职结束时间", FontChinese, 1, 0)); // 将单元格加入table中
			t16.addCell(createcell("安排职务", FontChinese, 2, 0)); // 将单元格加入table中

			for (Social soc : p.getXrqtshzw()) {
				t16.addCell(createcell(soc.getZzmc(), FontChinese, 2, 0)); // 将单元格加入table中
				t16.addCell(createcell(soc.getRzkssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t16.addCell(createcell(soc.getRzjssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t16.addCell(createcell(getPnameById(prolist,soc.getApzw()), FontChinese, 2, 0)); // 将单元格加入table中
			}
			if (p.getXrqtshzw().size() < 3) {
				for (int i = 0; i < 3 - p.getXrqtshzw().size(); i++) {
					t16.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t16.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t16.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t16.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
				}
			}
			PdfPCell cell16 = createcell("现任其他社会职务(人民团体、社会团体、学术及科研机构等)", FontChinese, 4, 0);
			table.addCell(cell16); // 将单元格加入table中
			table.addCell(createcell(t16, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t7 = new PdfPTable(8);
			t7.addCell(createcell("主办单位", FontChinese, 2, 0)); // 将单元格加入table中
			t7.addCell(createcell("班次名称", FontChinese, 2, 0)); // 将单元格加入table中
			t7.addCell(createcell("培训院校", FontChinese, 2, 0)); // 将单元格加入table中
			t7.addCell(createcell("开始时间", FontChinese, 1, 0)); // 将单元格加入table中
			t7.addCell(createcell("结束时间", FontChinese, 1, 0)); // 将单元格加入table中

			for (Training tra : p.getJwnlcjpxqk()) {
				t7.addCell(createcell(tra.getZbdw(), FontChinese, 2, 0)); // 将单元格加入table中
				t7.addCell(createcell(tra.getBcmc(), FontChinese, 2, 0)); // 将单元格加入table中
				t7.addCell(createcell(tra.getPxyx(), FontChinese, 2, 0)); // 将单元格加入table中
				t7.addCell(createcell(tra.getKssj(), FontChinese, 1, 0)); // 将单元格加入table中
				t7.addCell(createcell(tra.getJssj(), FontChinese, 1, 0)); // 将单元格加入table中
			}
			if (p.getJwnlcjpxqk().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t7.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t7.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t7.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t7.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t7.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中

				}
			}
			PdfPCell cell7 = createcell("近五年来参加培训情况", FontChinese, 4, 0);
			table.addCell(cell7); // 将单元格加入table中
			table.addCell(createcell(t7, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t8 = new PdfPTable(6);
			t8.addCell(createcell("授予单位", FontChinese, 2, 0)); // 将单元格加入table中
			t8.addCell(createcell("获奖或受表彰名称", FontChinese, 3, 0)); // 将单元格加入table中
			t8.addCell(createcell("获奖时间", FontChinese, 1, 0)); // 将单元格加入table中

			for (Carry carr : p.getHjhsbzqk()) {
				t8.addCell(createcell(carr.getXydw(), FontChinese, 2, 0)); // 将单元格加入table中
				t8.addCell(createcell(carr.getHjhsbzmc(), FontChinese, 3, 0)); // 将单元格加入table中
				t8.addCell(createcell(carr.getSjsj(), FontChinese, 1, 0)); // 将单元格加入table中
			}
			if (p.getHjhsbzqk().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t8.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t8.addCell(createcell("", FontChinese, 3, 0)); // 将单元格加入table中
					t8.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中

				}
			}
			PdfPCell cell8 = createcell("获奖或受表彰情况", FontChinese, 4, 0);
			table.addCell(cell8); // 将单元格加入table中
			table.addCell(createcell(t8, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPCell cell9 = createcell("主要政治表现", FontChinese, 4, 0);
			cell9.setMinimumHeight(80);
			table.addCell(cell9); // 将单元格加入table中
			table.addCell(createcell(p.getZyzzbx(), FontChinese, 26, 0)); // 将单元格加入table中

			PdfPCell cell10 = createcell("主要成就和社会影响", FontChinese, 4, 0);
			cell10.setMinimumHeight(80);
			table.addCell(cell10); // 将单元格加入table中
			table.addCell(createcell(p.getZycjhshyx(), FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t11 = new PdfPTable(3);
			t11.addCell(createcell("近三年以来", FontChinese, 1, 0)); // 将单元格加入table中
			t11.addCell(createcell("考核结果", FontChinese, 2, 0)); // 将单元格加入table中

			for (Assessment assess : p.getNdkhqk()) {
				t11.addCell(createcell(assess.getSj(), FontChinese, 1, 0)); // 将单元格加入table中
				t11.addCell(createcell(assess.getKhjg(), FontChinese, 2, 0)); // 将单元格加入table中
			}
			if (p.getNdkhqk().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t11.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t11.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
				}
			}
			PdfPCell cell11 = createcell("年度考核情况", FontChinese, 4, 0);
			table.addCell(cell11); // 将单元格加入table中
			table.addCell(createcell(t11, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t12 = new PdfPTable(5);
			t12.addCell(createcell("综合评价结果", FontChinese, 2, 0)); // 将单元格加入table中
			t12.addCell(createcell("评价单位", FontChinese, 2, 0)); // 将单元格加入table中
			t12.addCell(createcell("评价时间", FontChinese, 1, 0)); // 将单元格加入table中

			for (Evaluation eval : p.getZhpjqk()) {
				t12.addCell(createcell(eval.getZhpjjg(), FontChinese, 2, 0)); // 将单元格加入table中
				t12.addCell(createcell(eval.getPjdw(), FontChinese, 2, 0)); // 将单元格加入table中
				t12.addCell(createcell(eval.getPjsj(), FontChinese, 1, 0)); // 将单元格加入table中
			}
			if (p.getZhpjqk().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t12.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t12.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
					t12.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
				}
			}
			PdfPCell cell12 = createcell("综合评价情况", FontChinese, 4, 0);
			table.addCell(cell12); // 将单元格加入table中
			table.addCell(createcell(t12, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPTable t13 = new PdfPTable(6);
			t13.addCell(createcell("称谓", FontChinese, 1, 0)); // 将单元格加入table中
			t13.addCell(createcell("姓名", FontChinese, 1, 0)); // 将单元格加入table中
			t13.addCell(createcell("出生年月", FontChinese, 1, 0)); // 将单元格加入table中
			t13.addCell(createcell("政治面貌", FontChinese, 1, 0)); // 将单元格加入table中
			t13.addCell(createcell("工作单位及职务", FontChinese, 2, 0)); // 将单元格加入table中

			for (Family fam : p.getJtcyjzyshgx()) {
				t13.addCell(createcell(fam.getCw(), FontChinese, 1, 0)); // 将单元格加入table中
				t13.addCell(createcell(fam.getXm(), FontChinese, 1, 0)); // 将单元格加入table中
				t13.addCell(createcell(fam.getCsny(), FontChinese, 1, 0)); // 将单元格加入table中
				t13.addCell(createcell(fam.getZzmm(), FontChinese, 1, 0)); // 将单元格加入table中
				t13.addCell(createcell(fam.getGzdwjzw(), FontChinese, 2, 0)); // 将单元格加入table中
			}
			if (p.getJtcyjzyshgx().size() < 1) {
				for (int i = 0; i < 1; i++) {
					t13.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t13.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t13.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t13.addCell(createcell("", FontChinese, 1, 0)); // 将单元格加入table中
					t13.addCell(createcell("", FontChinese, 2, 0)); // 将单元格加入table中
				}
			}
			PdfPCell cell13 = createcell("家庭成员及重要社会关系", FontChinese, 4, 0);
			table.addCell(cell13); // 将单元格加入table中
			table.addCell(createcell(t13, FontChinese, 26, 0)); // 将单元格加入table中

			PdfPCell cell14 = createcell("备注", FontChinese, 4, 0);
			cell14.setMinimumHeight(80);
			table.addCell(cell14); // 将单元格加入table中
			table.addCell(createcell(p.getBz(), FontChinese, 26, 0)); // 将单元格加入table中

			doc.add(table);
			doc.add(new Paragraph(" "));
			Paragraph foot = new Paragraph("打印时间：" + BasicUtil.getCurrentTimeOfDay() + "    技术支持：德州学院", footChinese);
			foot.setAlignment(Element.ALIGN_CENTER);
			foot.setLeading(1f);// 设置行间距
			doc.add(foot);
			// 关闭文档对象，释放资源
			doc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pdf/printuser.pdf";
	}

	/**
	 * 遍历属性，根据属性获取内容 @Title: getContentById @param @param l @param @param
	 * id @param @return 参数说明 @return String 返回类型 @throws
	 */
	private static String getContentById(List<Property> l, int id) {
		if (id == 1) {
			return "代表人士";
		} else if (id == 2) {
			return "后备人才";
		}
		for (Property p : l) {
			if (p.getId() == id) {
				return p.getContent();
			}
		}
		return "";
	}

	private static String getPnameById(List<Property> l, String id) {
		String res="";
		if (!id.equals("")) {
			int ids = Integer.valueOf(id);
			for (Property p : l) {
				if (p.getId() == ids) {
					res= p.getContent();
				}
			}
		}
		return res;
	}

	/**
	 * 创建一个单元格
	 * 
	 * @param str
	 * @param font
	 * @param col
	 * @param row
	 * @param align
	 * @return
	 */
	private static PdfPCell createcell(String str, Font font, int col, int align) {
		PdfPCell cell = new PdfPCell(new Paragraph(str, font)); // 创建单元格并加入内容
		cell.setMinimumHeight(23);
		cell.setUseAscender(true);
		cell.setColspan(col);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER); // 水平居中
		cell.setVerticalAlignment(Cell.ALIGN_MIDDLE);
		return cell;
	}

	private static PdfPCell createcell(PdfPTable t, Font font, int col, int align) {
		PdfPCell cell = new PdfPCell(t); // 创建单元格并加入内容
		cell.setMinimumHeight(23);
		cell.setUseAscender(true);
		cell.setColspan(col);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER); // 水平居中
		cell.setVerticalAlignment(Cell.ALIGN_MIDDLE);
		return cell;
	}
}
