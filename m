Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A1B2B8F3
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Aug 2025 07:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E710E10C;
	Tue, 19 Aug 2025 05:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p33GjE6+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADBD10E10C
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Aug 2025 05:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S44pufHKFqXn1D5/EqQ0YD/UCxRJ61L7M4X7E+H7SnA+V0yKd56glMCG0sdcLegXTsoGCcFesEuoAsue7AnXdkCwgzxbY4R03Ehgghe77NdyEez9sEPVK0/ulYg4BRZOeTcHYPL3/8M14agWuIuJtnrRGYpzv12wb52mVys2h/RK+LvJTEL7Lxt7MfFFs+nS0xisndeHdctJ2ecTs3BUtivuBlSnYzHGg1RzP36OEj94Pyw9q0dQ0q2q9dNOfiKdCUBFCe1bbfncBPFngMKwFhcmbM6Lgec0N6NgqTjrm5G9DJZa/lNZY0F4FeWucZ5Pu2Xrc8SQcO4xrXEUIv0y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnwBISr5UF9nn4ICTb9Ld12608YBeqrESxHfI5MsQB0=;
 b=gT3eg4OAGwTNogdi41pjjOphE1+6dYbqgNu9Ll0iIVzaEe/HoRXuOxu0U6fXPL1OgFK5NXhSHcLCPrg98jx+y3qzcWEQR5h8ddLFPT0UK4ukAlERLEzJKdItPM8ZqKaVz7CUXsrBImQUeBFGv0++eULaKscH7Agi1kAbZ/UtAaO1AjdelUYFI0XYxPALE9BUY214qvxcXVd/IkT9566+mxgx3L2tv4jU4JbE69bqGrhyDCglyeRePp7czg0b95Js/RMgwKNPd3kVOulf13zzugO02V582L7O81K3K1f1H0cojiZkSxm8c01hPf/vJfORThTdZKUJYODPjhVyMnkQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnwBISr5UF9nn4ICTb9Ld12608YBeqrESxHfI5MsQB0=;
 b=p33GjE6+GrwAOW94DlybEsiztgADaJDzjVYMA/9V/He+hDyTW3XPKqf4qr3CcO++5ozYoC8qpZTm3Yz+zCfmC58pw9p3Q/BiSHqdHANXAM1by4VG0nTXTUu3LawGTZM/I4uRwwNcTjrc1Rh3v/tyB9K8GjVqn6Wa3kLBb6EMcdk=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 05:50:21 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::c593:f43d:c798:e009]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::c593:f43d:c798:e009%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 05:50:21 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Skvortsov, Victor"
 <Victor.Skvortsov@amd.com>, "Gande, Shravan kumar"
 <Shravankumar.Gande@amd.com>
CC: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Yang, Stanley" <Stanley.Yang@amd.com>, 
 "Chai, Thomas" <YiPeng.Chai@amd.com>
Subject: RE: [PATCH 2/2] drm/amdgpu: Check VF critical region before RAS
 poison injection
Thread-Topic: [PATCH 2/2] drm/amdgpu: Check VF critical region before RAS
 poison injection
Thread-Index: AQHcEMnHb9eQhaVCNUiZtjHvLhyIMLRpeHOw
Date: Tue, 19 Aug 2025 05:50:21 +0000
Message-ID: <BN9PR12MB5257589DCD61DB49E52EE54BFC30A@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20250819052548.124897-1-xiang.liu@amd.com>
 <20250819052548.124897-2-xiang.liu@amd.com>
