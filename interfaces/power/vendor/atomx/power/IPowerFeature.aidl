/*
 * Copyright (C) 2022 The AtomX Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

package vendor.atomx.power;

import vendor.atomx.power.Feature;

@VintfStability
interface IPowerFeature {
    oneway void setFeature(Feature feature, boolean enabled);
}
