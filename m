Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CA6C1E39
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Mar 2023 18:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8740510E614;
	Mon, 20 Mar 2023 17:38:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33AA10E610
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Mar 2023 17:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXf8icyyWUKlHQc7b+Ho0SLNfmkjrTft8SLbrUhvCctT3oxGFVi1d2+3//A/dIt+5O9B9GxoEDPotioiIa/Sxlx3S2K9vmOFKPZ0Oi191w5pyQRVHCJqEHAsz6oFOpkJ59TgeGieOa4UDDBaCjWYKSbqdzuktgMJoQFtrJ6fxIgnTi0/a5REWRuQiLeP4LQMdR2I/niCf8dDvBNTm16wfC0NtKonAUpCwjv3woB6f2merAL3iblm378Na2/yDQkcrNWXJrA91wM9jpTETI6Vctp0sQ/cvvEjuhZggJkdgD2lyCAJrpjFlwlzK2YmwQjcVj/bJCXolRPey8FBCVRfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJScH0duXy1bsEHcxzXdFl8VLkewUTwvcCeB6HZ09z4=;
 b=SwlPGiCNuycRRP+SXbdUauon6bUuF7B+f9T+pNIwIqkABJ3AhGgJJKyqJqD0oiW8dEUFqLBtYg+jeaoWNrLxtyTl4ZJNab/8iSWylD3el1Lf1uHULeddu6D9tONC3vNHLy8UzGDhRV6A6egSrwQlnwxWe/AZpxscoQn/DbOkOg1zTH9NR8jt1rSDH4bSKbWx6muCHvKV2t2EKQZE/fm5CVZf+nqLyW6PiG7EBRCu1HzAbwGYiWkSIlMRVREEFKawjhvR5fYuWG9dmCQ4JI39ADVSJN2UBVR7oOeiMeMxu63LR3HGleHLK9x2zPgleEJTiMmogdE+Z8Shp58W+e6omA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJScH0duXy1bsEHcxzXdFl8VLkewUTwvcCeB6HZ09z4=;
 b=x0rL0t2xGr1dlVbjBOjgWDBbrrMZWwoYUYaMInk1cgRFUK2/1JlBr3xyfmsTb8i4cNTvRaigf2CHshLTh2Z6dIOuaVYkGa/2qYmvOsgw65SFLl2gWzv5fmx71wiOpe+ix9g8xuSPc41bMZfj1tCct7esc4SQ9OCBQPuNDuzpl+4=
