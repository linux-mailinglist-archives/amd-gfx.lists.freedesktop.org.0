Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF7343EE8
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Mar 2021 12:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C27899B3;
	Mon, 22 Mar 2021 11:07:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADCD89913;
 Mon, 22 Mar 2021 11:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsRu0+h+wXnjJdDUTdCp2A5hfE6IpHL6NxIo7BRr+dxRQuOALIe1kO9+R9/IAqmnZzzUGGg6B25oJ6Mvx13o2FkaaYc5BI6nkQqiQoFd09lHKHXcUmstVAfYDqeR6koIZZBE9DJQ/2aaj+NKui13oFkdZFKSCr4q2E5l18v6YdrTTT4kgZPrWbfSKJZrUGRZG/GFRrbrck/ZXNZ7BTl9gi+RPTvH6Xbqj+jiDq5kwh/FyRCRHgNjwHZYsgXbAYusPdJT6MGHM4qHyAVEFohI90U45Z4Bbou15xZFczhuCx6QPfqm50E2PW+NpfIyXk5Opu+lDseiT3lhhYD0BNYBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEkGnQ/dUrzy0vrtXpEDUBVM61SU5hsYR5KSzxWkbKY=;
 b=OJFK3ch27+0VJsyId9tnsGslE0FzkAD/Dwxg5qxReoLOfQflWp+hvp+Q0o3lJieuTvHj5HOo3KRGBFxiBRzDYm55w/bumUD42vsY9+Gy/L4hv+d9OqmvITgAjtz8/tQth2p65KGdedWdgTSMzao8S4pR1pJBF7U28H+Sb21vwevqHEjFC03nogvPcv2Lm5zLWeaVgF12SURrqFXshXg/mvmPWPI2EqNCabh1RzBhdloRizEdqSjjbENdhTyNRjE7SYNNzcZRkB/RExEbC4f3DuaKKJ1AEpHXfQxviajZsjtGc56rJeHLnUvp9J8xpWKZDj1JTteCDFGgwLlmueC3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEkGnQ/dUrzy0vrtXpEDUBVM61SU5hsYR5KSzxWkbKY=;
 b=XUbHDExY91XHM2QnZ3+0n3eh3VrSPmgRCK71LEV/YDC2W1QMnh37GezSK+45V/p+RLvZLIyJdq0lEM6a+0PJmDWEA+Vw0clFwhfjUZUiu3U5fi9IY7vdBzlcq3jZej3y/Ku2gJ1A2PnJ5cm/Vwdw61/AOlpJZtGrrdBfpqAutIE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:30 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:30 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/44] drm/amdgpu: replace per_device_list by array
