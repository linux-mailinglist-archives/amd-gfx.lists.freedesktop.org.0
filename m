Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228C806862
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Dec 2023 08:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACE310E68B;
	Wed,  6 Dec 2023 07:31:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9310E68F
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Dec 2023 07:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9pbOw1HM6AAq6WgBi5xr6CQsLPvrgFUOWb4lqgz/kI8bPWYdFzVHuRqaSRA5eZlukNuHjuojej4FT87DGHbwRa8/YL7qe02LBVMnAZOJ2igu33qTZlS9iv7tE1fhsgXCtxpj3FM9XPhnRs1kcTwwEvZKlJQK2iQTtMFsAzW/AIVKTUDvD/JGbJ4mQl/9aNLr68ygSw5b6mpxMjf9EKKDZbgSUGcmfw/jHVPdkYJ7Lz7Sp3/IQUB+WVuOUxquBxQD/x31Z/gZ3ZoR6zwMMdCV/fBTtP9ZWRwrZaxPAOGLjyGa4Ag6zONjYai8QVBnIpP0NWgmGvJW/qmxiBO+bMp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq52/BRhNMPrtOhKdplDpcYxEvdAoNh+kljaM8Q1FZk=;
 b=jpC7jl3iX+xfkmsfTWZy7jgRa8Dqyyto00WBJZn3ll2ucTIKj2wzasD95wiwI05fe9pBeNN69oUdsjP1ab78zq0FY63U3/yu518pD/r2UdiTC9dbmkHcdDVyei1Kn0TbYhnznq+j1UqyhIwdiZbPDusQjW3qKAWOg+LN5GDDZ4pvqIY1OHr9mXaENFMfIXyC+YwIKJWA0odrNwy8fh9jitGCtvyJFi310v6RiWbaowIP10DwHwr6JtibSy8aUCUjBS9pc/CkT6fbsavXdIXvfQXPgyXx8I8e5WTRn0KBsTP1nCaZ9KAeV6jmR4MtF5wUIaAxtzkHBzp77ayNkvj3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq52/BRhNMPrtOhKdplDpcYxEvdAoNh+kljaM8Q1FZk=;
 b=J+kNCSKRI3dPOyxhAA6afCyFiWlA05nUWIQTJ6V1SyL24gV9c/ZuiW8I3OmiubXymaqVvf5GvT18Ikm3N9KsOHu59g0eyHGdgpcTWxDWNdOqh11Ujp7trUTi8FrVo2hHEF0u3Z5l9jvDgDTG4BI47qUwF4X+inVzlMAkQDHBAEA=
Received: from MW4PR03CA0124.namprd03.prod.outlook.com (2603:10b6:303:8c::9)
 by BY5PR12MB4273.namprd12.prod.outlook.com (2603:10b6:a03:212::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 07:31:19 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8c:cafe::5f) by MW4PR03CA0124.outlook.office365.com
 (2603:10b6:303:8c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 07:31:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Wed, 6 Dec 2023 07:31:19 +0000
Received: from compile-server.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 01:31:14 -0600
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <lenb@kernel.org>, <hdegoede@redhat.com>, 
 <johannes@sipsolutions.net>, <davem@davemloft.net>, <edumazet@google.com>, 
 <kuba@kernel.org>, <pabeni@redhat.com>, <alexander.deucher@amd.com>,
 <Lijo.Lazar@amd.com>, <mario.limonciello@amd.com>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v15 7/9] drm/amd/pm: add flood detection for wbrf events
