package cn.imethan.other;

public enum EnumTest {
	
	FRANK("The given name of me"),
    LIU("The family name of me");

	private String context;

	private String getContext() {
		return this.context;
	}

	private EnumTest(String context) {
		this.context = context;
	}

	public static void main(String[] args) {
		for (EnumTest name : EnumTest.values()) {
			System.out.println(name + " : " + name.getContext());
		}
		System.out.println(EnumTest.FRANK.getDeclaringClass());
		
		System.out.println(EnumTest.FRANK.ordinal());
	}
}
