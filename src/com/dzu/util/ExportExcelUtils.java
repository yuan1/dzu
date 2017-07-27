package com.dzu.util;

import java.io.OutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

/**
 * @Title: ExportExcelUtils.java
 * @Package com.dzu.util
 * @Description: 导出EXCEL工具类，适用于单行表头的表格
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:49:51
 * @version V1.0
 */
public class ExportExcelUtils {

	/**
	 * 导出Excel的方法
	 * @param title
	 *            excel中的sheet名称
	 * @param headers
	 *            表头
	 * @param columns
	 *            表头对应的数据库中的列名
	 * @param result
	 *            结果集
	 * @param out
	 *            输出流
	 * @param pattern
	 *            时间格式
	 * @throws Exception
	 */
	public static void exportExcel(String title, String[] headers, String[] columns,
			List<LinkedHashMap<String, Object>> result, OutputStream out, String pattern) throws Exception {
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet(title);
		// 设置默认高度（2015.04.22）
		sheet.setDefaultRowHeightInPoints(20);
		// 设置表格默认列宽度为20个字节
		sheet.setDefaultColumnWidth(20);
		// 生成一个样式
		HSSFCellStyle style = workbook.createCellStyle();
		// style.setWrapText(true);// 自动换行(2015.04.22)
		// 设置这些样式
		// 默认样式颜色修改为白色(2015.04.22)
		style.setFillForegroundColor(HSSFColor.WHITE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(CellStyle.BORDER_THIN);
		style.setBorderLeft(CellStyle.BORDER_THIN);
		style.setBorderRight(CellStyle.BORDER_THIN);
		style.setBorderTop(CellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		// 生成一个字体
		HSSFFont font = workbook.createFont();
		font.setColor(HSSFColor.BLACK.index);
		// font.setFontHeightInPoints((short) 12);
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
		// 把字体应用到当前的样式
		style.setFont(font);
		// 指定当单元格内容显示不下时自动换行
		style.setWrapText(true);
		/*
		 * 以下可以用于设置导出的数据的样式
		 * // 生成并设置另一个样式
		 * HSSFCellStyle style2 = workbook.createCellStyle();
		 * style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
		 * style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		 * style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		 * style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		 * style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		 * style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		 * style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		 * style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 * // 生成另一个字体
		 * HSSFFont font2 = workbook.createFont();
		 * font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		 * // 把字体应用到当前的样式
		 * style2.setFont(font2);
		 * // 声明一个画图的顶级管理器
		 * HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		 * // 定义注释的大小和位置,详见文档
		 * HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
		 * 0, 0, 0, (short) 4, 2, (short) 6, 5));
		 * // 设置注释内容
		 * comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
		 * // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
		 * comment.setAuthor("leno");
		 */
		// 产生表格标题行
		HSSFRow row = sheet.createRow(0);
		for (int i = 0; i < headers.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellStyle(style);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellValue(text);
		}
		// 遍历集合数据，产生数据行
		if (result != null) {
			int index = 1;
			for (LinkedHashMap<String, Object> m : result) {
				row = sheet.createRow(index);
				int cellIndex = 0;
				for (String s : columns) {
					HSSFCell cell = row.createCell(cellIndex);
					// cell.setCellStyle(style2);
					HSSFRichTextString richString = new HSSFRichTextString(m.get(s) == null ? "" : m.get(s).toString());
					// HSSFFont font3 = workbook.createFont();
					// font3.setColor(HSSFColor.BLUE.index);
					// richString.applyFont(font3);
					cell.setCellValue(richString);
					cellIndex++;
				}
				index++;
			}
		}
		workbook.write(out);
	}
}
