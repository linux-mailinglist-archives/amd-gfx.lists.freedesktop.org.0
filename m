Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0229353856
	for <lists+amd-gfx@lfdr.de>; Sun,  4 Apr 2021 16:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FACC89E33;
	Sun,  4 Apr 2021 14:18:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375B89E33
 for <amd-gfx@lists.freedesktop.org>; Sun,  4 Apr 2021 14:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/HHlQ/2sKePjJ90jVOETzjtRuIt3CR++O7tn+p1kjhw864rhhoGUt7JBQ8UKv/QHgxcNLuuz+r4W5unWBj9INr1jK7BP8OMtkahP4DutHW9EYqfGgD0PLUBJaf07KvvVeQpRwyn56AfegfZIVYvoJiEUcASOVMhXYdADAcGEq5J8whDYxcTTaLponBWB9KZk2tS39ZNykyKlFukolowrZdXrzIbmawOiye7U8DUzhKUDU4y4qPNCynr1a0V9/pgEH4CmLK2NVsrIUfbdYaqYgwyPgnGib5luF6x/b+j/tMkb0/kGOoEK8T+I6bJMtthL1/iRM7d4rxIxVr9tLr5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhs2cfFe+xOQ8f4iuwvhUzmHR/lZbUnP+PAEUI2gAtM=;
 b=NJGa7SMYVN0gIZATHaoHTzqZEL6hEOwgb5NPS9RNDLq7g3h4YLfQO1VcQobY1yzVFftzvxrqtq4vdvznAJZJACglNHmxx6I1My26TH31fSrTUkUww4d9wKAOAMhP1FKN9rTX5zcMIQ3z4CjXeMDLMkDaajAAtDkHpJyP2ynkQHb0mEyxkgIBJskK25F0zVxpiGTpskV/W8lfwjqDkISnCajlmJ43JEc8HHC6Rov23nlrym93JBB1Z0bfJu81dlMKSnAqMxKi1PnRrg2EcKFKsJbgc0C/7zFsjm3fenRYbMeHoWcQ+1We0TGifbwiSExJeyBTRbiFEBhWPnqBHYou/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhs2cfFe+xOQ8f4iuwvhUzmHR/lZbUnP+PAEUI2gAtM=;
 b=zf1PrMoDhl39NLfCQkZiJP3b6JtrpHEp1DwJb76YuTn7LIMhbvZIGOT1XXpxTqJPWjDD5jsfQ41G596MYXJ6rDqfs02lF7llgFWJ7qi3kWHrxENzxz64SNBNzJdAxzR+8d8ad9i9DoQKTxXpkTjjeYF0WISifW80faPDCzD/sqw=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR1201MB0039.namprd12.prod.outlook.com (2603:10b6:910:1e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Sun, 4 Apr
 2021 14:18:19 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::8908:d7:5544:6007]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::8908:d7:5544:6007%8]) with mapi id 15.20.3999.028; Sun, 4 Apr 2021
 14:18:18 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Zhou, Peng Ju" <PengJu.Zhou@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: indirect register access for nv12 sriov