Received: from MW4PR03CA0169.namprd03.prod.outlook.com (2603:10b6:303:8d::24)
 by BL1PR12MB5173.namprd12.prod.outlook.com (2603:10b6:208:308::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Mon, 20 Mar
 2023 17:38:29 +0000
Received: from CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::55) by MW4PR03CA0169.outlook.office365.com
 (2603:10b6:303:8d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 17:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT078.mail.protection.outlook.com (10.13.175.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 17:38:29 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 12:38:26 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/11] drm/amdgpu: add gfx shadow CS IOCTL support
Date: Mon, 20 Mar 2023 13:38:03 -0400
Message-ID: <20230320173810.250835-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320173810.250835-1-alexander.deucher@amd.com>
References: <20230320173810.250835-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT078:EE_|BL1PR12MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0e5255-3fb3-4eed-8407-08db2969eae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4TGZEYphPZIR4yJXI+1VUeHPLP7RMsoJa6PJHEtytzbOG5sI9Kjd3BHkTh9h4eig+Hi70qQnx3dpiATdOyj5fO8rr1D2Nz/IqrlZVFINmjN060/8wwvyn2VWQTSZ+ppN1bxBXdF1IU2TU8IHvGcD5zlzUI9kL9uXZOIooVTdLYznL/iT5JvvJIdIxKcetIIXnzj1DfKrzkntEY1Prem2F83Z3AAUFXlCIiXth+u/SZ+yOqxSRPc6UMT9DpVn9xazBfoQ3/4wqmXCwMUhkQ8mSr5Q2tOYsdTAfkDNIiS72LBQCCK05B/bRDfxS7mH59tqT6nOPeINlmSmSpUFZr+tYSQSsA1WOHs44AsC2cKMGYrq2GS5UXcioElND3RvmkrnN7okox3K6JRKotg7p5byFWYtqdfk5UXrhUFdWpUez+YjRH429kI4YDsOQg7COpOZ7/bCw+/q9mXJD06JH/kNi6z9NOOrv67gdV0sZZHnygBAc7ffWQ8GhdEz6ufB7+fF09fBBeXpp4tRYerxFjTeIGztLU+rmIRr0v99cLX5zjGOIBpdLC0X5cD/Y+2BOr+9zW44H1DdtFcHJkrh6SaS7/R5ygH44e7jDc5O5lUY6rD60iKzohSo6YSLU6DhOZUMdXWHNLYBbDtvTxdtuz63DdfwhDtpWkgftVfpSp7zEczFF48wEfJeYgfmI75aNfQMqXWg6brWUeed1rJ24w/9Pk1zIoWMiK2/cvJJMcUYmY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(8936002)(54906003)(356005)(478600001)(81166007)(83380400001)(40480700001)(36860700001)(4326008)(6916009)(41300700001)(8676002)(316002)(70586007)(70206006)(40460700003)(1076003)(82740400003)(5660300002)(6666004)(336012)(16526019)(86362001)(2616005)(36756003)(186003)(82310400005)(2906002)(66574015)(426003)(26005)(47076005)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:38:29.0644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0e5255-3fb3-4eed-8407-08db2969eae4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5173
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

Add support for submitting the shadow update packet
when submitting an IB.  Needed for MCBP on GFX11.

v2: update API for CSA (Alex)
v3: fix ordering; SET_Q_PREEMPTION_MODE most come before COND_EXEC
    Add missing check for AMDGPU_CHUNK_ID_CP_GFX_SHADOW in
    amdgpu_cs_pass1()
    Only initialize shadow on first use
    (Alex)
v4: Pass parameters rather than job to new ring callback (Alex)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c   | 17 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h  |  6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  3 +++
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index f6144b378617..50cc117bc628 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -280,6 +280,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
 		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
 		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
+		case AMDGPU_CHUNK_ID_CP_GFX_SHADOW:
 			break;
 
 		default:
@@ -587,6 +588,26 @@ static int amdgpu_cs_p2_syncobj_timeline_signal(struct amdgpu_cs_parser *p,
 	return 0;
 }
 
+static int amdgpu_cs_p2_shadow(struct amdgpu_cs_parser *p,
+			       struct amdgpu_cs_chunk *chunk)
+{
+	struct drm_amdgpu_cs_chunk_cp_gfx_shadow *shadow = chunk->kdata;
+	int i;
+
+	if (shadow->flags & ~AMDGPU_CS_CHUNK_CP_GFX_SHADOW_FLAGS_INIT_SHADOW)
+		return -EINVAL;
+
+	for (i = 0; i < p->gang_size; ++i) {
+		p->jobs[i]->shadow_va = shadow->shadow_va;
+		p->jobs[i]->csa_va = shadow->csa_va;
+		p->jobs[i]->gds_va = shadow->gds_va;
+		p->jobs[i]->init_shadow =
+			shadow->flags & AMDGPU_CS_CHUNK_CP_GFX_SHADOW_FLAGS_INIT_SHADOW;
+	}
+
+	return 0;
+}
+
 static int amdgpu_cs_pass2(struct amdgpu_cs_parser *p)
 {
 	unsigned int ce_preempt = 0, de_preempt = 0;
@@ -629,6 +650,11 @@ static int amdgpu_cs_pass2(struct amdgpu_cs_parser *p)
 			if (r)
 				return r;
 			break;
+		case AMDGPU_CHUNK_ID_CP_GFX_SHADOW:
+			r = amdgpu_cs_p2_shadow(p, chunk);
+			if (r)
+				return r;
+			break;
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index bcccc348dbe2..7fb8e6691d13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -136,7 +136,9 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 	uint64_t fence_ctx;
 	uint32_t status = 0, alloc_size;
 	unsigned fence_flags = 0;
-	bool secure;
+	bool secure, init_shadow;
+	u64 shadow_va, csa_va, gds_va;
+	int vmid = AMDGPU_JOB_GET_VMID(job);
 
 	unsigned i;
 	int r = 0;
@@ -150,9 +152,17 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 		vm = job->vm;
 		fence_ctx = job->base.s_fence ?
 			job->base.s_fence->scheduled.context : 0;
+		shadow_va = job->shadow_va;
+		csa_va = job->csa_va;
+		gds_va = job->gds_va;
+		init_shadow = job->init_shadow;
 	} else {
 		vm = NULL;
 		fence_ctx = 0;
+		shadow_va = 0;
+		csa_va = 0;
+		gds_va = 0;
+		init_shadow = false;
 	}
 
 	if (!ring->sched.ready && !ring->is_mes_queue) {
@@ -212,6 +222,11 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 	}
 
 	amdgpu_ring_ib_begin(ring);
+
+	if (job && ring->funcs->emit_gfx_shadow)
+		amdgpu_ring_emit_gfx_shadow(ring, shadow_va, csa_va, gds_va,
+					    init_shadow, vmid);
+
 	if (job && ring->funcs->init_cond_exec)
 		patch_offset = amdgpu_ring_init_cond_exec(ring);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 9790def34815..b470808fa40e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -68,6 +68,12 @@ struct amdgpu_job {
 	uint64_t		uf_addr;
 	uint64_t		uf_sequence;
 
+	/* virtual addresses for shadow/GDS/CSA */
+	uint64_t		shadow_va;
+	uint64_t		csa_va;
+	uint64_t		gds_va;
+	bool			init_shadow;
+
 	/* job_run_counter >= 1 means a resubmit job */
 	uint32_t		job_run_counter;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 3989e755a5b4..7942cb62e52c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -212,6 +212,8 @@ struct amdgpu_ring_funcs {
 	void (*end_use)(struct amdgpu_ring *ring);
 	void (*emit_switch_buffer) (struct amdgpu_ring *ring);
 	void (*emit_cntxcntl) (struct amdgpu_ring *ring, uint32_t flags);
+	void (*emit_gfx_shadow)(struct amdgpu_ring *ring, u64 shadow_va, u64 csa_va,
+				u64 gds_va, bool init_shadow, int vmid);
 	void (*emit_rreg)(struct amdgpu_ring *ring, uint32_t reg,
 			  uint32_t reg_val_offs);
 	void (*emit_wreg)(struct amdgpu_ring *ring, uint32_t reg, uint32_t val);
@@ -307,6 +309,7 @@ struct amdgpu_ring {
 #define amdgpu_ring_emit_hdp_flush(r) (r)->funcs->emit_hdp_flush((r))
 #define amdgpu_ring_emit_switch_buffer(r) (r)->funcs->emit_switch_buffer((r))
 #define amdgpu_ring_emit_cntxcntl(r, d) (r)->funcs->emit_cntxcntl((r), (d))
+#define amdgpu_ring_emit_gfx_shadow(r, s, c, g, i, v) (r)->funcs->emit_gfx_shadow((r), (s), (c), (g), (i), (v))
 #define amdgpu_ring_emit_rreg(r, d, o) (r)->funcs->emit_rreg((r), (d), (o))
 #define amdgpu_ring_emit_wreg(r, d, v) (r)->funcs->emit_wreg((r), (d), (v))
 #define amdgpu_ring_emit_reg_wait(r, d, v, m) (r)->funcs->emit_reg_wait((r), (d), (v), (m))
-- 
2.39.2

