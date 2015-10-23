package cn.imethan.entity.comment;

public enum CommentType {
	
	CMS {
		public String getName(){return "CMS系统";}
	},
	ALBUM{
		public String getName(){return "ALBUM系统";}
	};
	
	public abstract String getName();
	
}
