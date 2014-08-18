package spring.common.parse;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import spring.domain.guro.GuroRentalShop;


public class GuroRentalShopParsing
{
	private String url = "http://openapi.guro.go.kr:8088/6e474a756468726a31303372704d7044/xml/GurotoyLib/1/2";
	
	public List<GuroRentalShop> getRentalShopData() throws Exception
	{
		HSSFWorkbook workbook = null;
		HSSFSheet sheet = null;
		HSSFRow row = null;
		HSSFCell cell = null;
		
		List<GuroRentalShop> guroRentalShopList = new ArrayList<GuroRentalShop>();
		
		workbook = new HSSFWorkbook(new FileInputStream(new File("C:\\workspace_project\\ToyProBoot140811\\rentalShop.xls")));
		
		if(workbook != null)
		{
			sheet = workbook.getSheetAt(0);
			
			if(sheet != null)
			{
				int nRowStartIndex = 3;
				
				int nRowEndIndex = sheet.getLastRowNum();
				
				int nColumnStartIndex = 2;
				
				int nColumnEndIndex = sheet.getRow(nColumnStartIndex).getLastCellNum();
				
				String szValue = "";
				
				for(int i = nRowStartIndex ; i <= nRowEndIndex ; i++)
				{
					GuroRentalShop guroRentalShop = new GuroRentalShop();
					
					row = sheet.getRow(i);
					
					for(int nColumn = nColumnStartIndex ; nColumn <= nColumnEndIndex ; nColumn++)
					{
						cell = row.getCell((int)nColumn);
						
						if(cell == null)
						{
							continue;
						}
						
						if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
						{
							szValue = String.valueOf(cell.getNumericCellValue());
						}
						else
						{
							szValue = cell.getStringCellValue();
						}
						// 구 이름, 대여점명, 주소, 전화번호, 홈페이지, 위도, 경도
						switch (nColumn)
						{
							case 2:
								guroRentalShop.setGuName(szValue);
								if(szValue.equals("구로구"))
								{
									guroRentalShop = getRentalShopOpenAPI(guroRentalShop);
								}
								break;
								
							case 3:
								guroRentalShop.setRentalName(szValue);
								break;
								
							case 10:
								guroRentalShop.setAddr(szValue);
								break;
								
							case 11:
								guroRentalShop.setTel(szValue);
								break;
								
							case 12:
								guroRentalShop.setWebsite(szValue);
								break;
								
							case 14:
								guroRentalShop.setLatitude(szValue);
								break;
								
							case 15:
								guroRentalShop.setLongitude(szValue);
								break;
						}
//						System.out.println(szValue);
//						System.out.println("\t");
					}
//					System.out.println();
//					GuroRentalShop guroRentalShopData = getRentalShopData(guroRentalShop);
					guroRentalShopList.add(guroRentalShop);
				}
			}
			else
			{
				System.out.println("Sheet is null!!");
			}
		}
		
		return guroRentalShopList;
	}
	
	public GuroRentalShop getRentalShopOpenAPI(GuroRentalShop guroRentalShop)
	{
//		List<GuroRentalShop> list = new ArrayList<GuroRentalShop>();
		
		try
		{
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			
			DocumentBuilder db = dbf.newDocumentBuilder();
			
			Document doc = db.parse(url);
			
			Node root = doc.getDocumentElement();
			
//			System.out.println("root : "+root.getNodeName());
//			System.out.println(root.getChildNodes().getLength());
			
			int rentalCode = 13;
			
			for(int i = 5 ; i < root.getChildNodes().getLength() ; i+=2)
			{
				Node item = root.getChildNodes().item(i);
				NodeList nodeList = item.getChildNodes();

//				GuroRentalShop guroRentalShop = new GuroRentalShop();
				
				for(int j = 1 ; j < nodeList.getLength() ; j+=2)
				{
					// created만 따로 DI
//					if(nodeList.item(j).getNodeName().equals("CREATED"))
//					{
//						toyParse.setCreated(nodeList.item(j).getTextContent());
//						continue;
//					}
					if(nodeList.item(j).getNodeName().equals("TOY_CNT"))
					{
						guroRentalShop.setToyCnt(nodeList.item(j).getTextContent());
					}
//					else if(nodeList.item(j).getNodeName().equals("ADDR"))
//					{
//						guroRentalShop.setAddr(nodeList.item(j).getTextContent());
//					}
//					else if(nodeList.item(j).getNodeName().equals("TEL"))
//					{
//						guroRentalShop.setTel(nodeList.item(j).getTextContent());
//					}
					else if(nodeList.item(j).getNodeName().equals("USE_HOURS"))
					{
						guroRentalShop.setUseHours(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("CLOSE_DAY"))
					{
						guroRentalShop.setCloseDay(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("BOOKRENTAL_TERM"))
					{
						guroRentalShop.setRentalTerm(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("BOOKRENTAL_CNT"))
					{
						guroRentalShop.setRentalCnt(nodeList.item(j).getTextContent());
					}
//					else if(nodeList.item(j).getNodeName().equals("BRCH_CODE"))
//					{
////						guroRentalShop.setRentalCode(rentalCode);
//						rentalCode--;
//					}
				}
//				System.out.println(locationParse);
//				list.add(guroRentalShop);
			}
		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return guroRentalShop;
	}
}
