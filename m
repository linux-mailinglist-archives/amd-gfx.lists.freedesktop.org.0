Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6A8CDCF5
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2024 00:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE8D10F52E;
	Thu, 23 May 2024 22:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ShuRr6J2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1444710F52E
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2024 22:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0dD+GI+OOeEMP8VUoLwDUOacJN8y5+akIyJAX72NVa1xfpLTCSaqeyaRZX4af+MI1aSMFWBGLceSlit5PF/M6FPNXFuIe1A78BlIDHe1Cjk8oAMmzaU88MBwtKc1C10trJyrywUIhQ2gDc7vAIyNFfBNp9JznQC8CgEsY/NP+r4xvXfH8xA0uiorkI4OvguI19cz3t96Ntm2BUoF2O+9+oaz49O2+ugzjfr20RRkOruPmHE7ADYJHQsySDROAVh13TZe/R2uUCmNvYuHxvqgRPQGSLeK1bk6I2gUQ4l3w8KG/ukDhaCrIngAvCJzthw0wWj0a/Y3IrrBUyph/9p+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvkXuP4ea/HrAg6he+pHbamWaCgw55z1zColMNCgLuA=;
 b=Vlq7qfF5arSZ2tI2/AAdcAWvTaIeaVeME4+OuKtwctwUPzgOwl2Cdb+bSFxMW4hj3imcgcvZbXaYcX80bkSqFb9iq9eXW84zrD0KVARyt5WcRTtW8ow3Y8eVVUGt9tKJiFvwIAMyZNRCospKcAB+KNM9VHR5J0XQOqwlromh1Td12p4ZiTRi9+fGONG6YoqtrJZK9RUz930I8qB/t5TClLymjnhc+Ehv/K2/Rsqu4g7DEP6bmUsjZe/4Nw2WIMkwbuxkWb9iVVo5iYxB3YpjpiGc5m61BTK815wZHUGH3Cidyogbi0KL2alLU+jsaBVoFC1zwYGC0+Ali5lsHy9pFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvkXuP4ea/HrAg6he+pHbamWaCgw55z1zColMNCgLuA=;
 b=ShuRr6J2Pv3UO1+OmlgzzTHR5wn+1+5FuVuOmZYBXTz6dPEW27/HJjcR4XQGayn60m2IzMYDWQeVesTa7FPity3kOWeZ3fhwZ2s6CYBMz3vjcdeGUNIczQzNzNzyRtu7qaHqbMRyfAOjISYvGXkrxNKVxeeqxjxZWRPamOUlTZ4=
Received: from CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17)
 by CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 22:45:00 +0000
Received: from CY8PR12MB7099.namprd12.prod.outlook.com
 ([fe80::314f:877c:8b6f:52d6]) by CY8PR12MB7099.namprd12.prod.outlook.com
 ([fe80::314f:877c:8b6f:52d6%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 22:45:00 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: drop MES 10.1 support v3
Thread-Topic: [PATCH] drm/amdgpu: drop MES 10.1 support v3
Thread-Index: AQHarUo6WK4DK4lavkCavXuMXPAqFbGlaobg
Date: Thu, 23 May 2024 22:45:00 +0000
Message-ID: <CY8PR12MB709983990F0BB2A3D9E4BBDA8CF42@CY8PR12MB7099.namprd12.prod.outlook.com>
References: <20240523194818.1523936-1-alexander.deucher@amd.com>
In-Reply-To: <20240523194818.1523936-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=1042815b-6850-4a2c-8e03-7abc2f664252;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-05-23T22:42:55Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7099:EE_|CH3PR12MB9393:EE_
x-ms-office365-filtering-correlation-id: cfd235d9-e45d-44cc-1fcc-08dc7b79fa8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?k+3ZJashbD+FwSQ0+AwdIwIzwU09msPTc+Pc/Ntferr67hzdfjY5VGSz0CVG?=
 =?us-ascii?Q?7Ap0EgV/Rhjlk9rtTC2i8Y7E5G1IqIEWU9fEzFCZtyPjRdlIMdsBhphrRDTR?=
 =?us-ascii?Q?T/156IyWo030YhHonF0z1XXOPcJ+rgIMrZvhrUEpZF/Ltp9tExbsozzy7eSv?=
 =?us-ascii?Q?yzZKHuj4fXFRIeKBhpADxAwZbELLkGNdAIQupv35msTnf72Lv9DDvxBYW4DE?=
 =?us-ascii?Q?tPphuVTbq16kTDso4/Ad9cIDCJ74unXZCHWmJT2lr8MSBCL6VDc/Ano0Ou9u?=
 =?us-ascii?Q?VMhAdRwa6I3Gbd7meJWm8mwsPh2Ie/v9a4iSYaqvnj0lajsfbHYclCh84IVe?=
 =?us-ascii?Q?Ct5sKap84kML2JNATT7UxNyD+vCcjYKu77+bXK4eI/HZFjvhOdM72lQBvm0H?=
 =?us-ascii?Q?dtXlkkrUfA/45pIQH6huI1/8dgh8siA46yCPBU3pRoUNfQSXoUAvApJiCGEZ?=
 =?us-ascii?Q?AVHETi7ZVVX72oWET/+YDGv6hpPN4AEUvY1cnaPiU2WAHie6BSx5RDITAnX1?=
 =?us-ascii?Q?Q+ITApijl8HpNQxVQSEipn/c/jYvBTzqUzBvnB9iUIaOKRwW0fMCAnGI50dn?=
 =?us-ascii?Q?GagnmuEg+ziE2yP89i74MjXRbPhoRGN+st02mKB3eh2kP+oGHBhEGWS8oDRA?=
 =?us-ascii?Q?ZbJdxU4iQGyzpk2bovTdG0ZFenlRXExVkAvurgK2YGA8+FBhKKWY52c5eZn2?=
 =?us-ascii?Q?e9mtk1QJh57/j+hILHN7RbYDiMv1acHDnFq1KUz8shYbKIf9XBpycUIhMzHh?=
 =?us-ascii?Q?LPQwTHqLlkNh/s8uttPIswDi6jDkB4CaxkQ5ynTU+Ed68uV5Dgo//oCnuBkx?=
 =?us-ascii?Q?0TCO6QEfJRYUIN7HiVdnE8b3l2u2ztin2ObWbkNew+LsRTaQPEEiI7R2vhuE?=
 =?us-ascii?Q?kdBWD/79Ic+ZIdmQ0noFBaFJs4UN9ZS4WLrRSJyqcxH6gyonk01m/zukAtVC?=
 =?us-ascii?Q?jdu2Is5S2yb1Y/KPuSgZk0wTl4a3SLBF+WXMUyFAbs8rm//1V0n8p45i9565?=
 =?us-ascii?Q?YcERhU6Gvj1oBkt+oCR/a/Esxkg68SfUdrw9S3T2/szfNUvNyQUM+NfFijtO?=
 =?us-ascii?Q?LiTQIyF5hDIEQRDOG/zuOJ/5kgxRE2EKaAeVLyKRTDvjIzn+2LX8rVintQk0?=
 =?us-ascii?Q?M8ncVq7rdGLAAxJLu1i5wOU6enxmFFYnFpELoDd9ku7Y9XKvJUPh6YXQUj4k?=
 =?us-ascii?Q?XBxplaMGYd6XtUF/HbInXhqe3FFGu/KJ8slyOZ4qVEvbe9s2oGG450H9ohFe?=
 =?us-ascii?Q?65TvnHZUoqSFrGE3GJBoMEkK9XzFYoEUUSI9+XkOxka1Kj6heHjkBdM+BdYn?=
 =?us-ascii?Q?GUkR97TTfyOdBjoQ7/r+5bZxMfjb0pIGy1c1JBLBAb7mAQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7099.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8xJV5Lg1AQTbNOeurREevkIl5zTaOLzU/DfTgVg3EortlGgxE5r+0LJ/hh17?=
 =?us-ascii?Q?L26Vp5/VifPUWshuHcHc+OCUP+qOmzfz1u9dG0tr2A30hsrG/009cR6U3OcW?=
 =?us-ascii?Q?eRaUEnWk4MqxiH3+rsekfC0vi5LhpGxvLhUCrbyV1rsw8E6ToO8xS0rTu/pn?=
 =?us-ascii?Q?5/CkjGxrA8Bbt/bKMzaYlxeqAz96bTeY/lzFBza+4GZynwXpgXROAwBXXcBr?=
 =?us-ascii?Q?+3p6Kmh+JzS4bVQcrcmr+qdEHkvfBexs1XZPsmNdgyqaiDRCjRF8Bxlpyy5c?=
 =?us-ascii?Q?t1mxhWymyTp4bNJJhD6eo280etTCrJCDsvUVegslKKgSCzhYQ3jddQELV4qa?=
 =?us-ascii?Q?zYWuWAkMhgNHUK2o7/LI6g3lbYa6xNxtNaxOCllZnK+zbzuYKxs92qIrqqrq?=
 =?us-ascii?Q?dDAya85zNZnKnviyvs9RLcqtUUVlnwcWLSNlKYV0lCjhnEq7tYrtatVsSAEz?=
 =?us-ascii?Q?8NXW0gNFKI6eHev3cBc5k8UIM04HORjs6Niih296GgN5yAl0ZUyWsM5ZV/FT?=
 =?us-ascii?Q?jokcJtJHEK31guOMKYLafJEQZZKEdTon4p8CfpbhfOc1Eil7qe3inYRM+Hpe?=
 =?us-ascii?Q?jacTYNTo3I9ZVhon/FsciGJUD5YwpgkxeWKa36HtZTtxP1oKrMBzug3zNt3c?=
 =?us-ascii?Q?6dBufr4ts10S9+LtozhSIk4kAk8uCTH14f+ZWOWBzNKxvWq4aB+GdykgBf95?=
 =?us-ascii?Q?MuwxcQSU19ouIIerl8NPUI5oMpsGxCi7Yxvk8t7U94QsJxOQMSdkSQVfdFfS?=
 =?us-ascii?Q?0xO61BkrAsoCIYid00Rfhz6lasKWNG2Z+O7YqcYv1DALdWjEsgx98yb0+05L?=
 =?us-ascii?Q?aMYWLb9oTso7CBxXlCDtatpXHr0HcHT9aBa5MYE4TZfAwLX7NxLF+O/FVg8D?=
 =?us-ascii?Q?H/rbTQfSlb6yyKqcRiRa8HwpSJhdmILrCC7hf3uPK3JuKAHyMYhzI8q98r/f?=
 =?us-ascii?Q?4dbUtSjZ/jCfMQVMFQF0YARto2zKZoeA0kQQbbQBSWc+u3IjzMF0u0rD1fgF?=
 =?us-ascii?Q?6AgWSDscCfb3HxnMYo8pNLTLXpjYO0KnJcTU+tm6zk+tssjGgcIo2CuZVg1Z?=
 =?us-ascii?Q?sMwjrYQ59mHnC7zhtS47Z0WxpQFlxpzmc3P+bDSXDR3rpuwlFeiWetl9yHBH?=
 =?us-ascii?Q?aYtDxxTTit/EOSQUDGmsqaiMZC29GtUq0gYuBGnxru1o+0amso0EnDGZxa2l?=
 =?us-ascii?Q?4tN97Whe9E49jykg0cSI16ujt0l6fTgQ678ZgZIZ2tVdD3ORpWYtxPr2N+7m?=
 =?us-ascii?Q?4IWILe+WPZUtIaJwRIhWlxhrQLuoIztlVTqAlflLsE51jvMXzord27eGcPRJ?=
 =?us-ascii?Q?G9lEYRybleHo/u+tdNpfpwaRzNIIGUTLVDN0q/FC2gvnmhjMKgpqmHUntWub?=
 =?us-ascii?Q?McqXD2h4rfPn4jZPM/I6HFuF6RYwBejdf7UPgTNJgN14wcqcLGE4eQo5ex8h?=
 =?us-ascii?Q?2Fq38f2DrIgLuYYeYHB+Hh27DRU6wbyq7nwg+UxBdFCiEkEnrQEyQhcTYENj?=
 =?us-ascii?Q?njaRsggYR8GGELP78RxpS1fn0UKy1yu73AC1wvijyrDEYpSG6j7yO8tq7cMx?=
 =?us-ascii?Q?Y/IaXh0wiFcluy4y6y4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7099.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd235d9-e45d-44cc-1fcc-08dc7b79fa8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 22:45:00.4220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5kFxvkWVaeNwSq+Kv9s/ODH/mMQCcS1RQM9QeI8RAXSldOOZgDFCSj1iexy4Xcz14BhH+olvECJW+HcsT4rQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393
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

[AMD Official Use Only - AMD Internal Distribution Only]

I had one more comment. With that fixed this patch is Reviewed-by: Harish K=
asiviswanathan <Harish.Kasiviswanathan@amd.com>

static gfx_v10_0_ring_invalidate_tlbs() function can be removed since it is=
 no longer used.

Best Regards,
Harish


-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deu=
cher
Sent: Thursday, May 23, 2024 3:48 PM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/amdgpu: drop MES 10.1 support v3

It was an enablement vehicle for MES 11 and was never
productized.  Remove it.

v2: drop additional checks in the GFX10 code.
v3: drop mes_api_def.h

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |   20 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  281 +---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 1190 -----------------
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.h        |   29 -
 drivers/gpu/drm/amd/amdgpu/nv.c               |    1 -
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |    2 +-
 drivers/gpu/drm/amd/include/mes_api_def.h     |  570 --------
 8 files changed, 72 insertions(+), 2022 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
 delete mode 100644 drivers/gpu/drm/amd/include/mes_api_def.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdg=
pu/Makefile
index 6e3d7f51616f..eddbb69a179f 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -187,7 +187,6 @@ amdgpu-y +=3D \
 # add MES block
 amdgpu-y +=3D \
        amdgpu_mes.o \
-       mes_v10_1.o \
        mes_v11_0.o \
        mes_v12_0.o

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.c
index c5f23e1a1362..510916e28d37 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -94,7 +94,6 @@
 #include "vcn_v4_0_5.h"
 #include "jpeg_v4_0_5.h"
 #include "amdgpu_vkms.h"
-#include "mes_v10_1.h"
 #include "mes_v11_0.h"
 #include "mes_v12_0.h"
 #include "smuio_v11_0.h"
@@ -2319,25 +2318,6 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct =
amdgpu_device *adev)
 static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
 {
        switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-       case IP_VERSION(10, 1, 10):
-       case IP_VERSION(10, 1, 1):
-       case IP_VERSION(10, 1, 2):
-       case IP_VERSION(10, 1, 3):
-       case IP_VERSION(10, 1, 4):
-       case IP_VERSION(10, 3, 0):
-       case IP_VERSION(10, 3, 1):
-       case IP_VERSION(10, 3, 2):
-       case IP_VERSION(10, 3, 3):
-       case IP_VERSION(10, 3, 4):
-       case IP_VERSION(10, 3, 5):
-       case IP_VERSION(10, 3, 6):
-               if (amdgpu_mes) {
-                       amdgpu_device_ip_block_add(adev, &mes_v10_1_ip_bloc=
k);
-                       adev->enable_mes =3D true;
-                       if (amdgpu_mes_kiq)
-                               adev->enable_mes_kiq =3D true;
-               }
-               break;
        case IP_VERSION(11, 0, 0):
        case IP_VERSION(11, 0, 1):
        case IP_VERSION(11, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index 8ceb26a5575a..2a808029a47c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3734,14 +3734,8 @@ static void gfx10_kiq_unmap_queues(struct amdgpu_rin=
g *kiq_ring,
                                   enum amdgpu_unmap_queues_action action,
                                   u64 gpu_addr, u64 seq)
 {
-       struct amdgpu_device *adev =3D kiq_ring->adev;
        uint32_t eng_sel =3D ring->funcs->type =3D=3D AMDGPU_RING_TYPE_GFX =
? 4 : 0;

-       if (adev->enable_mes && !adev->gfx.kiq[0].ring.sched.ready) {
-               amdgpu_mes_unmap_legacy_queue(adev, ring, action, gpu_addr,=
 seq);
-               return;
-       }
-
        amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_UNMAP_QUEUES, 4));
        amdgpu_ring_write(kiq_ring, /* Q_sel: 0, vmid: 0, engine: 0, num_Q:=
 1 */
                          PACKET3_UNMAP_QUEUES_ACTION(action) |
@@ -3999,33 +3993,18 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_rin=
g *ring, long timeout)

        memset(&ib, 0, sizeof(ib));

-       if (ring->is_mes_queue) {
-               uint32_t padding, offset;
-
-               offset =3D amdgpu_mes_ctx_get_offs(ring, AMDGPU_MES_CTX_IB_=
OFFS);
-               padding =3D amdgpu_mes_ctx_get_offs(ring,
-                                                 AMDGPU_MES_CTX_PADDING_OF=
FS);
-
-               ib.gpu_addr =3D amdgpu_mes_ctx_get_offs_gpu_addr(ring, offs=
et);
-               ib.ptr =3D amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
-
-               gpu_addr =3D amdgpu_mes_ctx_get_offs_gpu_addr(ring, padding=
);
-               cpu_ptr =3D amdgpu_mes_ctx_get_offs_cpu_addr(ring, padding)=
;
-               *cpu_ptr =3D cpu_to_le32(0xCAFEDEAD);
-       } else {
-               r =3D amdgpu_device_wb_get(adev, &index);
-               if (r)
-                       return r;
+       r =3D amdgpu_device_wb_get(adev, &index);
+       if (r)
+               return r;

-               gpu_addr =3D adev->wb.gpu_addr + (index * 4);
-               adev->wb.wb[index] =3D cpu_to_le32(0xCAFEDEAD);
-               cpu_ptr =3D &adev->wb.wb[index];
+       gpu_addr =3D adev->wb.gpu_addr + (index * 4);
+       adev->wb.wb[index] =3D cpu_to_le32(0xCAFEDEAD);
+       cpu_ptr =3D &adev->wb.wb[index];

-               r =3D amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, =
&ib);
-               if (r) {
-                       DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
-                       goto err1;
-               }
+       r =3D amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
+       if (r) {
+               DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
+               goto err1;
        }

        ib.ptr[0] =3D PACKET3(PACKET3_WRITE_DATA, 3);
@@ -4052,12 +4031,10 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_rin=
g *ring, long timeout)
        else
                r =3D -EINVAL;
 err2:
-       if (!ring->is_mes_queue)
-               amdgpu_ib_free(adev, &ib, NULL);
+       amdgpu_ib_free(adev, &ib, NULL);
        dma_fence_put(f);
 err1:
-       if (!ring->is_mes_queue)
-               amdgpu_device_wb_free(adev, index);
+       amdgpu_device_wb_free(adev, index);
        return r;
 }

