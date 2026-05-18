Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGffM1gCC2qJ/QQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 14:13:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2DD56C5B2
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 14:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312AB10E7D9;
	Mon, 18 May 2026 12:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WRvaQRVy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBDC10E7D9
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 May 2026 12:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybSMWrHIn3OtDXpVGVggn9OrW8GuhaCa7YeNvgVZIhjoML+toAAMTBH5ZAFU1cm7fXsldYacu57h67ZgaLWBTtbzQQ0+/CuWiG/UQQiSd/q6giXV9x1HcYyPj5cjtTjjC+n6wn8TfXUayiGziydqTl7+MP9SkbBnr3GfbwnF4G0nujIb5Fld+kkCEkmbinofVLNz08laHuwKQGmX1AdJUK46ZaBKWsrZCEOv1gc7re8OYy8yz/Yqb5fp5bCS9V7ZxB3aYHEQ5KYros57iHygUjaQXEKnCjLSYWeQdSxO2cKZIiv8c6xOF6/Part/mYv3lEvgsMXrh2cE2QmfK7f61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zujb1pThTZgP39Gl0iRTxTOU0x6488zGBycQPvvo30=;
 b=TxGCipxmfY5Jcm78wkCMBt+so0q/6nXMtx0JLiuACuKx9+kEAhVOqm/3vReK00RClOE0M84Y2zy838st2jBLnj5iIOvcfhfoTzYD7vTFDdyMlxmioQJAZpoQBUs3OAvMqCZMGkLPD8TXZ8bBvh/RN3UUyNibxSaENLK/+h8NBGzeS3Hwt5cPG/nACX/zqmtTAGc1JN5KHM4mwtJu2L/aEA2rsvsgP6jciNJ2aoeM7XZ3yqLBCuF9rHqVxBfk3lbRxjCtNRXVecRJk7uDrcXElA1YEVjtf2bZ3Bkznv895oO/627W+hOh+CeLLrqKWx3JYHrIz5TsU2vaAsMwdinjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zujb1pThTZgP39Gl0iRTxTOU0x6488zGBycQPvvo30=;
 b=WRvaQRVybyVTZBNCDm9RRONbIkl0Oq+U74AyCNX8bCNrUZxU4qYcyVJueKjaFduwiZk7HOx+1KtTu9qGtZ65YI0kuNPPp6jFFZ3ObqCdMXL4cnBTvwPGCBVPlnNmEHhu1kdOAr7aUy7MoVUuFZ/u+PT/Jp7A00az4uLnzE3L8qY=
