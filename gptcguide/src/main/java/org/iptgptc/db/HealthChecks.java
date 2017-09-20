/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.iptgptc.db;

import com.codahale.metrics.health.HealthCheckRegistry;

public class HealthChecks {
    private HealthChecks() {}

    private static final HealthCheckRegistry healthCheckRegistry;
    static {
        healthCheckRegistry = new HealthCheckRegistry();
    }

    public static HealthCheckRegistry getHealthCheckRegistry() {
        return healthCheckRegistry;
    }
}