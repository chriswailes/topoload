package org.chris.sched;

class CPU {
	public static native int cpus_online();
	public static native int cpus_configured();
	
	public static native int get_id();
	
	public static void pin() {
		pin(get_id());
	}
	
	public static void pin(int cpu_id) {
		int[] IDs = {cpu_id};
		
		pin(IDs);
	}
	
	public static native void pin(int[] IDs);
	
	static {
		System.loadLibrary("JavaSched");
  }
}