Date: Mon, 22 Mar 2021 06:58:17 -0400
Message-Id: <20210322105900.14068-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95de28c3-4a07-4714-d26d-08d8ed22af31
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39351A16D6FBB202CF56069F92659@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H43X1hMiwhmk87vY0tUR933LZFJcKDZXxeyhp+CefHFsFfPj90NFkd+eBOn6DZJ10Wi1Wz9TrlKjF/S/mZU6nwVubyswZ0+D50kksmiZ52u2jLF4bKOfBGmbChKicFuNyLE/hSXme/3+I+LcXO8l/nTWfNXu91BcKhM+kCq/f0BfucaYk9Zvmv2Kp+4+Ii+WQ3GSRllFY4zdAZF+g7gEU2jfSZiVV9BJwmX8l2jQHGS4yuxrL+IfwHD2MRKo4ANf4jufoP/S08nnVI7UIBRZCHTc371D9BGO6aZNVEd9uTlaV7KdCckNK00QO9L5pD8B9swqyaL2wj4TMp/4sCO+RKGw+HL9gZOyqrPlwFgaskw5zujpipp4b47kCxjpYdX8GmlmHv4r1BfqZYWdbXP98zACl6vMIBe0qZDVfhH5UNEpjjypUfX92JsKeorVsVfXAypdFeKraxkxRPR3px7C3UEdimbwcGrJv9iUCz1nM6WVkKsfVpZnR+iOq5BVmtFEZyPoxOKaKAWHyZtyLOwLPa7Lsi+qXC0+AIoZkAEw7GakWZpnlG80KztwrbND/wv96Ied82/gB0CACr0k+oRjbxW8nwT2PLyf7pzon3IsllQEENo/bvZMvfjkQrxuqAgEFti8NkbvpNEid9RWYy+tx/disImgvj7ra61kHQ6lFrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(5660300002)(30864003)(8936002)(450100002)(6486002)(478600001)(4326008)(83380400001)(1076003)(86362001)(8676002)(956004)(2906002)(36756003)(7696005)(26005)(16526019)(52116002)(186003)(316002)(66946007)(66556008)(6666004)(66476007)(2616005)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O9EDsRKtRNloU2lEcyo18QbpdJJLp1yyL8Qm6ufJuz3Cf89xyXwYniMt6BFP?=
 =?us-ascii?Q?EhrxgCpQYxd1Lwi4q2SzjHg6LftRxfOtbDrPrAdsBQ2Qok/aSnDz55BD25dp?=
 =?us-ascii?Q?fwF02FYut5HrlRiXpvMk8LZ0jZNaZlMTGcgbRrwASh3QHsRxoz9ij3HushFz?=
 =?us-ascii?Q?poPmDD8eHEdwZwSBnZLG1tyWmDdjFafewVyD7ugXU/30Vcyi0NO6gblxFGqN?=
 =?us-ascii?Q?6ZSMPLi73C3/JNcyR67vCmptryP6MNtPHZwiC/sXkDEF2B0Zfr8x8lzTxpQq?=
 =?us-ascii?Q?3U7ntjm8qk/i3nkLBd9FeZtE8lQR78/6iYYND3aQAXkvH6AwYEVD4926rnVC?=
 =?us-ascii?Q?U92BeZd1ewKx223V4yOPVOiXLehU2jyia2M3Cn2qUGd0VKx6Q+2+QJ3EbJ/U?=
 =?us-ascii?Q?W+AZ3g2X7h9ccL7Ifm2BAS+0UM1oMYid4UB7ObRctXhloGioTmcdihkvUat9?=
 =?us-ascii?Q?UTgA7AbB3d44jA6CfsuKsqkvhBuI+AoKKa1yaPmjFVPJNBgBxPONKUJOEUwS?=
 =?us-ascii?Q?HIr0Lmd+P7H43lqfnwepoNeks6W711Pj8BXAimZvSSFnZWXMnPMjvXaaDx7Z?=
 =?us-ascii?Q?N554vAM5Q9JFGn3KPxjiMheQfPToS5/EQ6z2MzOEvBpX2hS+xHCxnYuyNcgQ?=
 =?us-ascii?Q?d+3Gnr5c8ND8ikTEunL2W5vrYToFfgBIeJc5+CJiD4VUyPT+OAhIuaNxfIfH?=
 =?us-ascii?Q?DYt9Qt3e2MOdip2QgukrH2X2+hanQwVnmyozleN4HG5lY2oaLQ81p+SAUoWx?=
 =?us-ascii?Q?CsNSEa/BsCj3Vc05pwUaewzta9bUvvtOoSbmI4zkyI5vF3MA3ySuoxpK7TLA?=
 =?us-ascii?Q?/9Hio+ShtePoOnWLs8c9nmI9N7o82SSLaNUSTLy/D/Kyx0FJt8xit68qHctE?=
 =?us-ascii?Q?WVOqkkouzQL53frtPbhPLK8aP2RfjJIP7SE2eM0iB25NN/Y8x7DJFGheTLwe?=
 =?us-ascii?Q?glBXX2NfJCwEQ5tP2RmvJDPf2QRT6mgk/el98fi4vH1s8/NkQ9h2r8kYTO/h?=
 =?us-ascii?Q?BJBaQTH1aeKBU6KZqUW1mIHSmqmAOCOWMv4H7qB0DMYA2y2sA5u0sGi8S//S?=
 =?us-ascii?Q?w3pKXshyWPGikmY08uElM6EigK35d+QiqLTe0VEp4H+aV4OxWi11AS9SZ+/5?=
 =?us-ascii?Q?oaQIzmRnoOcUE28KdTsOHYqmOuNxHlAYMjjUFG/Nf0KYXxy4xDru9GfZzEPO?=
 =?us-ascii?Q?LEXwkW4yIbNk4n7yestNpUFu/ciJZaXtXyEijRikjstxs7V55lLJ0hl/D4Cw?=
 =?us-ascii?Q?j0TQrn3QGIKFkGskemL/uu4NdSo3CfMv3y4GgiaAREX1eKq0nLLmrI6njKmK?=
 =?us-ascii?Q?rk6haHU+JHdGwII1iWRmcsO9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95de28c3-4a07-4714-d26d-08d8ed22af31
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:29.9383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPz58wn6B4wLuq7VNePcZrsh04H+4jNrKleb1ed3ZZEljK5AHz1M4Xya/kMA40ttqrsVgPiqIkdcTgeyQfcI8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Remove per_device_list from kfd_process and replace it with a
kfd_process_device pointers array of MAX_GPU_INSTANCES size. This helps
to manage the kfd_process_devices binded to a specific kfd_process.
Also, functions used by kfd_chardev to iterate over the list were
removed, since they are not valid anymore. Instead, it was replaced by a
local loop iterating the array.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 116 ++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  20 +--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 108 ++++++++--------
 .../amd/amdkfd/kfd_process_queue_manager.c    |   6 +-
 5 files changed, 111 insertions(+), 147 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 6802c616e10e..43de260b2230 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -870,52 +870,47 @@ static int kfd_ioctl_get_process_apertures(struct file *filp,
 {
 	struct kfd_ioctl_get_process_apertures_args *args = data;
 	struct kfd_process_device_apertures *pAperture;
-	struct kfd_process_device *pdd;
+	int i;
 
 	dev_dbg(kfd_device, "get apertures for PASID 0x%x", p->pasid);
 
 	args->num_of_nodes = 0;
 
 	mutex_lock(&p->mutex);
+	/* Run over all pdd of the process */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		pAperture =
+			&args->process_apertures[args->num_of_nodes];
+		pAperture->gpu_id = pdd->dev->id;
+		pAperture->lds_base = pdd->lds_base;
+		pAperture->lds_limit = pdd->lds_limit;
+		pAperture->gpuvm_base = pdd->gpuvm_base;
+		pAperture->gpuvm_limit = pdd->gpuvm_limit;
+		pAperture->scratch_base = pdd->scratch_base;
+		pAperture->scratch_limit = pdd->scratch_limit;
 
-	/*if the process-device list isn't empty*/
-	if (kfd_has_process_device_data(p)) {
-		/* Run over all pdd of the process */
-		pdd = kfd_get_first_process_device_data(p);
-		do {
-			pAperture =
-				&args->process_apertures[args->num_of_nodes];
-			pAperture->gpu_id = pdd->dev->id;
-			pAperture->lds_base = pdd->lds_base;
-			pAperture->lds_limit = pdd->lds_limit;
-			pAperture->gpuvm_base = pdd->gpuvm_base;
-			pAperture->gpuvm_limit = pdd->gpuvm_limit;
-			pAperture->scratch_base = pdd->scratch_base;
-			pAperture->scratch_limit = pdd->scratch_limit;
-
-			dev_dbg(kfd_device,
-				"node id %u\n", args->num_of_nodes);
-			dev_dbg(kfd_device,
-				"gpu id %u\n", pdd->dev->id);
-			dev_dbg(kfd_device,
-				"lds_base %llX\n", pdd->lds_base);
-			dev_dbg(kfd_device,
-				"lds_limit %llX\n", pdd->lds_limit);
-			dev_dbg(kfd_device,
-				"gpuvm_base %llX\n", pdd->gpuvm_base);
-			dev_dbg(kfd_device,
-				"gpuvm_limit %llX\n", pdd->gpuvm_limit);
-			dev_dbg(kfd_device,
-				"scratch_base %llX\n", pdd->scratch_base);
-			dev_dbg(kfd_device,
-				"scratch_limit %llX\n", pdd->scratch_limit);
-
-			args->num_of_nodes++;
-
-			pdd = kfd_get_next_process_device_data(p, pdd);
-		} while (pdd && (args->num_of_nodes < NUM_OF_SUPPORTED_GPUS));
-	}
+		dev_dbg(kfd_device,
+			"node id %u\n", args->num_of_nodes);
+		dev_dbg(kfd_device,
+			"gpu id %u\n", pdd->dev->id);
+		dev_dbg(kfd_device,
+			"lds_base %llX\n", pdd->lds_base);
+		dev_dbg(kfd_device,
+			"lds_limit %llX\n", pdd->lds_limit);
+		dev_dbg(kfd_device,
+			"gpuvm_base %llX\n", pdd->gpuvm_base);
+		dev_dbg(kfd_device,
+			"gpuvm_limit %llX\n", pdd->gpuvm_limit);
+		dev_dbg(kfd_device,
+			"scratch_base %llX\n", pdd->scratch_base);
+		dev_dbg(kfd_device,
+			"scratch_limit %llX\n", pdd->scratch_limit);
 
+		if (++args->num_of_nodes >= NUM_OF_SUPPORTED_GPUS)
+			break;
+	}
 	mutex_unlock(&p->mutex);
 
 	return 0;
@@ -926,9 +921,8 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 {
 	struct kfd_ioctl_get_process_apertures_new_args *args = data;
 	struct kfd_process_device_apertures *pa;
-	struct kfd_process_device *pdd;
-	uint32_t nodes = 0;
 	int ret;
+	int i;
 
 	dev_dbg(kfd_device, "get apertures for PASID 0x%x", p->pasid);
 
@@ -937,17 +931,7 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 		 * sufficient memory
 		 */
 		mutex_lock(&p->mutex);
-
-		if (!kfd_has_process_device_data(p))
-			goto out_unlock;
-
-		/* Run over all pdd of the process */
-		pdd = kfd_get_first_process_device_data(p);
-		do {
-			args->num_of_nodes++;
-			pdd = kfd_get_next_process_device_data(p, pdd);
-		} while (pdd);
-
+		args->num_of_nodes = p->n_pdds;
 		goto out_unlock;
 	}
 
@@ -962,22 +946,23 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 
 	mutex_lock(&p->mutex);
 
-	if (!kfd_has_process_device_data(p)) {
+	if (!p->n_pdds) {
 		args->num_of_nodes = 0;
 		kfree(pa);
 		goto out_unlock;
 	}
 
 	/* Run over all pdd of the process */
-	pdd = kfd_get_first_process_device_data(p);
-	do {
-		pa[nodes].gpu_id = pdd->dev->id;
-		pa[nodes].lds_base = pdd->lds_base;
-		pa[nodes].lds_limit = pdd->lds_limit;
-		pa[nodes].gpuvm_base = pdd->gpuvm_base;
-		pa[nodes].gpuvm_limit = pdd->gpuvm_limit;
-		pa[nodes].scratch_base = pdd->scratch_base;
-		pa[nodes].scratch_limit = pdd->scratch_limit;
+	for (i = 0; i < min(p->n_pdds, args->num_of_nodes); i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		pa[i].gpu_id = pdd->dev->id;
+		pa[i].lds_base = pdd->lds_base;
+		pa[i].lds_limit = pdd->lds_limit;
+		pa[i].gpuvm_base = pdd->gpuvm_base;
+		pa[i].gpuvm_limit = pdd->gpuvm_limit;
+		pa[i].scratch_base = pdd->scratch_base;
+		pa[i].scratch_limit = pdd->scratch_limit;
 
 		dev_dbg(kfd_device,
 			"gpu id %u\n", pdd->dev->id);
@@ -993,17 +978,14 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 			"scratch_base %llX\n", pdd->scratch_base);
 		dev_dbg(kfd_device,
 			"scratch_limit %llX\n", pdd->scratch_limit);
-		nodes++;
-
-		pdd = kfd_get_next_process_device_data(p, pdd);
-	} while (pdd && (nodes < args->num_of_nodes));
+	}
 	mutex_unlock(&p->mutex);
 
-	args->num_of_nodes = nodes;
+	args->num_of_nodes = i;
 	ret = copy_to_user(
 			(void __user *)args->kfd_process_device_apertures_ptr,
 			pa,
-			(nodes * sizeof(struct kfd_process_device_apertures)));
+			(i * sizeof(struct kfd_process_device_apertures)));
 	kfree(pa);
 	return ret ? -EFAULT : 0;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index 9318936aa805..5a1f2433632b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -135,11 +135,11 @@ int kfd_iommu_bind_process_to_device(struct kfd_process_device *pdd)
  */
 void kfd_iommu_unbind_process(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		if (pdd->bound == PDD_BOUND)
-			amd_iommu_unbind_pasid(pdd->dev->pdev, p->pasid);
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i]->bound == PDD_BOUND)
+			amd_iommu_unbind_pasid(p->pdds[i]->dev->pdev, p->pasid);
 }
 
 /* Callback for process shutdown invoked by the IOMMU driver */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d8c8b5ff449a..33e56db14327 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -45,6 +45,7 @@
 #include <linux/swap.h>
 
 #include "amd_shared.h"
