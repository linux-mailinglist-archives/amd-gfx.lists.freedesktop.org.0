Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E726E358
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Sep 2020 20:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DFD6EC45;
	Thu, 17 Sep 2020 18:15:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C806E2D5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Sep 2020 18:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmkUSwee7Er1nflqc/OcwyMapz87pJBpKi3FGJdmpPvaQDsF3O7JhUIbtRnvdb6d61mkL9A6ROa2b2BCMkXA5S16iBd7lZ5XKf5zrZNMKiGnvvHqEw1rF4HKd8eN6apq7cJsXrm3JVeVEelEM97VJOSYhiv28lJC1hZOwLdpuIzJMFuRhojFWBHQIKnpC1GGBpZ/JXUj2Q+NHDqlg7tmmqZmDQrxerx2d1CKBBlnJTJtdU5pAMFUl86VpLPCPqBrw+Q/ADJRh3ZKaRUGxkH+VcQyGUDNkNf+ZR6DOR02O2zL4ON4yoEw1fkUE5ZrlIBzTd8IgokXcrYGiPPZ5hD6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYpufa7Fj2AyIntWTg21TfDUGaSqIxcgZUA5vw2FlNQ=;
 b=TCNd8F8xJaLgg6ar3UrZh4CQbMzvM9CBB2YfTf2c6FUEUrCfgcSw88Ogk7/doZhxGH9jWBmY8+k3N8YGXqwutHZ2cBtuNAvfdkjt2pMLMolVRyuMAlFKzZvNAAthARvYSbjc4ts5oI8banAkqeVhPx1YpnPBsEvM/7FCz9VbzkT7bTm1eR0JmVaEks8TZd8GUmYzyR81CmmAj5ART2S+keHN2KdE/prVomlSkonhKroSEKLChkTe8WYRQ0AWrpuqiRIta0ePNtuR2nEzrpk4AIKKctSA7bkkpfUUPQLxqNG394H8u3rvzBdqrBqEpJyWSziWmI9hHobKsyW0hgNOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYpufa7Fj2AyIntWTg21TfDUGaSqIxcgZUA5vw2FlNQ=;
 b=wqGS2/w0kxNNPsn0RDmFU0aFQj2WjWTGhdbeR2P4VKx2rH/Mo3FCLqo7PzHbSEYEChnJ6xQq+WLTl0PWy2y/EVjBvcuc9ObqQ22QPsmuRBmXVrxIQxZjgiuRrfTjkxkXZJNe4fUDWU3WHresCdrMP4kNDELmK7eSCiLYGt2IH/A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0146.namprd12.prod.outlook.com
 (2603:10b6:405:59::18) by BN7PR12MB2833.namprd12.prod.outlook.com
 (2603:10b6:408:27::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 18:15:31 +0000
Received: from BN6PR1201MB0146.namprd12.prod.outlook.com
 ([fe80::615d:bea9:8838:92be]) by BN6PR1201MB0146.namprd12.prod.outlook.com
 ([fe80::615d:bea9:8838:92be%4]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 18:15:31 +0000
From: Jonathan Kim <jonathan.kim@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: add per device user friendly xgmi events for
 vega20
Date: Thu, 17 Sep 2020 14:15:13 -0400
Message-Id: <20200917181514.38292-2-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917181514.38292-1-jonathan.kim@amd.com>
References: <20200917181514.38292-1-jonathan.kim@amd.com>
X-ClientProxiedBy: YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::23) To BN6PR1201MB0146.namprd12.prod.outlook.com
 (2603:10b6:405:59::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonathan-KFD.amd.com (165.204.55.251) by
 YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11 via Frontend Transport; Thu, 17 Sep 2020 18:15:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f2d275d9-f1a2-49d7-5fd3-08d85b35a96a
X-MS-TrafficTypeDiagnostic: BN7PR12MB2833:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR12MB283390ADBEEFCEAF96604B2A853E0@BN7PR12MB2833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tdGf4slBC6DyRYwJxTgNzb8ctCyq9qE3MleCkpraNRkkdivD0ZLyA3mtG6f/Txnp7Bs4Cim7/RKpv96rmTWzcodz5hIVy/K9eU8M+TIihIWcFJP5bE793+Q/XujBQIE93ZvUEV1fO7vjMFBl02NYXyoL54st+jzhEvRecfhMfnGcWdr6qZydnvXtW4iTqyMh7mX1hi/0/gXE7mPBFSsYpoqSAh/Lx+MaUPWlrvfgm0zlklDc+fe6+nV/j71ZHsfqykr7qU3Fg0ZLgIhF2z5Dx8/oGD1PCC/x8PKar3Zj6vd+8zTBOrBjbbIUiaQB6g3x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(8676002)(54906003)(26005)(316002)(6666004)(1076003)(2616005)(4326008)(956004)(52116002)(66946007)(66556008)(7696005)(83380400001)(6486002)(2906002)(86362001)(6916009)(30864003)(66476007)(44832011)(16526019)(186003)(36756003)(8936002)(478600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: EegmgXZjgifdbYc1aNKiHXTrGuRk8D0JLjV90KjbtVdzLPeSz1YoTgLUUEcG8TFzaDx6uNifIkQye8uvOFuce6VkTFAklkZM2xFWw0TKqfAqq8CMei6lfZq059VGUStMn7ex4E0poYVdNeMRxyH3ChdoOdRiM3Y06nE59a7lQtVFOlcdEM5S84fCrvpbqLq19UyyJswHmOiU5H7xjuV7nnl2QoNrnx5bwFuFaUco+/fGSAdnmLyn7tluQHedXvAiQO/NfeuiIv+iXLJvBSUwfMFURH6KpvGUiPKfEjACcMWAwivfjpQRANtl/yyrR93xoQalf3gM3UOdMDhxJb93K3Hfbffdixt8emappMuImdSCzP/o8+awy67SQpWJB9x8HuE8W3nBLqpZhDeqfTAzFi5Ux8G3+ZB/ItfClFWD6sVDgtcKrn0NWzKQjGjvdLvpJhbtVbPK7Ns3By7Ll9MSkuoBX3M+SzsMiVRnQICnHrFZHOCVTYZHIOXk2avRiHWgiIFiUalobR3a0bAzFSNNTAofLH2pFryl5q/1AyIOO3bnpDUozn6tPDC4XyHyfws3txVHzwG7SxRKn722UpCZaZGB+u07yPOuwWsvIYhkSBtWWYi1FShkJGmEKE88SBihJXC7VUIvRITYxyHxIyQ03g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d275d9-f1a2-49d7-5fd3-08d85b35a96a
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 18:15:30.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFGAli0rDigw9GQZZLNE2BxoPzTFhOSqKH2TLEhRhHoZxJLcajTD7P2j9ha8y2hW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2833
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
Cc: Jonathan Kim <Jonathan.Kim@amd.com>, Harish.Kasiviswanathan@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Non-outbound data metrics are non useful so mark them as legacy.
Bucket new perf counters into device and not device ip.
Bind events to chip instead of IP.
Report available event counters and not number of hw counter banks.
Move DF public macros to private since not needed outside of IP version.

v3: attr groups const array is global but attr groups are allocated per
device which doesn't work and causes problems on memory allocation and
de-allocation for pmu unregister. Switch to building const attr groups
per pmu instead to simplify solution.

v2: add comments on sysfs structure and formatting.

Signed-off-by: Jonathan Kim <Jonathan.Kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  13 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 341 ++++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.h |   6 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c    |  72 +----
 drivers/gpu/drm/amd/amdgpu/df_v3_6.h    |   9 -
 5 files changed, 304 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 13f92dea182a..f43dfdd2716a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1279,19 +1279,6 @@ bool amdgpu_device_load_pci_state(struct pci_dev *pdev);
 
 #include "amdgpu_object.h"
 
-/* used by df_v3_6.c and amdgpu_pmu.c */
-#define AMDGPU_PMU_ATTR(_name, _object)					\
-static ssize_t								\
-_name##_show(struct device *dev,					\
-			       struct device_attribute *attr,		\
-			       char *page)				\
-{									\
-	BUILD_BUG_ON(sizeof(_object) >= PAGE_SIZE - 1);			\
-	return sprintf(page, _object "\n");				\
-}									\
-									\
-static struct device_attribute pmu_attr_##_name = __ATTR_RO(_name)
-
 static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
 {
        return adev->gmc.tmz_enabled;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 1b0ec715c8ba..74fe8fbdc0d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -27,9 +27,19 @@
 #include <linux/init.h>
 #include "amdgpu.h"
 #include "amdgpu_pmu.h"
-#include "df_v3_6.h"
 
 #define PMU_NAME_SIZE 32
+#define NUM_FORMATS_AMDGPU_PMU		4
+#define NUM_FORMATS_DF_LEGACY		3
+#define NUM_EVENTS_DF_LEGACY		8
+#define NUM_EVENTS_VEGA20_XGMI		2
+#define NUM_EVENTS_VEGA20_MAX		NUM_EVENTS_VEGA20_XGMI
+
+struct amdgpu_pmu_event_attribute {
+	struct device_attribute attr;
+	const char *event_str;
+	unsigned int type;
+};
 
 /* record to keep track of pmu entry per pmu type per device */
 struct amdgpu_pmu_entry {
@@ -37,10 +47,74 @@ struct amdgpu_pmu_entry {
 	struct amdgpu_device *adev;
 	struct pmu pmu;
 	unsigned int pmu_perf_type;
+	struct attribute_group fmt_attr_group;
+	struct amdgpu_pmu_event_attribute *fmt_attr;
+	struct attribute_group evt_attr_group;
+	struct amdgpu_pmu_event_attribute *evt_attr;
 };
 
+static ssize_t amdgpu_pmu_event_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct amdgpu_pmu_event_attribute *amdgpu_pmu_attr;
+
+	amdgpu_pmu_attr = container_of(attr, struct amdgpu_pmu_event_attribute,
+									attr);
+
+	if (!amdgpu_pmu_attr->type)
+		return sprintf(buf, "%s\n", amdgpu_pmu_attr->event_str);
+
+	return sprintf(buf, "%s,type=0x%x\n",
+			amdgpu_pmu_attr->event_str, amdgpu_pmu_attr->type);
+}
+
 static LIST_HEAD(amdgpu_pmu_list);
 
+/*
+ * Event formatting is global to all amdgpu events under sysfs folder
+ * /sys/bus/event_source/devices/amdgpu_<dev_num> where dev_num is the
+ * primary device index. Registered events can be found in subfolder "events"
+ * and formatting under subfolder "format".
+ *
+ * Formats "event", "instance", and "umask" are currently used by xGMI but can
+ * be for generalized for other IP usage.  If format naming is insufficient
+ * for newly registered IP events, append to the list below and handle the
+ * perf events hardware configuration (see hwc->config) as required by the IP.
+ *
+ * Format "type" indicates IP type generated on pmu registration (see
+ * init_pmu_by_type) so non-legacy events omit this in the per-chip event
+ * list (e.g. vega20_events).
+ */
+static const char *amdgpu_pmu_formats[NUM_FORMATS_AMDGPU_PMU][2] = {
+	{ "event", "config:0-7" },
+	{ "instance", "config:8-15" },
+	{ "umask", "config:16-23"},
+	{ "type", "config:56-63"}
+};
+
+/* Vega20 events */
+static const char *vega20_events[NUM_EVENTS_VEGA20_MAX][2] = {
+	{ "xgmi_link0_data_outbound", "event=0x7,instance=0x46,umask=0x2" },
+	{ "xgmi_link1_data_outbound", "event=0x7,instance=0x47,umask=0x2" }
+};
+
+/* All df_vega20_* items are DEPRECATED. Use vega20_ items above instead. */
+static const char *df_vega20_formats[NUM_FORMATS_DF_LEGACY][2] = {
+	{ "event", "config:0-7" },
+	{ "instance", "config:8-15" },
+	{ "umask", "config:16-23"}
+};
+
+static const char *df_vega20_events[NUM_EVENTS_DF_LEGACY][2] = {
+	{ "cake0_pcsout_txdata", "event=0x7,instance=0x46,umask=0x2" },
+	{ "cake1_pcsout_txdata", "event=0x7,instance=0x47,umask=0x2" },
+	{ "cake0_pcsout_txmeta", "event=0x7,instance=0x46,umask=0x4" },
+	{ "cake1_pcsout_txmeta", "event=0x7,instance=0x47,umask=0x4" },
+	{ "cake0_ftiinstat_reqalloc", "event=0xb,instance=0x46,umask=0x4" },
+	{ "cake1_ftiinstat_reqalloc", "event=0xb,instance=0x47,umask=0x4" },
+	{ "cake0_ftiinstat_rspalloc", "event=0xb,instance=0x46,umask=0x8" },
+	{ "cake1_ftiinstat_rspalloc", "event=0xb,instance=0x47,umask=0x8" },
+};
 
 /* initialize perf counter */
 static int amdgpu_perf_event_init(struct perf_event *event)
@@ -73,7 +147,8 @@ static void amdgpu_perf_start(struct perf_event *event, int flags)
 	hwc->state = 0;
 
 	switch (pe->pmu_perf_type) {
-	case PERF_TYPE_AMDGPU_DF:
+	case PERF_TYPE_AMDGPU_DF_LEGACY:
+	case PERF_TYPE_AMDGPU_XGMI:
 		if (!(flags & PERF_EF_RELOAD)) {
 			target_cntr = pe->adev->df.funcs->pmc_start(pe->adev,
 						hwc->config, 0 /* unused */,
@@ -108,7 +183,8 @@ static void amdgpu_perf_read(struct perf_event *event)
 		prev = local64_read(&hwc->prev_count);
 
 		switch (pe->pmu_perf_type) {
-		case PERF_TYPE_AMDGPU_DF:
+		case PERF_TYPE_AMDGPU_DF_LEGACY:
+		case PERF_TYPE_AMDGPU_XGMI:
 			pe->adev->df.funcs->pmc_get_count(pe->adev,
 						hwc->config, hwc->idx, &count);
 			break;
@@ -133,7 +209,8 @@ static void amdgpu_perf_stop(struct perf_event *event, int flags)
 		return;
 
 	switch (pe->pmu_perf_type) {
-	case PERF_TYPE_AMDGPU_DF:
+	case PERF_TYPE_AMDGPU_DF_LEGACY:
+	case PERF_TYPE_AMDGPU_XGMI:
 		pe->adev->df.funcs->pmc_stop(pe->adev, hwc->config, hwc->idx,
 									0);
 		break;
@@ -160,10 +237,15 @@ static int amdgpu_perf_add(struct perf_event *event, int flags)
 						  struct amdgpu_pmu_entry,
 						  pmu);
 
+	if (pe->pmu_perf_type == PERF_TYPE_AMDGPU_MAX)
+		pe->pmu_perf_type = (hwc->config >> AMDGPU_PERF_TYPE_SHIFT) &
+							AMDGPU_PERF_TYPE_MASK;
+
 	event->hw.state = PERF_HES_UPTODATE | PERF_HES_STOPPED;
 
 	switch (pe->pmu_perf_type) {
-	case PERF_TYPE_AMDGPU_DF:
+	case PERF_TYPE_AMDGPU_DF_LEGACY:
+	case PERF_TYPE_AMDGPU_XGMI:
 		target_cntr = pe->adev->df.funcs->pmc_start(pe->adev,
 						hwc->config, 0 /* unused */,
 						1 /* add counter */);
@@ -197,7 +279,8 @@ static void amdgpu_perf_del(struct perf_event *event, int flags)
 	amdgpu_perf_stop(event, PERF_EF_UPDATE);
 
 	switch (pe->pmu_perf_type) {
-	case PERF_TYPE_AMDGPU_DF:
+	case PERF_TYPE_AMDGPU_DF_LEGACY:
+	case PERF_TYPE_AMDGPU_XGMI:
 		pe->adev->df.funcs->pmc_stop(pe->adev, hwc->config, hwc->idx,
 									1);
 		break;
@@ -208,25 +291,83 @@ static void amdgpu_perf_del(struct perf_event *event, int flags)
 	perf_event_update_userpage(event);
 }
 
-/* vega20 pmus */
-
-/* init pmu tracking per pmu type */
-static int init_pmu_by_type(struct amdgpu_device *adev,
-		  const struct attribute_group *attr_groups[],
-		  char *pmu_type_name, char *pmu_file_prefix,
-		  unsigned int pmu_perf_type,
-		  unsigned int num_counters)
+static void amdgpu_pmu_create_attributes(struct attribute_group *attr_group,
+				struct amdgpu_pmu_event_attribute *pmu_attr,
+				const char *events[][2],
+				int s_offset,
+				int e_offset,
+				unsigned int type)
 {
-	char pmu_name[PMU_NAME_SIZE];
-	struct amdgpu_pmu_entry *pmu_entry;
-	int ret = 0;
+	int i;
+
+	pmu_attr += s_offset;
+
+	for (i = s_offset; i < e_offset; i++) {
+		attr_group->attrs[i] = &pmu_attr->attr.attr;
+		sysfs_attr_init(&pmu_attr->attr.attr);
+		pmu_attr->attr.attr.name = events[i][0];
+		pmu_attr->attr.attr.mode = 0444;
+		pmu_attr->attr.show = amdgpu_pmu_event_show;
+		pmu_attr->event_str = events[i][1];
+		pmu_attr->type = type;
+		pmu_attr++;
+	}
+}
 
-	pmu_entry = kzalloc(sizeof(struct amdgpu_pmu_entry), GFP_KERNEL);
+static int amdgpu_pmu_alloc_pmu_attrs(
+				struct attribute_group *fmt_attr_group,
+				struct amdgpu_pmu_event_attribute **fmt_attr,
+				int fmt_num_attrs,
+				struct attribute_group *evt_attr_group,
+				struct amdgpu_pmu_event_attribute **evt_attr,
+				int evt_num_attrs)
+{
+	*fmt_attr = kcalloc(fmt_num_attrs, sizeof(**fmt_attr), GFP_KERNEL);
 
-	if (!pmu_entry)
+	if (!(*fmt_attr))
 		return -ENOMEM;
 
-	pmu_entry->adev = adev;
+	fmt_attr_group->attrs = kcalloc(fmt_num_attrs + 1,
+				sizeof(*fmt_attr_group->attrs), GFP_KERNEL);
+
+	if (!fmt_attr_group->attrs)
+		goto err_fmt_attr_grp;
+
+	*evt_attr = kcalloc(evt_num_attrs, sizeof(**evt_attr), GFP_KERNEL);
+
+	if (!(*evt_attr))
+		goto err_evt_attr;
+
+	evt_attr_group->attrs = kcalloc(evt_num_attrs + 1,
+				sizeof(*evt_attr_group->attrs), GFP_KERNEL);
+
+	if (!evt_attr_group->attrs)
+		goto err_evt_attr_grp;
+
+	return 0;
+err_evt_attr_grp:
+	kfree(*evt_attr);
+err_evt_attr:
+	kfree(fmt_attr_group->attrs);
+err_fmt_attr_grp:
+	kfree(*fmt_attr);
+	return -ENOMEM;
+}
+
+/* init pmu tracking per pmu type */
+static int init_pmu_by_type(struct amdgpu_pmu_entry *pmu_entry,
+			char *pmu_type_name, char *pmu_file_prefix,
+			unsigned int pmu_perf_type)
+{
+	const struct attribute_group *attr_groups[] = {
+		&pmu_entry->fmt_attr_group,
+		&pmu_entry->evt_attr_group,
+		NULL
+	};
+	char pmu_name[PMU_NAME_SIZE];
+	bool is_legacy = pmu_perf_type == PERF_TYPE_AMDGPU_DF_LEGACY;
+	int ret = 0, num_events = 0;
+
 	pmu_entry->pmu = (struct pmu){
 		.event_init = amdgpu_perf_event_init,
 		.add = amdgpu_perf_add,
@@ -237,59 +378,157 @@ static int init_pmu_by_type(struct amdgpu_device *adev,
 		.task_ctx_nr = perf_invalid_context,
 	};
 
-	pmu_entry->pmu.attr_groups = attr_groups;
+	switch (pmu_entry->adev->asic_type) {
+	case CHIP_VEGA20:
+		ret = amdgpu_pmu_alloc_pmu_attrs(&pmu_entry->fmt_attr_group,
+					&pmu_entry->fmt_attr,
+					is_legacy ? NUM_FORMATS_DF_LEGACY :
+							NUM_FORMATS_AMDGPU_PMU,
+					&pmu_entry->evt_attr_group,
+					&pmu_entry->evt_attr,
+					is_legacy ? NUM_EVENTS_DF_LEGACY :
+							NUM_EVENTS_VEGA20_MAX);
+
+		if (ret)
+			goto err_out;
+
+		amdgpu_pmu_create_attributes(&pmu_entry->fmt_attr_group,
+					pmu_entry->fmt_attr,
+					is_legacy ? df_vega20_formats :
+							amdgpu_pmu_formats, 0,
+					is_legacy ? NUM_FORMATS_DF_LEGACY :
+							NUM_FORMATS_AMDGPU_PMU,
+					0);
+
+		amdgpu_pmu_create_attributes(&pmu_entry->evt_attr_group,
+					pmu_entry->evt_attr,
+					is_legacy ? df_vega20_events :
+							vega20_events, 0,
+					is_legacy ? NUM_EVENTS_DF_LEGACY :
+							NUM_EVENTS_VEGA20_XGMI,
+					is_legacy ? PERF_TYPE_AMDGPU_DF_LEGACY :
+							PERF_TYPE_AMDGPU_XGMI);
+		num_events += is_legacy ? NUM_EVENTS_DF_LEGACY :
+							NUM_EVENTS_VEGA20_XGMI;
+
+		/* other events can be added here */
+
+		break;
+	default:
+		ret = -ENODEV;
+		goto err_out;
+	};
+
+	pmu_entry->pmu.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
+								GFP_KERNEL);
+
+	if (!pmu_entry->pmu.attr_groups)
+		goto err_attr_group;
+
 	pmu_entry->pmu_perf_type = pmu_perf_type;
-	snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d",
-				pmu_file_prefix, adev_to_drm(adev)->primary->index);
+	snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_file_prefix,
+				adev_to_drm(pmu_entry->adev)->primary->index);
 
 	ret = perf_pmu_register(&pmu_entry->pmu, pmu_name, -1);
 
-	if (ret) {
-		kfree(pmu_entry);
-		pr_warn("Error initializing AMDGPU %s PMUs.\n", pmu_type_name);
-		return ret;
-	}
+	if (ret)
+		goto err_register;
 
 	pr_info("Detected AMDGPU %s Counters. # of Counters = %d.\n",
-			pmu_type_name, num_counters);
+			pmu_type_name, num_events);
 
 	list_add_tail(&pmu_entry->entry, &amdgpu_pmu_list);
 
 	return 0;
+err_register:
+	kfree(pmu_entry->pmu.attr_groups);
+err_attr_group:
+	kfree(pmu_entry->fmt_attr_group.attrs);
+	kfree(pmu_entry->fmt_attr);
+	kfree(pmu_entry->evt_attr_group.attrs);
+	kfree(pmu_entry->evt_attr);
+err_out:
+	pr_warn("Error initializing AMDGPU %s PMUs.\n", pmu_type_name);
+	return ret;
+}
+
+/* destroy all pmu data associated with target device */
+void amdgpu_pmu_fini(struct amdgpu_device *adev)
+{
+	struct amdgpu_pmu_entry *pe, *temp;
+
+	list_for_each_entry_safe(pe, temp, &amdgpu_pmu_list, entry) {
+		if (pe->adev != adev)
+			continue;
+		list_del(&pe->entry);
+		perf_pmu_unregister(&pe->pmu);
+		kfree(pe->pmu.attr_groups);
+		kfree(pe->fmt_attr_group.attrs);
+		kfree(pe->fmt_attr);
+		kfree(pe->evt_attr_group.attrs);
+		kfree(pe->evt_attr);
+		kfree(pe);
+	}
+}
+
+static bool amdgpu_pmu_is_supported(struct amdgpu_device *adev)
+{
+	return adev->asic_type == CHIP_VEGA20;
 }
 
 /* init amdgpu_pmu */
 int amdgpu_pmu_init(struct amdgpu_device *adev)
 {
 	int ret = 0;
+	struct amdgpu_pmu_entry *pmu_entry, *pmu_entry_legacy;
 
-	switch (adev->asic_type) {
-	case CHIP_VEGA20:
-		/* init df */
-		ret = init_pmu_by_type(adev, df_v3_6_attr_groups,
-				       "DF", "amdgpu_df", PERF_TYPE_AMDGPU_DF,
-				       DF_V3_6_MAX_COUNTERS);
-
-		/* other pmu types go here*/
-		break;
-	default:
+	if (!amdgpu_pmu_is_supported(adev))
 		return 0;
-	}
 
-	return 0;
-}
+	if (adev->asic_type == CHIP_VEGA20) {
+		pmu_entry_legacy = kzalloc(sizeof(struct amdgpu_pmu_entry),
+								GFP_KERNEL);
 
+		if (!pmu_entry_legacy)
+			return -ENOMEM;
 
-/* destroy all pmu data associated with target device */
-void amdgpu_pmu_fini(struct amdgpu_device *adev)
-{
-	struct amdgpu_pmu_entry *pe, *temp;
+		pmu_entry_legacy->adev = adev;
+		pmu_entry_legacy->fmt_attr_group.name = "format";
+		pmu_entry_legacy->fmt_attr_group.attrs = NULL;
+		pmu_entry_legacy->evt_attr_group.name = "events";
+		pmu_entry_legacy->evt_attr_group.attrs = NULL;
 
-	list_for_each_entry_safe(pe, temp, &amdgpu_pmu_list, entry) {
-		if (pe->adev == adev) {
-			list_del(&pe->entry);
-			perf_pmu_unregister(&pe->pmu);
-			kfree(pe);
+		ret = init_pmu_by_type(pmu_entry_legacy, "DF", "amdgpu_df",
+						PERF_TYPE_AMDGPU_DF_LEGACY);
+
+		if (ret) {
+			kfree(pmu_entry_legacy);
+			return ret;
 		}
 	}
+
+	pmu_entry = kzalloc(sizeof(struct amdgpu_pmu_entry), GFP_KERNEL);
+
+	if (!pmu_entry) {
+		if (adev->asic_type == CHIP_VEGA20)
+			amdgpu_pmu_fini(adev);
+		return -ENOMEM;
+	}
+
+	pmu_entry->adev = adev;
+	pmu_entry->fmt_attr_group.name = "format";
+	pmu_entry->fmt_attr_group.attrs = NULL;
+	pmu_entry->evt_attr_group.name = "events";
+	pmu_entry->evt_attr_group.attrs = NULL;
+
+	ret = init_pmu_by_type(pmu_entry, "Event", "amdgpu",
+							PERF_TYPE_AMDGPU_MAX);
+	if (ret) {
+		if (adev->asic_type == CHIP_VEGA20)
+			amdgpu_pmu_fini(adev);
+		kfree(pmu_entry);
+
+	}
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.h
index 7dddb7160a11..0d214abe720e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.h
@@ -27,10 +27,14 @@
 #define _AMDGPU_PMU_H_
 
 enum amdgpu_pmu_perf_type {
-	PERF_TYPE_AMDGPU_DF = 0,
+	PERF_TYPE_AMDGPU_DF_LEGACY = 0,
+	PERF_TYPE_AMDGPU_XGMI,
 	PERF_TYPE_AMDGPU_MAX
 };
 
+#define AMDGPU_PERF_TYPE_SHIFT	56
+#define AMDGPU_PERF_TYPE_MASK	0xff
+
 int amdgpu_pmu_init(struct amdgpu_device *adev);
 void amdgpu_pmu_fini(struct amdgpu_device *adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 0ca6e176acb0..6e57ae95f997 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -30,71 +30,17 @@
 #define DF_3_6_SMN_REG_INST_DIST        0x8
 #define DF_3_6_INST_CNT                 8
 
-static u32 df_v3_6_channel_number[] = {1, 2, 0, 4, 0, 8, 0,
-				       16, 32, 0, 0, 0, 2, 4, 8};
-
-/* init df format attrs */
-AMDGPU_PMU_ATTR(event,		"config:0-7");
-AMDGPU_PMU_ATTR(instance,	"config:8-15");
-AMDGPU_PMU_ATTR(umask,		"config:16-23");
-
-/* df format attributes  */
-static struct attribute *df_v3_6_format_attrs[] = {
-	&pmu_attr_event.attr,
-	&pmu_attr_instance.attr,
-	&pmu_attr_umask.attr,
-	NULL
-};
-
-/* df format attribute group */
-static struct attribute_group df_v3_6_format_attr_group = {
-	.name = "format",
-	.attrs = df_v3_6_format_attrs,
-};
+/* Defined in global_features.h as FTI_PERFMON_VISIBLE */
+#define DF_V3_6_MAX_COUNTERS		4
 
-/* df event attrs */
-AMDGPU_PMU_ATTR(cake0_pcsout_txdata,
-		      "event=0x7,instance=0x46,umask=0x2");
-AMDGPU_PMU_ATTR(cake1_pcsout_txdata,
-		      "event=0x7,instance=0x47,umask=0x2");
-AMDGPU_PMU_ATTR(cake0_pcsout_txmeta,
-		      "event=0x7,instance=0x46,umask=0x4");
-AMDGPU_PMU_ATTR(cake1_pcsout_txmeta,
-		      "event=0x7,instance=0x47,umask=0x4");
-AMDGPU_PMU_ATTR(cake0_ftiinstat_reqalloc,
-		      "event=0xb,instance=0x46,umask=0x4");
-AMDGPU_PMU_ATTR(cake1_ftiinstat_reqalloc,
-		      "event=0xb,instance=0x47,umask=0x4");
-AMDGPU_PMU_ATTR(cake0_ftiinstat_rspalloc,
-		      "event=0xb,instance=0x46,umask=0x8");
-AMDGPU_PMU_ATTR(cake1_ftiinstat_rspalloc,
-		      "event=0xb,instance=0x47,umask=0x8");
-
-/* df event attributes  */
-static struct attribute *df_v3_6_event_attrs[] = {
-	&pmu_attr_cake0_pcsout_txdata.attr,
-	&pmu_attr_cake1_pcsout_txdata.attr,
-	&pmu_attr_cake0_pcsout_txmeta.attr,
-	&pmu_attr_cake1_pcsout_txmeta.attr,
-	&pmu_attr_cake0_ftiinstat_reqalloc.attr,
-	&pmu_attr_cake1_ftiinstat_reqalloc.attr,
-	&pmu_attr_cake0_ftiinstat_rspalloc.attr,
-	&pmu_attr_cake1_ftiinstat_rspalloc.attr,
-	NULL
-};
-
-/* df event attribute group */
-static struct attribute_group df_v3_6_event_attr_group = {
-	.name = "events",
-	.attrs = df_v3_6_event_attrs
-};
+/* get flags from df perfmon config */
+#define DF_V3_6_GET_EVENT(x)		(x & 0xFFUL)
+#define DF_V3_6_GET_INSTANCE(x)		((x >> 8) & 0xFFUL)
+#define DF_V3_6_GET_UNITMASK(x)		((x >> 16) & 0xFFUL)
+#define DF_V3_6_PERFMON_OVERFLOW	0xFFFFFFFFFFFFULL
 
-/* df event attr groups  */
-const struct attribute_group *df_v3_6_attr_groups[] = {
-		&df_v3_6_format_attr_group,
-		&df_v3_6_event_attr_group,
-		NULL
-};
+static u32 df_v3_6_channel_number[] = {1, 2, 0, 4, 0, 8, 0,
+				       16, 32, 0, 0, 0, 2, 4, 8};
 
 static uint64_t df_v3_6_get_fica(struct amdgpu_device *adev,
 				 uint32_t ficaa_val)
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.h b/drivers/gpu/drm/amd/amdgpu/df_v3_6.h
index 76998541bc30..2505c7ef258a 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.h
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.h
@@ -35,15 +35,6 @@ enum DF_V3_6_MGCG {
 	DF_V3_6_MGCG_ENABLE_63_CYCLE_DELAY = 15
 };
 
-/* Defined in global_features.h as FTI_PERFMON_VISIBLE */
-#define DF_V3_6_MAX_COUNTERS		4
-
-/* get flags from df perfmon config */
-#define DF_V3_6_GET_EVENT(x)		(x & 0xFFUL)
-#define DF_V3_6_GET_INSTANCE(x)		((x >> 8) & 0xFFUL)
-#define DF_V3_6_GET_UNITMASK(x)		((x >> 16) & 0xFFUL)
-#define DF_V3_6_PERFMON_OVERFLOW	0xFFFFFFFFFFFFULL
-
 extern const struct attribute_group *df_v3_6_attr_groups[];
 extern const struct amdgpu_df_funcs df_v3_6_funcs;
 
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
