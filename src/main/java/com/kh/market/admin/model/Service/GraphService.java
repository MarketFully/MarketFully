package com.kh.market.admin.model.Service;

import java.util.ArrayList;
import java.util.Date;

import com.kh.market.admin.model.vo.graphvo;

public interface GraphService {

	ArrayList<graphvo> getSixMonth(Date date);

	ArrayList<graphvo> getSixWeek();

	ArrayList getSevenDay();

	ArrayList getSevenPrice();

}
