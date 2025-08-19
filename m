Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B3B2B898
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Aug 2025 07:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8D10E11A;
	Tue, 19 Aug 2025 05:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gVTv3pnB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E90910E11A
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Aug 2025 05:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgQ96S8gw3Nqr6VY7f+QQ0tmOvSaK2Q8qRRBBxz6gmLPBn0TdhqVz+ZP3R6RwxT/qFmJ2Dykeji9ovuvQvK2G8pb3NeUzDIt95P/7v89Dd4l7dS6JNcaE/yfYJj6+6etr10mYvnSt9bwyl/cY5KdIt5KFbe6IZf6waaDu0MFe6NzIdVROvZP6qII4n6MRtMqEPJu1KI8FAj5Ao2YYfbEAT2fX5eToDgjX2cF/+u+pVbBvJPdSbHequPW17373+YXMFY6Mw3Nw63EDD6+ex9YQ9VpIAuGxMglU6sFjLQrG9QqrASSBnAdDcExEkKmP+MCZtfwmJoIq1L+N7RDbbDToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umMs9Jd4lb2yr5xRB9FOp11GUb/IgkGmnu6+wh0OGbY=;
 b=OqdwFb431SD40OUxX/6U3k3pbBvU3IBL3+fFx5+8lvV+1tR8tshU1+zVyJo1B2ZuvhULd0hP/+lwPcDVay5beI4X4HzD6NknOTcivf94D8qlm23ELDTOYEhoq23guubIYSjksJzPRoU847j0HgkaGj4h43flN7/P0XapUv7EUJuXPFICz8yOZk8miFq7ffN1d59kykHV/ZaF/PAL1jQQsRJhwyZl+LbMdjltpA/C6d/41u2AS3xa/EUs/7EAgw1hOPUdrx4flTPDQK62gPXIHghf0VKq6NaLNJt3cm9FSOtYyIoUmHw+C85eqogPDwfmf7xcsvFnWitb6HGe4EnvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umMs9Jd4lb2yr5xRB9FOp11GUb/IgkGmnu6+wh0OGbY=;
 b=gVTv3pnBs6g7sG1WEXsIZ4GsK1npDnxdwFM/VAH6ssYPW44/JtrfnPMlJ6X/OIATTxgszq7jjALsvtJ0Pw8umhqEIzALnMnnZOk68JDu1d8MUJZkdFKIuSrdss5ZuOyoljUKjeGw0JPrzcthGrjnK5/A75pZ5e2bLb83ELPp9yk=