@@ -4832,18 +4809,16 @@ static int gfx_v10_0_sw_init(void *handle)
                }
        }

-       if (!adev->enable_mes_kiq) {
-               r =3D amdgpu_gfx_kiq_init(adev, GFX10_MEC_HPD_SIZE, 0);
-               if (r) {
-                       DRM_ERROR("Failed to init KIQ BOs!\n");
-                       return r;
-               }
-
-               r =3D amdgpu_gfx_kiq_init_ring(adev, xcc_id);
-               if (r)
-                       return r;
+       r =3D amdgpu_gfx_kiq_init(adev, GFX10_MEC_HPD_SIZE, 0);
+       if (r) {
+               DRM_ERROR("Failed to init KIQ BOs!\n");
+               return r;
        }

+       r =3D amdgpu_gfx_kiq_init_ring(adev, xcc_id);
+       if (r)
+               return r;
+
        r =3D amdgpu_gfx_mqd_sw_init(adev, sizeof(struct v10_compute_mqd), =
0);
        if (r)
                return r;
@@ -4897,10 +4872,8 @@ static int gfx_v10_0_sw_fini(void *handle)

        amdgpu_gfx_mqd_sw_fini(adev, 0);

-       if (!adev->enable_mes_kiq) {
-               amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
-               amdgpu_gfx_kiq_fini(adev, 0);
-       }
+       amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
+       amdgpu_gfx_kiq_fini(adev, 0);

        gfx_v10_0_pfp_fini(adev);
        gfx_v10_0_ce_fini(adev);
@@ -7111,10 +7084,7 @@ static int gfx_v10_0_cp_resume(struct amdgpu_device =
*adev)
                        return r;
        }

-       if (adev->enable_mes_kiq && adev->mes.kiq_hw_init)
-               r =3D amdgpu_mes_kiq_hw_init(adev);
-       else
-               r =3D gfx_v10_0_kiq_resume(adev);
+       r =3D gfx_v10_0_kiq_resume(adev);
        if (r)
                return r;

@@ -8435,45 +8405,17 @@ static u64 gfx_v10_0_ring_get_wptr_gfx(struct amdgp=
u_ring *ring)
 static void gfx_v10_0_ring_set_wptr_gfx(struct amdgpu_ring *ring)
 {
        struct amdgpu_device *adev =3D ring->adev;
-       uint32_t *wptr_saved;
-       uint32_t *is_queue_unmap;
-       uint64_t aggregated_db_index;
-       uint32_t mqd_size =3D adev->mqds[AMDGPU_HW_IP_GFX].mqd_size;
-       uint64_t wptr_tmp;
-
-       if (ring->is_mes_queue) {
-               wptr_saved =3D (uint32_t *)(ring->mqd_ptr + mqd_size);
-               is_queue_unmap =3D (uint32_t *)(ring->mqd_ptr + mqd_size +
-                                             sizeof(uint32_t));
-               aggregated_db_index =3D
-                       amdgpu_mes_get_aggregated_doorbell_index(adev,
-                       AMDGPU_MES_PRIORITY_LEVEL_NORMAL);
-
-               wptr_tmp =3D ring->wptr & ring->buf_mask;
-               atomic64_set((atomic64_t *)ring->wptr_cpu_addr, wptr_tmp);
-               *wptr_saved =3D wptr_tmp;
-               /* assume doorbell always being used by mes mapped queue */
-               if (*is_queue_unmap) {
-                       WDOORBELL64(aggregated_db_index, wptr_tmp);
-                       WDOORBELL64(ring->doorbell_index, wptr_tmp);
-               } else {
-                       WDOORBELL64(ring->doorbell_index, wptr_tmp);

-                       if (*is_queue_unmap)
-                               WDOORBELL64(aggregated_db_index, wptr_tmp);
-               }
+       if (ring->use_doorbell) {
+               /* XXX check if swapping is necessary on BE */
+               atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
+                            ring->wptr);
+               WDOORBELL64(ring->doorbell_index, ring->wptr);
        } else {
-               if (ring->use_doorbell) {
-                       /* XXX check if swapping is necessary on BE */
-                       atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
-                                    ring->wptr);
-                       WDOORBELL64(ring->doorbell_index, ring->wptr);
-               } else {
-                       WREG32_SOC15(GC, 0, mmCP_RB0_WPTR,
-                                    lower_32_bits(ring->wptr));
-                       WREG32_SOC15(GC, 0, mmCP_RB0_WPTR_HI,
-                                    upper_32_bits(ring->wptr));
-               }
+               WREG32_SOC15(GC, 0, mmCP_RB0_WPTR,
+                            lower_32_bits(ring->wptr));
+               WREG32_SOC15(GC, 0, mmCP_RB0_WPTR_HI,
+                            upper_32_bits(ring->wptr));
        }
 }

@@ -8498,42 +8440,13 @@ static u64 gfx_v10_0_ring_get_wptr_compute(struct a=
mdgpu_ring *ring)
 static void gfx_v10_0_ring_set_wptr_compute(struct amdgpu_ring *ring)
 {
        struct amdgpu_device *adev =3D ring->adev;
-       uint32_t *wptr_saved;
-       uint32_t *is_queue_unmap;
-       uint64_t aggregated_db_index;
-       uint32_t mqd_size =3D adev->mqds[AMDGPU_HW_IP_COMPUTE].mqd_size;
-       uint64_t wptr_tmp;
-
-       if (ring->is_mes_queue) {
-               wptr_saved =3D (uint32_t *)(ring->mqd_ptr + mqd_size);
-               is_queue_unmap =3D (uint32_t *)(ring->mqd_ptr + mqd_size +
-                                             sizeof(uint32_t));
-               aggregated_db_index =3D
-                       amdgpu_mes_get_aggregated_doorbell_index(adev,
-                       AMDGPU_MES_PRIORITY_LEVEL_NORMAL);
-
-               wptr_tmp =3D ring->wptr & ring->buf_mask;
-               atomic64_set((atomic64_t *)ring->wptr_cpu_addr, wptr_tmp);
-               *wptr_saved =3D wptr_tmp;
-               /* assume doorbell always used by mes mapped queue */
-               if (*is_queue_unmap) {
-                       WDOORBELL64(aggregated_db_index, wptr_tmp);
-                       WDOORBELL64(ring->doorbell_index, wptr_tmp);
-               } else {
-                       WDOORBELL64(ring->doorbell_index, wptr_tmp);

-                       if (*is_queue_unmap)
-                               WDOORBELL64(aggregated_db_index, wptr_tmp);
-               }
+       if (ring->use_doorbell) {
+               atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
+                            ring->wptr);
+               WDOORBELL64(ring->doorbell_index, ring->wptr);
        } else {
-               /* XXX check if swapping is necessary on BE */
-               if (ring->use_doorbell) {
-                       atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
-                                    ring->wptr);
-                       WDOORBELL64(ring->doorbell_index, ring->wptr);
-               } else {
-                       BUG(); /* only DOORBELL method supported on gfx10 n=
ow */
-               }
+               BUG(); /* only DOORBELL method supported on gfx10 now */
        }
 }

