Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F5990C2E
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2024 20:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869110EA8E;
	Fri,  4 Oct 2024 18:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lh3yHg5w";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DADB10EA8A
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2024 18:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqHV+Z1SZ2Z8305yKoGNXCtlmDrn3JcYtchpUug74qbB6tBYO7Hx7rL0ymrHNMZGdLeftKAsj7pgY40NaRu4OCEb9UGF7TNlWqQ2iA0mBx3wGo224T087z/rH9Z/G3OY4ryWZqaJH8aQUpTrwYDXksotRTsoJaZL6JhQPhaWlzO30r7JJkSZ4vz7VV3mLqjStT23FuFS6mjrqr9pPljsyuQ1zy0B1PfATcgFzOVHjMXN1EIQ0P6/ZvE4oITmGbqy3B0rbKyoHh3NFfjRp2kw+9LUgYclTiDQFG2cBnmxOA7gKM6xcFr7AEvq5xOKnvurR6eVRrmwIr+qph6wRU3fBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCt8RmA7chP+H/XAuV9/zC0WJJCbG5bRef3KZxPmWVc=;
 b=Kaepwwu5wy5fcGl0EqSTHslVFuNayDCaBCHLII9rzIQczPvFwgYHeRmpVzhR5K8Ede9SFpvEZeXb9u6fkOZjy8c5dHc5wq3tQz7brdw+MxJv0sa2yKjynHAXuLbwi26g0MBf2TiSdCZLfx1boQCz6hP1225Yg0l7WKEsO896j803yVrVeT2mEk0bcxTDCcgFzCi5VAxNWZzEIiG3RhnpeoBNt5O6REHZB3QYqlJM7Q0cXczHO+8i24Im9S0umVEtH974wR8bXNYX18C0b0fqKwLHzCmT2EjA8RKpYm4bZPGmk4gwqbDv0iJ5HUCU1sTDIiEaVvDdty7nPcbvCfNPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCt8RmA7chP+H/XAuV9/zC0WJJCbG5bRef3KZxPmWVc=;
 b=Lh3yHg5w1/3dylhtORliy8KL6dMOC5ACzWT0rscE5PQpMn9fTwv/tKNzO9o7k14USvwcK9nCbtdNGwPH4kOMe/0hA7YnjNGRXC44ydg4uWGy5St7zbaQOqf6zpHsVdKQ858Egi6g1IPViS8mUTxlGmftbST5DkRml68x8fMYyXQ=
