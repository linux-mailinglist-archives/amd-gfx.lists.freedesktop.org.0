Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC187874
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867BA6ED9C;
	Fri,  9 Aug 2019 11:29:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B6189078
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/rHMsRPs6Ytm171psm3q6i77s3Z5XkU0zJVxKWk1Dp1AAUkwwmJYEB8xSO49StlZ0oA4cDLekkskIE/pTaDws7nxPthmFODTjYSNbRj3DzMAwVyugsQNboncL3yBzyYKpE54du0gSitykhm2yEuoWIFvYP8hth8HSRjEAHzs2JRr0aKxd9P1r3jYpYypPNVBgI3i0Dsu6h4Ew84pbBDLKfkgATXcTRLpZcYCP65qsXrUyd0ZFDimb+6nrQaKgXT1H7OeVWfsjMOUJf/K3qMH3rZgF1HbcDXOk4gwFfy3KNIS1jjfKTxa6tKrOQnDHqKRYZq8dY3BhzKeHhvXPLoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwNAIioa9A1uNZoxiLMX66lMFIyjq+230N2NdArCFXY=;
 b=Mv3232GqVUaXHEzhFqvOqYbhjJ68ojUz8Fcr4saAI/7P5Sgc52Bfr5pplBmBgiLOjY5MDx+lDB9nFmxjGh51bjfSqUJ8pHl0gv27cpkUBbdarZJj+A/B7+3gER14Z4lpMzWq47xk9kmwxIPsvtSLsDajRAGBONVN5ePYF1JzULmJvoBWngQrlrl/cSigkZnQ1nV89hcMB3wuTwBTCxpmaL0GQxaudNa2/sMWS5z/1iBrFzwx/DNov8Sp6RjxQyaND7zjkvsXsb2L1YAWh3SoB0jlEOK+x4OYkvJL/2Tl46W8Rwc+WxKIa5mAMTIhD4yKdPc/hTAkOkks1/zkqriqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 11:29:38 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 11:29:38 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: add mmhub clock gating for Arcturus
