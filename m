Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B79D9616
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Nov 2024 12:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361A110E3EF;
	Tue, 26 Nov 2024 11:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dnLox2CM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D156210E3EF
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Nov 2024 11:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbP/qBlD9Px/9WwkDeGNR1RKG5bhdYihpy8mjSdjQP7Z0XJDhgsG5gk12Gf4x9SMmfPtE921vWq5vgOgp+iXcTKP756/qNYvR83cKYLaRYd/be+dR4S234lYqS7+PI+fZAK3pvBdmDbSZYXg1ZAMa5k5vElacLXiylUmzcdGLX20yl0BnzrE8l0NYMUdYiRsmPHkVjUDEBrroZPGHgf41riySsv3fusJ62fQ/Ck7+bAMjaF/21cElbal+7HmX0XtTp9dV/7ivlFcz8tMgPUKIo1pxGS2/elkPuF1DmUpA4v5k9QtvQemk99nDIPp1PHB5uGGoIKZ0fN9nLtxPdlc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCQgeu6FzlibZVBfD0PaBlGpw0A/+g7LoZzGVUsehdU=;
 b=AaSkevcRPfo8ckNOew/sxoEJ4m8GxTrRSAYbVpy9qJTxq9hf9Q9IEV1FHjZGaWAiiXJhWcCahfSVPT9mPmn7lu/TecrWOzIwDoxQOYmVWYCwgo4X6s8aF3DAqxiinFJnvBIYqYQJ+m5yFOiWPZW3u87iVu9Cl8Fc/NdgUIvkZOd9N6YUjHlQjHgFdsWIjaBDo8WS6SQ2bOGpJXpKimz3vHeIb54H/W0X7oMmwARjDMT1LMZOjX6smQqPos9v23894MSMayt3FUpR4qCZgTDai8Zdl9f3K9QwBl9lpgLVvxa6lx0Kg6UWwXUw9NQKybRZJPcyKry22RD5bUmajhU25w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCQgeu6FzlibZVBfD0PaBlGpw0A/+g7LoZzGVUsehdU=;
 b=dnLox2CM4Hu7Kx0BJ90xzvz+3s/uX2p5f/nt8fZ5irxgwVFUq29Jn1GSgLajGrxXVydnXT8d2X71Lpy4dWQ5sF0KSwC2DZwHpUTE2+xAM9Yvk5w7WqjDYBHkt5RrUesyydHiEXy03B1Lbh+JNgfCeMqI7Vj+VISTUJArX8c8Qso=
Received: from PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 11:19:44 +0000
Received: from PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::c5da:9b53:9d77:c708]) by PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::c5da:9b53:9d77:c708%4]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:19:42 +0000
Content-Type: multipart/mixed;
 boundary="_000_PH7PR12MB599732BB457CBF3A41DC8CFF822F2PH7PR12MB5997namp_"
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Zhao, Victor" <Victor.Zhao@amd.com>, "Zhao, Victor"
 <Victor.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: use sjt mec fw on gfx943 for sriov
