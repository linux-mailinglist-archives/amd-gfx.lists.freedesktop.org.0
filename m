Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACDC5FD7DC
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Oct 2022 12:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8599910E7AD;
	Thu, 13 Oct 2022 10:40:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305310E7AD
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Oct 2022 10:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbLyvbk6yaRO79k3Ml+UbaXIBz/9MFp5n/5pRooRhFxtvgGHV2/CY0zVU9AG2JHsAqaWtoEUa/1eB5n8k3BHD93CcF67GnL9Igdh1kUB7jOWfDMJLkvZ0fx1/IYmA9M+k6nMlYLcFw8gSATl5YXuMmwrZuUR6KehtIRQaWoNHbTSbdRyFlvmnOWBKq5Zk3S+itHaz1DeXdKsrCfAD7YdlGr+W8cRYnsfJxGg7oH9vmNgMbv6A71BWxMhMSbVL6kHN/0l60dRXhUkFSTwHHQpOkn1ep9Jg+vDQOhRTFcJ+JBCBTdN2m7jDXt+DXeyMvIXNpMLk5dNX05yNn/Fd8MHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P83Jhu+I3KJKSSj1vMbC5hElWraUwjqTX05MaNZWrrQ=;
 b=nVWcfU+rKmDxiGeDvAgx0uuSF4PNa9ekw/VvtkM18zl281TD+8kwUMWsWQbUe3SR7Pev0yfL77L4QOpAaNToQ2iTE1SQMl5sXfpXIvzi2Lkmj+HIdm/EK7RccbZ+0M7SwUdXDuFvmdRW/AgZ/a02m2YonS0HfirKO9zEEFotRD/V1JZ2gOlpbVv8jJKaVRd4WPduoCrKK0s+u37Y16J9x9dszAYLy6U67F9OUeGkSveqBflEpB9iLQyIdQ61quPRLRono4PHJxlaE2OYCihbbZnCqKm8TCnzDJIhposKC3bcac9y2VnAieqcJvjOi65TdBJISK/L8CRyzriQnCkobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P83Jhu+I3KJKSSj1vMbC5hElWraUwjqTX05MaNZWrrQ=;
 b=ZOFakHotaxoQqOkdTNR7lKCkN3zgLXf2QL+f6dsXt0O8/dvfODvjEQ8S9BC/NVTe4foZVWuPa4j5H26kPd8TsSCJte82JjMLZOF7Fkkefwex0tJ++3GFMRt5m9qV0lDvXWyfaxxLyxNBuQ5wT9mhNWy7HsLPZQYrIsWgvn1fuCA=
