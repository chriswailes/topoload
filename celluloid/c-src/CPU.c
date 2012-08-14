/*
 * Author:		Chris Wailes <chris.wailes@gmail.com>
 * Project:		Topoload
 * Date:			2012/08/10
 * Description:	JNI function implementations for the java.sched.Info Java class.
 */

/*
 * Standard Includes
 */

#define _GNU_SOURCE

#include <jni.h>

#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <unistd.h>

/*
 * Project Includes
 */

#include "jni/org_chris_sched_CPU.h"

/*
 * Macros
 */

/*
 * Global Variables
 */

/*
 * Forward Declarations
 */

/*
 * Functions
 */

/*
 * Get the number of online CPUs on this system.
 */
JNIEXPORT jint JNICALL Java_org_chris_sched_CPU_cpus_1online(JNIEnv* env, jclass klass) {
	return sysconf(_SC_NPROCESSORS_ONLN);
}

/*
 * Get the number of CPUs configured on this system.
 */
JNIEXPORT jint JNICALL Java_org_chris_sched_CPU_cpus_1configured(JNIEnv* env, jclass klass) {
	return sysconf(_SC_NPROCESSORS_CONF);
}

/*
 * Get the ID for the CPU that the current thread is running on.
 */
JNIEXPORT jint JNICALL Java_org_chris_sched_CPU_get_1id (JNIEnv* env, jclass klass) {
	return sched_getcpu();
}

/*
 * Sets the current thread's affinity for the given processor IDs.
 */
JNIEXPORT void JNICALL Java_org_chris_sched_CPU_set_1affinity(JNIEnv* env, jclass klass, jintArray IDs) {
	cpu_set_t affinity;
	CPU_ZERO(&affinity);
	
	jint* elements	= (*env)->GetIntArrayElements(env, IDs, 0);
	jsize length	= (*env)->GetArrayLength(env, IDs);
	
	while (length-- > 0) {
		CPU_SET(elements[length], &affinity);
	}
	
	(*env)->ReleaseIntArrayElements(env, IDs, elements, 0);
	
	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &affinity);
}