Thread-Topic: [PATCH] drm/amdgpu: use sjt mec fw on gfx943 for sriov
Thread-Index: AQHbPa/xm2HmL5pgq0KMwxFQw6O0obLJV2yAgAAXO0A=
Date: Tue, 26 Nov 2024 11:19:42 +0000
Message-ID: <PH7PR12MB599732BB457CBF3A41DC8CFF822F2@PH7PR12MB5997.namprd12.prod.outlook.com>
References: <20241123135920.2593163-1-Victor.Zhao@amd.com>
 <DM6PR12MB43405B502B64827FA574F82EFA2F2@DM6PR12MB4340.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB43405B502B64827FA574F82EFA2F2@DM6PR12MB4340.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <PH7PR12MB599732BB457CBF3A41DC8CFF822F2@PH7PR12MB5997.namprd12.prod.outlook.com>
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=7d3a122c-476b-4ead-80ad-ecd2d6485b22;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-26T09:23:31Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5997:EE_|DS0PR12MB7771:EE_
x-ms-office365-filtering-correlation-id: 3c8ddedf-4763-489e-5af2-08dd0e0c3978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?orx1n9eXMiF1mlwoXfHTC3M6fHJF7CsB2UACEeiouITzhV4XlFA+E/LNoSTm?=
 =?us-ascii?Q?1Wdxsoq557eQmW/Njmrvu0Ccr3bStOMxIf5hbRz047a8uGCtnJZctLWiWAHD?=
 =?us-ascii?Q?gUdifprNtjepJEu7/YISnyOzLfvkdjx7kDxW6mvsKsvH9ai6NNMKNDWBhXfw?=
 =?us-ascii?Q?/QmtH9U7t6YqFZpmz0L519To3vvx6gLXzv/PjQ6AToyL06dBRstyf42pu276?=
 =?us-ascii?Q?J180UvJbMrqG9ojI/CSXqiZ4smWvEWsF014mIoCFChPZmt8s9QmXN18JiH+A?=
 =?us-ascii?Q?PeKM6PLfHZfV2EPDSzGQjWIBQQs7O59wEJaC1lGH1xaaktwwLvpJ8T2Plkph?=
 =?us-ascii?Q?gHGjL8y6A/C6X8Am9N0HT3kKzgxtXRFP1YY+VnabcR+hRF2o/CT/3XlxbzGi?=
 =?us-ascii?Q?yoEIGl0vA8vsa8t/IJQJl0FmKNc+wSfw11PKxJaI9z9z9B7SaOt/py12LlD2?=
 =?us-ascii?Q?SNjstLI9yESd0vIHu3qP7owWoZ1RTS2oiTf1+HE+2sGxILv0uv8UBNFJCMC0?=
 =?us-ascii?Q?LMklNIchuSMhhgKsSszX5+u0v2NzibQxcOK7ueuNCGEioDkd3wSDtmSoqVFp?=
 =?us-ascii?Q?2j9A1kItswGjCWsEyeeHwvklFrOgsA6KaV0ZoMUpL0gRAvkLjHWO6imMgTtI?=
 =?us-ascii?Q?9cZ1M70Wqe6rXmW+BIjaWFwZFnk/Cp7ELo5PyUB0rMgQvX0tidFHYaADjyz/?=
 =?us-ascii?Q?pl9HIsxfhsPH8fYmm69muRVCxittEdirRSswQWccmme8bR/jOMsJFtLrQ70I?=
 =?us-ascii?Q?2rvhPkQ9DLf04AcyW6qwg8gpmmsd05Yn1BGOPZT882KRYTax+rrYa6LcakfZ?=
 =?us-ascii?Q?OLYXjMvtSItqy6qX4brJFRPMb/XtLGuVNMMMolQeBtA/3Qo84v0TUhYE6aN/?=
 =?us-ascii?Q?kVBkUinHNacrDu0S8j2wiQCT7SaGdOpvKCEAL/QbKTOG4ZdCklzgAOKPNU9d?=
 =?us-ascii?Q?ijSQzIrSyJqjPbVnjTzwXL3BqHHN2X3PD2IwIiYJ0yqyaiY0JiJBXCfOrBfJ?=
 =?us-ascii?Q?mUDXWx6+f+aI2J8a8vj+k1lBLxfdzkxa7qAs9KZL02WE99v2J4QqPbrnyBoj?=
 =?us-ascii?Q?281dDgcYoX22PwPIGcRnQ5k+UjshmvVhSOi7AXZpsCZKGpfhn7scfymotXni?=
 =?us-ascii?Q?hbUlgFbTdh1Xt38YZP5MnIxekdD3Et78FwGSEF9Nfymfy/O21XrBsAF6m9HC?=
 =?us-ascii?Q?d3qJsKgav4J8eHyA4HcoTGMY+LpPXeT8lD57ysBDBkD03h3AOvzZX+0qdSxe?=
 =?us-ascii?Q?2SbEqZyvZrT1cSpZ4zzvWbfD+p1a+zgL96xuDYDzTeSwfrvBH14PCR5gGUcK?=
 =?us-ascii?Q?68+WlJq7J2H4l95WvbYIzE0vuoHRRFcJ3juHM9d5Voo4t/sYaieow/9d+5PR?=
 =?us-ascii?Q?Juw0PSU6T+NEuKNBXh5WlS93DMKzwM0oOsGyDKJ7LW19gRCfEg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jlDQvL72BAScwqeHj3vyNs9AqdWYWsC8OzYNECV2DW+wwPJnENiOIZoq4QGa?=
 =?us-ascii?Q?iKqNTHsm58ejhvy2O8Rqa4va3SYRuViQTiUh3N8OVWd8ESvcB+OybG3No9gl?=
 =?us-ascii?Q?HwXfWrMP/lYky4ZP2P3rRvteMDKRYnXp2aEXeI6ayJaAvDtS/mkAC+/E3c6E?=
 =?us-ascii?Q?jIfehcGU+GGXsND2p4jbGcT3mKXWv5+NKVBZT8bnyEXpWYMIlSW5aZXlyWfH?=
 =?us-ascii?Q?aHvkRzrnYaFJl/OsM+q9sE9zYsIQ2YUnvlkAGHuMnJT4CDp3UEtQwhIkVynP?=
 =?us-ascii?Q?ulZQ0yRe82q/NWwAHuLczBtHkoktRWFHdRUQRg2wCCBwZY1za2N+85HCMUIK?=
 =?us-ascii?Q?P1hxUaC6X2ZjPRCB/658NGzcu/qB0kJz+etrf/xZVNUbqdnF4OwUfZqCeS9c?=
 =?us-ascii?Q?oY7F2ZxHDC4dVxvWxMiTmwoV4ashKwnw3P4wcxIfjewSqFs70m0r57GwZ1Zd?=
 =?us-ascii?Q?p5ddLqKLPEwOsIW+gNhDjvyCku0H6rPT8ytZtG+wj5HDNUJuRIfq+Kseku9C?=
 =?us-ascii?Q?GdxM4L2aoU/Ydws45epITDbtb2Jg5km3zz1C87t3MFOLWCQyOLKhhQVUhz6K?=
 =?us-ascii?Q?rfFbi0ZTSKQFI8uoak2JCnMYNOJ5PtaTiKUzBfjGEj0UqkPBOPiq7ue2EA6y?=
 =?us-ascii?Q?wq4GuAm9R+0hArr9b64r73q7iCPLIM6oFLQ8S6dx/5dFieIIDfuD1I8eqGvs?=
 =?us-ascii?Q?VOd48PziHr1LoAlSq1veV4eoTJmLUNG89ZSo+W/J2iO3dYuHPdka4Hi5phKt?=
 =?us-ascii?Q?me4NUWta0vFzIRWmQE5ehrhcAELqIa0OGSgLISo+MJ6v+Xm6iXEGIJYEANRn?=
 =?us-ascii?Q?oHB8Jf7fNqZnTa7ALLRUTQ6PB5/fjO/o+dkgz0p/asqH5raQP1Um/3VjaAYa?=
 =?us-ascii?Q?F/m47eHMOlus2tND6oWFYHMn2ymkd51CGRSVngme72kYzyFSOSmy5v3LUTGQ?=
 =?us-ascii?Q?2v4XiLf09A4mjheaC+uqjs+ttJzn5zFFpTiirzbS1on8JWWiOqEcblVqwZkX?=
 =?us-ascii?Q?Y1yiiL1XiiN7sJbkBQNRZUuIKu6Oc/mb0ljWdu3XQgPE569LyU00SPYxLSb7?=
 =?us-ascii?Q?8/bMx3FHTMO2Z0KJF9LleDx67FuOgK5nJiQURiWxpkQlRYroyWysPzyt04AW?=
 =?us-ascii?Q?mxy2m/UIzqCaLmgItRmi9TI4IEqOv7tFlfr1X2ZNX5ezcX6nFgFjac8yKMvV?=
 =?us-ascii?Q?OGwng8W7P3Wj31galHBzGXUTPQ2hXuzQIo6gwv/wlbnX+lloaY1X61zfQQMs?=
 =?us-ascii?Q?RLA9HJFOFhvUlAJI0k48CXmPU9J9aeKkf5JX1KIxOvjqXYyaGqSxut72pXiq?=
 =?us-ascii?Q?KHz3HcQv1D63heuGpMdPXe3q8Xs4Htz4apr0sooWtoAu4sOwNE7Swh8OfhGP?=
 =?us-ascii?Q?do+dru+cZokM76wgAOj+KVYdityndAUl2mK+KERaQ0WNz62EOrXAhSWibZcv?=
 =?us-ascii?Q?XgH0ypukgTH7rlq6vII6xl9+D2QVVN36dCSV77B2mshPKqBKGjs3dh8bWfPQ?=
 =?us-ascii?Q?tFnNWEOhouQXdlefb+Ow5EwxySJwvNbb/jA097O9XDkxJ/mbMPElqTbIU6Q7?=
 =?us-ascii?Q?pcqVRWeUjrnjXRF4q00=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8ddedf-4763-489e-5af2-08dd0e0c3978
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 11:19:42.2573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQ6pMlBN34DfikASDj/oNOqmSc6JsSdjn7Vh0/MMfdDWW2zddwBHVMgq6IIvXSUG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771
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

--_000_PH7PR12MB599732BB457CBF3A41DC8CFF822F2PH7PR12MB5997namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Reviewed-by: Yang Wang <kevinyang.wang@amd.com>

Best Regards,
Kevin

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Zhao, Vi=
ctor
Sent: Tuesday, November 26, 2024 17:56
To: Zhao, Victor <Victor.Zhao@amd.com>; amd-gfx@lists.freedesktop.org
Subject: RE: [PATCH] drm/amdgpu: use sjt mec fw on gfx943 for sriov

[AMD Official Use Only - AMD Internal Distribution Only]

[AMD Official Use Only - AMD Internal Distribution Only]

Ping. Please help review.

-----Original Message-----
From: Victor Zhao <Victor.Zhao@amd.com>
Sent: Saturday, November 23, 2024 9:59 PM
To: amd-gfx@lists.freedesktop.org
Cc: Zhao, Victor <Victor.Zhao@amd.com>
Subject: [PATCH] drm/amdgpu: use sjt mec fw on gfx943 for sriov

Use second jump table in sriov for live migration or mulitple VF support so=
 different VF can load different version of MEC as long as they support sjt

Signed-off-by: Victor Zhao <Victor.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_4_3.c
index f23df55d72fd..58541b93580a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -45,6 +45,8 @@ MODULE_FIRMWARE("amdgpu/gc_9_4_3_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_9_4_4_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_9_4_3_rlc.bin");
 MODULE_FIRMWARE("amdgpu/gc_9_4_4_rlc.bin");
+MODULE_FIRMWARE("amdgpu/gc_9_4_3_sjt_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_9_4_4_sjt_mec.bin");

 #define GFX9_MEC_HPD_SIZE 4096
 #define RLCG_UCODE_LOADING_START_ADDRESS 0x00002000L @@ -574,8 +576,12 @@ =
