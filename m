Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002678D8AF6
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2024 22:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7E210E2F6;
	Mon,  3 Jun 2024 20:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cf23q1ow";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D53F10E2F6
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2024 20:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUmqrqq45KBAu5NodX9iVqUX0SPYAcILC6PYF9AMNFTkkZ/dHaAk0hTdfUB17FA4hp8BGcBxQwblKgAe5GBC55x6BAPy9T9B2F7PjZ50QWCrNT+BH5ytruHUuU2Gd8y2IQQISc9cMYdklg9czDaMUUMYZbjTV7IA1Ft11a84tOchfzBefKchskv8MxPx2usr6f24Z5tYWslgw++73xPa/pZZGoHHA6Poov/ftZTzv83cTDvomRFLbt3U86KEdi+AOdIrHQjUeOgIm2WX9pDcqQx0an5cqcYywMD155K4SsbZ+u1mVHRKlzETNZG+53zermcqP7WY/+9vFamsR0t0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BRCfy5etHd2CQGBJBfto0SEtNW5tJFr3z73A3vCLrk=;
 b=ReF3KvVqpFN1HCq6eQPlmjEka70KxLznHJD4eXN0/j2BlAed8qUb7lLZ5EZ/vBiZFg0DhNQ6jD3uYJO7EDEBIWGTMwFVBlhZ8paxl9bo1vsQQCJDJaYpene0sr7Q1NtrK3zVo63U3zuT6D/uuwLq1AoJR31JYVJFROofhf5LLWAWpOBpTejzd0NQ2WaW2y5Hg/b7HmVeYjlVCw4vM4mibtT/dIewmzbPEa+Pgh4CTg4R80/uI22qIKlRJJBHIF2lYrjc5eIq+XobO+ffLb7/dJ4LiW/ubSjyG0j49uJSIa7RcleSTNZrBATt94xPZwNoPYWDh66le6QROIYWEzqtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BRCfy5etHd2CQGBJBfto0SEtNW5tJFr3z73A3vCLrk=;
 b=cf23q1owpn+Bo4s5G6lTo8A/IHVHp5GnnU4bVRyzxT8ojF+6rc8TpYxzpk9u33QH5FBhm/NfAMFV5uCnYJOf00RyUe3J2/qgAvBk9C6ggBEIvsipGSAuQo+6O9ODFcaPDARirp2VcQgibX5ttKq5LPtSjYTFVKDCUcoSAe8iLe0=
