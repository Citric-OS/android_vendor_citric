/*
 * Copyright (C) 2022 The AtomX Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.atomx.power-service"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>

#include "PowerFeature.h"

using ::aidl::vendor::atomx::power::PowerFeature;

int main() {
    ABinderProcess_setThreadPoolMaxThreadCount(0);
    std::shared_ptr<PowerFeature> powerFeature = ndk::SharedRefBase::make<PowerFeature>();
    if (!powerFeature) {
        return EXIT_FAILURE;
    }

    const std::string instance = std::string(PowerFeature::descriptor) + "/default";
    binder_status_t status =
            AServiceManager_addService(powerFeature->asBinder().get(), instance.c_str());
    CHECK(status == STATUS_OK);

    ABinderProcess_joinThreadPool();
    return EXIT_FAILURE; // should not reached
}