@@ -8592,10 +8505,6 @@ static void gfx_v10_0_ring_emit_ib_gfx(struct amdgpu=
_ring *ring,
                                    (!amdgpu_sriov_vf(ring->adev) && flags =
& AMDGPU_IB_PREEMPTED) ? true : false);
        }

-       if (ring->is_mes_queue)
-               /* inherit vmid from mqd */
-               control |=3D 0x400000;
-
        amdgpu_ring_write(ring, header);
        BUG_ON(ib->gpu_addr & 0x3); /* Dword align */
        amdgpu_ring_write(ring,
@@ -8615,10 +8524,6 @@ static void gfx_v10_0_ring_emit_ib_compute(struct am=
dgpu_ring *ring,
        unsigned int vmid =3D AMDGPU_JOB_GET_VMID(job);
        u32 control =3D INDIRECT_BUFFER_VALID | ib->length_dw | (vmid << 24=
);

-       if (ring->is_mes_queue)
-               /* inherit vmid from mqd */
-               control |=3D 0x40000000;
-
        /* Currently, there is a high possibility to get wave ID mismatch
         * between ME and GDS, leading to a hw deadlock, because ME generat=
es
         * different wave IDs than the GDS expects. This situation happens
@@ -8676,8 +8581,7 @@ static void gfx_v10_0_ring_emit_fence(struct amdgpu_r=
ing *ring, u64 addr,
        amdgpu_ring_write(ring, upper_32_bits(addr));
        amdgpu_ring_write(ring, lower_32_bits(seq));
        amdgpu_ring_write(ring, upper_32_bits(seq));
-       amdgpu_ring_write(ring, ring->is_mes_queue ?
-                        (ring->hw_queue_id | AMDGPU_FENCE_MES_QUEUE_FLAG) =
: 0);
+       amdgpu_ring_write(ring, 0);
 }

 static void gfx_v10_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
@@ -8705,10 +8609,7 @@ static void gfx_v10_0_ring_invalidate_tlbs(struct am=
dgpu_ring *ring,
 static void gfx_v10_0_ring_emit_vm_flush(struct amdgpu_ring *ring,
                                         unsigned int vmid, uint64_t pd_add=
r)
 {
-       if (ring->is_mes_queue)
-               gfx_v10_0_ring_invalidate_tlbs(ring, 0, 0, false, 0);
-       else
-               amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
+       amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);

        /* compute doesn't have PFP */
        if (ring->funcs->type =3D=3D AMDGPU_RING_TYPE_GFX) {
@@ -8859,19 +8760,9 @@ static void gfx_v10_0_ring_emit_ce_meta(struct amdgp=
u_ring *ring, bool resume)

        cnt =3D (sizeof(ce_payload) >> 2) + 4 - 2;

-       if (ring->is_mes_queue) {
-               offset =3D offsetof(struct amdgpu_mes_ctx_meta_data,
-                                 gfx[0].gfx_meta_data) +
-                       offsetof(struct v10_gfx_meta_data, ce_payload);
-               ce_payload_gpu_addr =3D
-                       amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
-               ce_payload_cpu_addr =3D
-                       amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
-       } else {
-               offset =3D offsetof(struct v10_gfx_meta_data, ce_payload);
-               ce_payload_gpu_addr =3D amdgpu_csa_vaddr(ring->adev) + offs=
et;
-               ce_payload_cpu_addr =3D adev->virt.csa_cpu_addr + offset;
-       }
+       offset =3D offsetof(struct v10_gfx_meta_data, ce_payload);
+       ce_payload_gpu_addr =3D amdgpu_csa_vaddr(ring->adev) + offset;
+       ce_payload_cpu_addr =3D adev->virt.csa_cpu_addr + offset;

        amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, cnt));
        amdgpu_ring_write(ring, (WRITE_DATA_ENGINE_SEL(2) |
@@ -8897,28 +8788,13 @@ static void gfx_v10_0_ring_emit_de_meta(struct amdg=
pu_ring *ring, bool resume)
        void *de_payload_cpu_addr;
        int cnt;

-       if (ring->is_mes_queue) {
-               offset =3D offsetof(struct amdgpu_mes_ctx_meta_data,
-                                 gfx[0].gfx_meta_data) +
-                       offsetof(struct v10_gfx_meta_data, de_payload);
-               de_payload_gpu_addr =3D
-                       amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
-               de_payload_cpu_addr =3D
-                       amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
-
-               offset =3D offsetof(struct amdgpu_mes_ctx_meta_data,
-                                 gfx[0].gds_backup) +
-                       offsetof(struct v10_gfx_meta_data, de_payload);
-               gds_addr =3D amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset)=
;
-       } else {
-               offset =3D offsetof(struct v10_gfx_meta_data, de_payload);
-               de_payload_gpu_addr =3D amdgpu_csa_vaddr(ring->adev) + offs=
et;
-               de_payload_cpu_addr =3D adev->virt.csa_cpu_addr + offset;
+       offset =3D offsetof(struct v10_gfx_meta_data, de_payload);
+       de_payload_gpu_addr =3D amdgpu_csa_vaddr(ring->adev) + offset;
+       de_payload_cpu_addr =3D adev->virt.csa_cpu_addr + offset;

-               gds_addr =3D ALIGN(amdgpu_csa_vaddr(ring->adev) +
-                                AMDGPU_CSA_SIZE - adev->gds.gds_size,
-                                PAGE_SIZE);
-       }
+       gds_addr =3D ALIGN(amdgpu_csa_vaddr(ring->adev) +
+                        AMDGPU_CSA_SIZE - adev->gds.gds_size,
+                        PAGE_SIZE);

        de_payload.gds_backup_addrlo =3D lower_32_bits(gds_addr);
        de_payload.gds_backup_addrhi =3D upper_32_bits(gds_addr);
@@ -9170,49 +9046,34 @@ static int gfx_v10_0_eop_irq(struct amdgpu_device *=
adev,
        int i;
        u8 me_id, pipe_id, queue_id;
        struct amdgpu_ring *ring;
-       uint32_t mes_queue_id =3D entry->src_data[0];

        DRM_DEBUG("IH: CP EOP\n");

-       if (adev->enable_mes && (mes_queue_id & AMDGPU_FENCE_MES_QUEUE_FLAG=
)) {
-               struct amdgpu_mes_queue *queue;
-
-               mes_queue_id &=3D AMDGPU_FENCE_MES_QUEUE_ID_MASK;
-
-               spin_lock(&adev->mes.queue_id_lock);
-               queue =3D idr_find(&adev->mes.queue_id_idr, mes_queue_id);
-               if (queue) {
-                       DRM_DEBUG("process mes queue id =3D %d\n", mes_queu=
e_id);
-                       amdgpu_fence_process(queue->ring);
-               }
-               spin_unlock(&adev->mes.queue_id_lock);
-       } else {
-               me_id =3D (entry->ring_id & 0x0c) >> 2;
-               pipe_id =3D (entry->ring_id & 0x03) >> 0;
-               queue_id =3D (entry->ring_id & 0x70) >> 4;
+       me_id =3D (entry->ring_id & 0x0c) >> 2;
+       pipe_id =3D (entry->ring_id & 0x03) >> 0;
+       queue_id =3D (entry->ring_id & 0x70) >> 4;

-               switch (me_id) {
-               case 0:
-                       if (pipe_id =3D=3D 0)
-                               amdgpu_fence_process(&adev->gfx.gfx_ring[0]=
);
-                       else
-                               amdgpu_fence_process(&adev->gfx.gfx_ring[1]=
);
-                       break;
-               case 1:
-               case 2:
-                       for (i =3D 0; i < adev->gfx.num_compute_rings; i++)=
 {
-                               ring =3D &adev->gfx.compute_ring[i];
-                               /* Per-queue interrupt is supported for MEC=
 starting from VI.
-                                * The interrupt can only be enabled/disabl=
ed per pipe instead
-                                * of per queue.
-                                */
-                               if ((ring->me =3D=3D me_id) &&
-                                   (ring->pipe =3D=3D pipe_id) &&
-                                   (ring->queue =3D=3D queue_id))
-                                       amdgpu_fence_process(ring);
-                       }
-                       break;
+       switch (me_id) {
+       case 0:
+               if (pipe_id =3D=3D 0)
+                       amdgpu_fence_process(&adev->gfx.gfx_ring[0]);
+               else
+                       amdgpu_fence_process(&adev->gfx.gfx_ring[1]);
+               break;
+       case 1:
+       case 2:
+               for (i =3D 0; i < adev->gfx.num_compute_rings; i++) {
+                       ring =3D &adev->gfx.compute_ring[i];
+                       /* Per-queue interrupt is supported for MEC startin=
g from VI.
+                        * The interrupt can only be enabled/disabled per p=
ipe instead
+                        * of per queue.
+                        */
+                       if ((ring->me =3D=3D me_id) &&
+                           (ring->pipe =3D=3D pipe_id) &&
+                           (ring->queue =3D=3D queue_id))
+                               amdgpu_fence_process(ring);
                }
+               break;
        }

        return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/a=
mdgpu/mes_v10_1.c
deleted file mode 100644
index 013aa690299e..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ /dev/null
@@ -1,1190 +0,0 @@
-/*
- * Copyright 2019 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software=
"),
- * to deal in the Software without restriction, including without limitati=
on
- * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included=
 in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#include <linux/firmware.h>
-#include <linux/module.h>
-#include "amdgpu.h"
-#include "amdgpu_reset.h"
-#include "soc15_common.h"
-#include "nv.h"
-#include "gc/gc_10_1_0_offset.h"
-#include "gc/gc_10_1_0_sh_mask.h"
-#include "gc/gc_10_1_0_default.h"
-#include "v10_structs.h"
-#include "mes_api_def.h"
-
-#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid               0x2820
-#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid_BASE_IDX      1
-#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid             0x4ca1
-#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid_BASE_IDX    1
-
-MODULE_FIRMWARE("amdgpu/navi10_mes.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes1.bin");
-
-static int mes_v10_1_hw_fini(void *handle);
-static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev);
-
-#define MES_EOP_SIZE   2048
-
-static void mes_v10_1_ring_set_wptr(struct amdgpu_ring *ring)
-{
-       struct amdgpu_device *adev =3D ring->adev;
-
-       if (ring->use_doorbell) {
-               atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
-                            ring->wptr);
-               WDOORBELL64(ring->doorbell_index, ring->wptr);
-       } else {
-               BUG();
-       }
-}
-
-static u64 mes_v10_1_ring_get_rptr(struct amdgpu_ring *ring)
-{
-       return *ring->rptr_cpu_addr;
-}
-
-static u64 mes_v10_1_ring_get_wptr(struct amdgpu_ring *ring)
-{
-       u64 wptr;
-
-       if (ring->use_doorbell)
-               wptr =3D atomic64_read((atomic64_t *)ring->wptr_cpu_addr);
-       else
-               BUG();
-       return wptr;
-}
-
-static const struct amdgpu_ring_funcs mes_v10_1_ring_funcs =3D {
-       .type =3D AMDGPU_RING_TYPE_MES,
-       .align_mask =3D 1,
-       .nop =3D 0,
-       .support_64bit_ptrs =3D true,
-       .get_rptr =3D mes_v10_1_ring_get_rptr,
-       .get_wptr =3D mes_v10_1_ring_get_wptr,
-       .set_wptr =3D mes_v10_1_ring_set_wptr,
-       .insert_nop =3D amdgpu_ring_insert_nop,
-};
-
-static int mes_v10_1_submit_pkt_and_poll_completion(struct amdgpu_mes *mes=
,
-                                                   void *pkt, int size,
-                                                   int api_status_off)
-{
-       int ndw =3D size / 4;
-       signed long r;
-       union MESAPI__ADD_QUEUE *x_pkt =3D pkt;
-       struct MES_API_STATUS *api_status;
-       struct amdgpu_device *adev =3D mes->adev;
-       struct amdgpu_ring *ring =3D &mes->ring;
-       unsigned long flags;
-
-       BUG_ON(size % 4 !=3D 0);
-
-       spin_lock_irqsave(&mes->ring_lock, flags);
-       if (amdgpu_ring_alloc(ring, ndw)) {
-               spin_unlock_irqrestore(&mes->ring_lock, flags);
-               return -ENOMEM;
-       }
-
-       api_status =3D (struct MES_API_STATUS *)((char *)pkt + api_status_o=
ff);
-       api_status->api_completion_fence_addr =3D mes->ring.fence_drv.gpu_a=
ddr;
-       api_status->api_completion_fence_value =3D ++mes->ring.fence_drv.sy=
nc_seq;
-
-       amdgpu_ring_write_multiple(ring, pkt, ndw);
-       amdgpu_ring_commit(ring);
-       spin_unlock_irqrestore(&mes->ring_lock, flags);
-
-       DRM_DEBUG("MES msg=3D%d was emitted\n", x_pkt->header.opcode);
-
-       r =3D amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq,
-                                     adev->usec_timeout);
-       if (r < 1) {
-               DRM_ERROR("MES failed to response msg=3D%d\n",
-                         x_pkt->header.opcode);
-
-               while (halt_if_hws_hang)
-                       schedule();
-
-               return -ETIMEDOUT;
-       }
-
-       return 0;
-}
-
-static int convert_to_mes_queue_type(int queue_type)
-{
-       if (queue_type =3D=3D AMDGPU_RING_TYPE_GFX)
-               return MES_QUEUE_TYPE_GFX;
-       else if (queue_type =3D=3D AMDGPU_RING_TYPE_COMPUTE)
-               return MES_QUEUE_TYPE_COMPUTE;
-       else if (queue_type =3D=3D AMDGPU_RING_TYPE_SDMA)
-               return MES_QUEUE_TYPE_SDMA;
-       else
-               BUG();
-       return -1;
-}
-
-static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
-                                 struct mes_add_queue_input *input)
-{
-       struct amdgpu_device *adev =3D mes->adev;
-       union MESAPI__ADD_QUEUE mes_add_queue_pkt;
-       struct amdgpu_vmhub *hub =3D &adev->vmhub[AMDGPU_GFXHUB(0)];
-       uint32_t vm_cntx_cntl =3D hub->vm_cntx_cntl;
-
-       memset(&mes_add_queue_pkt, 0, sizeof(mes_add_queue_pkt));
-
-       mes_add_queue_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
-       mes_add_queue_pkt.header.opcode =3D MES_SCH_API_ADD_QUEUE;
-       mes_add_queue_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
-
-       mes_add_queue_pkt.process_id =3D input->process_id;
-       mes_add_queue_pkt.page_table_base_addr =3D input->page_table_base_a=
ddr;
-       mes_add_queue_pkt.process_va_start =3D input->process_va_start;
-       mes_add_queue_pkt.process_va_end =3D input->process_va_end;
-       mes_add_queue_pkt.process_quantum =3D input->process_quantum;
-       mes_add_queue_pkt.process_context_addr =3D input->process_context_a=
ddr;
-       mes_add_queue_pkt.gang_quantum =3D input->gang_quantum;
-       mes_add_queue_pkt.gang_context_addr =3D input->gang_context_addr;
-       mes_add_queue_pkt.inprocess_gang_priority =3D
-               input->inprocess_gang_priority;
-       mes_add_queue_pkt.gang_global_priority_level =3D
-               input->gang_global_priority_level;
-       mes_add_queue_pkt.doorbell_offset =3D input->doorbell_offset;
-       mes_add_queue_pkt.mqd_addr =3D input->mqd_addr;
-       mes_add_queue_pkt.wptr_addr =3D input->wptr_addr;
-       mes_add_queue_pkt.queue_type =3D
-               convert_to_mes_queue_type(input->queue_type);
-       mes_add_queue_pkt.paging =3D input->paging;
-       mes_add_queue_pkt.vm_context_cntl =3D vm_cntx_cntl;
-       mes_add_queue_pkt.gws_base =3D input->gws_base;
-       mes_add_queue_pkt.gws_size =3D input->gws_size;
-       mes_add_queue_pkt.trap_handler_addr =3D input->tba_addr;
-
-       return mes_v10_1_submit_pkt_and_poll_completion(mes,
-                       &mes_add_queue_pkt, sizeof(mes_add_queue_pkt),
-                       offsetof(union MESAPI__ADD_QUEUE, api_status));
-}
-
-static int mes_v10_1_remove_hw_queue(struct amdgpu_mes *mes,
-                                    struct mes_remove_queue_input *input)
-{
-       union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
-
-       memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
-
-       mes_remove_queue_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
-       mes_remove_queue_pkt.header.opcode =3D MES_SCH_API_REMOVE_QUEUE;
-       mes_remove_queue_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
-
-       mes_remove_queue_pkt.doorbell_offset =3D input->doorbell_offset;
-       mes_remove_queue_pkt.gang_context_addr =3D input->gang_context_addr=
;
-
-       return mes_v10_1_submit_pkt_and_poll_completion(mes,
-                       &mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt)=
,
-                       offsetof(union MESAPI__REMOVE_QUEUE, api_status));
-}
-
-static int mes_v10_1_unmap_legacy_queue(struct amdgpu_mes *mes,
-                                struct mes_unmap_legacy_queue_input *input=
)
-{
-       union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
-
-       memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
-
-       mes_remove_queue_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
-       mes_remove_queue_pkt.header.opcode =3D MES_SCH_API_REMOVE_QUEUE;
-       mes_remove_queue_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
-
-       mes_remove_queue_pkt.doorbell_offset =3D input->doorbell_offset;
-       mes_remove_queue_pkt.gang_context_addr =3D 0;
-
-       mes_remove_queue_pkt.pipe_id =3D input->pipe_id;
-       mes_remove_queue_pkt.queue_id =3D input->queue_id;
-
-       if (input->action =3D=3D PREEMPT_QUEUES_NO_UNMAP) {
-               mes_remove_queue_pkt.preempt_legacy_gfx_queue =3D 1;
-               mes_remove_queue_pkt.tf_addr =3D input->trail_fence_addr;
-               mes_remove_queue_pkt.tf_data =3D
-                       lower_32_bits(input->trail_fence_data);
-       } else {
-               if (input->queue_type =3D=3D AMDGPU_RING_TYPE_GFX)
-                       mes_remove_queue_pkt.unmap_legacy_gfx_queue =3D 1;
-               else
-                       mes_remove_queue_pkt.unmap_kiq_utility_queue =3D 1;
-       }
-
-       return mes_v10_1_submit_pkt_and_poll_completion(mes,
-                       &mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt)=
,
-                       offsetof(union MESAPI__REMOVE_QUEUE, api_status));
-}
-
-static int mes_v10_1_suspend_gang(struct amdgpu_mes *mes,
-                                 struct mes_suspend_gang_input *input)
-{
-       return 0;
-}
-
-static int mes_v10_1_resume_gang(struct amdgpu_mes *mes,
-                                struct mes_resume_gang_input *input)
-{
-       return 0;
-}
-
-static int mes_v10_1_query_sched_status(struct amdgpu_mes *mes)
-{
-       union MESAPI__QUERY_MES_STATUS mes_status_pkt;
-
-       memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
-
-       mes_status_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
-       mes_status_pkt.header.opcode =3D MES_SCH_API_QUERY_SCHEDULER_STATUS=
;
-       mes_status_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
-
-       return mes_v10_1_submit_pkt_and_poll_completion(mes,
-                       &mes_status_pkt, sizeof(mes_status_pkt),
-                       offsetof(union MESAPI__QUERY_MES_STATUS, api_status=
));
-}
-
-static int mes_v10_1_set_hw_resources(struct amdgpu_mes *mes)
-{
-       int i;
-       struct amdgpu_device *adev =3D mes->adev;
-       union MESAPI_SET_HW_RESOURCES mes_set_hw_res_pkt;
-
-       memset(&mes_set_hw_res_pkt, 0, sizeof(mes_set_hw_res_pkt));
-
-       mes_set_hw_res_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
-       mes_set_hw_res_pkt.header.opcode =3D MES_SCH_API_SET_HW_RSRC;
-       mes_set_hw_res_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
-
-       mes_set_hw_res_pkt.vmid_mask_mmhub =3D mes->vmid_mask_mmhub;
-       mes_set_hw_res_pkt.vmid_mask_gfxhub =3D mes->vmid_mask_gfxhub;
-       mes_set_hw_res_pkt.gds_size =3D adev->gds.gds_size;
-       mes_set_hw_res_pkt.paging_vmid =3D 0;
-       mes_set_hw_res_pkt.g_sch_ctx_gpu_mc_ptr =3D mes->sch_ctx_gpu_addr;
-       mes_set_hw_res_pkt.query_status_fence_gpu_mc_ptr =3D
-               mes->query_status_fence_gpu_addr;
-
-       for (i =3D 0; i < MAX_COMPUTE_PIPES; i++)
-               mes_set_hw_res_pkt.compute_hqd_mask[i] =3D
-                       mes->compute_hqd_mask[i];
-
-       for (i =3D 0; i < MAX_GFX_PIPES; i++)
-               mes_set_hw_res_pkt.gfx_hqd_mask[i] =3D mes->gfx_hqd_mask[i]=
;
-
-       for (i =3D 0; i < MAX_SDMA_PIPES; i++)
-               mes_set_hw_res_pkt.sdma_hqd_mask[i] =3D mes->sdma_hqd_mask[=
i];
-
-       for (i =3D 0; i < AMD_PRIORITY_NUM_LEVELS; i++)
-               mes_set_hw_res_pkt.aggregated_doorbells[i] =3D
-                       mes->aggregated_doorbells[i];
-
-       for (i =3D 0; i < 5; i++) {
-               mes_set_hw_res_pkt.gc_base[i] =3D adev->reg_offset[GC_HWIP]=
[0][i];
-               mes_set_hw_res_pkt.mmhub_base[i] =3D
-                       adev->reg_offset[MMHUB_HWIP][0][i];
-               mes_set_hw_res_pkt.osssys_base[i] =3D
-                       adev->reg_offset[OSSSYS_HWIP][0][i];
-       }
-
-       mes_set_hw_res_pkt.disable_reset =3D 1;
-       mes_set_hw_res_pkt.disable_mes_log =3D 1;
-       mes_set_hw_res_pkt.use_different_vmid_compute =3D 1;
-
-       return mes_v10_1_submit_pkt_and_poll_completion(mes,
-                       &mes_set_hw_res_pkt, sizeof(mes_set_hw_res_pkt),
-                       offsetof(union MESAPI_SET_HW_RESOURCES, api_status)=
);
-}
-
-static void mes_v10_1_init_aggregated_doorbell(struct amdgpu_mes *mes)
-{
-       struct amdgpu_device *adev =3D mes->adev;
-       uint32_t data;
-
-       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1);
-       data &=3D ~(CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET_MASK |
-                 CP_MES_DOORBELL_CONTROL1__DOORBELL_EN_MASK |
-                 CP_MES_DOORBELL_CONTROL1__DOORBELL_HIT_MASK);
-       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_LOW] =
<<
-               CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET__SHIFT;
-       data |=3D 1 << CP_MES_DOORBELL_CONTROL1__DOORBELL_EN__SHIFT;
-       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1, data);
-
-       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2);
-       data &=3D ~(CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET_MASK |
-                 CP_MES_DOORBELL_CONTROL2__DOORBELL_EN_MASK |
-                 CP_MES_DOORBELL_CONTROL2__DOORBELL_HIT_MASK);
-       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_NORMA=
L] <<
-               CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET__SHIFT;
-       data |=3D 1 << CP_MES_DOORBELL_CONTROL2__DOORBELL_EN__SHIFT;
-       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2, data);
-
-       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3);
-       data &=3D ~(CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET_MASK |
-                 CP_MES_DOORBELL_CONTROL3__DOORBELL_EN_MASK |
-                 CP_MES_DOORBELL_CONTROL3__DOORBELL_HIT_MASK);
-       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_MEDIU=
M] <<
-               CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET__SHIFT;
-       data |=3D 1 << CP_MES_DOORBELL_CONTROL3__DOORBELL_EN__SHIFT;
-       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3, data);
-
-       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4);
-       data &=3D ~(CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET_MASK |
-                 CP_MES_DOORBELL_CONTROL4__DOORBELL_EN_MASK |
-                 CP_MES_DOORBELL_CONTROL4__DOORBELL_HIT_MASK);
-       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_HIGH]=
 <<
-               CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET__SHIFT;
-       data |=3D 1 << CP_MES_DOORBELL_CONTROL4__DOORBELL_EN__SHIFT;
-       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4, data);
-
-       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5);
-       data &=3D ~(CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET_MASK |
-                 CP_MES_DOORBELL_CONTROL5__DOORBELL_EN_MASK |
-                 CP_MES_DOORBELL_CONTROL5__DOORBELL_HIT_MASK);
-       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_REALT=
IME] <<
-               CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET__SHIFT;
-       data |=3D 1 << CP_MES_DOORBELL_CONTROL5__DOORBELL_EN__SHIFT;
-       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5, data);
-
-       data =3D 1 << CP_HQD_GFX_CONTROL__DB_UPDATED_MSG_EN__SHIFT;
-       WREG32_SOC15(GC, 0, mmCP_HQD_GFX_CONTROL, data);
-}
-
-static const struct amdgpu_mes_funcs mes_v10_1_funcs =3D {
-       .add_hw_queue =3D mes_v10_1_add_hw_queue,
-       .remove_hw_queue =3D mes_v10_1_remove_hw_queue,
-       .unmap_legacy_queue =3D mes_v10_1_unmap_legacy_queue,
-       .suspend_gang =3D mes_v10_1_suspend_gang,
-       .resume_gang =3D mes_v10_1_resume_gang,
-};
-
-static int mes_v10_1_allocate_ucode_buffer(struct amdgpu_device *adev,
-                                          enum admgpu_mes_pipe pipe)
-{
-       int r;
-       const struct mes_firmware_header_v1_0 *mes_hdr;
-       const __le32 *fw_data;
-       unsigned fw_size;
-
-       mes_hdr =3D (const struct mes_firmware_header_v1_0 *)
-               adev->mes.fw[pipe]->data;
-
-       fw_data =3D (const __le32 *)(adev->mes.fw[pipe]->data +
-                  le32_to_cpu(mes_hdr->mes_ucode_offset_bytes));
-       fw_size =3D le32_to_cpu(mes_hdr->mes_ucode_size_bytes);
-
-       r =3D amdgpu_bo_create_reserved(adev, fw_size,
-                                     PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
-                                     &adev->mes.ucode_fw_obj[pipe],
-                                     &adev->mes.ucode_fw_gpu_addr[pipe],
-                                     (void **)&adev->mes.ucode_fw_ptr[pipe=
]);
-       if (r) {
-               dev_err(adev->dev, "(%d) failed to create mes fw bo\n", r);
-               return r;
-       }
-
-       memcpy(adev->mes.ucode_fw_ptr[pipe], fw_data, fw_size);
-
-       amdgpu_bo_kunmap(adev->mes.ucode_fw_obj[pipe]);
-       amdgpu_bo_unreserve(adev->mes.ucode_fw_obj[pipe]);
-
-       return 0;
-}
-
-static int mes_v10_1_allocate_ucode_data_buffer(struct amdgpu_device *adev=
,
-                                               enum admgpu_mes_pipe pipe)
-{
-       int r;
-       const struct mes_firmware_header_v1_0 *mes_hdr;
-       const __le32 *fw_data;
-       unsigned fw_size;
-
-       mes_hdr =3D (const struct mes_firmware_header_v1_0 *)
-               adev->mes.fw[pipe]->data;
-
-       fw_data =3D (const __le32 *)(adev->mes.fw[pipe]->data +
-                  le32_to_cpu(mes_hdr->mes_ucode_data_offset_bytes));
-       fw_size =3D le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes);
-
-       r =3D amdgpu_bo_create_reserved(adev, fw_size,
-                                     64 * 1024, AMDGPU_GEM_DOMAIN_GTT,
-                                     &adev->mes.data_fw_obj[pipe],
-                                     &adev->mes.data_fw_gpu_addr[pipe],
-                                     (void **)&adev->mes.data_fw_ptr[pipe]=
);
-       if (r) {
-               dev_err(adev->dev, "(%d) failed to create mes data fw bo\n"=
, r);
-               return r;
-       }
-
-       memcpy(adev->mes.data_fw_ptr[pipe], fw_data, fw_size);
-
-       amdgpu_bo_kunmap(adev->mes.data_fw_obj[pipe]);
-       amdgpu_bo_unreserve(adev->mes.data_fw_obj[pipe]);
-
-       return 0;
-}
-
-static void mes_v10_1_free_ucode_buffers(struct amdgpu_device *adev,
-                                        enum admgpu_mes_pipe pipe)
-{
-       amdgpu_bo_free_kernel(&adev->mes.data_fw_obj[pipe],
-                             &adev->mes.data_fw_gpu_addr[pipe],
-                             (void **)&adev->mes.data_fw_ptr[pipe]);
-
-       amdgpu_bo_free_kernel(&adev->mes.ucode_fw_obj[pipe],
-                             &adev->mes.ucode_fw_gpu_addr[pipe],
-                             (void **)&adev->mes.ucode_fw_ptr[pipe]);
-}
-
-static void mes_v10_1_enable(struct amdgpu_device *adev, bool enable)
-{
-       uint32_t pipe, data =3D 0;
-
-       if (enable) {
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, =
1);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL,
-                            MES_PIPE1_RESET, adev->enable_mes_kiq ? 1 : 0)=
;
-               WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
-
-               mutex_lock(&adev->srbm_mutex);
-               for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-                       if (!adev->enable_mes_kiq &&
-                           pipe =3D=3D AMDGPU_MES_KIQ_PIPE)
-                               continue;
-
-                       nv_grbm_select(adev, 3, pipe, 0, 0);
-                       WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
-                            (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2=
);
-               }
-               nv_grbm_select(adev, 0, 0, 0, 0);
-               mutex_unlock(&adev->srbm_mutex);
-
-               /* clear BYPASS_UNCACHED to avoid hangs after interrupt. */
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL);
-               data =3D REG_SET_FIELD(data, CP_MES_DC_OP_CNTL,
-                                    BYPASS_UNCACHED, 0);
-               WREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL, data);
-
-               /* unhalt MES and activate pipe0 */
-               data =3D REG_SET_FIELD(0, CP_MES_CNTL, MES_PIPE0_ACTIVE, 1)=
;
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE,
-                                    adev->enable_mes_kiq ? 1 : 0);
-               WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
-               udelay(100);
-       } else {
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_ACTIVE,=
 0);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE,=
 0);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL,
