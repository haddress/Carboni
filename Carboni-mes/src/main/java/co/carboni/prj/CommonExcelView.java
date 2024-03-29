package co.carboni.prj;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

@Component
public class CommonExcelView extends AbstractXlsxView {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonExcelView.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Sheet sheet = workbook.createSheet("Datatypes in Java");
		Row row;
		Cell cell;
		int rowNum = 0;



		String file_name = (String) model.get("filename") // + System.currentTimeMillis()
				+ ".xlsx";
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file_name + "\"");

		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		headerStyle.setBorderTop(BorderStyle.THIN);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderBottom(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		
		CellStyle bodyStyle = workbook.createCellStyle();
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

		// header 출력
		String[] headers = (String[]) model.get("headers");
		if (headers != null) {
			row = sheet.createRow(rowNum++);
			int colNum = 0;
			for (String header : headers) {
				cell = row.createCell(colNum++);
				cell.setCellValue(header);
				cell.setCellStyle(headerStyle);
				row.setHeight((short)512);
				
			}
		}

		// body 출력
		@SuppressWarnings("unchecked") // 경고뜰떄 제외하고 진행하겠다
		List<Map<String, Object>> list = (List<Map<String, Object>>) model.get("datas");
		System.out.println(list);
		if (headers != null) {

			for (Map<String, Object> map : list) {
				row = sheet.createRow(rowNum++);
				int colNum = 0;
				for (String header : headers) {
					cell = row.createCell(colNum++);
					Object field = map.get(header);
					if (field == null) {
						field = "";
						System.out.println(header);
					}

					if (field instanceof String) {
						cell.setCellValue((String) field);
						cell.setCellStyle(bodyStyle);
					} else if (field instanceof BigDecimal) {
						cell.setCellValue(((BigDecimal) field).doubleValue());
						cell.setCellStyle(bodyStyle);
					} else if (field instanceof Date) {
						cell.setCellValue((Date) field);
						cell.setCellStyle(bodyStyle);
					} else {
						cell.setCellValue(field.toString());
						cell.setCellStyle(bodyStyle);
					}

				}
			}

		} else {

			for (Map<String, Object> map : list) {
				row = sheet.createRow(rowNum++);
				int colNum = 0;
				Iterator<String> iter = map.keySet().iterator();
				while (iter.hasNext()) {
					cell = row.createCell(colNum++);
					Object field = map.get(iter.next());
					if (field instanceof String) {
						cell.setCellValue((String) field);
						cell.setCellStyle(bodyStyle);
					} else if (field instanceof BigDecimal) {
						cell.setCellValue(((BigDecimal) field).doubleValue());
						cell.setCellStyle(bodyStyle);
					} else if (field instanceof Date) {
						cell.setCellValue((Date) field);
						cell.setCellStyle(bodyStyle);
					} else {
						cell.setCellValue(field.toString());
						cell.setCellStyle(bodyStyle);
					}
				}
			}

		}

		LOGGER.debug("### buildExcelDocument Map : {} end!!");
	}

}