Date: Wed, 6 Dec 2023 15:29:45 +0800
Message-ID: <20231206072947.1331729-8-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206072947.1331729-1-Jun.Ma2@amd.com>
References: <20231206072947.1331729-1-Jun.Ma2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|BY5PR12MB4273:EE_
X-MS-Office365-Filtering-Correlation-Id: f51efba3-64b5-45e0-f30d-08dbf62d56d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2eUUex+R+INhWlAd+JfZyEj8rDbwOhRuGEonVDrs7RnyF2CDTqrf9eVIMVSiOJ3k9AnAhZ0tZ+4iZhfTKBpP+jRdRNqLNapco66Vvq9tsaVIuc9JKdDtjtm8vDE3tk2U827opOOIYCsyk4yQSH6JBSJDW8sLjkM1O7/TUQ4dZHG03j4x3XKOeoFJr1F5vTKHXbvyE+q+gELt3H4csEgqIADpZ1oug1p0XlLlttypngvUBcyimnMEi5ORMPkdg8q9Lpk4QBSFunYgb1F+fbcYXm6+Ifbey51xbyePdHfc5IhXrLwLPnjKNGAW9ndyT1JFQWoxun35B0fVuvBjniO4Rsi2pB/zZ1WoEaJ0jc/7vRJR3StC1iyQJCijHWkPJaeuUQC85tSWFjFpwfTWzEfVrwJHZtAlNMDQLVfanfeBQUL8RCPS/b4j7fGQ/+zJi+KRTxNWSDMnCvXHl9hi6Bu0jGiylMhga0y9+O5JbUIRogNr3DPxxAjWE/LDbLqmEI+9hXHwB9duWk5IRMh32mIGX5If18EdUOMy7dLGg45MXx/EvEuoXTJ2ohHBGpvhHcibikAigR5FKAgOpX6SRqzfGjXGUEwr0fqQKExHRkgxaHS6akLj1jy3DXsJ0n72nve+zAg7U7J3MegmOkkU+D8FVP+kJypWYqxzcMESEbZkNuDxaa2PF9B/zRHMV8MXRwCUzSis6BxjIo6AhD8nYkTEGmfL8kNKdSEvFRl6dwnNVYDy/UfeXbuUfqwfrCZT7S4NjrBOMMRG65OJH8i9Q8FbvThsGZrYXLCgyV/vht9wlE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(40460700003)(2906002)(41300700001)(82740400003)(7416002)(5660300002)(32650700002)(36860700001)(86362001)(36756003)(356005)(83380400001)(336012)(26005)(2616005)(6666004)(4326008)(7696005)(8936002)(478600001)(45080400002)(16526019)(70586007)(70206006)(54906003)(110136005)(316002)(81166007)(1076003)(8676002)(426003)(921008)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 07:31:19.2448 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51efba3-64b5-45e0-f30d-08dbf62d56d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4273
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
Cc: Ma Jun <Jun.Ma2@amd.com>, Evan Quan <quanliangl@hotmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Evan Quan <quanliangl@hotmail.com>

To protect PMFW from being overloaded.

Signed-off-by: Evan Quan <quanliangl@hotmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 29 +++++++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 2c7507cf256b..7049fa5c9cb2 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1410,7 +1410,8 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 
 	switch (action) {
 	case WBRF_CHANGED:
-		smu_wbrf_handle_exclusion_ranges(smu);
+		schedule_delayed_work(&smu->wbrf_delayed_work,
+				      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 		break;
 	default:
 		return NOTIFY_DONE;
@@ -1419,6 +1420,20 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+/**
+ * smu_wbrf_delayed_work_handler - callback on delayed work timer expired
+ *
+ * @work: struct work_struct pointer
+ *
+ * Flood is over and driver will consume the latest exclusion ranges.
+ */
+static void smu_wbrf_delayed_work_handler(struct work_struct *work)
+{
+	struct smu_context *smu = container_of(work, struct smu_context, wbrf_delayed_work.work);
+
+	smu_wbrf_handle_exclusion_ranges(smu);
+}
+
 /**
  * smu_wbrf_support_check - check wbrf support
  *
@@ -1448,12 +1463,13 @@ static void smu_wbrf_support_check(struct smu_context *smu)
  */
 static int smu_wbrf_init(struct smu_context *smu)
 {
-	struct amdgpu_device *adev = smu->adev;
 	int ret;
 
 	if (!smu->wbrf_supported)
 		return 0;
 
+	INIT_DELAYED_WORK(&smu->wbrf_delayed_work, smu_wbrf_delayed_work_handler);
+
 	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
 	ret = amd_wbrf_register_notifier(&smu->wbrf_notifier);
 	if (ret)
@@ -1464,11 +1480,10 @@ static int smu_wbrf_init(struct smu_context *smu)
 	 * before our driver loaded. To make sure our driver
 	 * is awared of those exclusion ranges.
 	 */
-	ret = smu_wbrf_handle_exclusion_ranges(smu);
-	if (ret)
-		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
+	schedule_delayed_work(&smu->wbrf_delayed_work,
+			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1484,6 +1499,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	amd_wbrf_unregister_notifier(&smu->wbrf_notifier);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 620e53cc3a61..24032c5bc883 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -472,6 +472,12 @@ struct stb_context {
 
 #define WORKLOAD_POLICY_MAX 7
 
+/*
+ * Configure wbrf event handling pace as there can be only one
+ * event processed every SMU_WBRF_EVENT_HANDLING_PACE ms.
+ */
+#define SMU_WBRF_EVENT_HANDLING_PACE	10
+
 struct smu_context {
 	struct amdgpu_device            *adev;
 	struct amdgpu_irq_src		irq_source;
@@ -575,6 +581,7 @@ struct smu_context {
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
 	struct notifier_block		wbrf_notifier;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

