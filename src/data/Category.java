package data;

public enum Category {
	POLITICS,ECONOMY,SOCIETY,EDUCATION;
	
	@Override
	public String toString() {
		switch(this) {
			case POLITICS :
				return "politics";
			case ECONOMY :
				return "economy";
			case SOCIETY :
				return "society";
			case EDUCATION :
				return "education";
			default :
				return null;
		}
	}
}