Thread-Topic: [PATCH 4/4] drm/amdgpu: indirect register access for nv12 sriov
Thread-Index: AQHXJe2ocddMz9dVuUeZ3VfqqTBeE6qfLNWAgAU7c5A=
Date: Sun, 4 Apr 2021 14:18:18 +0000
Message-ID: <CY4PR12MB1287B50A9FCCE5E975E110AEF1789@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20210331052025.24200-1-PengJu.Zhou@amd.com>
 <20210331052025.24200-4-PengJu.Zhou@amd.com>
 <BY5PR12MB4115BE504294097CAAA2E9C98F7B9@BY5PR12MB4115.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4115BE504294097CAAA2E9C98F7B9@BY5PR12MB4115.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-04-04T14:18:15Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=42c5f5e6-6f0d-436b-abc8-48cdc98d3864;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [101.93.253.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 651192a5-e724-4cbb-2edd-08d8f7747ee0
x-ms-traffictypediagnostic: CY4PR1201MB0039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00395AB93ACCA242754B1C99F1789@CY4PR1201MB0039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9uSiqOQ7VOX0xuAaUGGpv61hrjaWAodJhnDdsK8PD39mMeahsT7l9odetT2JXELOez7Fb2KMiw/gK44qbiMLemFppAKTxUfXQLUQk0vB/pi3G0KIWGoHpzI9t6yYSxY4igo2Zkt3PZLX5Ef0QkzRjeB1SqthziUDpbK88eTVAMjqpvFL9nA7gK/GVP1sUeEEmNDQj9ka4Hk86yTSgptH/9iV/2g/CTTVZJVDtzfncknsImUeTFKFe3NG8F/ArdCborrywxdhk5tnHiHgGv+fZQhc8mfdJ7ZgniFQEErmD9MmPaKe7yXyw5o6ECxLinfLPoytk1XfG/FGHa8ikSSJlSuiHr0i5V4wCWiHqiR48W0DL359sLY5gQENDJTEynw1kctRHrEUl4TVoSudo+mUyuFIEdooPhYkwO52lko80lHEqEubvQhsg2fwO3f3Ky3A0u/Hpyor4CKNwpHpu3RkeUiWTiTtkmPwbXtjev7MgaxXm56iiNwgjVsovxpjBR/hSs4gCClgBRP6xCwXV5bsgzf54C+n6fO22/G8t082pwIdzAGX97iM7LXaqBw0CTpyhubHz27iY8fOO2PO/ythPWUjk8tSZtV7w/t1ZHZkRjb5QT2Cfg2BJQXqnrfAwZmqHWMztF1Yvt6+mdhJxpTjizhAiwW+c4aFDPWxZSAcWvQVdyn7ALK+qaLbMRZZe+8L6Or1Azdp8TmNaCf+r8H3e6I4c7aGKwAKT38DR/oL4Z0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(478600001)(110136005)(26005)(186003)(83380400001)(45080400002)(71200400001)(8936002)(4326008)(2906002)(38100700001)(6506007)(53546011)(966005)(33656002)(66946007)(55016002)(30864003)(8676002)(9686003)(76116006)(86362001)(66446008)(52536014)(66476007)(5660300002)(316002)(66556008)(7696005)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0PQNtyqICNP8U2XKgYTR9t5tnkpsY7mZJv+M8LqXYwn8JYp8Yve2YT0hIfSw?=
 =?us-ascii?Q?J/oBvHrxTQfmhoZna4xqpJRFeCVXSXkASCrPiFvUQ6290UQ5Yh7S11y5qSgp?=
 =?us-ascii?Q?/5+RpaQk3nCnJ1mEr3O1H+6VxZRXLPAdxnhe/cBuv2fxSzLwWjzBVnJXzl+h?=
 =?us-ascii?Q?sD6WbfiCOHLo02bZBby3JvwZIp8jdX3N0quSeSO9i1on/FB+kvSD18k3y60S?=
 =?us-ascii?Q?RP5hPtMCnZoz9wG/OL35lvtnEAYlCmRZVmj/7hdIgiRE2I0HOoJhF+h2bTZU?=
 =?us-ascii?Q?ZLGhd+ySzqh/uYLeAjHwaPv3YL6/FEedICvSPkDWjQ+J+SmAcMSPbkbglaAt?=
 =?us-ascii?Q?sBszE7/U1nYbRKZh4PgB7TO7sGgcgnQkxXyxcI4Wk8ftoYmraHE+GaEm20gC?=
 =?us-ascii?Q?EoinIxzy1dMWWGjifQH+5GEgToUEVHg+645Le2OvZmbWhSr7bugervQhpI3Q?=
 =?us-ascii?Q?ozZRZf7Uz4o1zFGhXYhQ5FFMchE0tK3Beu44Xo+vbSamL38uRUxeuSJM3b7a?=
 =?us-ascii?Q?X4oXFrerycDWAC7W8jA/AyIa6ox90X3X5tChqv64SK5qbEpvDx19KlEhI37B?=
 =?us-ascii?Q?MQSuEeFI1zU4kEAVXEVnA8+weHT96c53TAixgx7ocXCBfhMFIDRX7zXmfkSM?=
 =?us-ascii?Q?ldNisthjWqwl5YzBzFduJwZNMUsj8/R7ukKrNSnVwJrth8qnTUBvxcCaCvjU?=
 =?us-ascii?Q?lE33NiecjW/1imYC+uMq3CvVS7ZriLBhg7XsBF/rvnlQvslUqQLF3vhn3fOh?=
 =?us-ascii?Q?YmnYg60vNdzSDAownH9y4F+hnRC5mfJH22pEqk6Vm4DHnvhvteyms1HYaNMo?=
 =?us-ascii?Q?oYv5cmgPGX/y1WcKcNf/ozpqfcCtWyxoyxIU//WY5WOktWELBokr9D3Cc2/q?=
 =?us-ascii?Q?DrvoNRUSeAM7vdhJY5Z4qgBUPC+Cp9LJkhzVX2Cdl5sSHr0Cv4eQcLUYGSap?=
 =?us-ascii?Q?d0FCMmUSW6MM1aB9koIqj3lm8BiA+qnzIwD2SYvq+GmrVu+Bsa3Eg3Pp9kUH?=
 =?us-ascii?Q?F61l6Au+vzjnFkQ09u32+Fcy8bAlJfAOQyYOmef5Az7XPSe5lveQ/wp4InrC?=
 =?us-ascii?Q?xPr9zDICLaiSNnYEVhgf9r6ZvjlEK1wTFjUwONCBEtqJ7iH8+J631OexgzR+?=
 =?us-ascii?Q?StlDoWNNt5CUTmZaF1B5OtbuCpaTGkGkZ/z2tNqETYnfisMUO1LSZiB9V9b1?=
 =?us-ascii?Q?B+lvbiCqaG+qD9Fv6qJ4OyshU2DP5YsQ5s7OrYWjj3dTP5T3s+l8QfVLNFG3?=
 =?us-ascii?Q?BpGgHnRW7B+ULn4W/L+FARQ8WjDauS08m8R4ZjjLSLL0KA7GiKcbPpxe723j?=
 =?us-ascii?Q?CFBtVDRBk8WICCFIlfEmugwm?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651192a5-e724-4cbb-2edd-08d8f7747ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2021 14:18:18.8074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7ywNrhbtny2qjr3tUFHzMUW9PcwHhh8CyteeKj8RIIGs4tJAt1kbCkg7xzWFOEMmRm655ccantE4ZmjxgnUjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0039
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
Cc: "Zhao, Jiange" <Jiange.Zhao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Public Use]

