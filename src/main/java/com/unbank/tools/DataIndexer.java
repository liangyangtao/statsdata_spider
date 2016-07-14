package com.unbank.tools;

import com.unbank.dao.QuotasStorer;


public class DataIndexer {

	public void writerIndex(String name, int idLength) {
	    new QuotasStorer().upIndex(name,idLength);
	}

}
