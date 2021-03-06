package org.chris.sched;

class CPU {
	public static native int cpus_online();
	public static native int cpus_configured();
	
	public static native int[] get_affinity();
	
	public static native int get_id();
	
	public static void pin() {
		set_affinity(get_id());
	}
	
	public static void set_affinity(int cpu_id) {
		int[] IDs = {cpu_id};
		
		set_affinity(IDs);
	}
	
	public static native void set_affinity(int[] IDs);
	
	static {
		System.loadLibrary("JavaSched");
  }
}