static int gfx_v9_4_3_init_cp_compute_microcode(struct amdgpu_device *adev,=
  {
        int err;

-       err =3D amdgpu_ucode_request(adev, &adev->gfx.mec_fw,
-                                  "amdgpu/%s_mec.bin", chip_name);
+       if (amdgpu_sriov_vf(adev))
+               err =3D amdgpu_ucode_request(adev, &adev->gfx.mec_fw,
+                               "amdgpu/%s_sjt_mec.bin", chip_name);
+       else
+               err =3D amdgpu_ucode_request(adev, &adev->gfx.mec_fw,
+                               "amdgpu/%s_mec.bin", chip_name);
        if (err)
                goto out;
        amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
--
2.34.1


--_000_PH7PR12MB599732BB457CBF3A41DC8CFF822F2PH7PR12MB5997namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
gMU+owVtoqFBoPOh+KP0UUTBR1BVm7VJmcBDGlCZUjGNdy3HMi4zPDQuAFAlOxVCz+AAAAAfAEIA
AQAAACQAAABXAGEAbgBnACwAIABZAGEAbgBnACgASwBlAHYAaQBuACkAAAAfAGUAAQAAAC4AAABL
AGUAdgBpAG4AWQBhAG4AZwAuAFcAYQBuAGcAQABhAG0AZAAuAGMAbwBtAAAAAAAfAGQAAQAAAAoA
AABTAE0AVABQAAAAAAACAUEAAQAAAHQAAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIBXAGEAbgBn
ACwAIABZAGEAbgBnACgASwBlAHYAaQBuACkAAABTAE0AVABQAAAASwBlAHYAaQBuAFkAYQBuAGcA
LgBXAGEAbgBnAEAAYQBtAGQALgBjAG8AbQAAAB8AAl0BAAAALgAAAEsAZQB2AGkAbgBZAGEAbgBn
AC4AVwBhAG4AZwBAAGEAbQBkAC4AYwBvAG0AAAAAAB8A5V8BAAAAJAAAAHMAaQBwADoAawBlAHYA
dwBhAEAAYQBtAGQALgBjAG8AbQAAAAIBLgwBAAAAEAAAAG6K0sem+vtMk1+FnUTptA8fABoMAQAA
ACQAAABXAGEAbgBnACwAIABZAGEAbgBnACgASwBlAHYAaQBuACkAAAAfAB8MAQAAAC4AAABLAGUA
dgBpAG4AWQBhAG4AZwAuAFcAYQBuAGcAQABhAG0AZAAuAGMAbwBtAAAAAAAfAB4MAQAAAAoAAABT
AE0AVABQAAAAAAACARkMAQAAAHQAAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIBXAGEAbgBnACwA
IABZAGEAbgBnACgASwBlAHYAaQBuACkAAABTAE0AVABQAAAASwBlAHYAaQBuAFkAYQBuAGcALgBX
AGEAbgBnAEAAYQBtAGQALgBjAG8AbQAAAB8AAV0BAAAALgAAAEsAZQB2AGkAbgBZAGEAbgBnAC4A
VwBhAG4AZwBAAGEAbQBkAC4AYwBvAG0AAAAAAAIBLQwBAAAAEAAAAG6K0sem+vtMk1+FnUTptA8L
AEA6AQAAAB8AGgABAAAAEgAAAEkAUABNAC4ATgBvAHQAZQAAAAAAAwDxPwkEAAALAEA6AQAAAAMA
/T/kBAAAAgELMAEAAAAQAAAAsSUIqJ0sQUeka5cCBN/HBQMAFwABAAAAQAA5AACb0hb1P9sBQAAI
MEXl9hb1P9sBCwAjAAAAAAALACkAAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAQAAADIAAABFAHgA
YwBoAGEAbgBnAGUAQQBwAHAAbABpAGMAYQB0AGkAbwBuAEYAbABhAGcAcwAAAAAAIAAAAB8AAICG
AwIAAAAAAMAAAAAAAABGAQAAAB4AAABhAGMAYwBlAHAAdABsAGEAbgBnAHUAYQBnAGUAAAAAAAEA
AAAaAAAAZQBuAC0AVQBTACwAIAB6AGgALQBDAE4AAAAAAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAA
ABSFAAAAAAAAHwAAgBOP8kH0gxRBpYTu21prC/8BAAAAFgAAAEMAbABpAGUAbgB0AEkAbgBmAG8A
AAAAAAEAAAAqAAAAQwBsAGkAZQBuAHQAPQBNAFMARQB4AGMAaABhAG4AZwBlAFIAUABDAAAAAABI
AACAa8U/QDDNxUeG+O3p41oCKwEAAAAcAAAATQBTAEkAUABMAGEAYgBlAGwARwB1AGkAZAAAAP5i
49xYFbVPn2SKYkDXZEEfAACAhgMCAAAAAADAAAAAAAAARgEAAAAYAAAAbQBzAGkAcABfAGwAYQBi
AGUAbABzAAAAAQAAAC4EAABNAFMASQBQAF8ATABhAGIAZQBsAF8AZABjAGUAMwA2ADIAZgBlAC0A
MQA1ADUAOAAtADQAZgBiADUALQA5AGYANgA0AC0AOABhADYAMgA0ADAAZAA3ADYANAA0ADEAXwBB
AGMAdABpAG8AbgBJAGQAPQA3AGQAMwBhADEAMgAyAGMALQA0ADcANgBiAC0ANABlAGEAZAAtADgA
MABhAGQALQBlAGMAZAAyAGQANgA0ADgANQBiADIAMgA7AE0AUwBJAFAAXwBMAGEAYgBlAGwAXwBk
AGMAZQAzADYAMgBmAGUALQAxADUANQA4AC0ANABmAGIANQAtADkAZgA2ADQALQA4AGEANgAyADQA
MABkADcANgA0ADQAMQBfAEMAbwBuAHQAZQBuAHQAQgBpAHQAcwA9ADAAOwBNAFMASQBQAF8ATABh
AGIAZQBsAF8AZABjAGUAMwA2ADIAZgBlAC0AMQA1ADUAOAAtADQAZgBiADUALQA5AGYANgA0AC0A
OABhADYAMgA0ADAAZAA3ADYANAA0ADEAXwBFAG4AYQBiAGwAZQBkAD0AdAByAHUAZQA7AE0AUwBJ
AFAAXwBMAGEAYgBlAGwAXwBkAGMAZQAzADYAMgBmAGUALQAxADUANQA4AC0ANABmAGIANQAtADkA
ZgA2ADQALQA4AGEANgAyADQAMABkADcANgA0ADQAMQBfAE0AZQB0AGgAbwBkAD0AUwB0AGEAbgBk
AGEAcgBkADsATQBTAEkAUABfAEwAYQBiAGUAbABfAGQAYwBlADMANgAyAGYAZQAtADEANQA1ADgA
LQA0AGYAYgA1AC0AOQBmADYANAAtADgAYQA2ADIANAAwAGQANwA2ADQANAAxAF8ATgBhAG0AZQA9
AEEATQBEACAASQBuAHQAZQByAG4AYQBsACAARABpAHMAdAByAGkAYgB1AHQAaQBvAG4AIABPAG4A
bAB5ADsATQBTAEkAUABfAEwAYQBiAGUAbABfAGQAYwBlADMANgAyAGYAZQAtADEANQA1ADgALQA0
AGYAYgA1AC0AOQBmADYANAAtADgAYQA2ADIANAAwAGQANwA2ADQANAAxAF8AUwBlAHQARABhAHQA
ZQA9ADIAMAAyADQALQAxADEALQAyADYAVAAwADkAOgAyADMAOgAzADEAWgA7AE0AUwBJAFAAXwBM
AGEAYgBlAGwAXwBkAGMAZQAzADYAMgBmAGUALQAxADUANQA4AC0ANABmAGIANQAtADkAZgA2ADQA
LQA4AGEANgAyADQAMABkADcANgA0ADQAMQBfAFMAaQB0AGUASQBkAD0AMwBkAGQAOAA5ADYAMQBm
AC0AZQA0ADgAOAAtADQAZQA2ADAALQA4AGUAMQAxAC0AYQA4ADIAZAA5ADkANABlADEAOAAzAGQA
OwAAAAAASAAAgAggBgAAAAAAwAAAAAAAAEYBAAAAIgAAAE4AZQB0AHcAbwByAGsATQBlAHMAcwBh
AGcAZQBJAGQAAAAAAN/ejTxjR55IWvII3Q4MOXgDADYAAAAAAB8ANwABAAAAdgAAAFIARQA6ACAA
WwBQAEEAVABDAEgAXQAgAGQAcgBtAC8AYQBtAGQAZwBwAHUAOgAgAHUAcwBlACAAcwBqAHQAIABt
AGUAYwAgAGYAdwAgAG8AbgAgAGcAZgB4ADkANAAzACAAZgBvAHIAIABzAHIAaQBvAHYAAAAAAB8A
PQABAAAACgAAAFIARQA6ACAAAAAAAEAABzBpJr4W9T/bAQsAAIAIIAYAAAAAAMAAAAAAAABGAAAA
AAOFAAAAAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAAYUAAAAAAAAfAHAAAQAAAG4AAABbAFAA
QQBUAEMASABdACAAZAByAG0ALwBhAG0AZABnAHAAdQA6ACAAdQBzAGUAIABzAGoAdAAgAG0AZQBj
ACAAZgB3ACAAbwBuACAAZwBmAHgAOQA0ADMAIABmAG8AcgAgAHMAcgBpAG8AdgAAAAAAAgFxAAEA
AAAgAAAAAQHbPa/xm2HmL5pgq0KMwxFQw6O0obLJV2yAgAAXO0ACAQCAE4/yQfSDFEGlhO7bWmsL
/wEAAABAAAAAQwBvAG4AdgBlAHIAcwBhAHQAaQBvAG4AVAByAGUAZQBQAGEAcgBlAG4AdABSAGUA
YwBvAHIAZABLAGUAeQAAAAEAAAAuAAAAAAAAANQ7YodzFRNCrLJTZECaWwkBAID7rk8go/dJuHiA
XGImrxsABpcCTwEAAAAACwAAgBOP8kH0gxRBpYTu21prC/8BAAAAHAAAAEgAYQBzAFEAdQBvAHQA
ZQBkAFQAZQB4AHQAAAABAAAAAwCAEP////8DABMSAAAAAB8AQhABAAAAogAAADwARABNADYAUABS
ADEAMgBNAEIANAAzADQAMAA1AEIANQAwADIAQgA2ADQAOAAyADcARgBBADUANwA0AEYAOAAyAEUA
RgBBADIARgAyAEAARABNADYAUABSADEAMgBNAEIANAAzADQAMAAuAG4AYQBtAHAAcgBkADEAMgAu
AHAAcgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0APgAAAAAAAwDeP59OAAAfADUQAQAAAKIA
AAA8AFAASAA3AFAAUgAxADIATQBCADUAOQA5ADcAMwAyAEIAQgA0ADUANwBDAEIARgAzAEEANAAx
AEQAQwA4AEMARgBGADgAMgAyAEYAMgBAAFAASAA3AFAAUgAxADIATQBCADUAOQA5ADcALgBuAGEA
bQBwAHIAZAAxADIALgBwAHIAbwBkAC4AbwB1AHQAbABvAG8AawAuAGMAbwBtAD4AAAAAAB8AORAB
AAAAAAEAADwAMgAwADIANAAxADEAMgAzADEAMwA1ADkAMgAwAC4AMgA1ADkAMwAxADYAMwAtADEA
LQBWAGkAYwB0AG8AcgAuAFoAaABhAG8AQABhAG0AZAAuAGMAbwBtAD4AIAA8AEQATQA2AFAAUgAx
ADIATQBCADQAMwA0ADAANQBCADUAMAAyAEIANgA0ADgAMgA3AEYAQQA1ADcANABGADgAMgBFAEYA
QQAyAEYAMgBAAEQATQA2AFAAUgAxADIATQBCADQAMwA0ADAALgBuAGEAbQBwAHIAZAAxADIALgBw
AHIAbwBkAC4AbwB1AHQAbABvAG8AawAuAGMAbwBtAD4AAAALAACAE4/yQfSDFEGlhO7bWmsL/wEA
AAAoAAAASQBzAFEAdQBvAHQAZQBkAFQAZQB4AHQAQwBoAGEAbgBnAGUAZAAAAAAAAAAfAPo/AQAA
ACQAAABXAGEAbgBnACwAIABZAGEAbgBnACgASwBlAHYAaQBuACkAAAACAQCAE4/yQfSDFEGlhO7b
WmsL/wEAAAAuAAAASABlAGEAZABlAHIAQgBvAGQAeQBGAHIAYQBnAG0AZQBuAHQATABpAHMAdAAA
AAAAAQAAAEoAAAABAAoAAAAEAAAAAgAAABQAAAAAAAAAAAAAAEsAAAAAAAAAFAAAAAAAAABsAQAA
AwIAAAAAAAAUAAAAAAAAAP8CAAD/////AAAAAAAAAwAuAAAAAAAfANk/AQAAAAACAABSAGUAdgBp
AGUAdwBlAGQALQBiAHkAOgAgAFkAYQBuAGcAIABXAGEAbgBnACAAPABrAGUAdgBpAG4AeQBhAG4A
ZwAuAHcAYQBuAGcAQABhAG0AZAAuAGMAbwBtAD4ADQAKAA0ACgBCAGUAcwB0ACAAUgBlAGcAYQBy
AGQAcwAsAA0ACgBLAGUAdgBpAG4ADQAKAA0ACgAtAC0ALQAtAC0ATwByAGkAZwBpAG4AYQBsACAA
TQBlAHMAcwBhAGcAZQAtAC0ALQAtAC0ADQAKAEYAcgBvAG0AOgAgAGEAbQBkAC0AZwBmAHgAIAA8
AGEAbQBkAC0AZwBmAHgALQBiAG8AdQBuAGMAZQBzAEAAbABpAHMAdABzAC4AZgByAGUAZQBkAGUA
cwBrAHQAbwBwAC4AbwByAGcAPgAgAE8AbgAgAEIAZQBoAGEAbABmACAATwBmACAAWgBoAGEAbwAs
ACAAVgBpAGMAdABvAHIADQAKAFMAZQBuAHQAOgAgAFQAdQBlAHMAZABhAHkALAAgAE4AbwB2AGUA
bQBiAGUAcgAgADIANgAsACAAMgAwADIANAAgADEANwA6ADUANgANAAoAVABvADoAIABaAGgAYQBv
ACwAIABWAGkAYwB0AG8AcgAgADwAVgBpAGMAdABvAHIALgBaAGgAYQBvAEAAYQAAAAsAAIAIIAYA
AAAAAMAAAAAAAABGAAAAAAaFAAAAAAAACwACAAEAAAADACYAAAAAAAsAKwAAAAAACwAGDAAAAAAC
ARAwAQAAAEYAAAAAAAAA1Dtih3MVE0KsslNkQJpbCQcAgPuuTyCj90m4eIBcYiavGwAAAAABCwAA
gPuuTyCj90m4eIBcYiavGwAFQKPA1QAAAAACARMwAQAAABAAAACbYeYvmmCrQozDEVDDo7ShAgEU
MAEAAAAMAAAAwAAAAFkWkDFSAAAAAwBbMwEAAAADAFo2AAAAAAMAaDYNAAAACwD6NgEAAAAfAPg/
AQAAACQAAABXAGEAbgBnACwAIABZAGEAbgBnACgASwBlAHYAaQBuACkAAAAfACJAAQAAAAYAAABF
AFgAAAAAAB8AI0ABAAAAAgEAAC8ATwA9AEUAWABDAEgAQQBOAEcARQBMAEEAQgBTAC8ATwBVAD0A
RQBYAEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkAUwBUAFIAQQBUAEkAVgBFACAARwBSAE8AVQBQ
ACAAKABGAFkARABJAEIATwBIAEYAMgAzAFMAUABEAEwAVAApAC8AQwBOAD0AUgBFAEMASQBQAEkA
RQBOAFQAUwAvAEMATgA9AEEAMwA3ADcARAA4ADIAOQBCADEARQAzADQAQQA1ADEAOABBADMANQA1
AEEANABFAEYAMwA3ADAAMABFADUANgAtAFcAQQBOAEcALAAgAEsARQBWAEkATgAAAAAAHwAkQAEA
AAAGAAAARQBYAAAAAAAfACVAAQAAAAIBAAAvAE8APQBFAFgAQwBIAEEATgBHAEUATABBAEIAUwAv
AE8AVQA9AEUAWABDAEgAQQBOAEcARQAgAEEARABNAEkATgBJAFMAVABSAEEAVABJAFYARQAgAEcA
UgBPAFUAUAAgACgARgBZAEQASQBCAE8ASABGADIAMwBTAFAARABMAFQAKQAvAEMATgA9AFIARQBD
AEkAUABJAEUATgBUAFMALwBDAE4APQBBADMANwA3AEQAOAAyADkAQgAxAEUAMwA0AEEANQAxADgA
QQAzADUANQBBADQARQBGADMANwAwADAARQA1ADYALQBXAEEATgBHACwAIABLAEUAVgBJAE4AAAAA
AB8AMEABAAAAJAAAAFcAYQBuAGcALAAgAFkAYQBuAGcAKABLAGUAdgBpAG4AKQAAAB8AMUABAAAA
JAAAAFcAYQBuAGcALAAgAFkAYQBuAGcAKABLAGUAdgBpAG4AKQAAAB8AOEABAAAAJAAAAFcAYQBu
AGcALAAgAFkAYQBuAGcAKABLAGUAdgBpAG4AKQAAAB8AOUABAAAAJAAAAFcAYQBuAGcALAAgAFkA
YQBuAGcAKABLAGUAdgBpAG4AKQAAAAMAWUAAAAAAAwBaQAAAAAADADdQAQAAAAMACVkBAAAAHwAK
XQEAAAAuAAAASwBlAHYAaQBuAFkAYQBuAGcALgBXAGEAbgBnAEAAYQBtAGQALgBjAG8AbQAAAAAA
HwALXQEAAAAuAAAASwBlAHYAaQBuAFkAYQBuAGcALgBXAGEAbgBnAEAAYQBtAGQALgBjAG8AbQAA
AAAAAgEVXQEAAAASAAAAAh+W2D2I5GBOjhGoLZlOGD0BAAACARZdAQAAABIAAAACH5bYPYjkYE6O
EagtmU4YPQEAAB8AAIAfpOszqHouQr57eeGpjlSzAQAAADgAAABDAG8AbgB2AGUAcgBzAGEAdABp
AG8AbgBJAG4AZABlAHgAVAByAGEAYwBrAGkAbgBnAEUAeAAAAAEAAAAcAgAASQBJAD0AWwBDAEkA
RAA9ADIAZgBlADYANgAxADkAYgAtADYAMAA5AGEALQA0ADIAYQBiAC0AOABjAGMAMwAtADEAMQA1
ADAAYwAzAGEAMwBiADQAYQAxADsASQBEAFgASABFAEEARAA9ADAAMQBEAEIAMwBEAEEARgBGADEA
OwBJAEQAWABDAE8AVQBOAFQAPQAzAF0AOwBTAEIATQBJAEQAPQA0ADsAUwAxAD0APABEAE0ANgBQ
AFIAMQAyAE0AQgA0ADMANAAwADUAQgA1ADAAMgBCADYANAA4ADIANwBGAEEANQA3ADQARgA4ADIA
RQBGAEEAMgBGADIAQABEAE0ANgBQAFIAMQAyAE0AQgA0ADMANAAwAC4AbgBhAG0AcAByAGQAMQAy
AC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA+ADsAUgBUAFAAPQBEAGkAcgBlAGMA
dABDAGgAaQBsAGQAOwBUAEYAUgA9AFQAaAByAGUAYQBkAEYAbwByAGsAaQBuAGcASQBzAEQAaQBz
AGEAYgBsAGUAZAA7AFYAZQByAHMAaQBvAG4APQBWAGUAcgBzAGkAbwBuACAAMQA1AC4AMgAwACAA
KABCAHUAaQBsAGQAIAA4ADEAOAAyAC4AMAApACwAIABTAHQAYQBnAGUAPQBIADEAOwBVAFAAPQAx
ADAAOwBEAFAAPQAxAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAADAACACCAGAAAA
AADAAAAAAAAARgAAAAAYhQAAAAAAAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAHwAA
gAggBgAAAAAAwAAAAAAAAEYAAAAA2IUAAAEAAAASAAAASQBQAE0ALgBOAG8AdABlAAAAAAALAACA
CCAGAAAAAADAAAAAAAAARgAAAACChQAAAAAAAAMAAIBQ42MLzJzQEbzbAIBfzM4EAQAAACQAAABJ
AG4AZABlAHgAaQBuAGcARQByAHIAbwByAEMAbwBkAGUAAAAbAAAAHwAAgFDjYwvMnNARvNsAgF/M
zgQBAAAAKgAAAEkAbgBkAGUAeABpAG4AZwBFAHIAcgBvAHIATQBlAHMAcwBhAGcAZQAAAAAAAQAA
AHAAAABJAG4AZABlAHgAaQBuAGcAIABQAGUAbgBkAGkAbgBnACAAdwBoAGkAbABlACAAQgBpAGcA
RgB1AG4AbgBlAGwAUABPAEkASQBzAFUAcABUAG8ARABhAHQAZQAgAGkAcwAgAGYAYQBsAHMAZQAu
AAAACwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJgAAAEkAcwBQAGUAcgBtAGEAbgBlAG4AdABGAGEA
aQBsAHUAcgBlAAAAAAAAAAAAAgEAgAggBgAAAAAAwAAAAAAAAEYBAAAANgAAAEkAbgBUAHIAYQBu
AHMAaQB0AE0AZQBzAHMAYQBnAGUAQwBvAHIAcgBlAGwAYQB0AG8AcgAAAAAAAQAAABAAAAB/aabQ
A5ymTpeeEAlangBHAwANNAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAuAAAAYQB1AHQAaABl
AG4AdABpAGMAYQB0AGkAbwBuAC0AcgBlAHMAdQBsAHQAcwAAAAAAAQAAALIAAABkAGsAaQBtAD0A
bgBvAG4AZQAgACgAbQBlAHMAcwBhAGcAZQAgAG4AbwB0ACAAcwBpAGcAbgBlAGQAKQAgAGgAZQBh
AGQAZQByAC4AZAA9AG4AbwBuAGUAOwBkAG0AYQByAGMAPQBuAG8AbgBlACAAYQBjAHQAaQBvAG4A
PQBuAG8AbgBlACAAaABlAGEAZABlAHIALgBmAHIAbwBtAD0AYQBtAGQALgBjAG8AbQA7AAAAAAAf
AACAhgMCAAAAAADAAAAAAAAARgEAAAAgAAAAeAAtAG0AcwAtAGgAYQBzAC0AYQB0AHQAYQBjAGgA
AAABAAAAAgAAAAAAAAAfAACAa8U/QDDNxUeG+O3p41oCKwEAAAASAAAATQBJAFAATABhAGIAZQBs
AAAAAAABAAAA+gEAAFsAewAiAGkAZAAiADoAIgBkAGMAZQAzADYAMgBmAGUALQAxADUANQA4AC0A
NABmAGIANQAtADkAZgA2ADQALQA4AGEANgAyADQAMABkADcANgA0ADQAMQAiACwAIgB0AGkAIgA6
ACIAMwBkAGQAOAA5ADYAMQBmAC0AZQA0ADgAOAAtADQAZQA2ADAALQA4AGUAMQAxAC0AYQA4ADIA
ZAA5ADkANABlADEAOAAzAGQAIgAsACIAcABpACIAOgAiADAAMAAwADAAMAAwADAAMAAtADAAMAAw
ADAALQAwADAAMAAwAC0AMAAwADAAMAAtADAAMAAwADAAMAAwADAAMAAwADAAMAAwACIALAAiAG4A
bQAiADoAIgBBAE0ARAAgAEkAbgB0AGUAcgBuAGEAbAAgAEQAaQBzAHQAcgBpAGIAdQB0AGkAbwBu
ACAATwBuAGwAeQAiACwAIgBhAGMAIgA6ADAALAAiAG8AcAAiADoAMQAsACIAYwB0ACIAOgAiADIA
MAAyADQALQAxADEALQAyADYAVAAwADkAOgAyADMAOgAzADEAWgAiACwAIgBtAHQAIgA6ACIAMAAw
ADAAMQAtADAAMQAtADAAMQBUADAAMAA6ADAAMAA6ADAAMAAiACwAIgB1AGMAIgA6AG4AdQBsAGwA
fQBdAAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAuAAAAeAAtAG0AcwAtAHAAdQBiAGwAaQBj
AHQAcgBhAGYAZgBpAGMAdAB5AHAAZQAAAAAAAQAAAAwAAABFAG0AYQBpAGwAAAAfAACAhgMCAAAA
AADAAAAAAAAARgEAAAA2AAAAeAAtAG0AcwAtAHQAcgBhAGYAZgBpAGMAdAB5AHAAZQBkAGkAYQBn
AG4AbwBzAHQAaQBjAAAAAAABAAAASAAAAFAASAA3AFAAUgAxADIATQBCADUAOQA5ADcAOgBFAEUA
XwB8AEQAUwAwAFAAUgAxADIATQBCADcANwA3ADEAOgBFAEUAXwAAAB8AAICGAwIAAAAAAMAAAAAA
AABGAQAAAFAAAAB4AC0AbQBzAC0AbwBmAGYAaQBjAGUAMwA2ADUALQBmAGkAbAB0AGUAcgBpAG4A
ZwAtAGMAbwByAHIAZQBsAGEAdABpAG8AbgAtAGkAZAAAAAEAAABKAAAAMwBjADgAZABkAGUAZABm
AC0ANAA3ADYAMwAtADQAOAA5AGUALQA1AGEAZgAyAC0AMAA4AGQAZAAwAGUAMABjADMAOQA3ADgA
AAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBl
AC0AcwBlAG4AZABlAHIAYQBkAGMAaABlAGMAawAAAAEAAAAEAAAAMQAAAB8AAICGAwIAAAAAAMAA
AAAAAABGAQAAADoAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBlAC0AYQBuAHQAaQBzAHAAYQBt
AC0AcgBlAGwAYQB5AAAAAAABAAAABAAAADAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAqAAAA
eAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAAAAAAABAAAAiAAAAEIAQwBM
ADoAMAA7AEEAUgBBADoAMQAzADIAMwAwADAANAAwAHwAMwA3ADYAMAAxADQAfAAxADgAMAAwADcA
OQA5ADAAMgA0AHwAMwA2ADYAMAAxADYAfAA3ADAANQAzADEAOQA5ADAAMAA3AHwAMwA4ADAANwAw
ADcAMAAwADAAMQA4ADsAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABEAAAAeAAtAG0AaQBjAHIA
bwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQAtAGkAbgBmAG8AAAAB
AAAAMgsAAG8AcgB4ADEAbgA5AGUAWABNAGkARgAxAG0AbAB3AG8AWABmAEgAVABDADMATQA2AGYA
SABKAEYANwBDAHMAQgAyAFUAQQBDAEUAZQBpAG8AdQBJAFQAegBoAFYANABYAGwARgBBACsARQAv
AEwATgBvAFMAVABtADEAVwBkAHgAcwBvAHEANQA1ADcAZQBRAG0AVwAvAE4AagBtAHIAdgB1ADAA
QwBjAHIAMwBiAFMAdABPAE0AeABJAGYANQBoAGIAUgB6ADAANAA3AGEAOAB1AEcAQwB0AG4ASgBa
AGMAdABMAFcAaQBXAEEASABEAGcAVQBkAGkAZgBwAHIATgB0AGoAZQBwAEoARQB1ADcALwBZAEkA
UwBuAHkATwB6AEwAZgB2AGsAZABqAHgANwBrAEQAeABXADYAbQB2AHMASwBzAHYASAA5AGEAaQA2
AE4ATgBNAEsATgBEAFcAQgBoAFgAZgB3AC8AUQBtAHQASAA5AFUANwB0ADYAWQBxAEYAWgBwAG0A
egAwAEwANQAxADkAVABvADMAdgB2AHgANgBnAEwAWAB6AHYALwBQAGoAUQA2AEEAVABvAHkATAAw
ADYAZABCAFIAcwB0AHkAZgA0ADIAcAB1ADIANwA2AEoAMQA4ADAAVQB2AEoAYgBNAHIAcQBHADkA
bwBqAEkALwBDAFMAWABxAGkAWgA0AHMAbQBXAHYARQBXAHMARgAwADEANABtAEkAbwBDAEYAQwBo
AFAAWgBtAHQAOABzADkAUQBtAFgATgAxADgASgBpAEgAKwBBAFAAZQBLAE0ANgBQAEwAZgBIAFoA
ZgBWADIARQBQAEQAUwB6AEcAUQBqAFcASQBCAFEAUQBzADcATwA1ADkAdwBFAEoAYQBDADEAbABH
AEgAMQB4AGEAYQBrAHQAdwB3AEwAdgBwAEoAOABUADIAUABsAGsAcABoAGcASABHAGoATAA4AHkA
NgBBAC8AQwA2AFgAOABBAG0AOQBOADAASABUADMAawBLAHoAZwB4AHQAWABSAEYAUAAxAFkAWQAr
AFYAbgBhAGIAYwBSACsAaABSAEYAMgBvAC8AQwBUAC8AMwBYAGwAeABiAHoARwBpAHkAbwBFAEkA
RwBsADAAdgBBADgAdgBzAGEAOAB0AC8ASQBKAFEASgBsADAARgBtAEsATgBjACsAdwBTAGYAdwAx
ADEAUABLAHgASgBhAEkAOQB6ADkAegA5AEIANwBTAGEATwB0AC8AcAB5ADEAMgBMAGwARAAyAFMA
TgBqAHMAdABMAEkAOQB5AEUAUwBkADAAdgBJAEgAdQAzAHEAUAA3AG8AdwBXAG8AWgAxAFIAVABT
ADIAbwBpAFQAZgAxACsASABFACsAMgBzAEcAeABJAEwAdgAwAHUAdgA4AFUAQgBOAEYASgBDAE0A
QwAwAEwATQBrAGwATgBJAGMAaAB1AFMATQBoAGgAZwBLAHMAUwBzAHoAWAA1ACsAdQAwAHYAMgBO
AHoAaQBiAFEAeABjAE8ASwA3AHUAZQB1AE4AQwBHAEUAaQBvAEQAawBkADMAdwBTAEQAdABtAFMA
bwBxAFYARgBwADIAagA5AEEAMQBrAEkAdABzAHcARwBqAEMAVwBzAEUAeQBlAGUASAB3AHYAawBs
AEYAcgBPAGcAcwBBADYASwBhAFYAMABaAG8ATQBVAHAATAAwAGcAUgBBAHYAawBMAGoASABXAE8A
NgBpAG0ATQBnAFQAdABJADkAYwBaADEATQA3ADAAVwBxAGUANgByAFgAbQBXACsAQgBJAGoAYQBX
AEYAdwBaAEYAbgBrAC8AQwBwADcARQBMAG8ANQBQAHkAVQBCADAAcgBNAGcAUQB2AFgAMAB0AGkA
ZABGAEgAWQBhAEEARABqAHkAegAvAHAAbAA5AEgASQBzAHgAZgBoAHMAUABIADgAZgBZAG0AbQA2
ADkAbQB1AFIAVgBDAHgAaQB0AHQARQBkAGkAcgBSAFMAcwB3AFEAVwBjAGMAbQBtAGUAOABiAFIA
LwBqAE8ATQBzAEoARgB0AEwAcgBRADcAMABJADIAcgB2AGgAUABrAFEAOQBEAEwAZgAwADQAQQBj
AHkAVwA2AHEAdwBnADgAZwBwAG0AbQBzAGQAMAA1AFkAbgAxAEIARwBPAFAAWgBUADgAOAAyAEsA
UgBZAFQAYQB4ACsAcgByAFkAYQA2AEwAYwBhAGsAZgBaAE8ATABZAFgAagBNAHYAdABTAEkAdABx
AHkANgBxAFgANABiAHIASgBGAFIAUABNAGIALwBYAHQATABHAHUAVgBOAE0ATQBNAG8AbABRAGUA
QgB0AEEALwAzAFEAbwA4ADQAdgAwAFQAVQBoAFkARQA2AGEATgAvAGsAVgBCAGsAVQBpAG4ASABO
AGEAYwByAEQAdQAwAFMAOABqADIAdwBpAFEAQwBUADcAUwBhAEcAZABPAHAAdgBLAEMARQBBAEwA
LwBRAGIASwBUAE8ARwA0AFoAZABDAGsAbAB6AGcAQQBPAEsAUABOAFUAOQBkAGkAagBTAFEAegBJ
AHIAUwB5AEoAcQBqAFAAYgBWAG4AagBUAHoAdwBYAEwAMwBCAHEASABIAE4AMgBYADMAUABEADIA
SQB3AEkAaQBZAEoAMAB5AHEAeQBhAGkAWQAwAEoAaQBKAEIAWABDAGYATwByAEIAZgBKAG0AVQBE
AFgAVwB4ADYAKwBmACsAYQBJADIASgA4AGEAOAB2AGoAKwBrADEAbABCAEwAeABmAGQAegBrAHgA
YQA3AHEAQQBzADkASwBaAEwAMAAyAFcARQA5ADkAdgAyAEoANABRAHEAUABiAHIAbgB5AEIAbwBq
ADIAOAAxAGQARABnAGMAWQBvAFgAMgAyAFAAdwBQAEkARwBjAFIAbgBRADUAawArAFUAagBzAGgA
bQB2AFYAaABTAE8AaQA3AEEAWABaAHAAcwBDAFoASwBHAHAAZgBoAG4ANwBzAGMAZgB5AG0AbwB0
AFgAbgBpAGgAYgBVAGwAZwBGAGIAVABkAGgAMQBYAHQAMwA4AFkAWgBQADUATQBuAEkAeABlAGsA
ZABEADMARQB0ADcAOABGAHcARwBTAEUARgA5AE4AZgB5AG0AZgB5AC8ATwAyADEAWAByAEIAcwBB
AEYANgBtADkASABDAGQAMwBxAEoAcwBLAGcAYQB2ADQASgA4AGUASAB5AEEANABIAGMAbwBUAEcA
TQBZACsATABwAFAAWABlAFQAOABsAEQANQA3AHkAcwBCAEQAQgBrAEQAMAAzAGgAMwBBAE8AdgB6
AFoAWAArADAAcQBkAFMAeABlADIAUwBiAEUAcQBaAHkAdgBaAHIAVAAxAGMAUwBwAFoANAB6AHoA
dgBXAGIAZgBEACsAcAAxAGEAKwB6AGcATAA5ADYAeAB1AEQAWQBEAHoAVABlAFMAdwBmAHIAdgBC
AEgAMQA0AFAAQwBSADUAZwBHAFUAYwBLADYAOAArAFcAbABKAHEANwBKADIASAA0AGwAOQA1AFcA
dgBiAFkASQB6AEUAMAB2AHUAbwBIAFIAUgBGAGMASgAzAGoAdQBIAE0AOQBkADUAVgBvAG8ANAB0
AC8AcwBZAGEAaQBlAG8AdwAvADkAZAArADUAUABSAEoAdQB3ADAAUABTAFUANgBUACsATgBFAHUA
SwBOAEIAWABoADUAVwBsAFMAOQAzAEQATQBLAHoAdwBNADAAbwBPAHMARwB5AEQASwBKADcATABX
ADEAOQBnAFIAQwBmAEUAZwA9AD0AAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0A
ZgBvAHIAZQBmAHIAbwBuAHQALQBhAG4AdABpAHMAcABhAG0ALQByAGUAcABvAHIAdAAAAAEAAACY
AQAAQwBJAFAAOgAyADUANQAuADIANQA1AC4AMgA1ADUALgAyADUANQA7AEMAVABSAFkAOgA7AEwA
QQBOAEcAOgBlAG4AOwBTAEMATAA6ADEAOwBTAFIAVgA6ADsASQBQAFYAOgBOAEwASQA7AFMARgBW
ADoATgBTAFAATQA7AEgAOgBQAEgANwBQAFIAMQAyAE0AQgA1ADkAOQA3AC4AbgBhAG0AcAByAGQA
MQAyAC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA7AFAAVABSADoAOwBDAEEAVAA6
AE4ATwBOAEUAOwBTAEYAUwA6ACgAMQAzADIAMwAwADAANAAwACkAKAAzADcANgAwADEANAApACgA
MQA4ADAAMAA3ADkAOQAwADIANAApACgAMwA2ADYAMAAxADYAKQAoADcAMAA1ADMAMQA5ADkAMAAw
ADcAKQAoADMAOAAwADcAMAA3ADAAMAAwADEAOAApADsARABJAFIAOgBPAFUAVAA7AFMARgBQADoA
MQAxADAAMQA7AAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAXAAAAHgALQBtAHMALQBlAHgAYwBo
AGEAbgBnAGUALQBhAG4AdABpAHMAcABhAG0ALQBtAGUAcwBzAGEAZwBlAGQAYQB0AGEALQBjAGgA
dQBuAGsAYwBvAHUAbgB0AAAAAQAAAAQAAAAxAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAASgAA
AHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBhAG4AdABpAHMAcABhAG0ALQBtAGUAcwBzAGEA
ZwBlAGQAYQB0AGEALQAwAAAAAAABAAAAWgwAAGoAbABEAFEAdgBMADcAMgBCAEEAUwBjAHcAcQBl
AEgAagAzAHYAeQBOAHMAOQBBAHEAZABXAFkAVwBzAEMAOABPAHoAWQBOAEUAQwBWADIARABXACsA
dwB3AFAASgBuAEUATgBpAE8ASQBaAG8AcQA0AFEARwBhAGkASwBxAE4AVABIAHMAbQA1ADgAZQBq
AGgAdgB5ADIATwA4AFIAcQBhADQAdgBhADMAUwBZAFIAdQBWAGkAUQBUAGkAVQBoADMATgA4AE8A
VgBXAGQAOABFAFMAdgBjAEIAKwBPAHkAYgBHADMATgBvADkAZwBsAEgAdwBYAGYAVwByAE0AUAAv
AGwAWQBrAHkANABaAFAAMgBQADMAcgBSAHYAdABlAE0ARABLAFIAWQBuAFgAcAAyAGEARQBYAGUA
SQA2AGEAeQBKAGEAQQB2AEQAdABTAC8AbQBrAEEAQwArAC8ARQAzAGMANgBFAGoASQBmAGUAaABj
AEcAVQArAEcARwBYAHMATgBEADIAcAA0AGoAYgBHAGMAVAAzAG0ASwBYAFcAdgA1ACsATgBLAFYA
QgBaAFQAOABiAG4AeQBFAFgAcABXAFkATQBJAGwAUwBXADUAYQBaAFgAbAB5AFcAZgBIAGEASAB2
AGsAUgB6AHIAbgBZAGEARgBKAGwALwBPAHMATQArAHEAOQBzAEUAOQB6AFkAcwBJAFEAMgBZAFUA
bgB2AGwAawBBAEcASAB1AE0AbgBKAFQANABDAEQAcAAzAFUARQB0AFEAdwBoAEkAawBWAHkAbgBQ
AHUAbABaAFEAMAB5AFIAZQA4ADIAcQAvAE4AVwB3AEEASAB1AEwAYwB6AEIAdABIAGsAbwBrAHQA
UgBXAEYASABkAFIAVQBRAFIAZwAyAHcAQwBDAEIAdwBaAFkAMQB6AGEAMgBOACsAOAA1AEgAQwBN
AFUASQBLAFAAMQBoAHgAVQBhAEMANgBYADIAWgBqAFAAUgBDAEIALwA2ADUAOABOAEcAegBjAHUA
LwBxAEIAMABrAEoAegArAGUAdAByAGYALwB4AFoAVgBOAFUAYgBxAGQAbgBGADQATwB3AFUAZgBa
AHEAQwBlAFMAOQBjAG8AWQA3AEYAMgBaAHgASABEAEMANABkAFYAeAB2AFcAeABNAGkAVABtAHcA
bwBWADQAYQBzAGgASwB3AG4AdwAzAFAANAB3AGMAeABJAGYAagBlAHcAUwBxAEYAcwA3ADAAbQAw
AHIANQA3AEcAdwBaADEAWgBkAHAANQBkAGQATABxAEsATABQAEUAdwBPAHMASQBXACsAZwBOAGgA
RABqAHYAeQBDAGsAdQAwAEgANgByAFAAVAA4AHkAdABaAHQARwArAHcAagA1AEgARABOAFUASgB1
AFIASQBmAHEAKwBLAHMAZQBrAHUAOQBDAEcAZAB4AE0ANABMADIAYQBvAFUALwBZAGQAdwBzADQA
NQBlAHAASQBUAEQAYgB0AGIAMgBKAGcANQBrAG0AMwB6AHoAMQBDADgANwB0ADMATQBGAE8ATABX
AEMAUQB5AE8ATABLAGgAaABRAFYAVQBoAHoANgBLAHIAZgBGAGIAaQAwAFoAVABTAEsAUQBGAEkA
OAB1AG8AYQBrADIASgBDAG4ATQBZAE4ATwBKADUAUAB0AGEAVABpAEsAVQB6AEIAZgBqAEcARQBq
ADAAVQBxAGsAUABCAE8AUABpAHEANwB1AGUAMgBFAEEANgB5AHcAcQA0AEcAdQBBAG0AOQBSACsA
MABoAEEAcgByADkAYgA2ADQAcgA3ADMAcQA3AGkAQwBQAEwASQBNADYAbwBGAEwAUQA4AFMANgBk
AHgALwA1AGQARgBpAGUASQBJAEQAZgB1AEQAMQBJADgAZQBxAEcAdgBzAFYATwBkADQAOABQAHoA
aQBIAHIAMQBMAG8AQQBsAFMAcQAxAHYAZQBWADQAZQBvAFQASgBtAEwAVQBOAEcAOAA5AFoAUwBv
ACsAVwAvAEoAMgBpAE8AMwBkAFkAdQBIAFAAZABrAGEANABIAGkANQBwAGgASwB0AG0AZQA0AE4A
VQBXAHQAYQAwAHYARgB6AEkAUgBXAG0AUQBFADUAZQBoAHIAaABjAEEARQBMAHEASQBhADAATwBH
AFMAZwBMAEkAUwBvACsATQBKADYAdgArAFgAbQA2AGkAWABFAEcASQBKAFkARQBBAE4AUgBuAG8A
SABCADgASgBmADcAZgBOAHEAWgBuAFQAYQA3AEEATABMAFIAVQBUAFEANgBQAEIANQAvAGYAagBP
AC8AbwArAGQAawBnAHoAMABwAC8AYQBzAHEASAA1AHIAYQBRAFAAMQBVAG0ALwAzAFYAagBhAEEA
WQBhAEYALwBtADQANwBlAEgATQBPAGwAdQBzADIAdABOAEQANgBvAFcARgBZAEgATQBuADIAeQBt
AGsAZAA1ADEAQwBHAFIAUwBWAG4AZwBtAGUANwAyAGsAWQB6AHkARgBTAE8AUwBtAHkANQB2ADMA
TABVAFQARwBRADIAdgA0AFgAaQBMAGYAMAA5AEEANABtAGoAaABlAGEAQwArAHUAcQBqAHMAKwB0
AHQASgB6AG4ANQB6AEYARgBwAFQAaQBpAHIAegBiAFMAMQBvAG4AOABKAFcAVwBpAE8AcQBFAGMA
YgBsAFYAcQB3AFoAawBYAFkAMQB5AGkAaQBMADEAWABpAGkATgA3AHMASgBiAGsAQgBRAE4AUgBa
AFUAdQBJAEsAdQA2AE8AYwAvAG0AYgAwAGwAagBXAGQAdQAzAFgAUQBnAFAARQA1ADYAOQBMAHkA
VQAwADAAUwBQAFkAeABMAFMAYgA3ADgALwBiAE0AeAAzAEYASABUAE0ATwAyAFoAMABLAEoARgA5
AEwAbABlAEQAeAA2ADcARgB1AE8AZwBLADUAbgBKAGkAUQBVAFIAaQBXAHgAcABrAFEAbABSAFkA
cgBvAHkAVwB5AHMAUAB6AHkAdAAwADQAQQBXAG0AeAB5ADIAbQAvAFUASQB6AHEAQwBhAEwAbQBn
AEkAdABSAG0AaQA5AFQASQA0AEkARQBxAE8AdgA3AHQARgBsAGYAcgAxAFgAMgBaAE4AWAA1AGUA
egBjAFgANgBuAEYAZwBGAGoAYQBjADgAeQBLAE0AdgBWAE8ARwB3AG4AZwA4AFcANwBQADMAVwBq
ADMAMQBnAGEAbABIAEIAegBHAFgAVQBUAFAAUQAyAGgAWAB1AHoAUQBJAG8ANgBnAHcAdgAvAHcA
bABiAG4AWAArAGwAbABvAGEAWQAxAFgANgAxAHoAZgBRAFEATQBzAFIATABBADkASABKAEYATwBG
AGgAdgBVAGwAQQBKAEkAMABrADQAOABDAFgAbQBQAFUAOQBKADkAYQBlAEsAawBmADUASgBYADEA
SwBJAHgATwB2AGoAcQBYAFkAeQBhAEcAcQBTAHgAdQB0ADcAMgBwAFgAaQBxAEsASAB6ADMASABj
AFEAdgAxAEQANgAzAGgAZQB1AEcAcABNAGQAUABYAGUAMwBxADgAWABzADQASAB0AHoANABhAHAA
cgAwAHMAbwBvAFcAdABvAEEAdQA0AHMATwB3AE4ARQA3AFMAdwBoADgATwBmAGgARwBQAGQAbwAr
AGQAcgB1ACsAYwBaAG8AawBNADcANgB3AGcAQQBPAGoAKwBLAFYAWQBkAGkAdAB5AG4AZABBAFUA
bAAyAG0ASwArAEsARQBSAGEAUQAwAFcATgB6ADYAMgBFAE8AcgBYAEEAaABTAFcAaQBiAFoAYwB2
AFgAZwBIADAAeQBwAHUAawBnAFQASAA3AHIAbABxADYAdgBJAEkANgB4AGwAOQArAEQAMgBRAFYA
VgBOADMANgBkAEMAUwBWADcANwBCADIAbQBzAGgAUABLAHEAQgBLAEcAagBzADMAZABoADgAYgBX
AGYAUABRAHQARgBuAE4AVwBFAE8AaABvAHUAUQBYAGQAbABlAGYAYgArAE8AdwA1AEUAdwB4AHkA
UwBKAHcAdgBOAGIAYgAvAGoAQQAwADkANwBPADkAWABEAGsAeABKAC8AbQBiAE0AUABFAGwAcQBU
AGIASQBVADYAUQA3AHAAYwBxAFYAUgBXAGUAVQBqAHIAbgBqAFgAUgBGADQAcQAwADAAPQAAAAAA
Idg=

--_000_PH7PR12MB599732BB457CBF3A41DC8CFF822F2PH7PR12MB5997namp_--
