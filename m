Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC0D7AB83E
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Sep 2023 19:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28610E6DD;
	Fri, 22 Sep 2023 17:52:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F4110E6DB;
 Fri, 22 Sep 2023 17:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNiBZz5sb091nb68ZC3uXNo1ViUCMqrXPJ80R6e3V7yS8dRqKUsmhvtabwgrYjbHB2ruSezw0G+z6d+CVJ4zPzJkBWKX/Cd69Fi3HpC1J7f3p0WlQB2/6xdrecelUAP/XSoyQ66sm44I7YThYH2ZBSox6EiOGKOX6jNoyn8aw6whHDnviLVeY7+Vf46WCNK3RsLaCuA4S0B+Go2zoCcPJP+gTSh9rbDu0m1vNAapTfbnoY70jQiBw5a42g2iQzYfYA2vcqH6HUZGrxo6o6BU//ALoFEOrwYDA3soxdHAwOUjucbL1mWoV6t7KMzN8jVL5ruG4QMC3HHqM6KAHYU0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2fqI3CvjA9IVDknvfrPEaq4mUF7ZlAt4ZyHB15/Muc=;
 b=HnjB78y0Vr2v3WwzJK4bO0J8pIrUXi3Y8N/6KaVOvkMKrwfoI8KXNw+bdbYDJJpEevufgXLKr5riFKPIKiDdY7r8VUI9cjhbneSAQd2KYukkE9dCVZ+YJtPy/1LMYn9d72GqLHMVNzktpLhxz1lDoY2nf6/h19HbgAPd0YMJFUM5YftLRwIFZdPHRM9TVbAMQUb3jjsyXNgKbQTgJOiGZWihe6A7Nr4+oQhmuZmKHdBnJtnRO7DM6Y6AGZ1ESKiSxjYUxtY4bWsbKt0X1h8fH57PQnqR2tbu3lvbl8F5dg0Xvk73gmkkWBApsz53Pi46PeaHmF1qBKvArwyp1KkonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2fqI3CvjA9IVDknvfrPEaq4mUF7ZlAt4ZyHB15/Muc=;
 b=V6Rz81OHch1xb7bnyr4yzyYZeCx+gut02rwyMv+3Q+qZVj0DrARrotRcIWHWYLsgMdiAOGyjUFauqpjG7RatOkX8hKyZSgvjIW6scgU9EkQNPkv1EgiZKf7ua7gsLFYS+YP0x3gXUX44D8er25Kuq5hHvmf5aLZyp2nl4c1lZus=
Received: from MN2PR17CA0012.namprd17.prod.outlook.com (2603:10b6:208:15e::25)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 17:52:12 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:15e:cafe::48) by MN2PR17CA0012.outlook.office365.com
 (2603:10b6:208:15e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 22 Sep 2023 17:52:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 06/15] platform/x86/amd/pmf: Add support to get inputs from
 other subsystems
Date: Fri, 22 Sep 2023 23:20:47 +0530
Message-ID: <20230922175056.244940-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 122db49b-6c24-4223-c11b-08dbbb94a678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nxwfkxzmc0Il6DjsBDt+2DKIrs8EoayukoQDBuqmu7h9jPA5TMjskArfENx3HZOWoakrwtyH/LLSOz7HQYZvDVHAu191MOtplI+whWQbD5xaPX2daRsuYQdre6H/m3KUcqqEzVq+M13nEHCTKHJC/jLXuNJkYEoBqrGY8+OmOLA2pwKDrGr5jGDtz81kgMFyIZk4RVASikFCAvsCgroiz8y9V8mIUePW9zNzIUH9NDDd9bD+MVILwyPKvca6aEETU/bkgF228mIrO15E6qCcu/Fj0tLkD06NgxMWAR/9Q8fwQ5QUalNQ+GrDaqC211C+0VFiCyU5ADclxfx2fdWcoUS/n7w82lblgElsevaP6K9SUW6+l1f3RaUvlI1Cs/38rT0/mzJi2rqYvp+VbG6ZysgBpiUxo1rMsw4bgj2YsJWT5rS2Jj5YWkT3PwezM0p+3d8suhvRCOHfoVx8mJ1VFggf+qSeOM49e95WdqiFrH0P/ydziD+l11OdGhCAg4tAt4NWlTdzgI0ACsnkB9CbNouvea/AT0AN5t4NBo6XcQwaT/ReWA5wYgGiPGsdNJVJbmJtldTgDYn5yVZ6LujroJmlBhcnOjMS68/K3oO5asI3MdU0/wUWWMK4ZuPNT7/9z0PEbGCPXHKFmN5kPfDL4CBYLFrsGoh5EExS0tOEM38XTeNsIJT49M6jMp52IeA+3wJM1jpRAap+TxP6t957K9QqLgXt69GHIxmANNwZGjjLfwrfDbjmNX1ecqYRgAJJlkVMu9cMItnzvbExRW3wZimFkJe3ATCrEcScHJFamRoD3CUp2YFpqAV2ktKaDnGMEKIx0BQeWDepc8LTEKUQDQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(82310400011)(230921699003)(46966006)(36840700001)(40470700004)(36860700001)(47076005)(426003)(16526019)(36756003)(26005)(336012)(2616005)(7696005)(81166007)(82740400003)(6666004)(921005)(356005)(83380400001)(478600001)(70586007)(316002)(54906003)(110136005)(41300700001)(8676002)(70206006)(4326008)(8936002)(5660300002)(7416002)(40460700003)(1076003)(86362001)(2906002)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:12.4917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122db49b-6c24-4223-c11b-08dbbb94a678
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PMF driver sends changing inputs from each subystem to TA for evaluating
the conditions in the policy binary.