Thread-Topic: [PATCH 3/4] drm/amdgpu: add mmhub clock gating for Arcturus
Thread-Index: AQHVTqVsGZwBeVLe90eJP1GiaRzwWabyrhuv
Date: Fri, 9 Aug 2019 11:29:38 +0000
Message-ID: <MN2PR12MB32962D9754E7C51121D068BDA2D60@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>,
 <1565350016-7071-3-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-3-git-send-email-le.ma@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d868341d-5e87-4ead-36e0-08d71cbcdd31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29119219EE1BF5A1BD538D57A2D60@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(81156014)(53936002)(486006)(6306002)(86362001)(9686003)(236005)(54896002)(105004)(6116002)(966005)(52536014)(5660300002)(8676002)(81166006)(8936002)(14454004)(19627405001)(446003)(11346002)(2501003)(476003)(33656002)(66066001)(102836004)(14444005)(186003)(55016002)(2906002)(256004)(26005)(6246003)(7736002)(6506007)(76176011)(478600001)(7696005)(74316002)(99286004)(25786009)(71200400001)(71190400001)(53546011)(606006)(110136005)(316002)(3846002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(6436002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QtKwW48Cp8LYYzpz4ZLF/k0Cv/qUZGEcK5oJJWSEsW2VFWkRBhmN+LuMuJe5wMZbgmk0lBJiBawszS13Z0+9Eb3vRt/gkMVKvp2D1MIkRVGTkF8njdUBiBdXThkFv9oEmuFSQH1YKqO7xwEMB1yRoocZYX1KD9ZLIOpRgluYVRBvAdVFP6ifPDXPfCkTDCqtEa9i9WixDxJOfNBmfPfRDco9NHX7DENKc6UzAqBdlzhXNhSryMl5c7DcwpRdKaQwkG0OYG2ayZ4k6sU3ZNwovaNGTffhZYWT492pXhSQDQI9vQiQe2Mzzg+toJFydnZJc2ynbJpsDl3FFfxr5DUqPRKsNwWfHTGbrgYobmIBqVPhNy0SFpjnTP26DzQnmY63K0bqxJdmq7KgxVrY2YxteK67qhm34qKK8zkdiNiRBX8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d868341d-5e87-4ead-36e0-08d71cbcdd31
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 11:29:38.4185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WzifsHX/W8PLgt5R8ndF3J6JgFv7tndltPuOK9HAX22WrHrpZ3vt032fZF53Q2+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwNAIioa9A1uNZoxiLMX66lMFIyjq+230N2NdArCFXY=;
 b=Wgcm/fAi6IdmWVHbjVA/KJjgE52FJl+RY1an8QoJI+/6CR2Aeq9f3FS8oWRnbgV9ZGuD1bt1LJtgTKfIQggiWMo2/Jn8LDRhhFcYjWDxMJtSwZbpZc/1U3D2IsF7nfD50nOx7EzTpUX4YnlpgLeRhHe1Lfz5MtjFSoRYRPcSl74=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0709356869=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0709356869==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32962D9754E7C51121D068BDA2D60MN2PR12MB3296namp_"

--_000_MN2PR12MB32962D9754E7C51121D068BDA2D60MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Le Ma <l=
e.ma@amd.com>
Sent: Friday, August 9, 2019 7:26 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Ma, Le <Le.Ma@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: add mmhub clock gating for Arcturus

Add 2 mmhub instances CG

Change-Id: I76ab7a50cd9a40de3022f733787b42e4e5c4dbf5
Signed-off-by: Le Ma <le.ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   |  12 +--
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 126 ++++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h |   3 +
 3 files changed, 135 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c
index cccb6e9..44ac122 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1465,9 +1465,9 @@ static int gmc_v9_0_set_clockgating_state(void *handl=
e,
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

         if (adev->asic_type =3D=3D CHIP_ARCTURUS)
-               return 0;
-
-       mmhub_v1_0_set_clockgating(adev, state);
+               mmhub_v9_4_set_clockgating(adev, state);
+       else
+               mmhub_v1_0_set_clockgating(adev, state);

         athub_v1_0_set_clockgating(adev, state);

@@ -1479,9 +1479,9 @@ static void gmc_v9_0_get_clockgating_state(void *hand=
le, u32 *flags)
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

         if (adev->asic_type =3D=3D CHIP_ARCTURUS)
-               return;
-
-       mmhub_v1_0_get_clockgating(adev, flags);
+               mmhub_v9_4_get_clockgating(adev, flags);
+       else
+               mmhub_v1_0_get_clockgating(adev, flags);

         athub_v1_0_get_clockgating(adev, flags);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.c
index 33b0de5..e52e4d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
@@ -515,3 +515,129 @@ void mmhub_v9_4_init(struct amdgpu_device *adev)
                                     i * MMHUB_INSTANCE_REGISTER_OFFSET;
         }
 }
+
+static void mmhub_v9_4_update_medium_grain_clock_gating(struct amdgpu_devi=
ce *adev,
+                                                       bool enable)
+{
+       uint32_t def, data, def1, data1;
+       int i, j;
+       int dist =3D mmDAGB1_CNTL_MISC2 - mmDAGB0_CNTL_MISC2;
+
+       for (i =3D 0; i < MMHUB_NUM_INSTANCES; i++) {
+               def =3D data =3D RREG32_SOC15_OFFSET(MMHUB, 0,
+                                       mmATCL2_0_ATC_L2_MISC_CG,
+                                       i * MMHUB_INSTANCE_REGISTER_OFFSET)=
;
+
+               if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_MGCG))
+                       data |=3D ATCL2_0_ATC_L2_MISC_CG__ENABLE_MASK;
+               else
+                       data &=3D ~ATCL2_0_ATC_L2_MISC_CG__ENABLE_MASK;
+
+               if (def !=3D data)
+                       WREG32_SOC15_OFFSET(MMHUB, 0, mmATCL2_0_ATC_L2_MISC=
_CG,
+                               i * MMHUB_INSTANCE_REGISTER_OFFSET, data);
+
+               for (j =3D 0; j < 5; j++) {
+                       def1 =3D data1 =3D RREG32_SOC15_OFFSET(MMHUB, 0,
+                                       mmDAGB0_CNTL_MISC2,
+                                       i * MMHUB_INSTANCE_REGISTER_OFFSET =
+
+                                       j * dist);
+                       if (enable &&
+                           (adev->cg_flags & AMD_CG_SUPPORT_MC_MGCG)) {
+                               data1 &=3D
+                                   ~(DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MA=
SK |
+                                   DAGB0_CNTL_MISC2__DISABLE_WRRET_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_RDREQ_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_RDRET_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_TLBWR_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK=
);
+                       } else {
+                               data1 |=3D
+                                   (DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MAS=
K |
+                                   DAGB0_CNTL_MISC2__DISABLE_WRRET_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_RDREQ_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_RDRET_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_TLBWR_CG_MASK=
 |
+                                   DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK=
);
+                       }
+
+                       if (def1 !=3D data1)
+                               WREG32_SOC15_OFFSET(MMHUB, 0,
+                                       mmDAGB0_CNTL_MISC2,
+                                       i * MMHUB_INSTANCE_REGISTER_OFFSET =
+
+                                       j * dist, data1);
+
+                       if (i =3D=3D 1 && j =3D=3D 3)
+                               break;
+               }
+       }
+}
+
+static void mmhub_v9_4_update_medium_grain_light_sleep(struct amdgpu_devic=
e *adev,
+                                                      bool enable)
+{
+       uint32_t def, data;
+       int i;
+
+       for (i =3D 0; i < MMHUB_NUM_INSTANCES; i++) {
+               def =3D data =3D RREG32_SOC15_OFFSET(MMHUB, 0,
+                                       mmATCL2_0_ATC_L2_MISC_CG,
+                                       i * MMHUB_INSTANCE_REGISTER_OFFSET)=
;
+
+               if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS))
+                       data |=3D ATCL2_0_ATC_L2_MISC_CG__MEM_LS_ENABLE_MAS=
K;
+               else
+                       data &=3D ~ATCL2_0_ATC_L2_MISC_CG__MEM_LS_ENABLE_MA=
SK;
+
+               if (def !=3D data)
+                       WREG32_SOC15_OFFSET(MMHUB, 0, mmATCL2_0_ATC_L2_MISC=
_CG,
+                               i * MMHUB_INSTANCE_REGISTER_OFFSET, data);
+       }
+}
+
+int mmhub_v9_4_set_clockgating(struct amdgpu_device *adev,
+                              enum amd_clockgating_state state)
+{
+       if (amdgpu_sriov_vf(adev))
+               return 0;
+
+       switch (adev->asic_type) {
+       case CHIP_ARCTURUS:
+               mmhub_v9_4_update_medium_grain_clock_gating(adev,
+                               state =3D=3D AMD_CG_STATE_GATE ? true : fal=
se);
+               mmhub_v9_4_update_medium_grain_light_sleep(adev,
+                               state =3D=3D AMD_CG_STATE_GATE ? true : fal=
se);
+               break;
+       default:
+               break;
+       }
+
+       return 0;
+}
+
+/* TODO: get 2 mmhub instances CG state */
+void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *flags)
+{
+       int data, data1;
+
+       if (amdgpu_sriov_vf(adev))
+               *flags =3D 0;
+
+       /* AMD_CG_SUPPORT_MC_MGCG */
+       data =3D RREG32_SOC15(MMHUB, 0, mmATCL2_0_ATC_L2_MISC_CG);
+
+       data1 =3D RREG32_SOC15(MMHUB, 0, mmATCL2_0_ATC_L2_MISC_CG);
+
+       if ((data & ATCL2_0_ATC_L2_MISC_CG__ENABLE_MASK) &&
+           !(data1 & (DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MASK |
+                      DAGB0_CNTL_MISC2__DISABLE_WRRET_CG_MASK |
+                      DAGB0_CNTL_MISC2__DISABLE_RDREQ_CG_MASK |
+                      DAGB0_CNTL_MISC2__DISABLE_RDRET_CG_MASK |
+                      DAGB0_CNTL_MISC2__DISABLE_TLBWR_CG_MASK |
+                      DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK)))
+               *flags |=3D AMD_CG_SUPPORT_MC_MGCG;
+
+       /* AMD_CG_SUPPORT_MC_LS */
+       if (data & ATCL2_0_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK)
+               *flags |=3D AMD_CG_SUPPORT_MC_LS;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.h
index 9ba3dd8..d435cfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h
@@ -29,5 +29,8 @@ void mmhub_v9_4_gart_disable(struct amdgpu_device *adev);
 void mmhub_v9_4_set_fault_enable_default(struct amdgpu_device *adev,
                                          bool value);
 void mmhub_v9_4_init(struct amdgpu_device *adev);
+int mmhub_v9_4_set_clockgating(struct amdgpu_device *adev,
+                              enum amd_clockgating_state state);
+void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *flags);

 #endif
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32962D9754E7C51121D068BDA2D60MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">Reviewed-by: Kevi=
n Wang &lt;kevin1.wang@amd.com&gt;</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Le Ma &lt;le.ma@amd.com&gt;<b=
r>
<b>Sent:</b> Friday, August 9, 2019 7:26 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Ma, Le &lt;Le.Ma@amd.com&gt;<br>
<b>Subject:</b> [PATCH 3/4] drm/amdgpu: add mmhub clock gating for Arcturus=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add 2 mmhub instances CG<br>
<br>
Change-Id: I76ab7a50cd9a40de3022f733787b42e4e5c4dbf5<br>
Signed-off-by: Le Ma &lt;le.ma@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c&nbsp;&nbsp; |&nbsp; 12 &#43;--<=
br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 126 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h |&nbsp;&nbsp; 3 &#43;<br>
&nbsp;3 files changed, 135 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c<br>
index cccb6e9..44ac122 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
@@ -1465,9 &#43;1465,9 @@ static int gmc_v9_0_set_clockgating_state(void *h=
andle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type =3D=
=3D CHIP_ARCTURUS)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmhub_v1_0_set_clockgating(adev, stat=
e);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mmhub_v9_4_set_clockgating(adev, state);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mmhub_v1_0_set_clockgating(adev, state);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; athub_v1_0_set_clockgating=
(adev, state);<br>
&nbsp;<br>
@@ -1479,9 &#43;1479,9 @@ static void gmc_v9_0_get_clockgating_state(void *=
handle, u32 *flags)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type =3D=
=3D CHIP_ARCTURUS)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmhub_v1_0_get_clockgating(adev, flag=
s);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mmhub_v9_4_get_clockgating(adev, flags);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mmhub_v1_0_get_clockgating(adev, flags);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; athub_v1_0_get_clockgating=
(adev, flags);<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.c<br>
index 33b0de5..e52e4d1 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c<br>
@@ -515,3 &#43;515,129 @@ void mmhub_v9_4_init(struct amdgpu_device *adev)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i * MMHU=
B_INSTANCE_REGISTER_OFFSET;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
&#43;<br>
&#43;static void mmhub_v9_4_update_medium_grain_clock_gating(struct amdgpu_=
device *adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool enable)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t def, data, def1, data1;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, j;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dist =3D mmDAGB1_CNTL_MISC2 -=
 mmDAGB0_CNTL_MISC2;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; MMHUB_NUM_IN=
