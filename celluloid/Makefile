CC	= gcc
CXX	= g++

CFLAGS	= -Wall -O3 -fPIC -I/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.5.x86_64/include -I/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.5.x86_64/include/linux
LFLAGS	= 

COBJECTS	= c-src/CPU.o
LIBNAME	= JavaSched

JAVA_SOURCE_FILES	= org/chris/sched/CPU.java
JAVA_CLASS_FILES	= $(JAVA_SOURCE_FILES:.java=.class)
JAVA_CLASS_NAMES	= $(subst /,.,$(JAVA_CLASS_FILES:.class=))

JNI_HEADER_DIR		= c-src/jni
JNI_HEADER_FILES	= $(patsubst %,$(JNI_HEADER_DIR)%.h,$(subst .,_,$(JAVA_CLASS_NAMES)))

JAR_NAME = $(LIBNAME).jar

all: c java

c: jni_headers $(LIBNAME)
java: $(JAVA_CLASS_FILES) jni_headers

$(LIBNAME): $(COBJECTS)
	$(CC) $(LFLAGS) -shared -Wl,-soname,lib$(LIBNAME) -o lib$(LIBNAME).so $(COBJECTS)

jni_headers: $(JAVA_SOURCE_FILES)
	javah -jni -classpath '.' -d $(JNI_HEADER_DIR) $(JAVA_CLASS_NAMES)

jar: $(JAVA_CLASS_FILES)
	jar cf $(JAR_NAME) $(JAVA_CLASS_FILES)

%.class: %.java
	javac $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -f $(JAVA_CLASS_FILES)
	rm -f $(JNI_HEADER_FILES)
	rm -f $(COBJECTS)
	rm -f lib$(LIBNAME).so