Received: from BN9PR03CA0607.namprd03.prod.outlook.com (2603:10b6:408:106::12)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 18:45:06 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::9d) by BN9PR03CA0607.outlook.office365.com
 (2603:10b6:408:106::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 18:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 18:45:05 +0000
Received: from atitest-Rembrandt.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 13:45:03 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <leo.liu@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <sunil.khatri@amd.com>
CC: Boyuan Zhang <boyuan.zhang@amd.com>
Subject: [PATCH 07/18] drm/amdgpu: pass ip_block in set_powergating_state
Date: Fri, 4 Oct 2024 14:44:33 -0400
Message-ID: <20241004184444.435356-8-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004184444.435356-1-boyuan.zhang@amd.com>
References: <20241004184444.435356-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5706003e-1404-40d7-7695-08dce4a4a9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCt2enpjNFI1QUxXNUorNDBPclUwK3d0dDBVNDUxTXpWdEYyaUdqQmc5elRi?=
 =?utf-8?B?OGZGQitLK08zQUJ1eEhQQnErNy9HaitoOEhUMkc2cGVXa1RaOXZmb096Rlpn?=
 =?utf-8?B?ZlVWQjBlOUhpaDc4TGEvMjB6NzdDRkh3ZGdRZ0Z5K2VwU2MrWUM3TmFQUmZz?=
 =?utf-8?B?aUNTek9mcW9wQVNuZTVKQjlxK3ZpekkyQUtkampwL0F2d2tXb1M5bHNvN3hr?=
 =?utf-8?B?ZnhSY1JDaUJsUitVV0J3dFoyMlU0aUQ4aTYybWRvYjNxTVYvMys5VVdrVXBv?=
 =?utf-8?B?eGx2UHZwZXJuTkM4QTI1ZGc1Yi9aWDJzajd1UE1rSWo2ZC96UGVzRE1qdnU2?=
 =?utf-8?B?QVRURUtjdmdERys1ZlNQWk1LYllyNmhwVFp6TzFCZFpJNDlXWWNyM2ZvTWNL?=
 =?utf-8?B?emdlMnpXWWFGSWF0ajRKYjBNa2RRdzJSSG16YitJeThoVFZRYWJoVkNEQzBy?=
 =?utf-8?B?UXN2Q0h4UHJNRFRxL2xiNDBmdXY1bjBObFFsRUs2YVVpR29UdGdTQVI1Q3hV?=
 =?utf-8?B?SVZWbG40VXdhYTlIaGJDTzJZeEJlb2lnK2dPT2JVM0pJYktnNllERUZ6VWNn?=
 =?utf-8?B?c2JNTG1WR1ZKRHNHZHZSZ1RNSFFFMEFHYnFOT243UVBOVWdLV2xhRDJiT0xV?=
 =?utf-8?B?VUZSWlhzOVpyTU5YaC82aXBRTld0RHdUelRWcTV1OW5kclpFMkNrRHZ0WWJo?=
 =?utf-8?B?UkpFbXlpSFovS0xlazB2WFJ5YlVFVVhTcTJnSzA0NGt1ZVk1UnZJZW9aa2x3?=
 =?utf-8?B?RUY5NHFLcjcyVldYS1VzNnh1RnB5L2VUckp6Tmdhck1vSzZOWmJrWlMrbjRw?=
 =?utf-8?B?ZzdYci93NE9vZzRoSmhoby82YTFLQTltQWE4RXd1N0tWR0ozdGN5NUZ6TTQv?=
 =?utf-8?B?V096SHgvVWpia1ArVStwS2paQ2k1OE84S2xLYURlN1NWWFlEWWhjbHJVbnlZ?=
 =?utf-8?B?UFJXV2ppTVIyZFVvSXYzSy8xdENvM1hzcG1jRjdEQ3IzdjRJRGYwd0h1aVBu?=
 =?utf-8?B?bmxEVzJSTnhhM2xOM3N2TUJWcG5WaDdnOXNlR3UyeW05b29GZVlRYnNiQ0Na?=
 =?utf-8?B?U2FMTnp0NkNuYXZwb0RPbDZCUWJOeDBiSTMzQ1BzaFdsLzRINjRaU2VLTXdj?=
 =?utf-8?B?cWVMdFZZRm45TTZtZ1U0elFHUnI1UlU0anY2TU9vdXlqbTJjTHFjQWdSSXI3?=
 =?utf-8?B?R1BDVW5kYjl1WmxVMTRyOFZlSERqTWtMQTRMU1pZV1EvWmpLQjNFUnZSVUFx?=
 =?utf-8?B?MjFSTm5INy9TRzJ1ZVVHWFAyaGhFNFV2ZWtOaXYyTGpyWnM0RmpzMzBtQXcz?=
 =?utf-8?B?UTRKaFc4QXROblozNUZLQmROK3BWSnpSZlMweEZKRy9jY3NoQTM0Y0tMb3Ur?=
 =?utf-8?B?bUIzOVFiQ1QydC8zSlFVNThiWjdrVEt0akJZQnd3Zzdhd2FMcU1MM09zRUdP?=
 =?utf-8?B?RUExcC83VUZzN0N3cHFmYXdNU2JnU1NOdStqNUVaMXJpT3VmUGY3b0l0M25V?=
 =?utf-8?B?Vlo3ZHRhUHZ3cTZGaG9FUnFnZXJjZ21rc1RycXJ0MnkzT2I5ZzBaeWdYbThX?=
 =?utf-8?B?YTlRQnBxdGkvOU9XTVVoTlFOVCs5eTFJYWdFMUZKVXJjNUlFKzRZRE1wRWVJ?=
 =?utf-8?B?Z1RURmg4QmhDRDFOZDdSTUt5Sk1MbmhOTk81eGI3bk1UK3IxZjdwYU1VcVM5?=
 =?utf-8?B?VFRCdHEyTnVMVW11eDFtUERtS1oxOXg1dHdwZm52UkJIWjluM2VPUWc3RVNH?=
 =?utf-8?B?YlUxOGFtVVhweFpMYzhLSWdvYkwwZFdEZDUwWW8xazI2Nnl5dDRyMFJsY3JK?=
 =?utf-8?Q?csJxSaMCwlAXwspuGho25dFttkO0kQofZyNd4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 18:45:05.4871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5706003e-1404-40d7-7695-08dce4a4a9e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
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

From: Boyuan Zhang <boyuan.zhang@amd.com>

Pass ip_block instead of adev in set_powergating_state callback function.
Modify set_powergating_state ip functions for all correspoding ip blocks.

v2: fix a ip block index error.

Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c        |  5 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c           |  4 ++--
 drivers/gpu/drm/amd/amdgpu/cik.c                  |  2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              |  4 ++--
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              |  4 ++--
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              |  4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                   |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/si.c                   |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c               |  4 ++--
 drivers/gpu/drm/amd/amdgpu/si_ih.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                |  4 ++--
 drivers/gpu/drm/amd/amdgpu/soc24.c                |  4 ++--
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             |  9 +++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             | 11 ++++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             | 13 +++++++------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           |  9 +++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           |  9 +++++----
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                   |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 drivers/gpu/drm/amd/include/amd_shared.h          |  2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        |  2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        |  2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         |  2 +-
 82 files changed, 165 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 575826d220b8..64828cb7c2f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -600,10 +600,10 @@ static int acp_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int acp_set_powergating_state(void *handle,
+static int acp_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				     enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, enable, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index b545940e512b..dd3ae5d74436 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -724,7 +724,10 @@ void amdgpu_amdkfd_set_compute_idle(struct amdgpu_device *adev, bool idle)
 		/* Disable GFXOFF and PG. Temporary workaround
 		 * to fix some compute applications issue on GFX9.
 		 */
-		adev->ip_blocks[AMD_IP_BLOCK_TYPE_GFX].version->funcs->set_powergating_state((void *)adev, state);
+		for (int i = 0; i < adev->num_ip_blocks; i++) {
+			if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX)
+				adev->ip_blocks[i].version->funcs->set_powergating_state((void *)&adev->ip_blocks[i], state);
+		}
 	}
 	amdgpu_dpm_switch_power_profile(adev,
 					PP_SMC_POWER_PROFILE_COMPUTE,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index dbe4c26f63e6..fe5de35eef64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2154,7 +2154,7 @@ int amdgpu_device_ip_set_powergating_state(void *dev,
 		if (!adev->ip_blocks[i].version->funcs->set_powergating_state)
 			continue;
 		r = adev->ip_blocks[i].version->funcs->set_powergating_state(
-			(void *)adev, state);
+			(void *)&adev->ip_blocks[i], state);
 		if (r)
 			DRM_ERROR("set_powergating_state of IP block <%s> failed %d\n",
 				  adev->ip_blocks[i].version->funcs->name, r);
@@ -3128,7 +3128,7 @@ int amdgpu_device_set_pg_state(struct amdgpu_device *adev,
 		    adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_JPEG &&
 		    adev->ip_blocks[i].version->funcs->set_powergating_state) {
 			/* enable powergating to save power */
-			r = adev->ip_blocks[i].version->funcs->set_powergating_state((void *)adev,
+			r = adev->ip_blocks[i].version->funcs->set_powergating_state((void *)&adev->ip_blocks[i],
 											state);
 			if (r) {
 				DRM_ERROR("set_powergating_state(gate) of IP block <%s> failed %d\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index adc0b80ca5db..844f71eeea27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -164,7 +164,7 @@ static int isp_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int isp_set_powergating_state(void *handle,
+static int isp_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				     enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 8ef6bf7c6b65..527470323c33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -3793,7 +3793,7 @@ static int psp_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int psp_set_powergating_state(void *handle,
+static int psp_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				     enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index fd31e2e9feb9..f44ce5edba6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -647,7 +647,7 @@ static int amdgpu_vkms_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int amdgpu_vkms_set_powergating_state(void *handle,
+static int amdgpu_vkms_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 6d96e1f21e20..f3a9ea3f6044 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -644,10 +644,10 @@ static int vpe_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int vpe_set_powergating_state(void *handle,
+static int vpe_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				     enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_vpe *vpe = &adev->vpe;
 
 	if (!adev->pm.dpm_enabled)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 6c18ab35cf69..08b398aa6c6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2185,7 +2185,7 @@ static int cik_common_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int cik_common_set_powergating_state(void *handle,
+static int cik_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					    enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 9e9a58fd86ce..42c3eb8b6a95 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -408,7 +408,7 @@ static int cik_ih_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int cik_ih_set_powergating_state(void *handle,
+static int cik_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index df3f429e003e..5283b0e94f02 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1204,7 +1204,7 @@ static int cik_sdma_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int cik_sdma_set_powergating_state(void *handle,
+static int cik_sdma_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index cadd69a243af..4bf5402bd3aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -405,7 +405,7 @@ static int cz_ih_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int cz_ih_set_powergating_state(void *handle,
+static int cz_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	// TODO
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 2d0a24a343f7..e7505934cce2 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -3313,7 +3313,7 @@ static int dce_v10_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int dce_v10_0_set_powergating_state(void *handle,
+static int dce_v10_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 386ece7bc389..8adee675f4d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3445,7 +3445,7 @@ static int dce_v11_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int dce_v11_0_set_powergating_state(void *handle,
+static int dce_v11_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index cd3e0118988d..66cb19f9b073 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -3135,7 +3135,7 @@ static int dce_v6_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int dce_v6_0_set_powergating_state(void *handle,
+static int dce_v6_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 295bc1d47095..57a5207b4e76 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -3223,7 +3223,7 @@ static int dce_v8_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int dce_v8_0_set_powergating_state(void *handle,
+static int dce_v8_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index bf5c739c7058..b5da9a1e8216 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3673,7 +3673,7 @@ static void gfx_v10_0_ring_invalidate_tlbs(struct amdgpu_ring *ring,
 static void gfx_v10_0_update_spm_vmid_internal(struct amdgpu_device *adev,
 					       unsigned int vmid);
 
-static int gfx_v10_0_set_powergating_state(void *handle,
+static int gfx_v10_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state);
 static void gfx10_kiq_set_resources(struct amdgpu_ring *kiq_ring, uint64_t queue_mask)
 {
@@ -7451,7 +7451,7 @@ static int gfx_v10_0_hw_fini(struct amdgpu_ip_block *ip_block)
 	 * otherwise the gfxoff disallowing will be failed to set.
 	 */
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 3, 1))
-		gfx_v10_0_set_powergating_state(ip_block->adev, AMD_PG_STATE_UNGATE);
+		gfx_v10_0_set_powergating_state(ip_block, AMD_PG_STATE_UNGATE);
 
 	if (!adev->no_hw_access) {
 		if (amdgpu_async_gfx_ring) {
@@ -8339,10 +8339,10 @@ static const struct amdgpu_rlc_funcs gfx_v10_0_rlc_funcs_sriov = {
 	.is_rlcg_access_range = gfx_v10_0_is_rlcg_access_range,
 };
 
-static int gfx_v10_0_set_powergating_state(void *handle,
+static int gfx_v10_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index c78a63da8d2e..92786e3bbf0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -5424,10 +5424,10 @@ static void gfx_v11_cntl_pg(struct amdgpu_device *adev, bool enable)
 	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
 }
 
-static int gfx_v11_0_set_powergating_state(void *handle,
+static int gfx_v11_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index dc25fcb89b13..4ff78c9e3e43 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -3846,10 +3846,10 @@ static void gfx_v12_cntl_pg(struct amdgpu_device *adev, bool enable)
 }
 #endif
 
-static int gfx_v12_0_set_powergating_state(void *handle,
+static int gfx_v12_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 6ac6d4dfa49f..429aa895d6bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3400,11 +3400,11 @@ static int gfx_v6_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int gfx_v6_0_set_powergating_state(void *handle,
+static int gfx_v6_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	bool gate = false;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (state == AMD_PG_STATE_GATE)
 		gate = true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 77150c9f1e18..7c04dccec8d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4869,11 +4869,11 @@ static int gfx_v7_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int gfx_v7_0_set_powergating_state(void *handle,
+static int gfx_v7_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	bool gate = false;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (state == AMD_PG_STATE_GATE)
 		gate = true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index cb59ba3a6d1b..22ada2ede46b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -5360,10 +5360,10 @@ static void cz_update_gfx_cg_power_gating(struct amdgpu_device *adev,
 	}
 }
 
-static int gfx_v8_0_set_powergating_state(void *handle,
+static int gfx_v8_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index d85b2968a7cf..6516e88c55aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -5214,10 +5214,10 @@ static const struct amdgpu_rlc_funcs gfx_v9_0_rlc_funcs = {
 	.is_rlcg_access_range = gfx_v9_0_is_rlcg_access_range,
 };
 
-static int gfx_v9_0_set_powergating_state(void *handle,
+static int gfx_v9_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 7d425d2e7ab0..627652cab308 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2760,7 +2760,7 @@ static const struct amdgpu_rlc_funcs gfx_v9_4_3_rlc_funcs = {
 	.is_rlcg_access_range = gfx_v9_4_3_is_rlcg_access_range,
 };
 
-static int gfx_v9_4_3_set_powergating_state(void *handle,
+static int gfx_v9_4_3_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 5cf2002fcba8..b398021d5b90 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1133,7 +1133,7 @@ static void gmc_v10_0_get_clockgating_state(void *handle, u64 *flags)
 		athub_v2_0_get_clockgating(adev, flags);
 }
 
-static int gmc_v10_0_set_powergating_state(void *handle,
+static int gmc_v10_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 4df4d73038f8..36e2f4e5a865 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -1020,7 +1020,7 @@ static void gmc_v11_0_get_clockgating_state(void *handle, u64 *flags)
 	athub_v3_0_get_clockgating(adev, flags);
 }
 
-static int gmc_v11_0_set_powergating_state(void *handle,
+static int gmc_v11_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index e33f9e9058cc..c6510f12afb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -1004,7 +1004,7 @@ static void gmc_v12_0_get_clockgating_state(void *handle, u64 *flags)
 	athub_v4_1_0_get_clockgating(adev, flags);
 }
 
-static int gmc_v12_0_set_powergating_state(void *handle,
+static int gmc_v12_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index c1e2f1d79e74..3965b9ca8e9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -1100,7 +1100,7 @@ static int gmc_v6_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int gmc_v6_0_set_powergating_state(void *handle,
+static int gmc_v6_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 54a48662f3b5..b43eaa42e5c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1327,7 +1327,7 @@ static int gmc_v7_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int gmc_v7_0_set_powergating_state(void *handle,
+static int gmc_v7_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index c4f2ad32c078..d36cf90d4133 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1679,7 +1679,7 @@ static int gmc_v8_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int gmc_v8_0_set_powergating_state(void *handle,
+static int gmc_v8_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 94600e5c8ea3..5aac51d9db2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2485,7 +2485,7 @@ static void gmc_v9_0_get_clockgating_state(void *handle, u64 *flags)
 	athub_v1_0_get_clockgating(adev, flags);
 }
 
-static int gmc_v9_0_set_powergating_state(void *handle,
+static int gmc_v9_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index a3fb01f905d4..879d34e88014 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -398,7 +398,7 @@ static int iceland_ih_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int iceland_ih_set_powergating_state(void *handle,
+static int iceland_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 09403eac483b..4f271d9f43ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -756,10 +756,10 @@ static void ih_v6_0_update_ih_mem_power_gating(struct amdgpu_device *adev,
 	WREG32_SOC15(OSSSYS, 0, regIH_MEM_POWER_CTRL, ih_mem_pwr_cntl);
 }
 
-static int ih_v6_0_set_powergating_state(void *handle,
+static int ih_v6_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					 enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (adev->pg_flags & AMD_PG_SUPPORT_IH_SRAM_PG)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 9706d7593d26..5b0a1eaa1fd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -737,10 +737,10 @@ static void ih_v6_1_update_ih_mem_power_gating(struct amdgpu_device *adev,
 	WREG32_SOC15(OSSSYS, 0, regIH_MEM_POWER_CTRL, ih_mem_pwr_cntl);
 }
 
-static int ih_v6_1_set_powergating_state(void *handle,
+static int ih_v6_1_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					 enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (adev->pg_flags & AMD_PG_SUPPORT_IH_SRAM_PG)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 9657145d7cce..a584863f1bed 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -727,10 +727,10 @@ static void ih_v7_0_update_ih_mem_power_gating(struct amdgpu_device *adev,
 	WREG32_SOC15(OSSSYS, 0, regIH_MEM_POWER_CTRL, ih_mem_pwr_cntl);
 }
 
-static int ih_v7_0_set_powergating_state(void *handle,
+static int ih_v7_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					 enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
 	if (adev->pg_flags & AMD_PG_SUPPORT_IH_SRAM_PG)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 6762b5c64ccb..c5f692a45bee 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -35,7 +35,7 @@
 
 static void jpeg_v2_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v2_0_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v2_0_set_powergating_state(void *handle,
+static int jpeg_v2_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 
 /**
@@ -154,7 +154,7 @@ static int jpeg_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 
 	if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 	      RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS))
-		jpeg_v2_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		jpeg_v2_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 
 	return 0;
 }
@@ -692,10 +692,10 @@ static int jpeg_v2_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v2_0_set_powergating_state(void *handle,
+static int jpeg_v2_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (state == adev->jpeg.cur_state)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 4b8c801f204d..f1ddef8e60ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -38,7 +38,7 @@
 
 static void jpeg_v2_5_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v2_5_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v2_5_set_powergating_state(void *handle,
+static int jpeg_v2_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 static void jpeg_v2_5_set_ras_funcs(struct amdgpu_device *adev);
 
@@ -219,7 +219,7 @@ static int jpeg_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
 
 		if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 		      RREG32_SOC15(JPEG, i, mmUVD_JRBC_STATUS))
-			jpeg_v2_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
+			jpeg_v2_5_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 
 		if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__JPEG))
 			amdgpu_irq_put(adev, &adev->jpeg.inst[i].ras_poison_irq, 0);
@@ -541,10 +541,10 @@ static int jpeg_v2_5_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v2_5_set_powergating_state(void *handle,
+static int jpeg_v2_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (state == adev->jpeg.cur_state)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 7996209818b6..69f0a9006b96 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -36,7 +36,7 @@
 
 static void jpeg_v3_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v3_0_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v3_0_set_powergating_state(void *handle,
+static int jpeg_v3_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 
 /**
@@ -168,7 +168,7 @@ static int jpeg_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 
 	if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 	      RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS))
-		jpeg_v3_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		jpeg_v3_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 
 	return 0;
 }
@@ -483,10 +483,10 @@ static int jpeg_v3_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v3_0_set_powergating_state(void *handle,
+static int jpeg_v3_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if(state == adev->jpeg.cur_state)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 20e1fe89c463..e304108d7024 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -39,7 +39,7 @@
 static int jpeg_v4_0_start_sriov(struct amdgpu_device *adev);
 static void jpeg_v4_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v4_0_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v4_0_set_powergating_state(void *handle,
+static int jpeg_v4_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 static void jpeg_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 
@@ -199,7 +199,7 @@ static int jpeg_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 	if (!amdgpu_sriov_vf(adev)) {
 		if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 			RREG32_SOC15(JPEG, 0, regUVD_JRBC_STATUS))
-			jpeg_v4_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+			jpeg_v4_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 	}
 	if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__JPEG))
 		amdgpu_irq_put(adev, &adev->jpeg.inst->ras_poison_irq, 0);
@@ -645,10 +645,10 @@ static int jpeg_v4_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v4_0_set_powergating_state(void *handle,
+static int jpeg_v4_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (amdgpu_sriov_vf(adev)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 2a53537db135..f4d6a4768ee2 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -43,7 +43,7 @@ enum jpeg_engin_status {
 
 static void jpeg_v4_0_3_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v4_0_3_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v4_0_3_set_powergating_state(void *handle,
+static int jpeg_v4_0_3_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 static void jpeg_v4_0_3_set_ras_funcs(struct amdgpu_device *adev);
 static void jpeg_v4_0_3_dec_ring_set_wptr(struct amdgpu_ring *ring);
@@ -371,7 +371,7 @@ static int jpeg_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
 
 	if (!amdgpu_sriov_vf(adev)) {
 		if (adev->jpeg.cur_state != AMD_PG_STATE_GATE)
-			ret = jpeg_v4_0_3_set_powergating_state(adev, AMD_PG_STATE_GATE);
+			ret = jpeg_v4_0_3_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 	}
 
 	return ret;
@@ -960,10 +960,10 @@ static int jpeg_v4_0_3_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v4_0_3_set_powergating_state(void *handle,
+static int jpeg_v4_0_3_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (amdgpu_sriov_vf(adev)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index ef2d4237925b..2a28eb479a34 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -48,7 +48,7 @@
 
 static void jpeg_v4_0_5_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v4_0_5_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v4_0_5_set_powergating_state(void *handle,
+static int jpeg_v4_0_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 
 static void jpeg_v4_0_5_dec_ring_set_wptr(struct amdgpu_ring *ring);
@@ -228,7 +228,7 @@ static int jpeg_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
 		if (!amdgpu_sriov_vf(adev)) {
 			if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 			    RREG32_SOC15(JPEG, i, regUVD_JRBC_STATUS))
-				jpeg_v4_0_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
+				jpeg_v4_0_5_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 		}
 	}
 	return 0;
@@ -676,10 +676,10 @@ static int jpeg_v4_0_5_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v4_0_5_set_powergating_state(void *handle,
+static int jpeg_v4_0_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (amdgpu_sriov_vf(adev)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index 7954a6fae464..692d0083b5f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -36,7 +36,7 @@
 
 static void jpeg_v5_0_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v5_0_0_set_irq_funcs(struct amdgpu_device *adev);
-static int jpeg_v5_0_0_set_powergating_state(void *handle,
+static int jpeg_v5_0_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 
 /**
@@ -165,7 +165,7 @@ static int jpeg_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
 
 	if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 	      RREG32_SOC15(JPEG, 0, regUVD_JRBC_STATUS))
-		jpeg_v5_0_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		jpeg_v5_0_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 
 	return 0;
 }
@@ -570,10 +570,10 @@ static int jpeg_v5_0_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int jpeg_v5_0_0_set_powergating_state(void *handle,
+static int jpeg_v5_0_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (state == adev->jpeg.cur_state)
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 93da900b7ee2..9ca248ea3428 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -677,7 +677,7 @@ static int navi10_ih_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int navi10_ih_set_powergating_state(void *handle,
+static int navi10_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 4e8f9af1e2be..6481f72b32d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1085,7 +1085,7 @@ static int nv_common_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int nv_common_set_powergating_state(void *handle,
+static int nv_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
 	/* TODO */
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 10fd772cb80f..6a1028baf16d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1087,7 +1087,7 @@ static int sdma_v2_4_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v2_4_set_powergating_state(void *handle,
+static int sdma_v2_4_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 69fba087e09c..42d996d4136f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1506,7 +1506,7 @@ static int sdma_v3_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v3_0_set_powergating_state(void *handle,
+static int sdma_v3_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 3f5959557727..a2f5f2be699b 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2312,10 +2312,10 @@ static int sdma_v4_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v4_0_set_powergating_state(void *handle,
+static int sdma_v4_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 1, 0):
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 9c7cea0890c9..95d5de2bd186 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1830,7 +1830,7 @@ static int sdma_v4_4_2_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v4_4_2_set_powergating_state(void *handle,
+static int sdma_v4_4_2_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 6a675daf5620..82a8bbd53d49 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1859,7 +1859,7 @@ static int sdma_v5_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v5_0_set_powergating_state(void *handle,
+static int sdma_v5_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index e1413ccaf7e4..b84d5c27bb94 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1818,7 +1818,7 @@ static int sdma_v5_2_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v5_2_set_powergating_state(void *handle,
+static int sdma_v5_2_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 4b33bd6b776d..bc9fe03ab145 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1589,7 +1589,7 @@ static int sdma_v6_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v6_0_set_powergating_state(void *handle,
+static int sdma_v6_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 24f24974ac1d..c224e7e7e103 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1524,7 +1524,7 @@ static int sdma_v7_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int sdma_v7_0_set_powergating_state(void *handle,
+static int sdma_v7_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index b9934661a92e..6b0211c94836 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2681,7 +2681,7 @@ static int si_common_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int si_common_set_powergating_state(void *handle,
+static int si_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					    enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index d44483ed3363..26782dad9311 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -672,12 +672,12 @@ static int si_dma_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int si_dma_set_powergating_state(void *handle,
+static int si_dma_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	u32 tmp;
 
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	WREG32(DMA_PGFSM_WRITE,  0x00002000);
 	WREG32(DMA_PGFSM_CONFIG, 0x100010ff);
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index b018a3b90401..976d803bef8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -269,7 +269,7 @@ static int si_ih_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int si_ih_set_powergating_state(void *handle,
+static int si_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 6ab34c526c86..9fbada694cd7 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1481,7 +1481,7 @@ static void soc15_common_get_clockgating_state(void *handle, u64 *flags)
 		adev->df.funcs->get_clockgating_state(adev, flags);
 }
 
-static int soc15_common_set_powergating_state(void *handle,
+static int soc15_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					    enum amd_powergating_state state)
 {
 	/* todo */
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index c4b950e75133..6497a65f9738 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -968,10 +968,10 @@ static int soc21_common_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int soc21_common_set_powergating_state(void *handle,
+static int soc21_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					   enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
 	case IP_VERSION(6, 0, 0):
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index b20dc81dc257..7b43d8908448 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -557,10 +557,10 @@ static int soc24_common_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int soc24_common_set_powergating_state(void *handle,
+static int soc24_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					      enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
 	case IP_VERSION(7, 0, 0):
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 45fb5140c8b7..77fba40e1dbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -454,7 +454,7 @@ static int tonga_ih_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int tonga_ih_set_powergating_state(void *handle,
+static int tonga_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 3011b5853fb4..561fc15173b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -796,7 +796,7 @@ static int uvd_v3_1_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int uvd_v3_1_set_powergating_state(void *handle,
+static int uvd_v3_1_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 4852a2ab128f..6bd728153b4c 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -714,7 +714,7 @@ static int uvd_v4_2_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int uvd_v4_2_set_powergating_state(void *handle,
+static int uvd_v4_2_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the UVD block.
@@ -724,7 +724,7 @@ static int uvd_v4_2_set_powergating_state(void *handle,
 	 * revisit this when there is a cleaner line between
 	 * the smc and the hw blocks
 	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (state == AMD_PG_STATE_GATE) {
 		uvd_v4_2_stop(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index a24b210c79ac..02e0e5c9e701 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -817,7 +817,7 @@ static int uvd_v5_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int uvd_v5_0_set_powergating_state(void *handle,
+static int uvd_v5_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the UVD block.
@@ -827,7 +827,7 @@ static int uvd_v5_0_set_powergating_state(void *handle,
 	 * revisit this when there is a cleaner line between
 	 * the smc and the hw blocks
 	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 0;
 
 	if (state == AMD_PG_STATE_GATE) {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index b4eeeebfe095..fdf23d2b0e42 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -1476,7 +1476,7 @@ static int uvd_v6_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int uvd_v6_0_set_powergating_state(void *handle,
+static int uvd_v6_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the UVD block.
@@ -1486,7 +1486,7 @@ static int uvd_v6_0_set_powergating_state(void *handle,
 	 * revisit this when there is a cleaner line between
 	 * the smc and the hw blocks
 	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 0;
 
 	WREG32(mmUVD_POWER_STATUS, UVD_POWER_STATUS__UVD_PG_EN_MASK);
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index a4531000ec0b..836643c99572 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -596,7 +596,7 @@ static int vce_v2_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int vce_v2_0_set_powergating_state(void *handle,
+static int vce_v2_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the VCE block.
@@ -606,7 +606,7 @@ static int vce_v2_0_set_powergating_state(void *handle,
 	 * revisit this when there is a cleaner line between
 	 * the smc and the hw blocks
 	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (state == AMD_PG_STATE_GATE)
 		return vce_v2_0_stop(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 9f9a9d89bcdc..e985cf1e63f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -801,7 +801,7 @@ static int vce_v3_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int vce_v3_0_set_powergating_state(void *handle,
+static int vce_v3_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the VCE block.
@@ -811,7 +811,7 @@ static int vce_v3_0_set_powergating_state(void *handle,
 	 * revisit this when there is a cleaner line between
 	 * the smc and the hw blocks
 	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 0;
 
 	if (state == AMD_PG_STATE_GATE) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index f4d2650e6b7a..30d64672f3c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -958,7 +958,7 @@ static int vce_v4_0_set_clockgating_state(void *handle,
 }
 #endif
 
-static int vce_v4_0_set_powergating_state(void *handle,
+static int vce_v4_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the VCE block.
@@ -968,7 +968,7 @@ static int vce_v4_0_set_powergating_state(void *handle,
 	 * revisit this when there is a cleaner line between
 	 * the smc and the hw blocks
 	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (state == AMD_PG_STATE_GATE)
 		return vce_v4_0_stop(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 1d5b0f4e5b1a..34b1e55a907a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -85,7 +85,8 @@ static int vcn_v1_0_stop(struct amdgpu_device *adev);
 static void vcn_v1_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v1_0_set_enc_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v1_0_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v1_0_set_powergating_state(void *handle, enum amd_powergating_state state);
+static int vcn_v1_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
+				enum amd_powergating_state state);
 static int vcn_v1_0_pause_dpg_mode(struct amdgpu_device *adev,
 				int inst_idx, struct dpg_pause_state *new_state);
 
@@ -281,7 +282,7 @@ static int vcn_v1_0_hw_fini(struct amdgpu_ip_block *ip_block)
 	if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
 		(adev->vcn.cur_state != AMD_PG_STATE_GATE &&
 		 RREG32_SOC15(VCN, 0, mmUVD_STATUS))) {
-		vcn_v1_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		vcn_v1_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 	}
 
 	return 0;
@@ -1799,7 +1800,7 @@ static void vcn_v1_0_dec_ring_insert_nop(struct amdgpu_ring *ring, uint32_t coun
 	}
 }
 
-static int vcn_v1_0_set_powergating_state(void *handle,
+static int vcn_v1_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the VCN block.
@@ -1810,7 +1811,7 @@ static int vcn_v1_0_set_powergating_state(void *handle,
 	 * the smc and the hw blocks
 	 */
 	int ret;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (state == adev->vcn.cur_state)
 		return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index d87e5505cf51..6c1f5d05f90a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -92,7 +92,7 @@ static const struct amdgpu_hwip_reg_entry vcn_reg_list_2_0[] = {
 static void vcn_v2_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v2_0_set_enc_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v2_0_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v2_0_set_powergating_state(void *handle,
+static int vcn_v2_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
 				int inst_idx, struct dpg_pause_state *new_state);
@@ -318,7 +318,7 @@ static int vcn_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 	if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
 	    (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
 	      RREG32_SOC15(VCN, 0, mmUVD_STATUS)))
-		vcn_v2_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		vcn_v2_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 
 	return 0;
 }
@@ -1796,7 +1796,7 @@ int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)
 }
 
 
-static int vcn_v2_0_set_powergating_state(void *handle,
+static int vcn_v2_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	/* This doesn't actually powergate the VCN block.
@@ -1807,7 +1807,7 @@ static int vcn_v2_0_set_powergating_state(void *handle,
 	 * the smc and the hw blocks
 	 */
 	int ret;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev)) {
 		adev->vcn.cur_state = AMD_PG_STATE_UNGATE;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index ad0922eb16c0..35ded346771d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -95,7 +95,7 @@ static const struct amdgpu_hwip_reg_entry vcn_reg_list_2_5[] = {
 static void vcn_v2_5_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v2_5_set_powergating_state(void *handle,
+static int vcn_v2_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				enum amd_powergating_state state);
 static int vcn_v2_5_pause_dpg_mode(struct amdgpu_device *adev,
 				int inst_idx, struct dpg_pause_state *new_state);
@@ -398,8 +398,9 @@ static int vcn_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
 
 		if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
 		    (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
-		     RREG32_SOC15(VCN, i, mmUVD_STATUS)))
-			vcn_v2_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		     RREG32_SOC15(VCN, i, mmUVD_STATUS))) {
+			vcn_v2_5_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
+		}
 
 		if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__VCN))
 			amdgpu_irq_put(adev, &adev->vcn.inst[i].ras_poison_irq, 0);
@@ -1825,10 +1826,10 @@ static int vcn_v2_5_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int vcn_v2_5_set_powergating_state(void *handle,
+static int vcn_v2_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 19c7f9cd4c15..c02c9ef8ddeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -105,7 +105,7 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev);
 static void vcn_v3_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v3_0_set_enc_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v3_0_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v3_0_set_powergating_state(void *handle,
+static int vcn_v3_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 			enum amd_powergating_state state);
 static int vcn_v3_0_pause_dpg_mode(struct amdgpu_device *adev,
 			int inst_idx, struct dpg_pause_state *new_state);
@@ -430,9 +430,9 @@ static int vcn_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 
 		if (!amdgpu_sriov_vf(adev)) {
 			if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
-					(adev->vcn.cur_state != AMD_PG_STATE_GATE &&
-					 RREG32_SOC15(VCN, i, mmUVD_STATUS))) {
-				vcn_v3_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+				(adev->vcn.cur_state != AMD_PG_STATE_GATE &&
+				 RREG32_SOC15(VCN, i, mmUVD_STATUS))) {
+				vcn_v3_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 			}
 		}
 	}
@@ -2159,10 +2159,10 @@ static int vcn_v3_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int vcn_v3_0_set_powergating_state(void *handle,
+static int vcn_v3_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	/* for SRIOV, guest should not control VCN Power-gating
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index e97d7f4ae371..319eb5a3d061 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -96,7 +96,7 @@ static int amdgpu_ih_clientid_vcns[] = {
 static int vcn_v4_0_start_sriov(struct amdgpu_device *adev);
 static void vcn_v4_0_set_unified_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v4_0_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v4_0_set_powergating_state(void *handle,
+static int vcn_v4_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
         enum amd_powergating_state state);
 static int vcn_v4_0_pause_dpg_mode(struct amdgpu_device *adev,
         int inst_idx, struct dpg_pause_state *new_state);
@@ -357,9 +357,9 @@ static int vcn_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 			continue;
 		if (!amdgpu_sriov_vf(adev)) {
 			if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
-                        (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
-                                RREG32_SOC15(VCN, i, regUVD_STATUS))) {
-                        vcn_v4_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+				(adev->vcn.cur_state != AMD_PG_STATE_GATE &&
+				 RREG32_SOC15(VCN, i, regUVD_STATUS))) {
+				vcn_v4_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 			}
 		}
 		if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__VCN))
@@ -2037,9 +2037,10 @@ static int vcn_v4_0_set_clockgating_state(void *handle, enum amd_clockgating_sta
  *
  * Set VCN block powergating state
  */
-static int vcn_v4_0_set_powergating_state(void *handle, enum amd_powergating_state state)
+static int vcn_v4_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
+					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	/* for SRIOV, guest should not control VCN Power-gating
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index ba22913398ec..b6c1135d6fec 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -87,7 +87,7 @@ static const struct amdgpu_hwip_reg_entry vcn_reg_list_4_0_3[] = {
 static int vcn_v4_0_3_start_sriov(struct amdgpu_device *adev);
 static void vcn_v4_0_3_set_unified_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v4_0_3_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v4_0_3_set_powergating_state(void *handle,
+static int vcn_v4_0_3_set_powergating_state(struct amdgpu_ip_block *ip_block,
 		enum amd_powergating_state state);
 static int vcn_v4_0_3_pause_dpg_mode(struct amdgpu_device *adev,
 		int inst_idx, struct dpg_pause_state *new_state);
@@ -319,7 +319,7 @@ static int vcn_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
 	if (adev->vcn.cur_state != AMD_PG_STATE_GATE)
-		vcn_v4_0_3_set_powergating_state(adev, AMD_PG_STATE_GATE);
+		vcn_v4_0_3_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 
 	return 0;
 }
@@ -1623,10 +1623,10 @@ static int vcn_v4_0_3_set_clockgating_state(void *handle,
  *
  * Set VCN block powergating state
  */
-static int vcn_v4_0_3_set_powergating_state(void *handle,
+static int vcn_v4_0_3_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	/* for SRIOV, guest should not control VCN Power-gating
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 873672f64778..ebf6301b13be 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -95,7 +95,7 @@ static int amdgpu_ih_clientid_vcns[] = {
 
 static void vcn_v4_0_5_set_unified_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v4_0_5_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v4_0_5_set_powergating_state(void *handle,
+static int vcn_v4_0_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
 		enum amd_powergating_state state);
 static int vcn_v4_0_5_pause_dpg_mode(struct amdgpu_device *adev,
 		int inst_idx, struct dpg_pause_state *new_state);
@@ -309,7 +309,7 @@ static int vcn_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
 			if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
 				(adev->vcn.cur_state != AMD_PG_STATE_GATE &&
 				RREG32_SOC15(VCN, i, regUVD_STATUS))) {
-				vcn_v4_0_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
+				vcn_v4_0_5_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 			}
 		}
 	}
@@ -1531,9 +1531,10 @@ static int vcn_v4_0_5_set_clockgating_state(void *handle, enum amd_clockgating_s
  *
  * Set VCN block powergating state
  */
-static int vcn_v4_0_5_set_powergating_state(void *handle, enum amd_powergating_state state)
+static int vcn_v4_0_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
+		enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (state == adev->vcn.cur_state)
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 893e66c2b9a5..50c102f1b5fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -78,7 +78,7 @@ static int amdgpu_ih_clientid_vcns[] = {
 
 static void vcn_v5_0_0_set_unified_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v5_0_0_set_irq_funcs(struct amdgpu_device *adev);
-static int vcn_v5_0_0_set_powergating_state(void *handle,
+static int vcn_v5_0_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
 		enum amd_powergating_state state);
 static int vcn_v5_0_0_pause_dpg_mode(struct amdgpu_device *adev,
 		int inst_idx, struct dpg_pause_state *new_state);
@@ -273,7 +273,7 @@ static int vcn_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
 			if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
 				(adev->vcn.cur_state != AMD_PG_STATE_GATE &&
 				RREG32_SOC15(VCN, i, regUVD_STATUS))) {
-				vcn_v5_0_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
+				vcn_v5_0_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
 			}
 		}
 	}
@@ -1258,9 +1258,10 @@ static int vcn_v5_0_0_set_clockgating_state(void *handle, enum amd_clockgating_s
  *
  * Set VCN block powergating state
  */
-static int vcn_v5_0_0_set_powergating_state(void *handle, enum amd_powergating_state state)
+static int vcn_v5_0_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
+		enum amd_powergating_state state)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret;
 
 	if (state == adev->vcn.cur_state)
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 73de5909f655..8df4f4352d65 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -616,7 +616,7 @@ static int vega10_ih_set_clockgating_state(void *handle,
 
 }
 
-static int vega10_ih_set_powergating_state(void *handle,
+static int vega10_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index a42404a58015..4ac43aeb85c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -681,7 +681,7 @@ static int vega20_ih_set_clockgating_state(void *handle,
 
 }
 
-static int vega20_ih_set_powergating_state(void *handle,
+static int vega20_ih_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 4996049dc199..6b58723f0b2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -2003,7 +2003,7 @@ static int vi_common_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int vi_common_set_powergating_state(void *handle,
+static int vi_common_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					    enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7616d7a509b9..d5a0417f95df 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -961,7 +961,7 @@ static int dm_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int dm_set_powergating_state(void *handle,
+static int dm_set_powergating_state(struct amdgpu_ip_block *ip_block,
 		  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index f98b3a544477..03c77bbc2e6d 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -398,7 +398,7 @@ struct amd_ip_funcs {
 	int (*post_soft_reset)(struct amdgpu_ip_block *ip_block);
 	int (*set_clockgating_state)(void *handle,
 				     enum amd_clockgating_state state);
-	int (*set_powergating_state)(void *handle,
+	int (*set_powergating_state)(struct amdgpu_ip_block *ip_block,
 				     enum amd_powergating_state state);
 	void (*get_clockgating_state)(void *handle, u64 *flags);
 	void (*dump_ip_state)(struct amdgpu_ip_block *ip_block);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index af7da780b58b..d5130da88162 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3194,7 +3194,7 @@ static int kv_dpm_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int kv_dpm_set_powergating_state(void *handle,
+static int kv_dpm_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					  enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index a4908f0402f1..18c47fa89bc1 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7860,7 +7860,7 @@ static int si_dpm_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int si_dpm_set_powergating_state(void *handle,
+static int si_dpm_set_powergating_state(struct amdgpu_ip_block *ip_block,
 					enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index de5ee1c5503f..069b604d6e7a 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -254,7 +254,7 @@ static int pp_sw_reset(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int pp_set_powergating_state(void *handle,
+static int pp_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				    enum amd_powergating_state state)
 {
 	return 0;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 0da84e390d0d..c58a377a5146 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2184,7 +2184,7 @@ static int smu_set_clockgating_state(void *handle,
 	return 0;
 }
 
-static int smu_set_powergating_state(void *handle,
+static int smu_set_powergating_state(struct amdgpu_ip_block *ip_block,
 				     enum amd_powergating_state state)
 {
 	return 0;
-- 
2.34.1