STANCES; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; def =3D data =3D RREG32_SOC15_OFFSET(MMHUB, 0,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; mmATCL2_0_ATC_L2_MISC_CG,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; i * MMHUB_INSTANCE_REGISTER_OFFSET);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (enable &amp;&amp; (adev-&gt;cg_flags &amp; AMD_CG_SUPPOR=
T_MC_MGCG))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data |=3D AT=
CL2_0_ATC_L2_MISC_CG__ENABLE_MASK;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data &amp;=
=3D ~ATCL2_0_ATC_L2_MISC_CG__ENABLE_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (def !=3D data)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15=
_OFFSET(MMHUB, 0, mmATCL2_0_ATC_L2_MISC_CG,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i * MMHUB_INSTANCE_REGISTER_OFFSET, dat=
a);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; for (j =3D 0; j &lt; 5; j&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def1 =3D dat=
a1 =3D RREG32_SOC15_OFFSET(MMHUB, 0,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; mmDAGB0_CNTL_MISC2,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; i * MMHUB_INSTANCE_REGISTER_OFFSET &#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; j * dist);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable &=
amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; (adev-&gt;cg_flags &amp; AMD_CG_SUPPORT_MC_MGCG)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data1 &amp;=3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~(DAGB0_CNTL_MI=
SC2__DISABLE_WRREQ_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_WRRET_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_RDREQ_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_RDRET_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_TLBWR_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_TLBRD_CG_MASK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data1 |=3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DAGB0_CNTL_MIS=
C2__DISABLE_WRREQ_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_WRRET_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_RDREQ_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_RDRET_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_TLBWR_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC=
2__DISABLE_TLBRD_CG_MASK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (def1 !=
=3D data1)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; mmDAGB0_CNTL_MISC2,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; i * MMHUB_INSTANCE_REGISTER_OFFSET &#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; j * dist, data1);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i =3D=3D=
 1 &amp;&amp; j =3D=3D 3)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;}<br>
&#43;<br>
&#43;static void mmhub_v9_4_update_medium_grain_light_sleep(struct amdgpu_d=
evice *adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; bool enable)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t def, data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; MMHUB_NUM_IN=
STANCES; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; def =3D data =3D RREG32_SOC15_OFFSET(MMHUB, 0,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; mmATCL2_0_ATC_L2_MISC_CG,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; i * MMHUB_INSTANCE_REGISTER_OFFSET);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (enable &amp;&amp; (adev-&gt;cg_flags &amp; AMD_CG_SUPPOR=
T_MC_LS))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data |=3D AT=
CL2_0_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data &amp;=
=3D ~ATCL2_0_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (def !=3D data)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15=
_OFFSET(MMHUB, 0, mmATCL2_0_ATC_L2_MISC_CG,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i * MMHUB_INSTANCE_REGISTER_OFFSET, dat=
a);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;}<br>
&#43;<br>
&#43;int mmhub_v9_4_set_clockgating(struct amdgpu_device *adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_clockgating_state state)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_ARCTURUS:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mmhub_v9_4_update_medium_grain_clock_gating(adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state =3D=3D AMD_CG_STATE_GATE ? true :=
 false);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mmhub_v9_4_update_medium_grain_light_sleep(adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state =3D=3D AMD_CG_STATE_GATE ? true :=
 false);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;/* TODO: get 2 mmhub instances CG state */<br>