-                                    MES_INVALIDATE_ICACHE, 1);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, =
1);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_RESET,
-                                    adev->enable_mes_kiq ? 1 : 0);
-               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_HALT, 1);
-               WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
-       }
-}
-
-/* This function is for backdoor MES firmware */
-static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
-                                   enum admgpu_mes_pipe pipe)
-{
-       int r;
-       uint32_t data;
-
-       mes_v10_1_enable(adev, false);
-
-       if (!adev->mes.fw[pipe])
-               return -EINVAL;
-
-       r =3D mes_v10_1_allocate_ucode_buffer(adev, pipe);
-       if (r)
-               return r;
-
-       r =3D mes_v10_1_allocate_ucode_data_buffer(adev, pipe);
-       if (r) {
-               mes_v10_1_free_ucode_buffers(adev, pipe);
-               return r;
-       }
-
-       WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_CNTL, 0);
-
-       mutex_lock(&adev->srbm_mutex);
-       /* me=3D3, pipe=3D0, queue=3D0 */
-       nv_grbm_select(adev, 3, pipe, 0, 0);
-
-       /* set ucode start address */
-       WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
-                    (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2);
-
-       /* set ucode fimrware address */
-       WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_LO,
-                    lower_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
-       WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_HI,
-                    upper_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
-
-       /* set ucode instruction cache boundary to 2M-1 */
-       WREG32_SOC15(GC, 0, mmCP_MES_MIBOUND_LO, 0x1FFFFF);
-
-       /* set ucode data firmware address */
-       WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_LO,
-                    lower_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
-       WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_HI,
-                    upper_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
-
-       /* Set 0x3FFFF (256K-1) to CP_MES_MDBOUND_LO */
-       WREG32_SOC15(GC, 0, mmCP_MES_MDBOUND_LO, 0x3FFFF);
-
-       /* invalidate ICACHE */
-       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-       case IP_VERSION(10, 3, 0):
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cic=
hlid);
-               break;
-       default:
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
-               break;
-       }
-       data =3D REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
-       data =3D REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE, 1=
);
-       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-       case IP_VERSION(10, 3, 0):
-               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, dat=
a);
-               break;
-       default:
-               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
-               break;
-       }
-
-       /* prime the ICACHE. */
-       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-       case IP_VERSION(10, 3, 0):
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cic=
hlid);
-               break;
-       default:
-               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
-               break;
-       }
-       data =3D REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
-       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-       case IP_VERSION(10, 3, 0):
-               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, dat=
a);
-               break;
-       default:
-               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
-               break;
-       }
-
-       nv_grbm_select(adev, 0, 0, 0, 0);
-       mutex_unlock(&adev->srbm_mutex);
-
-       return 0;
-}
-
-static int mes_v10_1_allocate_eop_buf(struct amdgpu_device *adev,
-                                     enum admgpu_mes_pipe pipe)
-{
-       int r;
-       u32 *eop;
-
-       r =3D amdgpu_bo_create_reserved(adev, MES_EOP_SIZE, PAGE_SIZE,
-                             AMDGPU_GEM_DOMAIN_GTT,
-                             &adev->mes.eop_gpu_obj[pipe],
-                             &adev->mes.eop_gpu_addr[pipe],
-                             (void **)&eop);
-       if (r) {
-               dev_warn(adev->dev, "(%d) create EOP bo failed\n", r);
-               return r;
-       }
-
-       memset(eop, 0, adev->mes.eop_gpu_obj[pipe]->tbo.base.size);
-
-       amdgpu_bo_kunmap(adev->mes.eop_gpu_obj[pipe]);
-       amdgpu_bo_unreserve(adev->mes.eop_gpu_obj[pipe]);
-
-       return 0;
-}
-
-static int mes_v10_1_mqd_init(struct amdgpu_ring *ring)
-{
-       struct v10_compute_mqd *mqd =3D ring->mqd_ptr;
-       uint64_t hqd_gpu_addr, wb_gpu_addr, eop_base_addr;
-       uint32_t tmp;
-
-       memset(mqd, 0, sizeof(*mqd));
-
-       mqd->header =3D 0xC0310800;
-       mqd->compute_pipelinestat_enable =3D 0x00000001;
-       mqd->compute_static_thread_mgmt_se0 =3D 0xffffffff;
-       mqd->compute_static_thread_mgmt_se1 =3D 0xffffffff;
-       mqd->compute_static_thread_mgmt_se2 =3D 0xffffffff;
-       mqd->compute_static_thread_mgmt_se3 =3D 0xffffffff;
-       mqd->compute_misc_reserved =3D 0x00000003;
-
-       eop_base_addr =3D ring->eop_gpu_addr >> 8;
-
-       /* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
-       tmp =3D mmCP_HQD_EOP_CONTROL_DEFAULT;
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
-                       (order_base_2(MES_EOP_SIZE / 4) - 1));
-
-       mqd->cp_hqd_eop_base_addr_lo =3D lower_32_bits(eop_base_addr);
-       mqd->cp_hqd_eop_base_addr_hi =3D upper_32_bits(eop_base_addr);
-       mqd->cp_hqd_eop_control =3D tmp;
-
-       /* disable the queue if it's active */
-       ring->wptr =3D 0;
-       mqd->cp_hqd_pq_rptr =3D 0;
-       mqd->cp_hqd_pq_wptr_lo =3D 0;
-       mqd->cp_hqd_pq_wptr_hi =3D 0;
-
-       /* set the pointer to the MQD */
-       mqd->cp_mqd_base_addr_lo =3D ring->mqd_gpu_addr & 0xfffffffc;
-       mqd->cp_mqd_base_addr_hi =3D upper_32_bits(ring->mqd_gpu_addr);
-
-       /* set MQD vmid to 0 */
-       tmp =3D mmCP_MQD_CONTROL_DEFAULT;
-       tmp =3D REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
-       mqd->cp_mqd_control =3D tmp;
-
-       /* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
-       hqd_gpu_addr =3D ring->gpu_addr >> 8;
-       mqd->cp_hqd_pq_base_lo =3D lower_32_bits(hqd_gpu_addr);
-       mqd->cp_hqd_pq_base_hi =3D upper_32_bits(hqd_gpu_addr);
-
-       /* set the wb address whether it's enabled or not */
-       wb_gpu_addr =3D ring->rptr_gpu_addr;
-       mqd->cp_hqd_pq_rptr_report_addr_lo =3D wb_gpu_addr & 0xfffffffc;
-       mqd->cp_hqd_pq_rptr_report_addr_hi =3D
-               upper_32_bits(wb_gpu_addr) & 0xffff;
-
-       /* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=
=3D1 */
-       wb_gpu_addr =3D ring->wptr_gpu_addr;
-       mqd->cp_hqd_pq_wptr_poll_addr_lo =3D wb_gpu_addr & 0xfffffff8;
-       mqd->cp_hqd_pq_wptr_poll_addr_hi =3D upper_32_bits(wb_gpu_addr) & 0=
xffff;
-
-       /* set up the HQD, this is similar to CP_RB0_CNTL */
-       tmp =3D mmCP_HQD_PQ_CONTROL_DEFAULT;
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
-                           (order_base_2(ring->ring_size / 4) - 1));
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
-                           ((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1) <=
< 8));
-#ifdef __BIG_ENDIAN
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ENDIAN_SWAP, 1);
-#endif
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 1);
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, TUNNEL_DISPATCH, 0);
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, NO_UPDATE_RPTR, 1);
-       mqd->cp_hqd_pq_control =3D tmp;
-
-       /* enable doorbell? */
-       tmp =3D 0;
-       if (ring->use_doorbell) {
-               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-                                   DOORBELL_OFFSET, ring->doorbell_index);
-               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-                                   DOORBELL_EN, 1);
-               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-                                   DOORBELL_SOURCE, 0);
-               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-                                   DOORBELL_HIT, 0);
-       }
-       else
-               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
-                                   DOORBELL_EN, 0);
-       mqd->cp_hqd_pq_doorbell_control =3D tmp;
-
-       mqd->cp_hqd_vmid =3D 0;
-       /* activate the queue */
-       mqd->cp_hqd_active =3D 1;
-       mqd->cp_hqd_persistent_state =3D mmCP_HQD_PERSISTENT_STATE_DEFAULT;
-       mqd->cp_hqd_ib_control =3D mmCP_HQD_IB_CONTROL_DEFAULT;
-       mqd->cp_hqd_iq_timer =3D mmCP_HQD_IQ_TIMER_DEFAULT;
-       mqd->cp_hqd_quantum =3D mmCP_HQD_QUANTUM_DEFAULT;
-
-       tmp =3D mmCP_HQD_GFX_CONTROL_DEFAULT;
-       tmp =3D REG_SET_FIELD(tmp, CP_HQD_GFX_CONTROL, DB_UPDATED_MSG_EN, 1=
);
-       /* offset: 184 - this is used for CP_HQD_GFX_CONTROL */
-       mqd->cp_hqd_suspend_cntl_stack_offset =3D tmp;
-
-       amdgpu_device_flush_hdp(ring->adev, NULL);
-       return 0;
-}
-
-#if 0
-static void mes_v10_1_queue_init_register(struct amdgpu_ring *ring)
-{
-       struct v10_compute_mqd *mqd =3D ring->mqd_ptr;
-       struct amdgpu_device *adev =3D ring->adev;
-       uint32_t data =3D 0;
-
-       mutex_lock(&adev->srbm_mutex);
-       nv_grbm_select(adev, 3, ring->pipe, 0, 0);
-
-       /* set CP_HQD_VMID.VMID =3D 0. */
-       data =3D RREG32_SOC15(GC, 0, mmCP_HQD_VMID);
-       data =3D REG_SET_FIELD(data, CP_HQD_VMID, VMID, 0);
-       WREG32_SOC15(GC, 0, mmCP_HQD_VMID, data);
-
-       /* set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_EN=3D0 */
-       data =3D RREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL);
-       data =3D REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
-                            DOORBELL_EN, 0);
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL, data);
-
-       /* set CP_MQD_BASE_ADDR/HI with the MQD base address */
-       WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR, mqd->cp_mqd_base_addr_lo);
-       WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR_HI, mqd->cp_mqd_base_addr_hi=
);
-
-       /* set CP_MQD_CONTROL.VMID=3D0 */
-       data =3D RREG32_SOC15(GC, 0, mmCP_MQD_CONTROL);
-       data =3D REG_SET_FIELD(data, CP_MQD_CONTROL, VMID, 0);
-       WREG32_SOC15(GC, 0, mmCP_MQD_CONTROL, 0);
-
-       /* set CP_HQD_PQ_BASE/HI with the ring buffer base address */
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE, mqd->cp_hqd_pq_base_lo);
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE_HI, mqd->cp_hqd_pq_base_hi);
-
-       /* set CP_HQD_PQ_RPTR_REPORT_ADDR/HI */
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR,
-                    mqd->cp_hqd_pq_rptr_report_addr_lo);
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
-                    mqd->cp_hqd_pq_rptr_report_addr_hi);
-
-       /* set CP_HQD_PQ_CONTROL */
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_CONTROL, mqd->cp_hqd_pq_control);
-
-       /* set CP_HQD_PQ_WPTR_POLL_ADDR/HI */
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR,
-                    mqd->cp_hqd_pq_wptr_poll_addr_lo);
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR_HI,
-                    mqd->cp_hqd_pq_wptr_poll_addr_hi);
-
-       /* set CP_HQD_PQ_DOORBELL_CONTROL */
-       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL,
-                    mqd->cp_hqd_pq_doorbell_control);
-
-       /* set CP_HQD_PERSISTENT_STATE.PRELOAD_SIZE=3D0x53 */
-       WREG32_SOC15(GC, 0, mmCP_HQD_PERSISTENT_STATE, mqd->cp_hqd_persiste=
nt_state);
-
-       /* set CP_HQD_ACTIVE.ACTIVE=3D1 */
-       WREG32_SOC15(GC, 0, mmCP_HQD_ACTIVE, mqd->cp_hqd_active);
-
-       nv_grbm_select(adev, 0, 0, 0, 0);
-       mutex_unlock(&adev->srbm_mutex);
-}
-#endif
-
-static int mes_v10_1_kiq_enable_queue(struct amdgpu_device *adev)
-{
-       struct amdgpu_kiq *kiq =3D &adev->gfx.kiq[0];
-       struct amdgpu_ring *kiq_ring =3D &adev->gfx.kiq[0].ring;
-       int r;
-
-       if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
-               return -EINVAL;
-
-       r =3D amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size);
-       if (r) {
-               DRM_ERROR("Failed to lock KIQ (%d).\n", r);
-               return r;
-       }
-
-       kiq->pmf->kiq_map_queues(kiq_ring, &adev->mes.ring);
-
-       return amdgpu_ring_test_helper(kiq_ring);
-}
-
-static int mes_v10_1_queue_init(struct amdgpu_device *adev)
-{
-       int r;
-
-       r =3D mes_v10_1_mqd_init(&adev->mes.ring);
-       if (r)
-               return r;
-
-       r =3D mes_v10_1_kiq_enable_queue(adev);
-       if (r)
-               return r;
-
-       return 0;
-}
-
-static int mes_v10_1_ring_init(struct amdgpu_device *adev)
-{
-       struct amdgpu_ring *ring;
-
-       ring =3D &adev->mes.ring;
-
-       ring->funcs =3D &mes_v10_1_ring_funcs;
-
-       ring->me =3D 3;
-       ring->pipe =3D 0;
-       ring->queue =3D 0;
-
-       ring->ring_obj =3D NULL;
-       ring->use_doorbell =3D true;
-       ring->doorbell_index =3D adev->doorbell_index.mes_ring0 << 1;
-       ring->eop_gpu_addr =3D adev->mes.eop_gpu_addr[AMDGPU_MES_SCHED_PIPE=
];
-       ring->no_scheduler =3D true;
-       sprintf(ring->name, "mes_%d.%d.%d", ring->me, ring->pipe, ring->que=
ue);
-
-       return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
-                               AMDGPU_RING_PRIO_DEFAULT, NULL);
-}
-
-static int mes_v10_1_kiq_ring_init(struct amdgpu_device *adev)
-{
-       struct amdgpu_ring *ring;
-
-       spin_lock_init(&adev->gfx.kiq[0].ring_lock);
-
-       ring =3D &adev->gfx.kiq[0].ring;
-
-       ring->me =3D 3;
-       ring->pipe =3D 1;
-       ring->queue =3D 0;
-
-       ring->adev =3D NULL;
-       ring->ring_obj =3D NULL;
-       ring->use_doorbell =3D true;
-       ring->doorbell_index =3D adev->doorbell_index.mes_ring1 << 1;
-       ring->eop_gpu_addr =3D adev->mes.eop_gpu_addr[AMDGPU_MES_KIQ_PIPE];
-       ring->no_scheduler =3D true;
-       sprintf(ring->name, "mes_kiq_%d.%d.%d",
-               ring->me, ring->pipe, ring->queue);
-
-       return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
-                               AMDGPU_RING_PRIO_DEFAULT, NULL);
-}
-
-static int mes_v10_1_mqd_sw_init(struct amdgpu_device *adev,
-                                enum admgpu_mes_pipe pipe)
-{
-       int r, mqd_size =3D sizeof(struct v10_compute_mqd);
-       struct amdgpu_ring *ring;
-
-       if (pipe =3D=3D AMDGPU_MES_KIQ_PIPE)
-               ring =3D &adev->gfx.kiq[0].ring;
-       else if (pipe =3D=3D AMDGPU_MES_SCHED_PIPE)
-               ring =3D &adev->mes.ring;
-       else
-               BUG();
-
-       if (ring->mqd_obj)
-               return 0;
-
-       r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
-                                   AMDGPU_GEM_DOMAIN_VRAM |
-                                   AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
-                                   &ring->mqd_gpu_addr, &ring->mqd_ptr);
-       if (r) {
-               dev_warn(adev->dev, "failed to create ring mqd bo (%d)", r)=
;
-               return r;
-       }
-       memset(ring->mqd_ptr, 0, mqd_size);
-
-       /* prepare MQD backup */
-       adev->mes.mqd_backup[pipe] =3D kmalloc(mqd_size, GFP_KERNEL);
-       if (!adev->mes.mqd_backup[pipe]) {
-               dev_warn(adev->dev,
-                        "no memory to create MQD backup for ring %s\n",
-                        ring->name);
-               return -ENOMEM;
-       }
-
-       return 0;
-}
-
-static int mes_v10_1_sw_init(void *handle)
-{
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-       int pipe, r;
-
-       adev->mes.funcs =3D &mes_v10_1_funcs;
-       adev->mes.kiq_hw_init =3D &mes_v10_1_kiq_hw_init;
-
-       r =3D amdgpu_mes_init(adev);
-       if (r)
-               return r;
-
-       for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-               if (!adev->enable_mes_kiq && pipe =3D=3D AMDGPU_MES_KIQ_PIP=
E)
-                       continue;
-
-               r =3D mes_v10_1_allocate_eop_buf(adev, pipe);
-               if (r)
-                       return r;
-
-               r =3D mes_v10_1_mqd_sw_init(adev, pipe);
-               if (r)
-                       return r;
-       }
-
-       if (adev->enable_mes_kiq) {
-               r =3D mes_v10_1_kiq_ring_init(adev);
-               if (r)
-                       return r;
-       }
-
-       r =3D mes_v10_1_ring_init(adev);
-       if (r)
-               return r;
-
-       return 0;
-}
-
-static int mes_v10_1_sw_fini(void *handle)
-{
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-       int pipe;
-
-       amdgpu_device_wb_free(adev, adev->mes.sch_ctx_offs);
-       amdgpu_device_wb_free(adev, adev->mes.query_status_fence_offs);
-
-       for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-               kfree(adev->mes.mqd_backup[pipe]);
-
-               amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
-                                     &adev->mes.eop_gpu_addr[pipe],
-                                     NULL);
-               amdgpu_ucode_release(&adev->mes.fw[pipe]);
-       }
-
-       amdgpu_bo_free_kernel(&adev->gfx.kiq[0].ring.mqd_obj,
-                             &adev->gfx.kiq[0].ring.mqd_gpu_addr,
-                             &adev->gfx.kiq[0].ring.mqd_ptr);
-
-       amdgpu_bo_free_kernel(&adev->mes.ring.mqd_obj,
-                             &adev->mes.ring.mqd_gpu_addr,
-                             &adev->mes.ring.mqd_ptr);
-
-       amdgpu_ring_fini(&adev->gfx.kiq[0].ring);
-       amdgpu_ring_fini(&adev->mes.ring);
-
-       amdgpu_mes_fini(adev);
-       return 0;
-}
-
-static void mes_v10_1_kiq_setting(struct amdgpu_ring *ring)
-{
-       uint32_t tmp;
-       struct amdgpu_device *adev =3D ring->adev;
-
-       /* tell RLC which is KIQ queue */
-       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
-       case IP_VERSION(10, 3, 0):
-       case IP_VERSION(10, 3, 2):
-       case IP_VERSION(10, 3, 1):
-       case IP_VERSION(10, 3, 4):
-               tmp =3D RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cich=
lid);
-               tmp &=3D 0xffffff00;
-               tmp |=3D (ring->me << 5) | (ring->pipe << 3) | (ring->queue=
);
-               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp=
);
-               tmp |=3D 0x80;
-               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp=
);
-               break;
-       default:
-               tmp =3D RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS);
-               tmp &=3D 0xffffff00;
-               tmp |=3D (ring->me << 5) | (ring->pipe << 3) | (ring->queue=
);
-               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
-               tmp |=3D 0x80;
-               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
-               break;
-       }
-}
-
-static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev)
-{
-       int r =3D 0;
-
-       if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_DIRECT) {
-               r =3D mes_v10_1_load_microcode(adev, AMDGPU_MES_KIQ_PIPE);
-               if (r) {
-                       DRM_ERROR("failed to load MES kiq fw, r=3D%d\n", r)=
;
-                       return r;
-               }
-
-               r =3D mes_v10_1_load_microcode(adev, AMDGPU_MES_SCHED_PIPE)=
;
-               if (r) {
-                       DRM_ERROR("failed to load MES fw, r=3D%d\n", r);
-                       return r;
-               }
-       }
-
-       mes_v10_1_enable(adev, true);
-
-       mes_v10_1_kiq_setting(&adev->gfx.kiq[0].ring);
-
-       r =3D mes_v10_1_queue_init(adev);
-       if (r)
-               goto failure;
-
-       return r;
-
-failure:
-       mes_v10_1_hw_fini(adev);
-       return r;
-}
-
-static int mes_v10_1_hw_init(void *handle)
-{
-       int r;
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-
-       if (!adev->enable_mes_kiq) {
-               if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_DIRECT) =
{
-                       r =3D mes_v10_1_load_microcode(adev,
-                                            AMDGPU_MES_SCHED_PIPE);
-                       if (r) {
-                               DRM_ERROR("failed to MES fw, r=3D%d\n", r);
-                               return r;
-                       }
-               }
-
-               mes_v10_1_enable(adev, true);
-       }
-
-       r =3D mes_v10_1_queue_init(adev);
-       if (r)
-               goto failure;
-
-       r =3D mes_v10_1_set_hw_resources(&adev->mes);
-       if (r)
-               goto failure;
-
-       mes_v10_1_init_aggregated_doorbell(&adev->mes);
-
-       r =3D mes_v10_1_query_sched_status(&adev->mes);
-       if (r) {
-               DRM_ERROR("MES is busy\n");
-               goto failure;
-       }
-
-       /*
-        * Disable KIQ ring usage from the driver once MES is enabled.
-        * MES uses KIQ ring exclusively so driver cannot access KIQ ring
-        * with MES enabled.
-        */
-       adev->gfx.kiq[0].ring.sched.ready =3D false;
-       adev->mes.ring.sched.ready =3D true;
-
-       return 0;
-
-failure:
-       mes_v10_1_hw_fini(adev);
-       return r;
-}
-
-static int mes_v10_1_hw_fini(void *handle)
-{
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-
-       adev->mes.ring.sched.ready =3D false;
-
-       mes_v10_1_enable(adev, false);
-
-       if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_DIRECT) {
-               mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_KIQ_PIPE);
-               mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_SCHED_PIPE);
-       }
-
-       return 0;
-}
-
-static int mes_v10_1_suspend(void *handle)
-{
-       int r;
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-
-       r =3D amdgpu_mes_suspend(adev);
-       if (r)
-               return r;
-
-       return mes_v10_1_hw_fini(adev);
-}
-
-static int mes_v10_1_resume(void *handle)
-{
-       int r;
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-
-       r =3D mes_v10_1_hw_init(adev);
-       if (r)
-               return r;
-
-       return amdgpu_mes_resume(adev);
-}
-
-static int mes_v10_0_early_init(void *handle)
-{
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-       int pipe, r;
-
-       for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
-               if (!adev->enable_mes_kiq && pipe =3D=3D AMDGPU_MES_KIQ_PIP=
E)
-                       continue;
-               r =3D amdgpu_mes_init_microcode(adev, pipe);
-               if (r)
-                       return r;
-       }
-
-       return 0;
-}
-
-static int mes_v10_0_late_init(void *handle)
-{
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-
-       if (!amdgpu_in_reset(adev))
-               amdgpu_mes_self_test(adev);
-
-       return 0;
-}
-
-static const struct amd_ip_funcs mes_v10_1_ip_funcs =3D {
-       .name =3D "mes_v10_1",
-       .early_init =3D mes_v10_0_early_init,
-       .late_init =3D mes_v10_0_late_init,
-       .sw_init =3D mes_v10_1_sw_init,
-       .sw_fini =3D mes_v10_1_sw_fini,
-       .hw_init =3D mes_v10_1_hw_init,
-       .hw_fini =3D mes_v10_1_hw_fini,
-       .suspend =3D mes_v10_1_suspend,
-       .resume =3D mes_v10_1_resume,
-       .dump_ip_state =3D NULL,
-       .print_ip_state =3D NULL,
-};
-
-const struct amdgpu_ip_block_version mes_v10_1_ip_block =3D {
-       .type =3D AMD_IP_BLOCK_TYPE_MES,
-       .major =3D 10,
-       .minor =3D 1,
-       .rev =3D 0,
-       .funcs =3D &mes_v10_1_ip_funcs,
-};
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h b/drivers/gpu/drm/amd/a=
mdgpu/mes_v10_1.h
deleted file mode 100644
index 9afd6ddb01e9..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Copyright 2019 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software=
"),
- * to deal in the Software without restriction, including without limitati=
on
- * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included=
 in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef __MES_V10_1_H__