+#include "amdgpu.h"
 
 #define KFD_MAX_RING_ENTRY_SIZE	8
 
@@ -649,12 +650,6 @@ enum kfd_pdd_bound {
 
 /* Data that is per-process-per device. */
 struct kfd_process_device {
-	/*
-	 * List of all per-device data for a process.
-	 * Starts from kfd_process.per_device_data.
-	 */
-	struct list_head per_device_list;
-
 	/* The device that owns this data. */
 	struct kfd_dev *dev;
 
@@ -771,10 +766,11 @@ struct kfd_process {
 	u32 pasid;
 
 	/*
-	 * List of kfd_process_device structures,
+	 * Array of kfd_process_device pointers,
 	 * one for each device the process is using.
 	 */
-	struct list_head per_device_data;
+	struct kfd_process_device *pdds[MAX_GPU_INSTANCE];
+	uint32_t n_pdds;
 
 	struct process_queue_manager pqm;
 
@@ -872,14 +868,6 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
 
-/* Process device data iterator */
-struct kfd_process_device *kfd_get_first_process_device_data(
-							struct kfd_process *p);
-struct kfd_process_device *kfd_get_next_process_device_data(
-						struct kfd_process *p,
-						struct kfd_process_device *pdd);
-bool kfd_has_process_device_data(struct kfd_process *p);
-
 /* PASIDs */
 int kfd_pasid_init(void);
 void kfd_pasid_exit(void);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index f5237997fa18..d4241d29ea94 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -505,7 +505,7 @@ static int kfd_sysfs_create_file(struct kfd_process *p, struct attribute *attr,
 static int kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 {
 	int ret = 0;
-	struct kfd_process_device *pdd;
+	int i;
 	char stats_dir_filename[MAX_SYSFS_FILENAME_LEN];
 
 	if (!p)
@@ -520,7 +520,8 @@ static int kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 	 * - proc/<pid>/stats_<gpuid>/evicted_ms
 	 * - proc/<pid>/stats_<gpuid>/cu_occupancy
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
 		struct kobject *kobj_stats;
 
 		snprintf(stats_dir_filename, MAX_SYSFS_FILENAME_LEN,
@@ -571,7 +572,7 @@ static int kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 static int kfd_procfs_add_sysfs_files(struct kfd_process *p)
 {
 	int ret = 0;
-	struct kfd_process_device *pdd;
+	int i;
 
 	if (!p)
 		return -EINVAL;
@@ -584,7 +585,9 @@ static int kfd_procfs_add_sysfs_files(struct kfd_process *p)
 	 * - proc/<pid>/vram_<gpuid>
 	 * - proc/<pid>/sdma_<gpuid>
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
 		snprintf(pdd->vram_filename, MAX_SYSFS_FILENAME_LEN, "vram_%u",
 			 pdd->dev->id);
 		ret = kfd_sysfs_create_file(p, &pdd->attr_vram, pdd->vram_filename);
@@ -881,21 +884,23 @@ void kfd_unref_process(struct kfd_process *p)
 	kref_put(&p->ref, kfd_process_ref_release);
 }
 
+
 static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 {
 	struct kfd_process *p = pdd->process;
 	void *mem;
 	int id;
+	int i;
 
 	/*
 	 * Remove all handles from idr and release appropriate
 	 * local memory object
 	 */
 	idr_for_each_entry(&pdd->alloc_idr, mem, id) {
-		struct kfd_process_device *peer_pdd;
 
-		list_for_each_entry(peer_pdd, &p->per_device_data,
-				    per_device_list) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *peer_pdd = p->pdds[i];
+
 			if (!peer_pdd->vm)
 				continue;
 			amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
@@ -909,18 +914,19 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 
 static void kfd_process_free_outstanding_kfd_bos(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		kfd_process_device_free_bos(pdd);
+	for (i = 0; i < p->n_pdds; i++)
+		kfd_process_device_free_bos(p->pdds[i]);
 }
 
 static void kfd_process_destroy_pdds(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd, *temp;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
 
-	list_for_each_entry_safe(pdd, temp, &p->per_device_data,
-				 per_device_list) {
 		pr_debug("Releasing pdd (topology id %d) for process (pasid 0x%x)\n",
 				pdd->dev->id, p->pasid);
 
@@ -933,8 +939,6 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 			amdgpu_amdkfd_gpuvm_destroy_process_vm(
 				pdd->dev->kgd, pdd->vm);
 
-		list_del(&pdd->per_device_list);
-
 		if (pdd->qpd.cwsr_kaddr && !pdd->qpd.cwsr_base)
 			free_pages((unsigned long)pdd->qpd.cwsr_kaddr,
 				get_order(KFD_CWSR_TBA_TMA_SIZE));
@@ -955,7 +959,9 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		}
 
 		kfree(pdd);
+		p->pdds[i] = NULL;
 	}
+	p->n_pdds = 0;
 }
 
 /* No process locking is needed in this function, because the process
@@ -967,7 +973,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 {
 	struct kfd_process *p = container_of(work, struct kfd_process,
 					     release_work);
-	struct kfd_process_device *pdd;
+	int i;
 
 	/* Remove the procfs files */
 	if (p->kobj) {
@@ -976,7 +982,9 @@ static void kfd_process_wq_release(struct work_struct *work)
 		kobject_put(p->kobj_queues);
 		p->kobj_queues = NULL;
 
-		list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *pdd = p->pdds[i];
+
 			sysfs_remove_file(p->kobj, &pdd->attr_vram);
 			sysfs_remove_file(p->kobj, &pdd->attr_sdma);
 			sysfs_remove_file(p->kobj, &pdd->attr_evict);
@@ -1036,7 +1044,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 					struct mm_struct *mm)
 {
 	struct kfd_process *p;
-	struct kfd_process_device *pdd = NULL;
+	int i;
 
 	/*
 	 * The kfd_process structure can not be free because the
@@ -1060,8 +1068,8 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 	 * pdd is in debug mode, we should first force unregistration,
 	 * then we will be able to destroy the queues
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
-		struct kfd_dev *dev = pdd->dev;
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
 
 		mutex_lock(kfd_get_dbgmgr_mutex());
 		if (dev && dev->dbgmgr && dev->dbgmgr->pasid == p->pasid) {
@@ -1098,11 +1106,11 @@ static const struct mmu_notifier_ops kfd_process_mmu_notifier_ops = {
 static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 {
 	unsigned long  offset;
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
-		struct kfd_dev *dev = pdd->dev;
-		struct qcm_process_device *qpd = &pdd->qpd;
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
+		struct qcm_process_device *qpd = &p->pdds[i]->qpd;
 
 		if (!dev->cwsr_enabled || qpd->cwsr_kaddr || qpd->cwsr_base)
 			continue;
@@ -1199,7 +1207,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	mutex_init(&process->mutex);
 	process->mm = thread->mm;
 	process->lead_thread = thread->group_leader;
-	INIT_LIST_HEAD(&process->per_device_data);
+	process->n_pdds = 0;
 	INIT_DELAYED_WORK(&process->eviction_work, evict_process_worker);
 	INIT_DELAYED_WORK(&process->restore_work, restore_process_worker);
 	process->last_restore_timestamp = get_jiffies_64();
@@ -1290,11 +1298,11 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
 struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p)
 {
-	struct kfd_process_device *pdd = NULL;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		if (pdd->dev == dev)
-			return pdd;
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i]->dev == dev)
+			return p->pdds[i];
 
 	return NULL;
 }
@@ -1304,6 +1312,8 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 {
 	struct kfd_process_device *pdd = NULL;
 
+	if (WARN_ON_ONCE(p->n_pdds >= MAX_GPU_INSTANCE))
+		return NULL;
 	pdd = kzalloc(sizeof(*pdd), GFP_KERNEL);
 	if (!pdd)
 		return NULL;
@@ -1332,7 +1342,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->vram_usage = 0;
 	pdd->sdma_past_activity_counter = 0;
 	atomic64_set(&pdd->evict_duration_counter, 0);
-	list_add(&pdd->per_device_list, &p->per_device_data);
+	p->pdds[p->n_pdds++] = pdd;
 
 	/* Init idr used for memory handle translation */
 	idr_init(&pdd->alloc_idr);
@@ -1464,28 +1474,6 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 	return ERR_PTR(err);
 }
 
-struct kfd_process_device *kfd_get_first_process_device_data(
-						struct kfd_process *p)
-{
-	return list_first_entry(&p->per_device_data,
-				struct kfd_process_device,
-				per_device_list);
-}
-
-struct kfd_process_device *kfd_get_next_process_device_data(
-						struct kfd_process *p,
-						struct kfd_process_device *pdd)
-{
-	if (list_is_last(&pdd->per_device_list, &p->per_device_data))
-		return NULL;
-	return list_next_entry(pdd, per_device_list);
-}
-
-bool kfd_has_process_device_data(struct kfd_process *p)
-{
-	return !(list_empty(&p->per_device_data));
-}
-
 /* Create specific handle mapped to mem from process local memory idr
  * Assumes that the process lock is held.
  */
@@ -1561,11 +1549,13 @@ struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm)
  */
 int kfd_process_evict_queues(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
 	int r = 0;
+	int i;
 	unsigned int n_evicted = 0;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
 		r = pdd->dev->dqm->ops.evict_process_queues(pdd->dev->dqm,
 							    &pdd->qpd);
 		if (r) {
@@ -1581,7 +1571,9 @@ int kfd_process_evict_queues(struct kfd_process *p)
 	/* To keep state consistent, roll back partial eviction by
 	 * restoring queues
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
 		if (n_evicted == 0)
 			break;
 		if (pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
@@ -1597,10 +1589,12 @@ int kfd_process_evict_queues(struct kfd_process *p)
 /* kfd_process_restore_queues - Restore all user queues of a process */
 int kfd_process_restore_queues(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
 	int r, ret = 0;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
 		r = pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
 							      &pdd->qpd);
 		if (r) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index eb1635ac8988..95a6c36cea4c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -126,10 +126,10 @@ int pqm_set_gws(struct process_queue_manager *pqm, unsigned int qid,
 
 void kfd_process_dequeue_from_all_devices(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		kfd_process_dequeue_from_device(pdd);
+	for (i = 0; i < p->n_pdds; i++)
+		kfd_process_dequeue_from_device(p->pdds[i]);
 }
 
 int pqm_init(struct process_queue_manager *pqm, struct kfd_process *p)
-- 
2.31.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