In-Reply-To: <20250819052548.124897-2-xiang.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Victor.Skvortsov@amd.com,Shravankumar.Gande@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-19T05:49:23.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|LV3PR12MB9268:EE_
x-ms-office365-filtering-correlation-id: 6079b333-52f7-42cb-129d-08dddee4492b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jRyrsOwQz1ni90/runrBv3LMvJ0fEdkYhbog64o1oSA9EB+RWrV1rAY5kXJL?=
 =?us-ascii?Q?2aWvgKB36JzxxlX8Bg1/rQLazodvAYQHfRD8cRqE722KZY8KlgPaOo9ANRMe?=
 =?us-ascii?Q?L3MTJdNLfSjVjL2Go9aNZ9SaQ8qAe8LT7LqqmaKofI+JaYi4jo6opVKJg9ir?=
 =?us-ascii?Q?kZwpHQgWS7xZzjNJ2btC6Y8Etkq+XEOG/RxOnmhWRIOxc1O8OYBdNu4xhUJc?=
 =?us-ascii?Q?E0C1UlpesMI0O2cFy7HYmEbFgo8slgUh69MvxqC6lnTBi1FxHVfEcmnaD/i8?=
 =?us-ascii?Q?QQJ433qDQVCtamH504qe56aqpgCl5ytcq7O8R15X3WyB/j1VVytYpp9Lqday?=
 =?us-ascii?Q?NChuw4ZAv9nTgpP9J2d1Ar7u7dvl6l7FLqYlDkqhFmOJn/A4c5O1kL7RaOVp?=
 =?us-ascii?Q?fvzFUtWXReu/nYx0xjJ3aJ7we+sGWq03LWABcV7cOZuDkcS7JcY4vTamp45a?=
 =?us-ascii?Q?TixIcsbEbjDQOxuecQQ1C9QKjguzeOaiHozfU3wZEb2/zu8VOGKPXlPUG6hT?=
 =?us-ascii?Q?6enzEF88UgX5Xpqfbl0GmcOQS5ix2gzDe3XIGo2KpKIotoh/LkRugmtxg619?=
 =?us-ascii?Q?a0wWcfaxsd/Bmrkx9yX9Al4CubfrWKg26fCLmNrzkKyb0MVEXU52dhF6563g?=
 =?us-ascii?Q?sraJic1rbZKS+br2oAcBFAkp5ETzDfwAAeH1hF1meNtKUvoE/QknjKY1syRS?=
 =?us-ascii?Q?k07xrTl2B+SWcI56SI9w9MeEcacvzRXmmGel2lI0A5BQKm3nXGEEs3HXbuJx?=
 =?us-ascii?Q?gq/pPQhts6zVjdDqOrfk7ZNp/W2U8WRB/SR9kQSUARp87F8XxiS4TZT8VgYn?=
 =?us-ascii?Q?yfCukfDbcIjVVLl9lP8w4yrP/QvbIYrHlc7+MEJqCG+ZHg+fDSEb5HdQSyCl?=
 =?us-ascii?Q?G+kLse8IWEouRAsjBQOmr/Egh5idhKKxOCFjTeKqAamv+F9ChXlmVswWfyg8?=
 =?us-ascii?Q?fW2nwdO87WWmOiVPPDkQCxZS5RbDKn7ur800iVsPBmdCaGhQJ88NQAABTMag?=
 =?us-ascii?Q?LC/QEZ3P4/Bea0Lw2TC3r13/uZwYPSIqKNpx6epg1X2cxmF+7tbAfTrvVrGW?=
 =?us-ascii?Q?c6PGxzt2ufoAAvMOtAPIjjrt0EWnlZoi5q5dc9u1flrdtKvMtva0nzdhIbsy?=
 =?us-ascii?Q?HVZ5CKqrK5LF/RJCpjCOrhuNL+vIokShJjHpaDRj1zaQhcgzPyeCvt/jOgUM?=
 =?us-ascii?Q?nh0IO0ryhdHrmIHqE5zwHfqryF4c7cagE1OtaE6dM6rP0Smfs6dGpFGJ4J69?=
 =?us-ascii?Q?unoODHWZpr96sn8BDjfEH7eaH9zRVEpOeKUYB/1kNKS586aJ0qJNNuesMkwk?=
 =?us-ascii?Q?UJXtO/aWtXNWvD9UKFRo+M8/WwMND3xo+8ZUed4z78CgvIF+K81AxTFd/gxy?=
 =?us-ascii?Q?MhzzlKWZZJUKJsSDGuT/TEc+udmjAD3ctEe8IvOmgDBcZZBYUeCJfQW4jUbY?=
 =?us-ascii?Q?ttX/JpM6YVwcqT6PrjgmzSPxFka9Gg8m5RsECl2+tL+Lo5iej62QqOxdCDnO?=
 =?us-ascii?Q?efc+zJhdKGpidfI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jlVK5moVdaGgwzUT4l4eDifKdO6uQaBLcb14Hbr1ui8ZZWo5YaWs/3NZafe5?=
 =?us-ascii?Q?lrjYTr/XHuROxGqZf6kVaGnUZOu3b59/8RyU0QKOcwL9i358PdgsQVXci0a3?=
 =?us-ascii?Q?DlGzouCsWD6ml4VyTMDTBLBIxV/ZluNYK3hySd8WVtHLR2gLo5Yv9mnsNsO+?=
 =?us-ascii?Q?P1KtBRclREQRWNCo5fnCEN2Ninf+LCNYz21B4CoTJcru0/1TCAD4a5CaH7xT?=
 =?us-ascii?Q?Mx7SUB6un7dn5zSl1Nja1ZIAXnkYsS9xPzmypvry/XvmVQ0kTXAu7b2RwmeN?=
 =?us-ascii?Q?vvnR7MRjFWrbjevsBscFJvlpXmVpExkV4lmGxGSdbq0TeWPp4ojFgMhC4W3v?=
 =?us-ascii?Q?o7jCkymTTXVkaLTnnY5GVTdEiFSTXvFyKdhA98f9MZGE3DwpRAFQuHvZDuBI?=
 =?us-ascii?Q?kjMlGKZ3+KItJXXMgkMxMpBLFC+nYLqnWfjFywddrRBsXIjPKnxmy1FT7o3H?=
 =?us-ascii?Q?G1ct+GCBTcV2TXwNOLg6zmgcnye4y1hmhSIIbhei4tXN091XmurFeydfDNZY?=
 =?us-ascii?Q?mV8DtG74/Nrwdt66oCN/7XXZxyKQtmhUYWyIK/GXjBEOub1mipHkek/bhV+Y?=
 =?us-ascii?Q?xpRTROupOav/QqMkyd/i0ay4siYsmvu8CArraE0EbOWNm+SFfpB0rqAQOPtM?=
 =?us-ascii?Q?7rVpTvxAknlxAkQ7ZmbNSI6X8Dg2piaRq4z1fthusIZMnmxFK5zVJTYNCuwr?=
 =?us-ascii?Q?ow+6Z4CuvJZDLIV1aaaHkELNoMOr/qnNbRFdwVjnLJHvbeLtOdW07l4xjQGj?=
 =?us-ascii?Q?V5rC2T8m7/EYqIGeygEvhpF5ZFhmJU6SmkAKwIecAtBRQblGg5B0/LKytP0/?=
 =?us-ascii?Q?wNiS2FU7ukHES/DsCcQG+Asqt5p8Ni2EYFXRkHWfkoKCpI2LZhT+rNjRIMdr?=
 =?us-ascii?Q?y2kz+aji8SHtfFde5NEiFCy/6X43p9wMe/6mWm7TdIZboJ7ziVTRpA5wSr+n?=
 =?us-ascii?Q?phyncJ2I5I7RBQz2EIFNJWIPhFK4G7YzL/mBZ9/xsMv39wunHH4uIadI6kvK?=
 =?us-ascii?Q?XSdew4hNgSrqGr2fY9JAzoLj5Cg6Hrgdc0H0mBDd+63HE02HJfVTQzc1wtfh?=
 =?us-ascii?Q?8hdjtz7uIyW0mqH8BP7fSjQguHAyNb9tlsOB0/xTBHSBm9oLrpgyfN3NqF4Y?=
 =?us-ascii?Q?yr76uvIbNlruxGd0iZytfXcSuIYr9D6y3QPMXOnZEJGANznJG7NmpgRWSS63?=
 =?us-ascii?Q?3y3GgWzDMPY4cdS5l6IP3i4KDgcWI3SIpGox77FZ1lR0GEtLinObGIWx4ZnH?=
 =?us-ascii?Q?5lyOqTP1HcRXSpRTwOiDu6AgHhqttNgiR6jBTkgaTysuYC4KaoMN7irpEzIM?=
 =?us-ascii?Q?Ofhe8UHBaPaw184FGos39zxLDIPbJLltp92zwhwO4hAdIGBFu8D+iCAC9zb1?=
 =?us-ascii?Q?3bvG6wkc4MjBfi2ym2K2eLlNxvaMniUNoDDwsbshjvqTQkGrMzAFRYx5DEoD?=
 =?us-ascii?Q?6MgsnsIoTnOKAIiWtm9GVefCyQuBbd0gTGJKKv3k/fM+niGxE848Ezm5sb9l?=
 =?us-ascii?Q?v4d2MH6IXY6ZKU12yp1Kx2m4LbQRFAxcwRwWnZ9Ki9Ab7UofIcNG5jvKsonV?=
 =?us-ascii?Q?a0hlBD/cHgn9n4T4W+4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB5257589DCD61DB49E52EE54BFC30ABN9PR12MB5257namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6079b333-52f7-42cb-129d-08dddee4492b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 05:50:21.7722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zk9GLc2KXNAIktiYGyh0GszZmZHgTtvWtC+4N4HBEADvgo6pYfkfN8QR9AtCRayf+ajwSCFTJxIt3sL1l8QzHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268
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