-#define __MES_V10_1_H__
-
-extern const struct amdgpu_ip_block_version mes_v10_1_ip_block;
-
-#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/n=
v.c
index 7e30a89fe03e..4938e6b340e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -59,7 +59,6 @@
 #include "vcn_v3_0.h"
 #include "jpeg_v3_0.h"
 #include "amdgpu_vkms.h"
-#include "mes_v10_1.h"
 #include "mxgpu_nv.h"
 #include "smuio_v11_0.h"
 #include "smuio_v11_0_6.h"
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 4721b2fccd06..485e26abc619 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -35,7 +35,7 @@
 #include "cik_regs.h"
 #include "kfd_kernel_queue.h"
 #include "amdgpu_amdkfd.h"
-#include "mes_api_def.h"
+#include "mes_v11_api_def.h"
 #include "kfd_debug.h"

 /* Size of the per-pipe EOP queue */
diff --git a/drivers/gpu/drm/amd/include/mes_api_def.h b/drivers/gpu/drm/am=
d/include/mes_api_def.h
deleted file mode 100644
index bf3d6ad263f9..000000000000
--- a/drivers/gpu/drm/amd/include/mes_api_def.h
+++ /dev/null
@@ -1,570 +0,0 @@
-/*
- * Copyright 2019 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software=
"),
- * to deal in the Software without restriction, including without limitati=
on
- * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included=
 in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef __MES_API_DEF_H__
-#define __MES_API_DEF_H__
-
-#pragma pack(push, 4)
-
-#define MES_API_VERSION 1
-
-/* Driver submits one API(cmd) as a single Frame and this command size is =
same
- * for all API to ease the debugging and parsing of ring buffer.
- */
-enum { API_FRAME_SIZE_IN_DWORDS =3D 64 };
-
-/* To avoid command in scheduler context to be overwritten whenever multip=
le
- * interrupts come in, this creates another queue.
- */
-enum { API_NUMBER_OF_COMMAND_MAX =3D 32 };
-
-enum MES_API_TYPE {
-       MES_API_TYPE_SCHEDULER =3D 1,
-       MES_API_TYPE_MAX
-};
-
-enum MES_SCH_API_OPCODE {
-       MES_SCH_API_SET_HW_RSRC                 =3D 0,
-       MES_SCH_API_SET_SCHEDULING_CONFIG       =3D 1, /* agreegated db, qu=
antums, etc */
-       MES_SCH_API_ADD_QUEUE                   =3D 2,
-       MES_SCH_API_REMOVE_QUEUE                =3D 3,
-       MES_SCH_API_PERFORM_YIELD               =3D 4,
-       MES_SCH_API_SET_GANG_PRIORITY_LEVEL     =3D 5,
-       MES_SCH_API_SUSPEND                     =3D 6,
-       MES_SCH_API_RESUME                      =3D 7,
-       MES_SCH_API_RESET                       =3D 8,
-       MES_SCH_API_SET_LOG_BUFFER              =3D 9,
-       MES_SCH_API_CHANGE_GANG_PRORITY         =3D 10,
-       MES_SCH_API_QUERY_SCHEDULER_STATUS      =3D 11,
-       MES_SCH_API_PROGRAM_GDS                 =3D 12,
-       MES_SCH_API_SET_DEBUG_VMID              =3D 13,
-       MES_SCH_API_MISC                        =3D 14,
-       MES_SCH_API_UPDATE_ROOT_PAGE_TABLE      =3D 15,
-       MES_SCH_API_AMD_LOG                     =3D 16,
-       MES_SCH_API_MAX                         =3D 0xFF
-};
-
-union MES_API_HEADER {
-       struct {
-               uint32_t type           : 4; /* 0 - Invalid; 1 - Scheduling=
; 2 - TBD */
-               uint32_t opcode         : 8;
-               uint32_t dwsize         : 8; /* including header */
-               uint32_t reserved       : 12;
-       };
-
-       uint32_t        u32All;
-};
-
-enum MES_AMD_PRIORITY_LEVEL {
-       AMD_PRIORITY_LEVEL_LOW          =3D 0,
-       AMD_PRIORITY_LEVEL_NORMAL       =3D 1,
-       AMD_PRIORITY_LEVEL_MEDIUM       =3D 2,
-       AMD_PRIORITY_LEVEL_HIGH         =3D 3,
-       AMD_PRIORITY_LEVEL_REALTIME     =3D 4,
-       AMD_PRIORITY_NUM_LEVELS
-};
-
-enum MES_QUEUE_TYPE {
-       MES_QUEUE_TYPE_GFX,
-       MES_QUEUE_TYPE_COMPUTE,
-       MES_QUEUE_TYPE_SDMA,
-       MES_QUEUE_TYPE_MAX,
-};
-
-struct MES_API_STATUS {
-       uint64_t        api_completion_fence_addr;
-       uint64_t        api_completion_fence_value;
-};
-
-enum { MAX_COMPUTE_PIPES =3D 8 };
-enum { MAX_GFX_PIPES =3D 2 };
-enum { MAX_SDMA_PIPES =3D 2 };
-
-enum { MAX_COMPUTE_HQD_PER_PIPE =3D 8 };
-enum { MAX_GFX_HQD_PER_PIPE =3D 8 };
-enum { MAX_SDMA_HQD_PER_PIPE =3D 10 };
-
-enum { MAX_QUEUES_IN_A_GANG =3D 8 };
-
-enum VM_HUB_TYPE {
-       VM_HUB_TYPE_GC =3D 0,
-       VM_HUB_TYPE_MM =3D 1,
-       VM_HUB_TYPE_MAX,
-};
-
-enum { VMID_INVALID =3D 0xffff };
-
-enum { MAX_VMID_GCHUB =3D 16 };
-enum { MAX_VMID_MMHUB =3D 16 };
-
-enum MES_LOG_OPERATION {
-       MES_LOG_OPERATION_CONTEXT_STATE_CHANGE =3D 0,
-       MES_LOG_OPERATION_QUEUE_NEW_WORK =3D 1,
-       MES_LOG_OPERATION_QUEUE_UNWAIT_SYNC_OBJECT =3D 2,
-       MES_LOG_OPERATION_QUEUE_NO_MORE_WORK =3D 3,
-       MES_LOG_OPERATION_QUEUE_WAIT_SYNC_OBJECT =3D 4,
-       MES_LOG_OPERATION_QUEUE_INVALID =3D 0xF,
-};
-
-enum MES_LOG_CONTEXT_STATE {
-       MES_LOG_CONTEXT_STATE_IDLE              =3D 0,
-       MES_LOG_CONTEXT_STATE_RUNNING           =3D 1,
-       MES_LOG_CONTEXT_STATE_READY             =3D 2,
-       MES_LOG_CONTEXT_STATE_READY_STANDBY     =3D 3,
-       MES_LOG_CONTEXT_STATE_INVALID           =3D 0xF,
-};
-
-struct MES_LOG_CONTEXT_STATE_CHANGE {
-       void                            *h_context;
-       enum MES_LOG_CONTEXT_STATE      new_context_state;
-};
-
-struct MES_LOG_QUEUE_NEW_WORK {
-       uint64_t                   h_queue;
-       uint64_t                   reserved;
-};
-
-struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT {
-       uint64_t                   h_queue;
-       uint64_t                   h_sync_object;
-};
-
-struct MES_LOG_QUEUE_NO_MORE_WORK {
-       uint64_t                   h_queue;
-       uint64_t                   reserved;
-};
-
-struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT {
-       uint64_t                   h_queue;
-       uint64_t                   h_sync_object;
-};
-
-struct MES_LOG_ENTRY_HEADER {
-       uint32_t        first_free_entry_index;
-       uint32_t        wraparound_count;
-       uint64_t        number_of_entries;
-       uint64_t        reserved[2];
-};
-
-struct MES_LOG_ENTRY_DATA {
-       uint64_t        gpu_time_stamp;
-       uint32_t        operation_type; /* operation_type is of MES_LOG_OPE=
RATION type */
-       uint32_t        reserved_operation_type_bits;
-       union {
-               struct MES_LOG_CONTEXT_STATE_CHANGE     context_state_chang=
e;
-               struct MES_LOG_QUEUE_NEW_WORK           queue_new_work;
-               struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT queue_unwait_sync_o=
bject;
-               struct MES_LOG_QUEUE_NO_MORE_WORK       queue_no_more_work;
-               struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT   queue_wait_sync_obj=
ect;
-               uint64_t                                all[2];
-       };
-};
-
-struct MES_LOG_BUFFER {
-       struct MES_LOG_ENTRY_HEADER     header;
-       struct MES_LOG_ENTRY_DATA       entries[1];
-};
-
-enum MES_SWIP_TO_HWIP_DEF {
-       MES_MAX_HWIP_SEGMENT =3D 6,
-};
-
-union MESAPI_SET_HW_RESOURCES {
-       struct {
-               union MES_API_HEADER    header;
-               uint32_t                vmid_mask_mmhub;
-               uint32_t                vmid_mask_gfxhub;
-               uint32_t                gds_size;
-               uint32_t                paging_vmid;
-               uint32_t                compute_hqd_mask[MAX_COMPUTE_PIPES]=
;
-               uint32_t                gfx_hqd_mask[MAX_GFX_PIPES];
-               uint32_t                sdma_hqd_mask[MAX_SDMA_PIPES];
-               uint32_t                aggregated_doorbells[AMD_PRIORITY_N=
UM_LEVELS];
-               uint64_t                g_sch_ctx_gpu_mc_ptr;
-               uint64_t                query_status_fence_gpu_mc_ptr;
-               uint32_t                gc_base[MES_MAX_HWIP_SEGMENT];
-               uint32_t                mmhub_base[MES_MAX_HWIP_SEGMENT];
-               uint32_t                osssys_base[MES_MAX_HWIP_SEGMENT];
-               struct MES_API_STATUS   api_status;
-               union {
-                       struct {
-                               uint32_t disable_reset  : 1;
-                               uint32_t use_different_vmid_compute : 1;
-                               uint32_t disable_mes_log   : 1;
-                               uint32_t apply_mmhub_pgvm_invalidate_ack_lo=
ss_wa : 1;
-                               uint32_t apply_grbm_remote_register_dummy_r=
ead_wa : 1;
-                               uint32_t second_gfx_pipe_enabled : 1;
-                               uint32_t enable_level_process_quantum_check=
 : 1;
-                               uint32_t apply_cwsr_program_all_vmid_sq_sha=
der_tba_registers_wa : 1;
-                               uint32_t enable_mqd_active_poll : 1;
-                               uint32_t disable_timer_int : 1;
-                               uint32_t reserved       : 22;
-                       };
-                       uint32_t        uint32_t_all;
-               };
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__ADD_QUEUE {
-       struct {
-               union MES_API_HEADER            header;
-               uint32_t                        process_id;
-               uint64_t                        page_table_base_addr;
-               uint64_t                        process_va_start;
-               uint64_t                        process_va_end;
-               uint64_t                        process_quantum;
-               uint64_t                        process_context_addr;
-               uint64_t                        gang_quantum;
-               uint64_t                        gang_context_addr;
-               uint32_t                        inprocess_gang_priority;
-               enum MES_AMD_PRIORITY_LEVEL     gang_global_priority_level;
-               uint32_t                        doorbell_offset;
-               uint64_t                        mqd_addr;
-               uint64_t                        wptr_addr;
-               uint64_t                        h_context;
-               uint64_t                        h_queue;
-               enum MES_QUEUE_TYPE             queue_type;
-               uint32_t                        gds_base;
-               uint32_t                        gds_size;
-               uint32_t                        gws_base;
-               uint32_t                        gws_size;
-               uint32_t                        oa_mask;
-               uint64_t                        trap_handler_addr;
-               uint32_t                        vm_context_cntl;
-
-               struct {
-                       uint32_t paging                 : 1;
-                       uint32_t debug_vmid             : 4;
-                       uint32_t program_gds            : 1;
-                       uint32_t is_gang_suspended      : 1;
-                       uint32_t is_tmz_queue           : 1;
-                       uint32_t map_kiq_utility_queue  : 1;
-                       uint32_t reserved               : 23;
-               };
-               struct MES_API_STATUS           api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__REMOVE_QUEUE {
-       struct {
-               union MES_API_HEADER    header;
-               uint32_t                doorbell_offset;
-               uint64_t                gang_context_addr;
-
-               struct {
-                       uint32_t unmap_legacy_gfx_queue   : 1;
-                       uint32_t unmap_kiq_utility_queue  : 1;
-                       uint32_t preempt_legacy_gfx_queue : 1;
-                       uint32_t reserved                 : 29;
-               };
-               struct MES_API_STATUS       api_status;
-
-               uint32_t                    pipe_id;
-               uint32_t                    queue_id;
-
-               uint64_t                    tf_addr;
-               uint32_t                    tf_data;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__SET_SCHEDULING_CONFIG {
-       struct {
-               union MES_API_HEADER    header;
-               /* Grace period when preempting another priority band for t=
his
-                * priority band. The value for idle priority band is ignor=
ed,
-                * as it never preempts other bands.
-                */
-               uint64_t                grace_period_other_levels[AMD_PRIOR=
ITY_NUM_LEVELS];
-               /* Default quantum for scheduling across processes within
-                * a priority band.
-                */
-               uint64_t                process_quantum_for_level[AMD_PRIOR=
ITY_NUM_LEVELS];
-               /* Default grace period for processes that preempt each oth=
er
-                * within a priority band.
-                */
-               uint64_t                process_grace_period_same_level[AMD=
_PRIORITY_NUM_LEVELS];
-               /* For normal level this field specifies the target GPU
-                * percentage in situations when it's starved by the high l=
evel.
-                * Valid values are between 0 and 50, with the default bein=
g 10.
-                */
-               uint32_t                normal_yield_percent;
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__PERFORM_YIELD {
-       struct {
-               union MES_API_HEADER    header;
-               uint32_t                dummy;
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__CHANGE_GANG_PRIORITY_LEVEL {
-       struct {
-               union MES_API_HEADER            header;
-               uint32_t                        inprocess_gang_priority;
-               enum MES_AMD_PRIORITY_LEVEL     gang_global_priority_level;
-               uint64_t                        gang_quantum;
-               uint64_t                        gang_context_addr;
-               struct MES_API_STATUS           api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__SUSPEND {
-       struct {
-               union MES_API_HEADER    header;
-               /* false - suspend all gangs; true - specific gang */
-               struct {
-                       uint32_t suspend_all_gangs      : 1;
-                       uint32_t reserved               : 31;
-               };
-               /* gang_context_addr is valid only if suspend_all =3D false=
 */
-               uint64_t                gang_context_addr;
-
-               uint64_t                suspend_fence_addr;
-               uint32_t                suspend_fence_value;
-
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__RESUME {
-       struct {
-               union MES_API_HEADER    header;
-               /* false - resume all gangs; true - specified gang */
-               struct {
-                       uint32_t resume_all_gangs       : 1;
-                       uint32_t reserved               : 31;
-               };
-               /* valid only if resume_all_gangs =3D false */
-               uint64_t                gang_context_addr;
-
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__RESET {
-       struct {
-               union MES_API_HEADER            header;
-
-               struct {
-                       /* Only reset the queue given by doorbell_offset (n=
ot entire gang) */
-                       uint32_t                reset_queue_only : 1;
-                       /* Hang detection first then reset any queues that =
are hung */
-                       uint32_t                hang_detect_then_reset : 1;
-                       /* Only do hang detection (no reset) */
-                       uint32_t                hang_detect_only : 1;
-                       /* Rest HP and LP kernel queues not managed by MES =
*/
-                       uint32_t                reset_legacy_gfx : 1;
-                       uint32_t                reserved : 28;
-               };
-
-               uint64_t                        gang_context_addr;
-
-               /* valid only if reset_queue_only =3D true */
-               uint32_t                        doorbell_offset;
-
-               /* valid only if hang_detect_then_reset =3D true */
-               uint64_t                        doorbell_offset_addr;
-               enum MES_QUEUE_TYPE             queue_type;
-
-               /* valid only if reset_legacy_gfx =3D true */
-               uint32_t                        pipe_id_lp;
-               uint32_t                        queue_id_lp;
-               uint32_t                        vmid_id_lp;
-               uint64_t                        mqd_mc_addr_lp;
-               uint32_t                        doorbell_offset_lp;
-               uint64_t                        wptr_addr_lp;
-
-               uint32_t                        pipe_id_hp;
-               uint32_t                        queue_id_hp;
-               uint32_t                        vmid_id_hp;
-               uint64_t                        mqd_mc_addr_hp;
-               uint32_t                        doorbell_offset_hp;
-               uint64_t                        wptr_addr_hp;
-
-               struct MES_API_STATUS           api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__SET_LOGGING_BUFFER {
-       struct {
-               union MES_API_HEADER    header;
-               /* There are separate log buffers for each queue type */
-               enum MES_QUEUE_TYPE     log_type;
-               /* Log buffer GPU Address */
-               uint64_t                logging_buffer_addr;
-               /* number of entries in the log buffer */
-               uint32_t                number_of_entries;
-               /* Entry index at which CPU interrupt needs to be signalled=
 */
-               uint32_t                interrupt_entry;
-
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__QUERY_MES_STATUS {
-       struct {
-               union MES_API_HEADER    header;
-               bool                    mes_healthy; /* 0 - not healthy, 1 =
- healthy */
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__PROGRAM_GDS {
-       struct {
-               union MES_API_HEADER    header;
-               uint64_t                process_context_addr;
-               uint32_t                gds_base;
-               uint32_t                gds_size;
-               uint32_t                gws_base;
-               uint32_t                gws_size;
-               uint32_t                oa_mask;
-               struct MES_API_STATUS   api_status;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__SET_DEBUG_VMID {
-       struct {
-               union MES_API_HEADER    header;
-               struct MES_API_STATUS   api_status;
-               union {
-                       struct {
-                               uint32_t use_gds        : 1;
-                               uint32_t reserved       : 31;
-                       } flags;
-                       uint32_t        u32All;
-               };
-               uint32_t                reserved;
-               uint32_t                debug_vmid;
-               uint64_t                process_context_addr;
-               uint64_t                page_table_base_addr;
-               uint64_t                process_va_start;
-               uint64_t                process_va_end;
-               uint32_t                gds_base;
-               uint32_t                gds_size;
-               uint32_t                gws_base;
-               uint32_t                gws_size;
-               uint32_t                oa_mask;
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-enum MESAPI_MISC_OPCODE {
-       MESAPI_MISC__MODIFY_REG,
-       MESAPI_MISC__INV_GART,
-       MESAPI_MISC__QUERY_STATUS,
-       MESAPI_MISC__MAX,
-};
-
-enum MODIFY_REG_SUBCODE {
-       MODIFY_REG__OVERWRITE,
-       MODIFY_REG__RMW_OR,
-       MODIFY_REG__RMW_AND,
-       MODIFY_REG__MAX,
-};
-
-enum { MISC_DATA_MAX_SIZE_IN_DWORDS =3D 20 };
-
-struct MODIFY_REG {
-       enum MODIFY_REG_SUBCODE   subcode;
-       uint32_t                  reg_offset;
-       uint32_t                  reg_value;
-};
-
-struct INV_GART {
-       uint64_t                  inv_range_va_start;
-       uint64_t                  inv_range_size;
-};
-
-struct QUERY_STATUS {
-       uint32_t context_id;
-};
-
-union MESAPI__MISC {
-       struct {
-               union MES_API_HEADER    header;
-               enum MESAPI_MISC_OPCODE opcode;
-               struct MES_API_STATUS   api_status;
-
-               union {
-                       struct          MODIFY_REG modify_reg;
-                       struct          INV_GART inv_gart;
-                       struct          QUERY_STATUS query_status;
-                       uint32_t        data[MISC_DATA_MAX_SIZE_IN_DWORDS];
-               };
-       };
-
-       uint32_t        max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI__UPDATE_ROOT_PAGE_TABLE {
-       struct {
-               union MES_API_HEADER        header;
-               uint64_t                    page_table_base_addr;
-               uint64_t                    process_context_addr;
-               struct MES_API_STATUS       api_status;
-       };
-
-       uint32_t max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-union MESAPI_AMD_LOG {
-       struct {
-               union MES_API_HEADER        header;
-               uint64_t                    p_buffer_memory;
-               uint64_t                    p_buffer_size_used;
-               struct MES_API_STATUS       api_status;
-       };
-
-       uint32_t max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
-};
-
-#pragma pack(pop)
-#endif
--
2.45.1