Hi Peng Ju,

Patch 4 breaks the driver modprobe sequence for the ASICs with GFX IP v9.0. The modification in WREG32_RLC will route to one different path for GFX v9. Please check it.

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Deng, Emily
Sent: Thursday, April 1, 2021 2:01 PM
To: Zhou, Peng Ju <PengJu.Zhou@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Zhao, Jiange <Jiange.Zhao@amd.com>
Subject: RE: [PATCH 4/4] drm/amdgpu: indirect register access for nv12 sriov

[AMD Official Use Only - Internal Distribution Only]

[AMD Official Use Only - Internal Distribution Only]

Series Reviewed-by: Emily.Deng <Emily.Deng@amd.com>

>-----Original Message-----
>From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Peng 
>Ju Zhou
>Sent: Wednesday, March 31, 2021 1:20 PM
>To: amd-gfx@lists.freedesktop.org
>Cc: Zhao, Jiange <Jiange.Zhao@amd.com>
>Subject: [PATCH 4/4] drm/amdgpu: indirect register access for nv12 
>sriov
>
>1. expand rlcg interface for gc & mmhub indirect access 2. add rlcg 
>interface for no kiq
>
>Signed-off-by: Peng Ju Zhou <PengJu.Zhou@amd.com>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h    |   3 +-
> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     | 131 ++++++++++++++++++---
> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      |   2 +-
> drivers/gpu/drm/amd/amdgpu/soc15_common.h  |  75 ++++++------
> 5 files changed, 150 insertions(+), 63 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>index 060d0ae99453..438e2f732377 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>@@ -490,7 +490,7 @@ void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device 
>*adev,
>     adev->gfx.rlc.funcs &&
>     adev->gfx.rlc.funcs->is_rlcg_access_range) {  if 
>(adev->gfx.rlc.funcs->is_rlcg_access_range(adev, reg)) -return 
>adev->gfx.rlc.funcs->rlcg_wreg(adev, reg, v);
>+return adev->gfx.rlc.funcs->rlcg_wreg(adev, reg, v, 0);
> } else {
> writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));  } diff --git 
>a/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h
>index aeaaae713c59..4fc2ce8ce8ab 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h
>@@ -127,7 +127,8 @@ struct amdgpu_rlc_funcs {  void (*reset)(struct 
>amdgpu_device *adev);  void (*start)(struct amdgpu_device *adev);  void 
>(*update_spm_vmid)(struct amdgpu_device *adev, unsigned vmid); -void 
>(*rlcg_wreg)(struct amdgpu_device *adev, u32 offset, u32 v);
>+void (*rlcg_wreg)(struct amdgpu_device *adev, u32 offset, u32 v, u32
>flag);
>+u32 (*rlcg_rreg)(struct amdgpu_device *adev, u32 offset, u32 flag);
> bool (*is_rlcg_access_range)(struct amdgpu_device *adev, uint32_t 
>reg);  };
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>index b4fd0394cd08..85a6a10e048f 100644
>--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>@@ -177,6 +177,11 @@
> #define mmGC_THROTTLE_CTRL_Sienna_Cichlid              0x2030
> #define mmGC_THROTTLE_CTRL_Sienna_Cichlid_BASE_IDX     0
>
>+#define GFX_RLCG_GC_WRITE_OLD(0x8 << 28) #define GFX_RLCG_GC_WRITE(0x0 
>+<< 28) #define GFX_RLCG_GC_READ(0x1 << 28) #define 
>+GFX_RLCG_MMHUB_WRITE(0x2 << 28)
>+
> MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
> MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
> MODULE_FIRMWARE("amdgpu/navi10_me.bin");
>@@ -1422,38 +1427,127 @@ static const struct soc15_reg_golden 
>golden_settings_gc_10_1_2[] =  SOC15_REG_GOLDEN_VALUE(GC, 0, 
>mmUTCL1_CTRL, 0xffffffff,
>0x00800000)  };
>
>-static void gfx_v10_rlcg_wreg(struct amdgpu_device *adev, u32 offset, 
>u32 v)
>+static bool gfx_v10_is_rlcg_rw(struct amdgpu_device *adev, u32 offset, 
>+uint32_t *flag, bool write) {
>+/* always programed by rlcg, only for gc */ if (offset == 
>+SOC15_REG_OFFSET(GC, 0, mmRLC_CSIB_ADDR_HI) ||
>+    offset == SOC15_REG_OFFSET(GC, 0, mmRLC_CSIB_ADDR_LO) ||
>+    offset == SOC15_REG_OFFSET(GC, 0, mmRLC_CSIB_LENGTH) ||
>+    offset == SOC15_REG_OFFSET(GC, 0, mmGRBM_GFX_CNTL) ||
>+    offset == SOC15_REG_OFFSET(GC, 0, mmGRBM_GFX_INDEX) ||
>+    offset == SOC15_REG_OFFSET(GC, 0, mmCP_ME_CNTL)) { if 
>+(!amdgpu_sriov_reg_indirect_gc(adev))
>+*flag = GFX_RLCG_GC_WRITE_OLD;
>+else
>+*flag = write ? GFX_RLCG_GC_WRITE :
>GFX_RLCG_GC_READ;
>+
>+return true;
>+}
>+
>+/* currently support gc read/write, mmhub write */ if (offset >= 
>+SOC15_REG_OFFSET(GC, 0, mmSDMA0_DEC_START) &&
>+    offset <= SOC15_REG_OFFSET(GC, 0, mmRLC_GTS_OFFSET_MSB)) { if 
>+(amdgpu_sriov_reg_indirect_gc(adev))
>+*flag = write ? GFX_RLCG_GC_WRITE :
>GFX_RLCG_GC_READ;
>+else
>+return false;
>+} else {
>+if (amdgpu_sriov_reg_indirect_mmhub(adev))
>+*flag = GFX_RLCG_MMHUB_WRITE;
>+else
>+return false;
>+}
>+
>+return true;
>+}
>+
>+static u32 gfx_v10_rlcg_rw(struct amdgpu_device *adev, u32 offset, u32 
>+v, uint32_t flag)
> {
> static void *scratch_reg0;
> static void *scratch_reg1;
>+static void *scratch_reg2;
>+static void *scratch_reg3;
> static void *spare_int;
>+static uint32_t grbm_cntl;
>+static uint32_t grbm_idx;
> uint32_t i = 0;
> uint32_t retries = 50000;
>+u32 ret = 0;
>+
>+scratch_reg0 = adev->rmmio +
>+       (adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] +
>mmSCRATCH_REG0) * 4;
>+scratch_reg1 = adev->rmmio +
>+       (adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] +
>mmSCRATCH_REG1) * 4;
>+scratch_reg2 = adev->rmmio +
>+       (adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] +
>mmSCRATCH_REG2) * 4;
>+scratch_reg3 = adev->rmmio +
>+       (adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] +
>mmSCRATCH_REG3) * 4;
>+spare_int = adev->rmmio +
>+    (adev-
>>reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_BASE_IDX] +
>+mmRLC_SPARE_INT) * 4;
>+
>+grbm_cntl = adev-
>>reg_offset[GC_HWIP][0][mmGRBM_GFX_CNTL_BASE_IDX] +
>mmGRBM_GFX_CNTL;
>+grbm_idx = adev-
>>reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] +
>+mmGRBM_GFX_INDEX;
>+
>+if (offset == grbm_cntl || offset == grbm_idx) { if (offset  == 
>+grbm_cntl) writel(v, scratch_reg2); else if (offset == grbm_idx) 
>+writel(v, scratch_reg3);
>+
>+writel(v, ((void __iomem *)adev->rmmio) + (offset * 4)); } else { 
>+writel(v, scratch_reg0); writel(offset | flag, scratch_reg1); 
>+writel(1, spare_int); for (i = 0; i < retries; i++) {
>+u32 tmp;
>+
>+tmp = readl(scratch_reg1);
>+if (!(tmp & flag))
>+break;
>
>-scratch_reg0 = adev->rmmio + (adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] +
>mmSCRATCH_REG0)*4;
>-scratch_reg1 = adev->rmmio + (adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] +
>mmSCRATCH_REG1)*4;
>-spare_int = adev->rmmio + (adev-
>>reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_BASE_IDX] +
>mmRLC_SPARE_INT)*4;
>+udelay(10);
>+}
>
>-if (amdgpu_sriov_runtime(adev)) {
>-pr_err("shouldn't call rlcg write register during runtime\n"); 
>-return;
>+if (i >= retries)
>+pr_err("timeout: rlcg program reg:0x%05x failed !\n",
>offset);
> }
>
>-writel(v, scratch_reg0);
>-writel(offset | 0x80000000, scratch_reg1); -writel(1, spare_int); -for 
>(i = 0; i < retries; i++) {
>-u32 tmp;
>+ret = readl(scratch_reg0);
>
>-tmp = readl(scratch_reg1);
>-if (!(tmp & 0x80000000))
>-break;
>+return ret;
>+}
>
>-udelay(10);
>+static void gfx_v10_rlcg_wreg(struct amdgpu_device *adev, u32 offset,
>+u32 value, u32 flag) {
>+uint32_t rlcg_flag;
>+
>+if (amdgpu_sriov_fullaccess(adev) &&
>+    gfx_v10_is_rlcg_rw(adev, offset, &rlcg_flag, 1)) { 
>+gfx_v10_rlcg_rw(adev, offset, value, rlcg_flag);
>+
>+return;
> }
>+if (flag & AMDGPU_REGS_NO_KIQ)
>+WREG32_NO_KIQ(offset, value);
>+else
>+WREG32(offset, value);
>+}
>+
>+static u32 gfx_v10_rlcg_rreg(struct amdgpu_device *adev, u32 offset,
>+u32 flag) {
>+uint32_t rlcg_flag;
>
>-if (i >= retries)
>-pr_err("timeout: rlcg program reg:0x%05x failed !\n", offset);
>+if (amdgpu_sriov_fullaccess(adev) &&
>+    gfx_v10_is_rlcg_rw(adev, offset, &rlcg_flag, 0)) return 
>+gfx_v10_rlcg_rw(adev, offset, 0, rlcg_flag);
>+
>+if (flag & AMDGPU_REGS_NO_KIQ)
>+return RREG32_NO_KIQ(offset);
>+else
>+return RREG32(offset);
>+
>+return 0;
> }
>
> static const struct soc15_reg_golden golden_settings_gc_10_1_nv14[] = 
>@@ -
>7888,6 +7982,7 @@ static const struct amdgpu_rlc_funcs 
>gfx_v10_0_rlc_funcs_sriov = {  .start = gfx_v10_0_rlc_start,  
>.update_spm_vmid = gfx_v10_0_update_spm_vmid,  .rlcg_wreg = 
>gfx_v10_rlcg_wreg,
>+.rlcg_rreg = gfx_v10_rlcg_rreg,
> .is_rlcg_access_range = gfx_v10_0_is_rlcg_access_range,  };
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>index 99f58439f3d5..6e49b239087a 100644
>--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>@@ -734,7 +734,7 @@ static const u32
>GFX_RLC_SRM_INDEX_CNTL_DATA_OFFSETS[] =
> mmRLC_SRM_INDEX_CNTL_DATA_7 -
>mmRLC_SRM_INDEX_CNTL_DATA_0,  };
>
>-static void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, 
>u32 v)
>+void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v,
>+u32 flag)
> {
> static void *scratch_reg0;
> static void *scratch_reg1;
>diff --git a/drivers/gpu/drm/amd/amdgpu/soc15_common.h
>b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
>index 8cdf5d1685cb..14bd794bbea6 100644
>--- a/drivers/gpu/drm/amd/amdgpu/soc15_common.h
>+++ b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
>@@ -77,27 +77,11 @@
> })
>
> #define WREG32_RLC(reg, value) \
>-do {\
>-if (amdgpu_sriov_fullaccess(adev)) {    \
>-uint32_t i = 0;\
>-uint32_t retries = 50000;\
>-uint32_t r0 = adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] +
>mmSCRATCH_REG0;\
>-uint32_t r1 = adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] +
>mmSCRATCH_REG1;\
>-uint32_t spare_int = adev-
>>reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_BASE_IDX] +
>mmRLC_SPARE_INT;\
>-WREG32(r0, value);\
>-WREG32(r1, (reg | 0x80000000));\
>-WREG32(spare_int, 0x1);\
>-for (i = 0; i < retries; i++) {\
>-u32 tmp = RREG32(r1);\
>-if (!(tmp & 0x80000000))\
>-break;\
>-udelay(10);\
>-}\
>-if (i >= retries)\
>-pr_err("timeout: rlcg program reg:0x%05x failed !\n", reg);\ -} else 
>{\ -WREG32(reg, value); \ -}\
>+do { \
>+if (adev->gfx.rlc.funcs->rlcg_wreg) \
>+adev->gfx.rlc.funcs->rlcg_wreg(adev, reg, value, 0); \
>+else \
>+WREG32(reg, value);\
> } while (0)
>
> #define WREG32_RLC_EX(prefix, reg, value) \ @@ -125,23 +109,24 @@ } 
> while (0)
>
> #define WREG32_SOC15_RLC_SHADOW(ip, inst, reg, value) \ -do {\ 
>-uint32_t target_reg = adev-
>>reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] + reg;\
>-if (amdgpu_sriov_fullaccess(adev)) {    \
>-uint32_t r2 = adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] +
>mmSCRATCH_REG2;\
>-uint32_t r3 = adev-
>>reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] +
>mmSCRATCH_REG3;\
>-uint32_t grbm_cntl = adev-
>>reg_offset[GC_HWIP][0][mmGRBM_GFX_CNTL_BASE_IDX] +
>mmGRBM_GFX_CNTL;   \
>-uint32_t grbm_idx = adev-
>>reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] +
>mmGRBM_GFX_INDEX;   \
>-if (target_reg == grbm_cntl) \
>-WREG32(r2, value);\
>-else if (target_reg == grbm_idx) \
>-WREG32(r3, value);\
>-WREG32(target_reg, value);\
>-} else {\
>-WREG32(target_reg, value); \
>-}\
>+WREG32_RLC((adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] +
>reg),
>+value)
>+
>+#define RREG32_RLC(reg) \
>+(adev->gfx.rlc.funcs->rlcg_rreg ? \
>+adev->gfx.rlc.funcs->rlcg_rreg(adev, reg, 0) : RREG32(reg))
>+
>+#define WREG32_RLC_NO_KIQ(reg, value) \ do { \ if 
>+(adev->gfx.rlc.funcs->rlcg_wreg) \
>+adev->gfx.rlc.funcs->rlcg_wreg(adev, reg, value,
>AMDGPU_REGS_NO_KIQ); \
>+else \
>+WREG32_NO_KIQ(reg, value);\
> } while (0)
>
>+#define RREG32_RLC_NO_KIQ(reg) \
>+(adev->gfx.rlc.funcs->rlcg_rreg ? \
>+adev->gfx.rlc.funcs->rlcg_rreg(adev, reg,
>AMDGPU_REGS_NO_KIQ) :
>+RREG32_NO_KIQ(reg))
>+
> #define WREG32_SOC15_RLC_SHADOW_EX(prefix, ip, inst, reg, value) \ do 
> {\ uint32_t target_reg = adev-
>>reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] + reg;\ @@ -160,10 +145,13
>@@
> }\
> } while (0)
>
>+#define RREG32_SOC15_RLC(ip, inst, reg) \ 
>+RREG32_RLC(adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] +
>reg)
>+
> #define WREG32_SOC15_RLC(ip, inst, reg, value) \  do {\ -uint32_t 
>target_reg = adev-
>>reg_offset[GC_HWIP][0][reg##_BASE_IDX] + reg;\
>-WREG32_RLC(target_reg, value); \
>+uint32_t target_reg = adev-
>>reg_offset[ip##_HWIP][0][reg##_BASE_IDX] + reg;\
>+WREG32_RLC(target_reg, value); \
> } while (0)
>
> #define WREG32_SOC15_RLC_EX(prefix, ip, inst, reg, value) \ @@ -173,11
>+161,14 @@
> } while (0)
>
> #define WREG32_FIELD15_RLC(ip, idx, reg, field, val)   \
>-    WREG32_RLC((adev->reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] +
>mm##reg), \
>-    (RREG32(adev->reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] +
>mm##reg) \
>-    & ~REG_FIELD_MASK(reg, field)) | (val) << REG_FIELD_SHIFT(reg, field))
>+WREG32_RLC((adev-
>>reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] + mm##reg), \
>+(RREG32_RLC(adev-
>>reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] + mm##reg) \
>+& ~REG_FIELD_MASK(reg, field)) | (val) << REG_FIELD_SHIFT(reg, field))
>
> #define WREG32_SOC15_OFFSET_RLC(ip, inst, reg, offset, value) \
>-    WREG32_RLC(((adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] + reg)
>+ offset), value)
>+WREG32_RLC(((adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] +
>reg)
>++ offset), value)
>+
>+#define RREG32_SOC15_OFFSET_RLC(ip, inst, reg, offset) \ 
>+RREG32_RLC(((adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] +
>reg)
>++ offset))
>
> #endif
>--
>2.17.1
>
>_______________________________________________
>amd-gfx mailing list
>amd-gfx@lists.freedesktop.org
>https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists
>.fr
>eedesktop.org%2Fmailman%2Flistinfo%2Famd-
>gfx&amp;data=04%7C01%7CEmily.Deng%40amd.com%7C5418b86bcb4042c1a
>b1c08d8f404c823%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63
>7527648681476268%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
>LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SIC
>r%2FbhwrejJzpuhJmsnJiu6TP%2Fvu075po7%2BJ70Foec%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C1506b6df5d124f715d3e08d8f4d37f4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637528536512044976%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rxuB%2F5If9Ij%2F03h9VxU2tJcB4FdslLePEYSGu1jet%2Fs%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