--_000_BN9PR12MB5257589DCD61DB49E52EE54BFC30ABN9PR12MB5257namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]


+ @Skvortsov, Victor<mailto:Victor.Skvortsov@amd.com>/@Gande, Shravan kumar=
<mailto:Shravankumar.Gande@amd.com>

Hi Victor/Shravan,

Could you please help review the code at your convenience?

Regards,
Hawking

-----Original Message-----
From: Liu, Xiang(Dean) <Xiang.Liu@amd.com>
Sent: Tuesday, August 19, 2025 13:26
To: amd-gfx@lists.freedesktop.org
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>;=
 Yang, Stanley <Stanley.Yang@amd.com>; Chai, Thomas <YiPeng.Chai@amd.com>; =
Liu, Xiang(Dean) <Xiang.Liu@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Check VF critical region before RAS poison=
 injection

Check VF critical region before RAS poison injection to ensure that the poi=
son injection will not hit the VF critical region.

Signed-off-by: Xiang Liu <xiang.liu@amd.com<mailto:xiang.liu@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index b00cbb927ca8..6730de574fdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -219,10 +219,17 @@ static int amdgpu_check_address_validity(struct amdgp=
u_device *adev,
        struct amdgpu_vram_block_info blk_info;
        uint64_t page_pfns[32] =3D {0};
        int i, ret, count;
+       bool hit =3D false;

        if (amdgpu_ip_version(adev, UMC_HWIP, 0) < IP_VERSION(12, 0, 0))
                return 0;

+       if (amdgpu_sriov_vf(adev)) {
+               if (amdgpu_virt_check_vf_critical_region(adev, address, &hi=
t))
+                       return -EPERM;
+               return hit ? -EACCES : 0;
+       }
+
        if ((address >=3D adev->gmc.mc_vram_size) ||
            (address >=3D RAS_UMC_INJECT_ADDR_LIMIT))
                return -EFAULT;
--
2.34.1


--_000_BN9PR12MB5257589DCD61DB49E52EE54BFC30ABN9PR12MB5257namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:10pt;">
<div style=3D"padding-right:5pt;padding-left:5pt;"><font color=3D"blue">[AM=
D Official Use Only - AMD Internal Distribution Only]<br>

</font></div>
<div style=3D"margin-top:5pt;"><font face=3D"Times New Roman" size=3D"3"><s=
pan style=3D"font-size:12pt;"><br>

</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+ <a=
 href=3D"mailto:Victor.Skvortsov@amd.com"><font color=3D"#2B579A"><span sty=
le=3D"background-color:#E1DFDD;">@Skvortsov, Victor</span></font></a>/<a hr=
ef=3D"mailto:Shravankumar.Gande@amd.com"><font color=3D"#2B579A"><span styl=
e=3D"background-color:#E1DFDD;">@Gande,
Shravan kumar</span></font></a></span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hi V=
ictor/Shravan,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Coul=
d you please help review the code at your convenience?</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rega=
rds,<br>

Hawking</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">----=
-Original Message-----<br>

From: Liu, Xiang(Dean) &lt;Xiang.Liu@amd.com&gt; <br>

Sent: Tuesday, August 19, 2025 13:26<br>

To: amd-gfx@lists.freedesktop.org<br>

Cc: Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Zhou1, Tao &lt;Tao.Zhou1@=
amd.com&gt;; Yang, Stanley &lt;Stanley.Yang@amd.com&gt;; Chai, Thomas &lt;Y=
iPeng.Chai@amd.com&gt;; Liu, Xiang(Dean) &lt;Xiang.Liu@amd.com&gt;<br>

Subject: [PATCH 2/2] drm/amdgpu: Check VF critical region before RAS poison=
 injection</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Chec=
k VF critical region before RAS poison injection to ensure that the poison =
injection will not hit the VF critical region.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Sign=
ed-off-by: Xiang Liu &lt;<a href=3D"mailto:xiang.liu@amd.com">xiang.liu@amd=
.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">---<=
/span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> dri=
vers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 7 +++++++</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> 1 f=
ile changed, 7 insertions(+)</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">diff=
 --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdg=
pu/amdgpu_ras.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">inde=
x b00cbb927ca8..6730de574fdc 100644</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">@@ -=
219,10 +219,17 @@ static int amdgpu_check_address_validity(struct amdgpu_de=
vice *adev,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vram_block_info =
blk_info;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t page_pfns[32] =3D {0}=
;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret, count;</span></fon=
t></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool hit =3D false;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_ip_version(adev, UM=
C_HWIP, 0) &lt; IP_VERSION(12, 0, 0))</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return 0;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev)) {</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; if (amdgpu_virt_check_vf_critical_region(adev, address, &amp;hit))</=
span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EPERM;</span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return hit ? -EACCES : 0;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+</s=
pan></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((address &gt;=3D adev-&gt;=
gmc.mc_vram_size) ||</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (addre=
ss &gt;=3D RAS_UMC_INJECT_ADDR_LIMIT))</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return -EFAULT;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">--</=
span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">2.34=
.1</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
</span></font>
</body>
</html>

--_000_BN9PR12MB5257589DCD61DB49E52EE54BFC30ABN9PR12MB5257namp_--