Received: from MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 12:13:02 +0000
Received: from MW4PR12MB7431.namprd12.prod.outlook.com
 ([fe80::34d1:4c70:8c65:ed21]) by MW4PR12MB7431.namprd12.prod.outlook.com
 ([fe80::34d1:4c70:8c65:ed21%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 12:13:00 +0000
From: "Yang, Stanley" <Stanley.Yang@amd.com>
To: "Xie, Patrick" <Gangliang.Xie@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Xie, Patrick" <Gangliang.Xie@amd.com>
Subject: RE: [PATCH 3/3] drm/amd/ras: return error when converting records to
 nps pages fails
Thread-Topic: [PATCH 3/3] drm/amd/ras: return error when converting records to
 nps pages fails
Thread-Index: AQHc5pFwKwbLBOHSrEGMFobsr2596bYTsPZA
Date: Mon, 18 May 2026 12:12:59 +0000
Message-ID: <MW4PR12MB7431F6D6A56B38446A75D90B9A032@MW4PR12MB7431.namprd12.prod.outlook.com>
References: <20260518064053.2778626-1-ganglxie@amd.com>
 <20260518064053.2778626-3-ganglxie@amd.com>
In-Reply-To: <20260518064053.2778626-3-ganglxie@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-18T12:08:34.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7431:EE_|SJ2PR12MB8781:EE_
x-ms-office365-filtering-correlation-id: 7a99834b-1c7c-4764-5677-08deb4d6cdb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|22082099003|56012099003|18002099003|38070700021|4143699003;
x-microsoft-antispam-message-info: o3Orja7TewmANkHaPdQb0rJczhSxs8uWuHV0pNcFPcdb8+Swr8RtcHjUj3eCh8jaaODyoDLPRg9faghpv79hHGlhHEF2G3UuevZeQ9E3QGJn4IF/okT7ODIuAbjtiah1h1ksKwShJkZqA/2NTHplGKqtWD+Hq4IXGm8hD7uqkUmdjawO3lP6Wnq8nVnazO7XMvr9pQwp0QVxP2b9RcYnC2S86H8bTXHslObzLg+4n1u+tR/FcBJ713j7lW3fLfS3oZBnHT7CPFW7mj7Wv2Y8bwrVplIObe6FTXgW9VQnVA4qe9vTZRKzUxYnD+DvSP6iXUeyAG4nnS5feenOjtnJxDo0zY3Kj9cZkdwLi7ZM1d4LeEfAGvYMTzg0l82OPGF1JvYSOOSZKFtO7+YQXVF+SfZkB7lLLASwE6mEv+oxKoDcIl43OBSGrl+5sIpOPaAdcRvkZhBqZzKWt2srHJYiyzlthRr/O3XcMqZWlTkuO8sf2lxbWCIhtPzlYwccpaHEC4wLo2697BQQDPkBxyIuGJXSNog/inGF6ezCbcuuh7ErWDr8P6oMjaHU9/NgIAGczenoyioHzjgiUR+XpW28+HJW08rKj1S1wK7DnyDhsmzbkDFi4BLdi4Gw8zpBOa5APVcOuJWQYa75pHq4FBXyVF3mVX3GqqI5q8vA1Wbc7iOWym6JH/K/sjH0Zk8Wagvh0wCLb9kKBTw4mr42vlcoitaFB1gXrdBnYbPyWQIMNGtafyj0J7UAdUooxZ8tBq8Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(22082099003)(56012099003)(18002099003)(38070700021)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XHxKPWLRJXRlw9RtdrtmE83/lDAKK6uqGgzwEqfO/nTwmG3b1+yBlQXLPSF5?=
 =?us-ascii?Q?cnv/0RkkFL7khpmCXcaYn0go/UPOD/E+vjZG+Mdtj893cb9tprVPDY10UVP+?=
 =?us-ascii?Q?B4utRTlbsNvpoVvR+AN0LfYIqc44RK0LmrQZubjWZ/ByCwvC403CZoJWfjz2?=
 =?us-ascii?Q?vQj1MKmRvAGUTj71f+z5plfQFCjQCOkUeQi1v//us4BCSxiGPowDfZdn8dK+?=
 =?us-ascii?Q?ez+YD6N2Hvvu6XCnTB39n37p1wVUlHE0bFjH3W5yNDu4cMc6jUomR5PSLSoD?=
 =?us-ascii?Q?Fhc8eiR7OfFiapHHY9aJr4WP28dPUyXPdANykwKT1+6zy2f39YEGQDgqmbkp?=
 =?us-ascii?Q?w19zHfuDn9Xg+giZiWgIB/9MMzzMVaoVw1kdJKrH8sWpECL10utktQfNTcRx?=
 =?us-ascii?Q?AYPIRF4P9MuGmuM4vAgt6Vr1fIsb2Q+pNUFQaufPU8Fl+3LzDaeOZVUR/AGH?=
 =?us-ascii?Q?NzPAwofDu7MGcow1H2uETGqSEXtC9PARdawgepBREWAXuH8+xj8mHMkWgC8u?=
 =?us-ascii?Q?RazdkjVVbJw1iBNlSfv8gMeJgtNUWvAIFp868P2r2b9gd0GddATshcPDi27P?=
 =?us-ascii?Q?WRQhCVOEM66oSyczOc2xyhgPn+GgZdG2pOuIcvCC1ZbziiFpzCXtvsJ/kNoS?=
 =?us-ascii?Q?lpy9jcmsigU38VD8lpergRThHqKjXr8QKRMLiUoerXwSV4Xu7SK9S3RxuB85?=
 =?us-ascii?Q?xEwc7JohXpEySkrGIxoBrJTvEeG1Qi2mYekTUubo4310ovszBJwO5fmWKAxx?=
 =?us-ascii?Q?0YMYtYBdhxsdDk3Uy6mcfFHbF0u3P/XodcP+hchNKCpF8+ViL6iCm9/7b/L+?=
 =?us-ascii?Q?VsagaNgS+Ma4kfXyZuc+5+/ZJBa3j/98sE8kjFBbj/luE209qVn8dp5xu4vW?=
 =?us-ascii?Q?mJVGIYDwPaWb36PzUiMTTba6lWMoDxSh8UPdlaCUo9EU/k3IEo0x0QekfZWx?=
 =?us-ascii?Q?MFpDGnKndx8UrbjV+BENJEQyiJJiw066aaan+Wk0Hie4nK5tkimLpe193TiR?=
 =?us-ascii?Q?JwVkPP7Z5Jkczuw2JTXwBnQoJ70OF6G54/l/qAoUnjDqDy7XkIELf7m4lLl7?=
 =?us-ascii?Q?mbetTHCUR53crjwIjxmQzJ9KyvdupU/Km9IUIt1Bb0WBg9q7F0E/mSaAg3Wh?=
 =?us-ascii?Q?EloSpfE54L4ugIvv3FYqDlt/4Y5bb5H5uxyFRebnkYfDzxVzdlMuUtON/2EG?=
 =?us-ascii?Q?n42WLF9IuZnyQNhNKSMHo42D6XgT675U+ZFcJTrMquhoSHYauOtMhdjVorKP?=
 =?us-ascii?Q?3Q6thDjvxPp6CTOFwhTdav9YD7fEr9qs4lqptVfoDnhaGj+HXeF9IFVsuc33?=
 =?us-ascii?Q?RVkhM9gDLMpFhV9gkHwWL779xhz259uk+T3XBhMpzxu3lKB64OCjPWEz52ge?=
 =?us-ascii?Q?xJFtG6dvSu1JjKu0CWutIqqSn8/IhuvMAEkprxhAvfhuraQC/Ga7IgJQtmyT?=
 =?us-ascii?Q?j5EJu+zfFYaipzKHV3njIeymUl8IlA1EOMcNZhHMik/4V//mtJy4WiZwnMfr?=
 =?us-ascii?Q?8BD+5lc/YLvCtqxYyiGsgU3qLvbK7Q/XozRYNYqkXCtHE7PkFDtRlEtmjCh1?=
 =?us-ascii?Q?eHKkKd5sCpmcECMoDVEA0Wa44il0k+jw9Srg1YuSRJHEkPiXLjxSoSerKdvH?=
 =?us-ascii?Q?gWbpm3iZarq5EilqWZk363Ic4veGKUIpe4q7grYhzBdlWZO2PSdXwW/4t1WX?=
 =?us-ascii?Q?hBbMpgw+D+OMuM4aA9CET2t0mUqLUI93FFjw5TtECRH+0B5a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a99834b-1c7c-4764-5677-08deb4d6cdb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 12:12:59.9853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPTFZalGr1pApFqTz0fWERipO4hzziZ3i1LtwMon2PzNwVSRCM1cxdSINuotjMBKIRyORrm8d+yqWfcngz+fTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
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
X-Rspamd-Queue-Id: 3C2DD56C5B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Gangliang.Xie@amd.com,m:Tao.Zhou1@amd.com,m:YiPeng.Chai@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Stanley.Yang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Stanley.Yang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

AMD General

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Gangliang Xie
> Sent: Monday, May 18, 2026 2:41 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Zhou1, Tao <Tao.Zhou1@amd.com>; Chai, Thomas
> <YiPeng.Chai@amd.com>; Xie, Patrick <Gangliang.Xie@amd.com>
> Subject: [PATCH 3/3] drm/amd/ras: return error when converting records to
> nps pages fails
>
> return error when converting records to nps pages fails
>
> Signed-off-by: Gangliang Xie <ganglxie@amd.com>
> ---
>  drivers/gpu/drm/amd/ras/rascore/ras_umc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
> b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
> index d4072350f48f..78db402182f7 100644
> --- a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
> +++ b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
> @@ -391,9 +391,8 @@ static int ras_umc_update_eeprom_ram_data(struct
> ras_core_context *ras_core,
>                       data->space_left--;
>               }
>       } else {
> -             memcpy(&data->bps[data->count], bps, sizeof(*data->bps));
> -             data->count++;
> -             data->space_left--;
[Stanley]: Is it reasonable to ignore current bad page directly if handle r=
ow bad pages failed?

Regards,
Stanley
> +             RAS_DEV_ERR(ras_core->dev, "Failed to convert record to nps
> pages!");
> +             return -EINVAL;
>       }
>
>       return 0;
> --
> 2.34.1