Received: from BL1PR13CA0368.namprd13.prod.outlook.com (2603:10b6:208:2c0::13)
 by BN7PPF7B4E3DFF8.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 05:26:11 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2c0:cafe::8a) by BL1PR13CA0368.outlook.office365.com
 (2603:10b6:208:2c0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.12 via Frontend Transport; Tue,
 19 Aug 2025 05:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 05:26:10 +0000
Received: from liuxiang-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 00:26:06 -0500
From: Xiang Liu <xiang.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Tao.Zhou1@amd.com>, <Stanley.Yang@amd.com>,
 <YiPeng.Chai@amd.com>, Xiang Liu <xiang.liu@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: Introduce VF critical region check for RAS
 poison injection
Date: Tue, 19 Aug 2025 13:25:47 +0800
Message-ID: <20250819052548.124897-1-xiang.liu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|BN7PPF7B4E3DFF8:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f0ab3e-caa3-4291-085e-08dddee0e85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N5CDpHJGZVHVhQL80uBMl/4UcsS2cML1Yvpl8B7pcz2lKIMrG16RMr5GZX9e?=
 =?us-ascii?Q?WgBOgD0poNQwjiNx71fNJJpWkp7V2qTpogVbuD8UZcoRZ2rKjzqXSs/s3Fjs?=
 =?us-ascii?Q?21Wdmv143PhfseCwUSpKVzimIXbjz9JQHLzGv4tpNDaZbbQCV7M0Ntx9Gw5f?=
 =?us-ascii?Q?wCA3M0nCWNhVPuVRqk8QxmepY2XmnhGynpvZIioFa6eMNHALIML8NISnxQBC?=
 =?us-ascii?Q?6tBYqfHs99wb0mCALU91Cgmf3ubmrL8bVzMIFu8Up+GmHicvlfVLLOvyap0t?=
 =?us-ascii?Q?3j4D69KGT6FqcjIgTcIaF63CnEib4KNwavdXwaeQRqRfL72UPb+E6rZ2Yfz8?=
 =?us-ascii?Q?ckS7qa4dyRUKpcOqm8RLkVFS3nYV6LFb/XHY9parfLpezHCjFm6Zr5KK/2T5?=
 =?us-ascii?Q?EDF5XvNfhq9M/Cx9JzEWtUxPhNwTvbuRCta1P73UOiV6/LXu7bAIEoUPQwfs?=
 =?us-ascii?Q?posMfW8AOh285ZR2TjZ2bApMPkxUZZ1xYJ8uDGvX75ieqvKECun1mJUhzTCV?=
 =?us-ascii?Q?WPaWK8Ul5mGcCf2e7OSrJXqwXSCCSGRQ7NpyCwtyJoCb5leWnWZgSt1NyR5p?=
 =?us-ascii?Q?Z+cxZxs4ibs1q1XEhiZkQi3YGem4bXWwTrI/kaQQAsdMZfEPHn/LEBOsmcWk?=
 =?us-ascii?Q?AXTe5Nj/9UWuyOVWKAeHXRcUegnO7Jq6EoS+DP/V6alDC44nbGsBpqKqht0T?=
 =?us-ascii?Q?amfVYuAFdr3dcsGeBXGV5nX0sjFg4Gg9Z1HBA/craGTCVMyenrM7dvq8t2FO?=
 =?us-ascii?Q?2xAe2oBDMkwGzJQ58EBGq9QYlSLKlwxZPumHs0V127OPVHeuu/Z7cj21SGdO?=
 =?us-ascii?Q?AejKRYcbrGDkibNR0O6Prk600MOGv4hM2l2xIUC+/lN2fuMVE+w0I1uZH5OF?=
 =?us-ascii?Q?d03oyFsap8Mo2HeH8Jedi5AF/ypUBLCL+/HFpLziYwZqIt5TRae/clm7TQjF?=
 =?us-ascii?Q?x+bWwJjL7yZtdbcY4dZ4DkSyYAQNq+RqLatr5rrJFrRSp1ZufhxQdx5kaxq/?=
 =?us-ascii?Q?IAYQflSdHIvMk0XRyvRzpXg85LnHvaSF601rs0+zLN9e1nJIR6nPg+UdYUBp?=
 =?us-ascii?Q?qNRGYiJ82ypTl4xpk7ifiISa7XYNni7sXJr3FD/j8qQuPn9VgtggP62Bu9bV?=
 =?us-ascii?Q?218HEburm3KcSlh6D1GzraMf4gw30Y+hbSbnWTAIoFWYo+u/2VAVGUUAuimr?=
 =?us-ascii?Q?BkAc6t2S2R0LCRh0f4VvqeJaIqYO2hXZT73OZOnsV+SZtMJMcaXiePqZtDvf?=
 =?us-ascii?Q?dwAkFW48NzsldiRnhfeZFQB/cF28aGII3qIuVoGzUM9PgN/5ZZxZxyWPhFJI?=
 =?us-ascii?Q?5nqcGH1m4+FbnqBgoJP+xd/T56I+GBgU4lDORxnV1R+nT11ACavcn97FmQGh?=
 =?us-ascii?Q?NqhG3LZ546qTg6J3D3BLEIXtRao5eWuxID3gY+Z4GwnQZwKfLpm2pnv6ADnw?=
 =?us-ascii?Q?LMf7N+avsqBdYog7T0Y7S4E0FSONbibbq1g599iJz6yK8Uo2KtU/ozS9yeSd?=
 =?us-ascii?Q?oKpALBgqjajmC20ihIpenYp91a+bHaNJ0pSL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 05:26:10.8630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f0ab3e-caa3-4291-085e-08dddee0e85f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7B4E3DFF8
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The SRIOV guest send requet to host to check whether the poison
injection address is in VF critical region or not via mabox.

Signed-off-by: Xiang Liu <xiang.liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c    | 55 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h    |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h |  5 ++
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c       | 14 ++++++
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h       |  2 +
 5 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 13f0cdeb59c4..3328ab63376b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -828,11 +828,14 @@ static void amdgpu_virt_init_ras(struct amdgpu_device *adev)
 {
 	ratelimit_state_init(&adev->virt.ras.ras_error_cnt_rs, 5 * HZ, 1);
 	ratelimit_state_init(&adev->virt.ras.ras_cper_dump_rs, 5 * HZ, 1);
+	ratelimit_state_init(&adev->virt.ras.ras_chk_criti_rs, 5 * HZ, 1);
 
 	ratelimit_set_flags(&adev->virt.ras.ras_error_cnt_rs,
 			    RATELIMIT_MSG_ON_RELEASE);
 	ratelimit_set_flags(&adev->virt.ras.ras_cper_dump_rs,
 			    RATELIMIT_MSG_ON_RELEASE);
+	ratelimit_set_flags(&adev->virt.ras.ras_chk_criti_rs,
+			    RATELIMIT_MSG_ON_RELEASE);
 
 	mutex_init(&adev->virt.ras.ras_telemetry_mutex);
 
@@ -1501,3 +1504,55 @@ void amdgpu_virt_request_bad_pages(struct amdgpu_device *adev)
 	if (virt->ops && virt->ops->req_bad_pages)
 		virt->ops->req_bad_pages(adev);
 }
+
+static int amdgpu_virt_cache_chk_criti_hit(struct amdgpu_device *adev,
+					   struct amdsriov_ras_telemetry *host_telemetry,
+					   bool *hit)
+{
+	struct amd_sriov_ras_chk_criti *tmp = NULL;
+	uint32_t checksum, used_size;
+
+	checksum = host_telemetry->header.checksum;
+	used_size = host_telemetry->header.used_size;
+
+	if (used_size > (AMD_SRIOV_RAS_TELEMETRY_SIZE_KB << 10))
+		return 0;
+
+	tmp = kmemdup(&host_telemetry->body.chk_criti, used_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	if (checksum != amd_sriov_msg_checksum(tmp, used_size, 0, 0))
+		goto out;
+
+	if (hit)
+		*hit = tmp->hit ? true : false;
+
+out:
+	kfree(tmp);
+
+	return 0;
+}
+
+int amdgpu_virt_check_vf_critical_region(struct amdgpu_device *adev, u64 addr, bool *hit)
+{
+	struct amdgpu_virt *virt = &adev->virt;
+	int r = -EPERM;
+
+	if (!virt->ops || !virt->ops->req_ras_chk_criti)
+		return -EOPNOTSUPP;
+
+	/* Host allows 15 ras telemetry requests per 60 seconds. Afterwhich, the Host
+	 * will ignore incoming guest messages. Ratelimit the guest messages to
+	 * prevent guest self DOS.
+	 */
+	if (__ratelimit(&virt->ras.ras_chk_criti_rs)) {
+		mutex_lock(&virt->ras.ras_telemetry_mutex);
+		if (!virt->ops->req_ras_chk_criti(adev, addr))
+			r = amdgpu_virt_cache_chk_criti_hit(
+				adev, virt->fw_reserve.ras_telemetry, hit);
+		mutex_unlock(&virt->ras.ras_telemetry_mutex);
+	}
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 3da3ebb1d9a1..6ca83abd7a4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -98,6 +98,7 @@ struct amdgpu_virt_ops {
 	int (*req_ras_err_count)(struct amdgpu_device *adev);
 	int (*req_ras_cper_dump)(struct amdgpu_device *adev, u64 vf_rptr);
 	int (*req_bad_pages)(struct amdgpu_device *adev);
+	int (*req_ras_chk_criti)(struct amdgpu_device *adev, u64 addr);
 };
 
 /*
@@ -252,6 +253,7 @@ struct amdgpu_virt_ras_err_handler_data {
 struct amdgpu_virt_ras {
 	struct ratelimit_state ras_error_cnt_rs;
 	struct ratelimit_state ras_cper_dump_rs;
+	struct ratelimit_state ras_chk_criti_rs;
 	struct mutex ras_telemetry_mutex;
 	uint64_t cper_rptr;
 };
@@ -447,4 +449,5 @@ int amdgpu_virt_ras_telemetry_post_reset(struct amdgpu_device *adev);
 bool amdgpu_virt_ras_telemetry_block_en(struct amdgpu_device *adev,
 					enum amdgpu_ras_block block);
 void amdgpu_virt_request_bad_pages(struct amdgpu_device *adev);
+int amdgpu_virt_check_vf_critical_region(struct amdgpu_device *adev, u64 addr, bool *hit);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index 33edad1f9dcd..3a79ed7d8031 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -405,12 +405,17 @@ struct amd_sriov_ras_cper_dump {
 	uint32_t buf[];
 };
 
+struct amd_sriov_ras_chk_criti {
+	uint32_t hit;
+};
+
 struct amdsriov_ras_telemetry {
 	struct amd_sriov_ras_telemetry_header header;
 
 	union {
 		struct amd_sriov_ras_telemetry_error_count error_count;
 		struct amd_sriov_ras_cper_dump cper_dump;
+		struct amd_sriov_ras_chk_criti chk_criti;
 	} body;
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index f6d8597452ed..00c5db336c0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -205,6 +205,9 @@ static int xgpu_nv_send_access_requests_with_param(struct amdgpu_device *adev,
 	case IDH_REQ_RAS_BAD_PAGES:
 		event = IDH_RAS_BAD_PAGES_READY;
 		break;
+	case IDH_REQ_RAS_CHK_CRITI:
+		event = IDH_REQ_RAS_CHK_CRITI_READY;
+		break;
 	default:
 		break;
 	}
@@ -535,6 +538,16 @@ static int xgpu_nv_req_ras_bad_pages(struct amdgpu_device *adev)
 	return xgpu_nv_send_access_requests(adev, IDH_REQ_RAS_BAD_PAGES);
 }
 
+static int xgpu_nv_check_vf_critical_region(struct amdgpu_device *adev, u64 addr)
+{
+	uint32_t addr_hi, addr_lo;
+
+	addr_hi = (uint32_t)(addr >> 32);
+	addr_lo = (uint32_t)(addr & 0xFFFFFFFF);
+	return xgpu_nv_send_access_requests_with_param(
+		adev, IDH_REQ_RAS_CHK_CRITI, addr_hi, addr_lo, 0);
+}
+
 const struct amdgpu_virt_ops xgpu_nv_virt_ops = {
 	.req_full_gpu	= xgpu_nv_request_full_gpu_access,
 	.rel_full_gpu	= xgpu_nv_release_full_gpu_access,
@@ -548,4 +561,5 @@ const struct amdgpu_virt_ops xgpu_nv_virt_ops = {
 	.req_ras_err_count = xgpu_nv_req_ras_err_count,
 	.req_ras_cper_dump = xgpu_nv_req_ras_cper_dump,
 	.req_bad_pages = xgpu_nv_req_ras_bad_pages,
+	.req_ras_chk_criti = xgpu_nv_check_vf_critical_region
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h
index 5808689562cc..c1083e5e41e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h
@@ -43,6 +43,7 @@ enum idh_request {
 	IDH_REQ_RAS_ERROR_COUNT = 203,
 	IDH_REQ_RAS_CPER_DUMP = 204,
 	IDH_REQ_RAS_BAD_PAGES = 205,
+	IDH_REQ_RAS_CHK_CRITI = 206
 };
 
 enum idh_event {
@@ -62,6 +63,7 @@ enum idh_event {
 	IDH_RAS_BAD_PAGES_READY = 15,
 	IDH_RAS_BAD_PAGES_NOTIFICATION = 16,
 	IDH_UNRECOV_ERR_NOTIFICATION = 17,
+	IDH_REQ_RAS_CHK_CRITI_READY = 18,
 
 	IDH_TEXT_MESSAGE = 255,
 };
-- 
2.34.1