&#43;void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *flags=
)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int data, data1;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *flags =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* AMD_CG_SUPPORT_MC_MGCG */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D RREG32_SOC15(MMHUB, 0, m=
mATCL2_0_ATC_L2_MISC_CG);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data1 =3D RREG32_SOC15(MMHUB, 0, =
mmATCL2_0_ATC_L2_MISC_CG);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((data &amp; ATCL2_0_ATC_L2_MI=
SC_CG__ENABLE_MASK) &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !(data1 &=
amp; (DAGB0_CNTL_MISC2__DISABLE_WRREQ_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC2__=
DISABLE_WRRET_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC2__=
DISABLE_RDREQ_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC2__=
DISABLE_RDRET_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC2__=
DISABLE_TLBWR_CG_MASK |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DAGB0_CNTL_MISC2__=
DISABLE_TLBRD_CG_MASK)))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *flags |=3D AMD_CG_SUPPORT_MC_MGCG;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* AMD_CG_SUPPORT_MC_LS */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (data &amp; ATCL2_0_ATC_L2_MIS=
C_CG__MEM_LS_ENABLE_MASK)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *flags |=3D AMD_CG_SUPPORT_MC_LS;<br>
&#43;}<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.h<br>
index 9ba3dd8..d435cfc 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h<br>
@@ -29,5 &#43;29,8 @@ void mmhub_v9_4_gart_disable(struct amdgpu_device *ad=
ev);<br>
&nbsp;void mmhub_v9_4_set_fault_enable_default(struct amdgpu_device *adev,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bool value);<br>
&nbsp;void mmhub_v9_4_init(struct amdgpu_device *adev);<br>
&#43;int mmhub_v9_4_set_clockgating(struct amdgpu_device *adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_clockgating_state state);<br>
&#43;void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *flags=
);<br>
&nbsp;<br>
&nbsp;#endif<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32962D9754E7C51121D068BDA2D60MN2PR12MB3296namp_--

--===============0709356869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0709356869==--
