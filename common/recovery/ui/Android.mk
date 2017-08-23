LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := amlogic_ui.cpp

LOCAL_MODULE := libamlogic_ui

LOCAL_MODULE_TAGS := eng

LOCAL_FORCE_STATIC_EXECUTABLE := true

LOCAL_CFLAGS += -Wall

include $(BUILD_STATIC_LIBRARY)