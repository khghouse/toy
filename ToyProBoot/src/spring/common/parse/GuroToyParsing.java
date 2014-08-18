package spring.common.parse;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import spring.domain.guro.GuroToy;


public class GuroToyParsing
{
	private String url = "http://openapi.guro.go.kr:8088/6b7349494b68726a3130364667557364/xml/GurotoyItm/1/127/";
	
	public List<GuroToy> getToyData()
	{
		List<GuroToy> list = new ArrayList<GuroToy>();
		
		try
		{
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			
			DocumentBuilder db = dbf.newDocumentBuilder();
			
			Document doc = db.parse(url);
			
			Node root = doc.getDocumentElement();
			
//			System.out.println("root : "+root.getNodeName());
//			System.out.println(root.getChildNodes().getLength());
			
//			Class c = Class.forName("spring.domain.ToyParse");
//			Method method[] = c.getDeclaredMethods();
//			
//			System.out.println(method[1].getName());
//			
//			for(Method m : method)
//			{
//				System.out.println(m);
//			}
			
			for(int i = 5 ; i < root.getChildNodes().getLength() ; i+=2)
			{
				Node item = root.getChildNodes().item(i);
				NodeList nodeList = item.getChildNodes();
				
				GuroToy toyParse = new GuroToy();
				
//				for(int j = 1 ; j <= nodeList.getLength()-2 ; j+=2)
//				{
//					// created만 따로 DI
//					if(nodeList.item(j).getNodeName().equals("CREATED"))
//					{
//						toyParse.setCreated(nodeList.item(j).getTextContent());
//						continue;
//					}
//					
////					System.out.println(method[setMethodIndex]);
//					method[setMethodIndex].invoke(toyParse, nodeList.item(j).getTextContent().trim());
//					
//					setMethodIndex+=1;
//				}
				for(int j = 1 ; j <= nodeList.getLength()-2 ; j+=2)
				{
					if(nodeList.item(j).getNodeName().equals("MAINTITLE"))
					{
						toyParse.setMaintitle(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("TOY_IDID"))
					{
						toyParse.setToyIdid(nodeList.item(j).getTextContent());
						toyParse.setToyImg(nodeList.item(j).getTextContent()+".jpg");
					}
					else if(nodeList.item(j).getNodeName().equals("SUBJECT"))
					{
						// subject가 0인 것 하나를 처리
						if(!nodeList.item(j).getTextContent().equals("0"))
						{
							toyParse.setSubject(nodeList.item(j).getTextContent());
						}
						else
						{
							toyParse.setSubject("000");
						}
					}
					else if(nodeList.item(j).getNodeName().equals("FN"))
					{
						toyParse.setFn(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("REGION"))
					{
						toyParse.setRegion(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("CREATED"))
					{
						toyParse.setCreated(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("ISSUED"))
					{
						toyParse.setIssued(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("AGE"))
					{
						toyParse.setAge(nodeList.item(j).getTextContent());
					}
					else if(nodeList.item(j).getNodeName().equals("BRCH_NAME"))
					{
						toyParse.setBrchName(nodeList.item(j).getTextContent());
					}
//					else if(nodeList.item(j).getNodeName().equals("CODE_DESC"))
//					{
//						toyParse.setCodeDesc(nodeList.item(j).getTextContent());
//					}
					else if(nodeList.item(j).getNodeName().equals("CODE_DESC"))
					{
						toyParse.setCodeDesc(nodeList.item(j).getTextContent());
					}
				}
				
				list.add(toyParse);
			}
		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
}
