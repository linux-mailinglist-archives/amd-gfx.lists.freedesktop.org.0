Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNs4O5u0mGlzLAMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 20:23:07 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B616A532
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 20:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D5C10E373;
	Fri, 20 Feb 2026 19:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a9dEDpc2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013059.outbound.protection.outlook.com
 [40.93.196.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C702D10E36C
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 19:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPTYnsDDlIKliO7HfeC/3QC2NxNJ43/K408SEfSVf+N+sRrHjIF/TZucUAoeopel17jI/GDRwVaTYUf09NwDXZ9SYYC5KbL6po+uK3TnrAPnioKixM2SB9cgUUPxGYA0gaNKoPffDXyU/Xzt9eNVkbbvsF77EcgRNA1axz/+ARGHxBrwed/bEgNvd5HiCMqmCW4m+tmklkTQ1jn1dThJF9M13N5mdllcvytpWuWJZhRWNkJcenVGed2wJsCuARVF62pnAC51JUO4xlOSrm/ikvMHoT3bwlZwNTrtotagRk2IF1yPh7/Zk1IrLDLtpnfCz56qiYaQpuEEE3Rvc8m1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64S4HiqM1FkOpn0QHkjuiejOS4vLdrQrx/oiV4r4EV8=;
 b=oOjIjS0dnZSI5vdR2+BrA886+AS5ihfkQo2ZdodzLV3g5sjKKJG7tf2ifaPMkGzLuOqLemFqBrrPxm0VV3/GOS37C89rNUjOIKnT4OBkdZQmIVS4hZOFAeRyQRTU7JKYtlAI5fKgXc2ss+SAod+l6k4YGOb/lE333y+G/AOGR52AT5KPDrpUEXclaZWJssAblKsJ9iPclksfHNDstyVZWQQGB0HviBsmPUjamN9gGSHftpUgsBdXCJreKQL7frBNsa8mQ+H+/LBvONXyUAwPM4DK4NqSTvvIpoRgGQlKn+BUZkO0HfAGythp6oHbW8jfQzcS/rY87CJ3H9nZW5FFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64S4HiqM1FkOpn0QHkjuiejOS4vLdrQrx/oiV4r4EV8=;
 b=a9dEDpc2+MnI+G+kOJYGX5t/tqewbu/MRdv2DOWnthgZqxMRdN0B5cZtU6+Y5ZkhpGk18MxCrskWuo/ijCXNxNGgFhnplbcxsMyApewuvQPRMSO3baUHGk5B76EqNG3oM3506eRfic6VqAqqozoVhqFvyo5PiZj7LZMmDnfnbck=
Received: from PH1PEPF00013310.namprd07.prod.outlook.com (2603:10b6:518:1::b)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 19:22:53 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH1PEPF00013310.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 19:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 19:22:52 +0000
Received: from work-495456.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Feb
 2026 13:22:51 -0600
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>
CC: <Bing.Ma@amd.com>, <jamesz@amd.com>
Subject: [PATCH 01/17] drm/amdgpu: add UAPI to support profiler
Date: Fri, 20 Feb 2026 14:22:20 -0500
Message-ID: <20260220192236.3121556-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e2e4c8-c2e1-44eb-1cc6-08de70b57107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/vw1rPlltaWKDeuxh0enhme2av3DSNInr+D0leKYO+tLpx+BTCA3M0mZRo2V?=
 =?us-ascii?Q?s/tJMBoZYTzNOvjVWOp48qIzkb0YiBesU8hL7dv5RMbUGcppYCnntxNjVI6H?=
 =?us-ascii?Q?4vJFUhOHLXpkPshN+bu+cAzuBcBLewuNwNG54V3Xs7QEe1cnqVfkP05eis8l?=
 =?us-ascii?Q?SW6a77oCYSaIim425o1HS+yCvbgmpWe8NHnY/2M8S79jEdpj+AfTAaIsaUOG?=
 =?us-ascii?Q?F3Xvjf1l7Jiknc9Oym4rlJ1AhH8VLewOlEK12zOH65NFhmVSe2BTEcPBeW71?=
 =?us-ascii?Q?zmV/OuY7alDSxX2MASGudjWzcGa/4SXKXNA+5AYAywv7CWF/wxXxGzgab2kn?=
 =?us-ascii?Q?72qt9qAvKVGqNSySH5tvgp85LFMFlTtTeDXJhxOoiYd7WzPTJZTCI+92EdY9?=
 =?us-ascii?Q?lUV287ISlYPErWD9IJbl2J6JH+PWpfflSMzMt6vEkctkO/0l1uSEvFFv4A+D?=
 =?us-ascii?Q?xA5eDbJqwG36Dgk0rxGzF0ZwUr/TY2sc3ZSHBt4wYTH1Rrsyu7+IAmlW4/JV?=
 =?us-ascii?Q?F/90Qq7b+qyg9ICoNcmYaHP1q8BNx2tCHXrvh2Wmx4jPKTRyLzeYu1nBCXI6?=
 =?us-ascii?Q?iZNsw3zQJ6k3SYNVY9ISPIfc6xQ+1J03N6J93q4ApoI1VxpA8fvkxa+Ji3Uq?=
 =?us-ascii?Q?AYI1XiaI0loR33KkYtI0mrFY7EFjvGuB618kazM8oNWEAp2mDwPulWYNvuaU?=
 =?us-ascii?Q?gNLzaHAyxmajqZxvt2eC5viWbSgu0rKxLHeQjudHvxuW+DRHZF05vP6DBhj/?=
 =?us-ascii?Q?eJwtBHZFUERxP2LibXJXQ2TH53/lZi4Y+rLqfNkasl8UwkUzHc7CPv6GN0SY?=
 =?us-ascii?Q?WtBE31I0mZ9F4Pl/LhG5qyAw1ucOI/sz4/QeWI5NHWNB5+ncu+QGv6Ya4+Th?=
 =?us-ascii?Q?lweUZA5vlTKitYIXuBFgBk2GEyxkykV48ZzDkLTNBmIyencKmiHSFgSfhJnX?=
 =?us-ascii?Q?PktVnEb74M7VOMBz5rgzWgBa3qNu/S6kqFv7kUXFSfzU7VnwN21vkyyvM8iI?=
 =?us-ascii?Q?k6sM2sNnlQCnWbpINF7SqhH92FCojH1m8OEtBKq+SX5cafGxutrXsjQkcDB8?=
 =?us-ascii?Q?zn9i/6We2G+bhFZLYxRWdHSsW6/06RxbJiBlxgggNkQNPXu8VgzNZmGGstKP?=
 =?us-ascii?Q?lL1bEeXPfElu8+Zgz/5DNUoODOC4QRLaXwRIX6Kbtq4igkQd4X9f4/Ba1utE?=
 =?us-ascii?Q?8rUnAtpkqg6/qOxFPAZUeFOD5T/XiRj9d7y6vou8r/8ot89kglzlBubnR2IV?=
 =?us-ascii?Q?UzL4d5K8qwNvmPIyt6vFeVHPTUWHMXE9N4lAFdRnSYsYNJfR2dQA+Nf6Fl+G?=
 =?us-ascii?Q?iywUeaFTuKhw+Db9c05v19EP8GsglDnWaJcSrN+QFDtyltdM6qMX+dyPL8ak?=
 =?us-ascii?Q?o9AxasEQWs3GAepzQpoa+Ss8l5DF72cItzJC6bK69RnxI+c+xtexqsBwlTAE?=
 =?us-ascii?Q?zsuMiQ3LZ9dvj9OEq68TOS8ZuClIzJB/Z528KHyrBVALf2v5oyeEQP27ggkr?=
 =?us-ascii?Q?jjQtuMpOX/digBYltqAmSbL71ZZG1FlNIZmMzYsRU5KtXgrzG2ieF3geaJtc?=
 =?us-ascii?Q?t0y9e9j4wEp0BTAJNYpVnXVKFJqhrHvsovyFccKh32QcatHmy4+qiKsYEAV1?=
 =?us-ascii?Q?Ady7AOZUbVCDXWovX7jYzlILNueNoPPabO0T0RSKM5u0mTth44jvpUad3yHk?=
 =?us-ascii?Q?2D9Yyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: He9FsA7C9FOvTRF5Ov5UrPiDAOBWeyq1pPEJA/LxZcIgTzGqiI16IA1sycYNh09r+Nt7y42Qgd1Bdfayia3n+mUM0UaaF5NXOvjONDrQUbNsU0dKWuiwO29VoM585az+9KW/2j6zzGOXXpU4cy8eamYrhFnobAseORpIPZSjGhecH2CBOoPKIug7hcAqivo4pVFtrqEiaY5is3Yjoef+ZTzgtsG+WANHeJGPvZP8So+JTIcvgh7SNUkQ1YeAU4vfN0mTU9osh1w8hEXtG3k+7xvvbMei41ICNfPbP6Dfmq8TKQvm6GttBLTHTzQRfXt+EL70ep25/+Q4rTzkGbRbTmIqNV9o3Zl+EqCSRVQiFb46NyxRuWXAVuO3VY0P2fmT+zBL0jT0TbuH4hbRb/EbK9kzb2j3TD2rAdpRxmBfYf9nqltxAAUKcsb3hszYQfbs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 19:22:52.0477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e2e4c8-c2e1-44eb-1cc6-08de70b57107
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[James.Zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7A2B616A532
X-Rspamd-Action: no action

which contains all profilers' kernel driver changes.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 include/uapi/drm/amdgpu_drm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 1a961f62724e..dfc98d6d98a8 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -58,6 +58,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
 #define DRM_AMDGPU_GEM_LIST_HANDLES	0x19
+#define DRM_AMDGPU_PROFILER			0x20
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -79,6 +80,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
 #define DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_LIST_HANDLES, struct drm_amdgpu_gem_list_handles)
+#define DRM_IOCTL_AMDGPU_PROFILER	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_PROFILER, struct drm_amdgpu_profiler_args)
 
 /**
  * DOC: memory domains
@@ -1708,6 +1710,20 @@ struct drm_color_ctm_3x4 {
 	__u64 matrix[12];
 };
 
+/*
+ * Supported Profiler Operations
+ */
+enum drm_amdgpu_profiler_ops {
+	AMDGPU_PROFILER_VERSION = 0,
+};
+
+struct drm_amdgpu_profiler_args {
+	__u32 op;				/* amdgpu_profiler_op */
+	union {
+		__u32 version;		/* lower 16 bit: minor. higher 16 bit: major */
+	};
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

