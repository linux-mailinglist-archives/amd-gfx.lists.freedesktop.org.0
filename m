Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3881C96D
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Dec 2023 12:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CC210E795;
	Fri, 22 Dec 2023 11:53:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817E010E79E
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Dec 2023 11:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSsSQQaBdTsD9K0yfsD4EOtqDOvnXv0hsJ+hjI3ecBzCauhGteAdHkKiVytKtJoPIrM79HbeekKNfCnE726Q2JJIyWXFD660PX+RjB9g7oiyypTrrS/IBdco+u4OPlLrxUVc3MvfURK37RTcOdeZyjTODP1TD+Q2VtnOdx91kIQs2+J/lasVlqD8qeiAf9SyfQQXhaj+DwlLb8rwis4+UZyMfVcJ2Yl9oyFDQtwFn0lNn3YOKnt5/qdl7kbJv20h+bQYkPYNv3aPQy7hSG6vYw1JO2I0UCtmXLqZK11eIPeLjfGockQg9kHj2mubSJqVCgxHqLgfIvVNuiAdcKcEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Hf64S/VwBzA9gQIss9l6wVmmJ0q4hrQm0Eqq+uVqMw=;
 b=cgWhcmiqat+LCmTfSjDHizC3jUPt8LSdLnCgTIqfGMMr82vELZin3WhJHV8nyGcklDkzYPKSkDa/qo5u1WyPJAku1Ffe9Ngc/wmECfJXCaiu8BPE6nZu52FW8AlpaV6yfSvSx/t78wskgjuEgLmABlViNJUDMOBCYOIwI6HS1EAmFDXfFq974F8yzvVIXhajq9/0FLAFgGc9t8/J1OTx2GLHi3K8y5gdZq4MRutq6tzxMtvaUprgm+crQD8onvyzC7G3R9WGmckYTxffwACezjHv1rfthAVec/HpQZjD51VVso3NyIgyrhS0GL3xwbn/PdxqBqg2X2nqRjpmXDBxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Hf64S/VwBzA9gQIss9l6wVmmJ0q4hrQm0Eqq+uVqMw=;
 b=cMO6NOhQc9cuiLDbmD4/396fwdi1YvaAUVg103WSjDju+E+nj0SPKT+HJyb04zD9SMS1ReUBL/4I+1UL31IvnjHj3YGdu4R0TU7oypHPFeooVFGQ27lFXmorg5yCMzsEOKicv51JMc0JJXWfzS1SnWShJmKvN3tXWbRLqP1jkkw=
Received: from SA9PR13CA0090.namprd13.prod.outlook.com (2603:10b6:806:23::35)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 11:53:55 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com (2603:10b6:806:23::4)
 by SA9PR13CA0090.outlook.office365.com (2603:10b6:806:23::35) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.21 via Frontend Transport; Fri, 22 Dec 2023 11:53:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Fri, 22 Dec 2023 11:53:55 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 22 Dec 2023 05:53:52 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>
Subject: [PATCH v2] drm/amdkfd: Confirm list is non-empty before utilizing
 list_first_entry in kfd_topology.c