Received: from CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 20:36:53 +0000
Received: from CY8PR12MB8193.namprd12.prod.outlook.com
 ([fe80::9edb:7f9f:29f8:7123]) by CY8PR12MB8193.namprd12.prod.outlook.com
 ([fe80::9edb:7f9f:29f8:7123%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 20:36:53 +0000
From: "Li, Roman" <Roman.Li@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Hung, Alex"
 <Alex.Hung@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/display: prevent register access while in IPS
Thread-Topic: [PATCH] drm/amd/display: prevent register access while in IPS
Thread-Index: AQHatcNXFmsnBI00P02oRGLpfbmOS7G2f4fg
Date: Mon, 3 Jun 2024 20:36:52 +0000
Message-ID: <CY8PR12MB81939EA05C86FB03C7883B5289FF2@CY8PR12MB8193.namprd12.prod.outlook.com>
References: <20240603143505.75910-1-hamza.mahfooz@amd.com>
In-Reply-To: <20240603143505.75910-1-hamza.mahfooz@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=9dbd166d-436a-4860-aba9-d97d2693f061;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-06-03T20:36:39Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8193:EE_|BL1PR12MB5852:EE_
x-ms-office365-filtering-correlation-id: c8012268-b2f0-43a7-6a91-08dc840ce6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?dbwzOptICTKHbGJ/entpg6SI0WtF3KXJh6gMCCpqM1C9mkvvl1h0rlUTKUzj?=
 =?us-ascii?Q?AM6L/MP0NqEiqIKf7NQlawRXzY4pL0GWenpLWkS4SLltZTWsIKjZIHVva1mp?=
 =?us-ascii?Q?mi31oAH5pWXi3sc6Borm/QqKjxWiA8vTBymQ8CyBjkcdeCw4sPAq9V7H3bJs?=
 =?us-ascii?Q?D0/6Urdxs1501Z0AOEElHVcvctNWuCH1oS6fKHCiI1SOmXZbURLpaxiqyj3M?=
 =?us-ascii?Q?4ib6+DBo8U05gEMY0w3Dfr/G5ffQbUcnzT88a5OXEvahsPQgVPgNxGr1mNPP?=
 =?us-ascii?Q?Bvi/x6UZHiYMtN1cM6Mt1iIgxTQCbJg5c905NhGN+F6mgr/xON1y1DuVVj9d?=
 =?us-ascii?Q?8AmjVSCpeY6i8Y16Tfiym/Rwgub56VWl+Cmzo9aC0hzg9XrWZPORw65MwW0t?=
 =?us-ascii?Q?e2w0bRNw5GAJGKazsV5bE7wHJB/Ass7vJsuIDkO8uRmS9m0FvlHcVqWcXL1Z?=
 =?us-ascii?Q?fIJjV8ZufCUzQ0mEvpvII99ZUtSLp/a6pSkzFnNOknw74vd4RCdQnfqiJMND?=
 =?us-ascii?Q?piW232Z6BkaMnH9r3payptrStpQSipSZtzQgw9VBWiOSOEJGMgr3vShTz8/D?=
 =?us-ascii?Q?LpZnVIXCBEcxRqPTFzlx2gzLqd/7i8ffrXVy2lJtRI8ZdnqKh20zDo1ZGCMy?=
 =?us-ascii?Q?9MbWugDQ6oBudGFg+Tp651SMfVP8Eyeep2aqokg3FIUwHrRodI4YN/fCdBMz?=
 =?us-ascii?Q?90twfDH9Mjk+h5kkYtwP+baiiD7CfkEI+4C3WHT4fH77xQYNkxZeNSvDlEAx?=
 =?us-ascii?Q?z/cUJDjf7Wcdxo5JcLmOlIXCibEE+t5gelO8W76KzoQhNYwby/UVD9iMYwPy?=
 =?us-ascii?Q?qEnRFhWjBKdWeoBQVGoHDOonKWUYK7rydKFRaZI7MCJpJ60H18Dp3IZyjTG6?=
 =?us-ascii?Q?SB/WsFrZLyeeXBbTZ/y1dOi00jE5Moi+JxO9GOxofvU4xEunavjvaUNXFlHq?=
 =?us-ascii?Q?BjCSacqIY0BH/hvb5DOgn4b9c2ubqZdhrsGEB+7zey48k645GI94LocDQdgc?=
 =?us-ascii?Q?OFqTCi6h/hWA1L+aNrKmWfLDdRGrtjK1sXnHwf5uHdfL7MTVde1o2JqDk98l?=
 =?us-ascii?Q?uyO+BwsijHVpAMzRi9hdWV0kfejA8fFAwPtEKOYI2p/hxeAe6SSx28+VzZHE?=
 =?us-ascii?Q?6GFQxRPMo7gtdfuNXoLPADmTjQtl9igkAkJ/znDySfAWvsfjim5+n7Jw9sXt?=
 =?us-ascii?Q?Bqoatjise7YrYQ5B1BV7sXPjMXAd/WO+wSGreDZ06oaDOXW04QZS6nxsMV/S?=
 =?us-ascii?Q?LRBTgHtPY2c2O6cc6L8qD4EnDWh/VEvPnsH4t5QA1jFgxrtmL3nH+bq00PP6?=
 =?us-ascii?Q?H/EWXd3HDkbPVPqUj+k9xi1GX5QGqEknYsb8jXRupYWG7Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB8193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0qbtYK2mtUNm7qfFzw2X29+OUPzkH/a9bFC1aXiAatk4Wc8Fzzp9fBKenFu8?=
 =?us-ascii?Q?OVTCc1Q7RlelDgw9k0wlDNnHr5GhZxQ238VPfSUnf36BG5XZzPXdAJ6TiPzD?=
 =?us-ascii?Q?3s36lViwuujg2Wi6UI/04qZY/sJTcolzFTmZ+YCnt/O4niULdx8mqSSG3Kl4?=
 =?us-ascii?Q?pGiPm5k9dkYFzR8wta//Z74ec/i9a0BIb/z+bhgmAaeLoPzh0113YthmZF5z?=
 =?us-ascii?Q?fSD0YbKAytcOgMditTWehP/x1enheLUl4MHwIIiLx5/WXpm9r6CrTAmbuBWc?=
 =?us-ascii?Q?gPQXnzSZyuHIV6uziwzGKcEXLcYRBBh91aA9oc5GG4An/9JwFeNY66OA9Rlx?=
 =?us-ascii?Q?Pg5YUA6EBVDnmhGxsyQGGfGBXbS87wyNILDB8Pg/pa+8rmbqxwCwQYQGupDP?=
 =?us-ascii?Q?pI+dj8ubj8lnFxlfN1z92FC6Ll9s9EGFPcJaurzeTvYjo++r0PHS/0nA10h+?=
 =?us-ascii?Q?5s3/P5CkMRhQCnDbKEB3nJiww2l5NL9wW14Bk/dft9tSNwA7JtTO8N1TY3ND?=
 =?us-ascii?Q?9A1R9afBYzTluIOMnO4z2O455wW7qWxOmMKQoP0uBauwsq+0bfRgZJYigAXw?=
 =?us-ascii?Q?bCYC7prSnTDQemEV5+XGFX9CK8OTvUaQO1DYE8vD4NJNXVKFfR7JbjfR3BRa?=
 =?us-ascii?Q?8cvLqdpxGbaZ/HIzVI+aHNPjLWYqcpYaYC5ejd4lzG6sdLZHgzoS48i2IvCX?=
 =?us-ascii?Q?3ylPNfeM7mCHA2EEK8ytvE6B4vr7rGhbrWD8THWe3zKPdKRV8cqeCcmjYXyO?=
 =?us-ascii?Q?TG3/7hquyJK2TJFISd47QzXT2CpzIs9pbzZjcROi97EOMBhCgISLT/vCU7aC?=
 =?us-ascii?Q?VjFsR59Gm1ZpvzddWzG1Pa8J6RKZrq8yTJLvMT071tjpJMhgDNX3ZRidk/u/?=
 =?us-ascii?Q?Trt6qyQTZKmuGkDv9OF9gRbU4Vau8tFKCIKTdrvwUL0pjSUFyapkyjLTaLAE?=
 =?us-ascii?Q?1RaQDIGlKAtNH4ebNPJC5iLUxh/ePYsZz6zC/qxhfel5AeAY31xTT/M2KEHY?=
 =?us-ascii?Q?P1TOq9dJzY55t06z/8CasGExQF4REZ7cTBAdVUWh8Sxj1ZDCXrbqUdIaVyR5?=
 =?us-ascii?Q?5z4dWzkrCIPV1tG21iE8zQ5I/XtsGUkdSYJJVyfanmv1JTRwRFPcCYUaWBec?=
 =?us-ascii?Q?dKnmrXMnWuV9yg+pWzYtMUpDLr1rNKNkDQa3rgsvIuxkhmPJBwu8DhQK6bUI?=
 =?us-ascii?Q?I6mekthREkdL6uyM5fcaOS5HCmTZa42NxscYwq6/2dYnrO9x7DCnHxXVxsL7?=
 =?us-ascii?Q?h5AekNKVmX9q2+8OK0qfo9yko+RKg3HUEH+CUVqoVMJHWSsXMYgxR0ztfXBS?=
 =?us-ascii?Q?155er2qa9FubzpgCqFjuHLNrSTQmFnk2ByZTVhfzaJh77n5FoWCOQQSyrjOJ?=
 =?us-ascii?Q?wReIHNtDN9VEuxPxH86sD07/nSvsCz6sLI/ZfNu3de5TYHyDzND8qDHb/+jW?=
 =?us-ascii?Q?sPGOysGnoZCWPtv/lui4or9dvV/or/e16iwDRg7e8u4OE6XEZrgPGWznyviy?=
 =?us-ascii?Q?7olGJtaYkUxRetqMtvtnQ88NlzjNyHj5ZCSL6P6Ps9fZy8U2wAZ3b0AL4nVm?=
 =?us-ascii?Q?c0JAbFv1TozIsLB8vEc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8012268-b2f0-43a7-6a91-08dc840ce6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 20:36:52.8861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVHFZ1hBEYyQnR0nx2IcBT7SDFPEM0p9CwFUoBruefmETY20C0rLO9kN21bAav0m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852
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

[Public]

Reviewed-by: Roman Li <roman.li@amd.com>

> -----Original Message-----
> From: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> Sent: Monday, June 3, 2024 10:35 AM
> To: amd-gfx@lists.freedesktop.org
> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Hung, Alex
> <Alex.Hung@amd.com>; Li, Roman <Roman.Li@amd.com>; Mahfooz, Hamza
> <Hamza.Mahfooz@amd.com>; stable@vger.kernel.org
> Subject: [PATCH] drm/amd/display: prevent register access while in IPS
>
> We can't read/write to DCN registers while in IPS. Since, that can cause =
the
> system to hang. So, before proceeding with the access in that scenario, f=
orce
> the system out of IPS.
>
> Cc: stable@vger.kernel.org # 6.6+
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10
> ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 059f78c8cd04..c8bc4098ed18 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -11796,6 +11796,12 @@ void amdgpu_dm_trigger_timing_sync(struct
> drm_device *dev)
>       mutex_unlock(&adev->dm.dc_lock);
>  }
>
> +static inline void amdgpu_dm_exit_ips_for_hw_access(struct dc *dc) {
> +     if (dc->ctx->dmub_srv && !dc->ctx->dmub_srv->idle_exit_counter)
> +             dc_exit_ips_for_hw_access(dc);
> +}
> +
>  void dm_write_reg_func(const struct dc_context *ctx, uint32_t address,
>                      u32 value, const char *func_name)  { @@ -11806,6
> +11812,8 @@ void dm_write_reg_func(const struct dc_context *ctx, uint32_t
> address,
>               return;
>       }
>  #endif
> +
> +     amdgpu_dm_exit_ips_for_hw_access(ctx->dc);
>       cgs_write_register(ctx->cgs_device, address, value);
>       trace_amdgpu_dc_wreg(&ctx->perf_trace->write_count, address,
> value);  } @@ -11829,6 +11837,8 @@ uint32_t dm_read_reg_func(const
> struct dc_context *ctx, uint32_t address,
>               return 0;
>       }
>
> +     amdgpu_dm_exit_ips_for_hw_access(ctx->dc);
> +
>       value =3D cgs_read_register(ctx->cgs_device, address);
>
>       trace_amdgpu_dc_rreg(&ctx->perf_trace->read_count, address,
> value);
> --
> 2.45.0