Add initial support of plumbing in the PMF driver for Smart PC to get
information from other subsystems in the kernel.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
 drivers/platform/x86/amd/pmf/spc.c    | 118 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c |   3 +
 4 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index d2746ee7369f..6b26e48ce8ad 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -7,4 +7,4 @@
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
 		auto-mode.o cnqf.o \
-		tee-if.o
+		tee-if.o spc.o
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 81acf2a37366..e64b4d285624 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -146,6 +146,21 @@ struct smu_pmf_metrics {
 	u16 infra_gfx_maxfreq; /* in MHz */
 	u16 skin_temp; /* in centi-Celsius */
 	u16 device_state;
+	u16 curtemp; /* in centi-Celsius */
+	u16 filter_alpha_value;
+	u16 avg_gfx_clkfrequency;
+	u16 avg_fclk_frequency;
+	u16 avg_gfx_activity;
+	u16 avg_socclk_frequency;
+	u16 avg_vclk_frequency;
+	u16 avg_vcn_activity;
+	u16 avg_dram_reads;
+	u16 avg_dram_writes;
+	u16 avg_socket_power;
+	u16 avg_core_power[2];
+	u16 avg_core_c0residency[16];
+	u16 spare1;
+	u32 metrics_counter;
 } __packed;
 
 enum amd_stt_skin_temp {
@@ -592,4 +607,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
+
+/* Smart PC - TA interfaces */
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
new file mode 100644
index 000000000000..08159cd5f853
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver - Smart PC Capabilities
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
+ */
+
+#include <acpi/button.h>
+#include <linux/power_supply.h>
+#include "pmf.h"
+
+static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	u16 max, avg = 0;
+	int i;
+
+	memset(dev->buf, 0, sizeof(dev->m_table));
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
+
+	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+	in->ev_info.skin_temperature = dev->m_table.skin_temp;
+
+	/* get the avg C0 residency of all the cores */
+	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)
+		avg += dev->m_table.avg_core_c0residency[i];
+
+	/* get the max C0 residency of all the cores */
+	max = dev->m_table.avg_core_c0residency[0];
+	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
+		if (dev->m_table.avg_core_c0residency[i] > max)
+			max = dev->m_table.avg_core_c0residency[i];
+	}
+
+	in->ev_info.avg_c0residency = avg / ARRAY_SIZE(dev->m_table.avg_core_c0residency);
+	in->ev_info.max_c0residency = max;
+	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+}
+
+static const char * const pmf_battery_supply_name[] = {
+	"BATT",
+	"BAT0",
+};
+
+static int get_battery_prop(enum power_supply_property prop)
+{
+	union power_supply_propval value;
+	struct power_supply *psy;
+	int i, ret = -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
+		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
+		if (!psy)
+			continue;
+
+		ret = power_supply_get_property(psy, prop, &value);
+		if (ret) {
+			power_supply_put(psy);
+			return ret;
+		}
+	}
+
+	return value.intval;
+}
+
+static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	int val;
+
+	val = get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
+	if (val != 1)
+		return -EINVAL;
+
+	in->ev_info.bat_percentage = get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
+	/* all values in mWh metrics */
+	in->ev_info.bat_design = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) / 1000;
+	in->ev_info.full_charge_capacity = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) / 1000;
+	in->ev_info.drain_rate = get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) / 1000;
+
+	return 0;
+}
+
+static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	int val;
+
+	switch (dev->current_profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		val = TA_BEST_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		val = TA_BETTER_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		val = TA_BEST_BATTERY;
+		break;
+	default:
+		dev_err(dev->dev, "Unknown Platform Profile.\n");
+		return -EOPNOTSUPP;
+	}
+	in->ev_info.power_slider = val;
+
+	return 0;
+}
+
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	/* TA side lid open is 1 and close is 0, hence the ! here */
+	in->ev_info.lid_state = !acpi_lid_open();
+	in->ev_info.power_source = amd_pmf_get_power_source();
+	amd_pmf_get_smu_info(dev, in);
+	amd_pmf_get_battery_info(dev, in);
+	amd_pmf_get_slider_info(dev, in);
+}
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index a8b05e746efd..eb25d5ce3a9a 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_result *out = NULL;
+	struct ta_pmf_enact_table *in = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
@@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
 	out = &ta_sm->pmf_output.policy_apply_table;
+	in = &ta_sm->pmf_input.enact_table;
 
 	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES;
 	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
 
+	amd_pmf_populate_ta_inputs(dev, in);
 	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES, &arg, param);
 
 	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
-- 
2.25.1