Date: Fri, 22 Dec 2023 17:23:39 +0530
Message-ID: <20231222115339.1689926-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e71d0d2-286a-40a9-15ca-08dc02e4acab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+RApxeWi2+xKpbyh/ih3dazNjpHct/CWldMp4Kbbl9DfB+zS6hAz6DLnpRgWYuchXP51buMKl7dpS2q470AQ31ZIX6te8zcKSE5qsC5h/450Of+k1nToc31PHK07vcXoKyRVK895jnIjRJBsTgqVbX9OTg7ulWa4azmKIDR2JChiSkajrsbM6IRRkEYuLbgVw/x0nNTNJD70zFKzO8I43V0Ogvl45NQBJ3XJY7eaF0EiqKwu5fUrX6NfLv7mSdLFzqEMn+tLXtA1h6a/4VnOImRpI4uSTcKzZDw+7SQzRd2Jnx5dSX7GJjS/WU07mLAmhCH/6Jqr3uHOdjQkch/wDuGyDnKch0IMAkEsVRFgW/JEQF/X1q2riUP4Ac4SLl/3nxDrDF2I/tpSEWX6zzyZdJAsJcp0CJW7HiVwT0Y+8tnSesOTeRIMpcNg9hE256/VnwPRD5xKAsD9nwH8YYtTAE41t/a0NAyHjLKsO3TVzNTQSA3BRBKNwdD9rKc9lrlH0dIXzMjYaPoIJ6JGIVuQys4L4tk/rIuX3QYRAioKjWBpU63kNefUJaey/IgQcpOmLitxaBZkBJjjuq8ry0hWzcjHpGCzqVP4Gsk5PxYlY6hjKhmmtz5iYg4G9ffEFpvIKw4HNwMLC7BLRYrrwB1hSo2mTV9R1T/F0IdYLN7AzzrHSmjH7Ir3rIJpRhPNJmg+eMRr3RTMItMiedWVmlzX0DSI6WGEo6rmwK1FQM6B5DdZQlPXNmBFOUFWliWOGQmi8c4aoCKg1hJlSWcVSblhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(47076005)(5660300002)(82740400003)(44832011)(40480700001)(7696005)(6666004)(478600001)(40460700003)(1076003)(26005)(426003)(336012)(16526019)(83380400001)(2616005)(54906003)(316002)(110136005)(70206006)(70586007)(6636002)(8676002)(8936002)(36860700001)(4326008)(81166007)(41300700001)(2906002)(86362001)(36756003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 11:53:55.1835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e71d0d2-286a-40a9-15ca-08dc02e4acab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Before using list_first_entry, make sure to check that list is not
empty, if list is empty return -ENODATA.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1347 kfd_create_indirect_link_prop() warn: can 'gpu_link' even be NULL?
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1428 kfd_add_peer_prop() warn: can 'iolink1' even be NULL?
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1433 kfd_add_peer_prop() warn: can 'iolink2' even be NULL?

'Fixes: 0f28cca87e9a ("drm/amdkfd: Extend KFD device topology to surface
peer-to-peer links")'
Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
Suggested-by: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---

v2: 
  Changed to "if (list_empty(&kdev->io_link_props)) return -ENODATA;"
(Lijo)

 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index dc7c8312e8c7..1fc9d4616564 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1342,10 +1342,11 @@ static int kfd_create_indirect_link_prop(struct kfd_topology_device *kdev, int g
 		num_cpu++;
 	}
 
+	if (list_empty(&kdev->io_link_props))
+		return -ENODATA;
+
 	gpu_link = list_first_entry(&kdev->io_link_props,
-					struct kfd_iolink_properties, list);
-	if (!gpu_link)
-		return -ENOMEM;
+				    struct kfd_iolink_properties, list);
 
 	for (i = 0; i < num_cpu; i++) {
 		/* CPU <--> GPU */
@@ -1423,15 +1424,17 @@ static int kfd_add_peer_prop(struct kfd_topology_device *kdev,
 				peer->gpu->adev))
 		return ret;
 
+	if (list_empty(&kdev->io_link_props))
+		return -ENODATA;
+
 	iolink1 = list_first_entry(&kdev->io_link_props,
-							struct kfd_iolink_properties, list);
-	if (!iolink1)
-		return -ENOMEM;
+				   struct kfd_iolink_properties, list);
+
+	if (list_empty(&peer->io_link_props))
+		return -ENODATA;
 
 	iolink2 = list_first_entry(&peer->io_link_props,
-							struct kfd_iolink_properties, list);
-	if (!iolink2)
-		return -ENOMEM;
+				   struct kfd_iolink_properties, list);
 
 	props = kfd_alloc_struct(props);
 	if (!props)
-- 
2.34.1