Received: from DM5PR07CA0103.namprd07.prod.outlook.com (2603:10b6:4:ae::32) by
 SJ1PR12MB6292.namprd12.prod.outlook.com (2603:10b6:a03:455::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Thu, 13 Oct
 2022 10:40:22 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::26) by DM5PR07CA0103.outlook.office365.com
 (2603:10b6:4:ae::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Thu, 13 Oct 2022 10:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Thu, 13 Oct 2022 10:40:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 13 Oct
 2022 05:40:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 13 Oct
 2022 05:40:20 -0500
Received: from yubiwang-dev-linux.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 13 Oct 2022 05:40:17 -0500
From: YuBiao Wang <YuBiao.Wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: dequeue mes scheduler during fini
Date: Thu, 13 Oct 2022 18:39:00 +0800
Message-ID: <20221013103858.2966780-1-YuBiao.Wang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT062:EE_|SJ1PR12MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f304917-5833-43ed-8b67-08daad075433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QzkA/WA/qQfxk7qMoEVluUGemKQ6TZCN2zSjTS3EZTQnZGjnT3Y+BRrcHoVuj6dgn+FygNQrzJXiEsUuCofMXgQZr2NgDCNIKTzn+vw0I1YC16rKcvwbzD1Oe4DWwP0H7igcUSOLbImDw/O2C4/jrXVFGhPqsK5674csXQLsFOXTaPX7fKXU9KoQpvYaRjrneaJX5WshiX7NffQ4d63qTFVof0gUbLShtlBNveVq7tx94lMTt8IT4U3xHixhww2N7MJA+QlwUZISoo5PGbkN73D/KxiGHTEm4EKnvcMjLHE1myM3WGnpruNjWjWvJyLHVdgNmpfaTk9XLycoZZQV+hSAPE7tsyRkeRWvEPdtP7dcMzs+9ym6fjqzo19wd8kXMSYAX9Mj5Ampc6xWAWde0wUuqQGrQ/xnpnyXWWqgpvZ89btsZNmWuaYUwOOFj/wLPfKk9dTLiBeUGDHJaI1aXjLA2zydvXX5eEwe9mlFIl1IFMgVtjjyoKIDcjL5KZBMGlPresHcSsQ3SRItFmQC2TF5DhgU91T6KKGzHNc4Ggi9PY2mf6oyjVgRms9eBiVhn/3EuJ4Eb9tiaIxK6M9keNqhgfxfGx7KfY4XgSoKLw1UTCjx9/tr7K6UF1Le+R3dY8ShAb5yk5gGVqaxWCJjVZNgaKCqdh0wdQSK/YVkNmhsJMJtNTSkq9oeKXedcL68/mUhsCbsPECfwerrIKGLW4Ylds76VVTg2uViQJpxIVisgRRbk8mTIyYXty3CtDRNv53PTkZKrQaexWmZ1aRk8nwO7WYEg3YtHH107zBW3Qg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(316002)(83380400001)(47076005)(426003)(81166007)(186003)(4326008)(41300700001)(82740400003)(6916009)(2906002)(70586007)(54906003)(2616005)(356005)(478600001)(70206006)(8676002)(26005)(36756003)(1076003)(40480700001)(6666004)(82310400005)(40460700003)(8936002)(5660300002)(7696005)(86362001)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 10:40:21.4605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f304917-5833-43ed-8b67-08daad075433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6292
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
Cc: YuBiao Wang <YuBiao.Wang@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, horace.chen@amd.com,
 Kevin Wang <Kevin1.Wang@amd.com>, Tuikov Luben <Luben.Tuikov@amd.com>,
 Deucher Alexander <Alexander.Deucher@amd.com>, Evan Quan <Evan.Quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Monk
 Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Resend to fix coding style issue.

[Why]
If mes is not dequeued during fini, mes will be in an uncleaned state
during reload, then mes couldn't receive some commands which leads to
reload failure.

[How]
Perform MES dequeue via MMIO after all the unmap jobs are done by mes
and before kiq fini.

Signed-off-by: YuBiao Wang <YuBiao.Wang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h |  3 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c  |  3 ++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  | 47 +++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index ad980f4b66e1..ea8efa52503b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -130,6 +130,9 @@ struct amdgpu_mes {
 	int                             (*kiq_hw_init)(struct amdgpu_device *adev);
 	int                             (*kiq_hw_fini)(struct amdgpu_device *adev);
 
+	/* dequeue sched pipe via kiq */
+	void                            (*kiq_dequeue_sched)(struct amdgpu_device *adev);
+
 	/* ip specific functions */
 	const struct amdgpu_mes_funcs   *funcs;
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 257b2e4de600..7c75758f58e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -4406,6 +4406,9 @@ static int gfx_v11_0_hw_fini(void *handle)
 		if (amdgpu_gfx_disable_kcq(adev))
 			DRM_ERROR("KCQ disable failed\n");
 
+		if (adev->mes.ring.sched.ready && adev->mes.kiq_dequeue_sched)
+			adev->mes.kiq_dequeue_sched(adev);
+
 		amdgpu_mes_kiq_hw_fini(adev);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index b48684db2832..837ff485dab6 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -44,6 +44,7 @@ MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes1.bin");
 static int mes_v11_0_hw_fini(void *handle);
 static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev);
 static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev);
+static void mes_v11_0_kiq_dequeue_sched(struct amdgpu_device *adev);
 
 #define MES_EOP_SIZE   2048
 
@@ -1078,6 +1079,7 @@ static int mes_v11_0_sw_init(void *handle)
 	adev->mes.funcs = &mes_v11_0_funcs;
 	adev->mes.kiq_hw_init = &mes_v11_0_kiq_hw_init;
 	adev->mes.kiq_hw_fini = &mes_v11_0_kiq_hw_fini;
+	adev->mes.kiq_dequeue_sched = &mes_v11_0_kiq_dequeue_sched;
 
 	r = amdgpu_mes_init(adev);
 	if (r)
@@ -1151,6 +1153,42 @@ static int mes_v11_0_sw_fini(void *handle)
 	return 0;
 }
 
+static void mes_v11_0_kiq_dequeue_sched(struct amdgpu_device *adev)
+{
+	uint32_t data;
+	int i;
+
+	mutex_lock(&adev->srbm_mutex);
+	soc21_grbm_select(adev, 3, AMDGPU_MES_SCHED_PIPE, 0, 0);
+
+	/* disable the queue if it's active */
+	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
+		WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+		for (i = 0; i < adev->usec_timeout; i++) {
+			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+				break;
+			udelay(1);
+		}
+	}
+	data = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_EN, 0);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_HIT, 1);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, data);
+
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0);
+
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_LO, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_HI, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR, 0);
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	adev->mes.ring.sched.ready = false;
+}
+
 static void mes_v11_0_kiq_setting(struct amdgpu_ring *ring)
 {
 	uint32_t tmp;
@@ -1257,9 +1295,12 @@ static int mes_v11_0_hw_init(void *handle)
 
 static int mes_v11_0_hw_fini(void *handle)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	adev->mes.ring.sched.ready = false;
+	/*
+	 * Do not disable mes.ring.sched.ready here, since mes
+	 * is still used to unmap other rings.
+	 * We'll set mes.ring.sched.ready to false when mes ring
+	 * is dequeued.
+	 */
 	return 0;
 }
 
-- 
2.25.1

