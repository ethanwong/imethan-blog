package com.the3.entity.todo;

public enum TodoType {
	
	IMETHAN {
		public String getName(){return "IMETHAN TODO";}
	},
	PERSONAL{
		public String getName(){return "PERSONAL TODO";}
	},
	PROJECT{
		public String getName(){return "PROJECT TODO";}
	};
	
	public abstract String getName();
	
}
