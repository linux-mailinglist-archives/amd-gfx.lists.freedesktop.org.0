Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SpnJI2zVHmqAVgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 15:06:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66962E48A
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 15:06:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=HdWN49mO;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944810F0B9;
	Tue,  2 Jun 2026 13:06:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881BE10F0B9
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 13:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAqnk+phw+e34WYsuaS7YU+4l0XrCqJv0rc1c6e0ER3drow5JXz5FOhRBYyIsflcx+MAE6MMN3h6yErD4Jfui/lAy8u53iFAoTxgOQHt3acqBf+6v9NEnceuq+We4WAAUzNq8Lh/nUEBudn9OiX/yy8PVw0iuLgo343Ml/NG9pqs8fkciEA3VSL474KjJ5RyNtbhlMAmBNnAnytxPuCHZFCqFztfyqVtx2O5NGVp1nHYf2ZHuB0tGq1pqfjmHXFXHl2BravfcUcQuk1aSqS3JXdcdRbzp7pn2ViI23es5hV6erweZ6P5H1PO65fuCFTSpRNlwqd5/9OBMEua+6tUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ip6cDSSwJg6EnOvx8HacxBjPTUsuxIsmQLsC8FR3dVc=;
 b=yiRd5mE2Ah0xj+zgChJAjFTwoHDYjhmVz1ZlCPawZA0W7fOhOH5UgiSUoVh7HTYE8NRH6FjbjPlOyjZKbjUU/ozEtAQGGPL2Mnu7iiTAyLD87pSGAWLvu/3r27Lelak+B36dTz9m4QX7Grsm+NPFTjJp7Hf0SpeQSyyPumU2fBFQlQfrDxRQ0Cxrk0J/3+YHYUDnS6exKyPbYg/Fou1dbUJlhxBbI11BheJRqh5Hjz6a1LXtLMTd1O4XaaONtyQI6Kv72/J1wgMACVDeEAeGAiJSUlK5ZrZpRbzAvbss9dymPPscRuIJRatvuUrNn89c+6Svm+lnTyWoyZEpLqvBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ip6cDSSwJg6EnOvx8HacxBjPTUsuxIsmQLsC8FR3dVc=;
 b=HdWN49mOq2Pov/zA3QcHO3ldBF3ck8u/tA8GTjr28juPOPuPQe9dOdjrVzh+1ydkXKC1fbZrY6rkJebSyOsGfCy0fug3sh4TYGXv2yrwCgWrJM8xZX0aFFDHrDgH46CU4FkXPmAEhybicDKoihTx4oZMhzkY9CoIRm2TXhVRlYI=
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:06:46 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%3]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:06:46 +0000
Message-ID: <f9d4a3ba-1b9c-4a19-8d34-bed73f1dc5ff@amd.com>
Date: Tue, 2 Jun 2026 18:36:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amd/pm: smu_v14_0_0: use SoftMin for gfxclk in
 set_soft_freq_limited_range
To: Priya Hosur <Priya.Hosur@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Cc: Pratik.Vishwakarma@amd.com, Veerabadhran.Gopalakrishnan@amd.com
References: <20260507080137.841442-1-Priya.Hosur@amd.com>
 <20260507080137.841442-2-Priya.Hosur@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20260507080137.841442-2-Priya.Hosur@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0276.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::19) To SJ0PR12MB7082.namprd12.prod.outlook.com
 (2603:10b6:a03:4ae::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 20dc682f-12a8-487a-8593-08dec0a7cbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: btJwRA2vOx0mjia7vNzZis9ZPYsM9yBumiCBDV307KFoBtpr0vQMyTZ4cx6l0ZlBO8updcyIBcASU3SvZOvIf0nIIY3hB1gO3HzjK23n9C17vPCRnbi+9Ku5XqU/AKhEKoIQwFWvJi6f4bKJsE5JIJ77iLLfTNQfzbxrXed0RycsDZck/UagKC7FUwzxEUqrxnEYOIj7194C2FRzM8AJ2setj9waGZVJNGe2MrMrb+WCHBmJoV+EaKWBwZVHAd0QLA1yatHOsLxFXU618G5B/5h52yKzPRJEcuQo+02zrjMoNTXFu8ojDBJoUUdG4Hp8U6/aT2SvCl8/fj3qZWMP8CGA6eccE4DyNo6EG3cgOsG1KsMih50BltCmCOyfjATsxezGsW1Cszjydo29SVjY8yGrVau0A5njBuCukqyEAY19ewiB0B0lzUZzXqVeJCL+B/oKn779C3YT5DAZOSxpL+4Soby6xYZPxZPYOQJY6XHorpin3Xt4WmKd+6WB4ch9oLjluHzmamSnMCcxgZpAwFdq5AI+MFnLy7N7JAapFwxvpOPsJun9bEOsaeMbBze+hL1IdHBkYVJxtyGkGt5ABD4tLH0eUf2jyTSn9NGYe6YLcTrwplkJbbJRUwvKAqw6y9g13M1q1ZWbw/I7+/ImFAcE7bZRm5tEFFdrWYj5KwKDdm4YJBdouaC/5zhGKKIG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkgxZVdyQXNjQmd6OUtBV2EwN1ZwZjdLbDhBT3JaMXkyM1h3U2dUZGRtK1g5?=
 =?utf-8?B?SmJ2Q1JpYkhKQmpiNXM1UjFLamVsMmE5Z0ROVEVlUlNIMFhybjVSdVNpWjFI?=
 =?utf-8?B?WFU1RnJDSFd6ZEtKS21mRVAvaW5LWDBSN0tuVWNkTjEwVm9tMnZnOWhlRnd4?=
 =?utf-8?B?MWNaSy9wOHFXT1hhNmVheVBwQ3FkMFNKNWdweXl2SG4rN21GdmRXaU03ZzdU?=
 =?utf-8?B?OFNsKytoQ2JFZldoMHk4dDNwZ1Z1S2FUbmVodjFMdnU4MG95S0JYWW5XUmFG?=
 =?utf-8?B?dVpFUVF5WHgwUWVDQmlMaFpleHV5TGREZHlCYXNJZE51NXltRTA5VHhRK2dV?=
 =?utf-8?B?cjRFQ2JBR09ld0VXK0FLNE9VTUdJNXQwZC9la0ZIL1JDY29jcTVoR0tVY1Rj?=
 =?utf-8?B?aTErenFvZ3FnTHNZWlBGWUU1ZFRWZmtlcWIxd1NmUEFMQkhhMW1JUGJJcTd2?=
 =?utf-8?B?SkZSSE9EZTdUb0dnNGdsYzR4VXBsZEdKNUdhMW4wcC9FUyt5MCt1TWlNYUVQ?=
 =?utf-8?B?bm84N2tlc3V3Y2JqUDBiV2IwRjVRclhqMldKUHJuank5SW14RmxHQmk5M2Rv?=
 =?utf-8?B?d21CL3JqazhOYnMrQitISnpOcTFkTGF6TVBlT0E5V3Z2bHI1L1FkY0dKMFFr?=
 =?utf-8?B?VnRITHJ2eTc3UkFPNWpSYkRYNXpZdFloeEJmSlo0djJncDRvOVp3bmVFTXdW?=
 =?utf-8?B?VG1wekpEVDRTNmVGSkVueXdEU0twT0wxUFBReG53TytLUzEvdTZOVlFGRWxW?=
 =?utf-8?B?L2RUZzlOOTNuVWVHMHBRZUx4WmJ0VkNXNXZjRDlYN05jOHFLc3RtalFDYkMy?=
 =?utf-8?B?WlJaQUIwTjF3ejBnSWk1V1lNRDNzQ3NJUmxhVkRzS25ITVlSaWhaU0pyUGIx?=
 =?utf-8?B?NzhvWUM0QWtMb2grSzVzM2c3akllVnU3R29pYzgxaTVqUno0STdLMS9PQmlQ?=
 =?utf-8?B?QnFubjJkM2czaW51OFBJOC9NSXRTMWk4ZGg3bFk4a3FWbFdyRi9KOS9aUkpL?=
 =?utf-8?B?RENjQTAvODNYbFNrMm1XOFpqQXRtT1B1eUduYUhXbFhBSlBSZXBkOXROdTNT?=
 =?utf-8?B?bXVIMG5LWmhwNk5od1FySHBmMHlTdnhHbWpieHp1bHdPaGNXaHlaY1VCNXRn?=
 =?utf-8?B?WGFBYkJaNHA1cEpyU0VRTGZ5UWNZczZPRFBuaFlBcEcwdFV0SGIzVVpvM29C?=
 =?utf-8?B?ckhPelhNd2xjQ0xsdUpYWXdmT2ROL2xMWDFTRzFPcURYZS95RG9KbU5vS290?=
 =?utf-8?B?cFpYcy9BV1pvTXowZUtLNUVObG5CdXRuWVpsTW96VXNoS0REYU0veUY2N21H?=
 =?utf-8?B?REhxTWV2ZnJVaVl2Y0QrdytZSXoyTUZ3Z1FCWVlTbzJGMlZuMlJEbzNGVmkr?=
 =?utf-8?B?Nkp2RXBGek1FcC9lQVo3UEJnMkZudGM3MlU4VjVaNE81bGRLUDh1elZVWU9v?=
 =?utf-8?B?a2MxRzNOZFpWTzRZS1ZtR2NRbmZJckowNzYyMWRqUEplMVM5ZStaUFJ6VlA3?=
 =?utf-8?B?czBEQ1l3VVVPZWMzVWpOYTdtWUNGZWtQQmhtdjA3bVBKL1AwMWtGQXlzQ0FB?=
 =?utf-8?B?RllZYS9UQndQU1h5b3M1ZWNDdjJEdytnOWdXNWpFQXE3bkpLQWU0ODdJNS9l?=
 =?utf-8?B?eGVVazVBWlF0RXdBOWhvQ29lTW9JSFhuU0pLcVRDbjV4SDI5amxLdVFuZXNp?=
 =?utf-8?B?OXVRWVRESkpwV1JJeTgyODFhWGE5Nzk1aUYyZ3BUbFJtUWRuU3QzTTFkaWlv?=
 =?utf-8?B?WERiVGw1eGNhYzF0MHRhTExYR2daR29SUW1zZXRTb0ZXTkJ6VjV5QWU3Y2Vr?=
 =?utf-8?B?MHFaMzNIL2pGclBKelkwN2xBTmhrUU9KWm5oM1RyNUUySEpMdUtPdHJEUzdu?=
 =?utf-8?B?SEdYWUQ3RHhJUHdiNmFsdm5wVG9yYitXbThvMHloTHQvVHNqa1AySmxoZmdS?=
 =?utf-8?B?cEk1eTdsb0dGNE9WSWlXcWhEUFJwUDhGbnp3bEkrR0ZlRkVyY2x3RmJnVy9P?=
 =?utf-8?B?UDd6YnpCRE1mRDhsKzQwZHFuOHFWeHBoR21Vd0swRW9KMmdjR2U2N1NJM0pn?=
 =?utf-8?B?TGt5b1dCZ2JZYmFlL3l5b2hYMTBYNkgrWFZ4R1doQUdhMzRvOVBzdncrL2RE?=
 =?utf-8?B?YkVYZE00L2h0dDFaTDBCZThFaU1qTWl3a1B1RFk4eDFHdnczSUpOVE1MWW5j?=
 =?utf-8?B?akNNQUFCRitIRlFja2NhMmw2QnJpSXJEQU14TXY0bzQwU1NlSUloT3VNQndk?=
 =?utf-8?B?SmRaN2U5RTk1QVVrTnR5ZFpMOG9OOXh3V3BHejk5ZFlJVHBwSVR6Zzl5MHVY?=
 =?utf-8?Q?S2OBV04bN4FGVviWju?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20dc682f-12a8-487a-8593-08dec0a7cbd7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7082.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:06:46.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL6OzquQWEfOehCHlTBe3K0iYZ5Qc/Bk033/4UqKvE+9MJlvptqgIKheSIYg0XTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Priya.Hosur@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Pratik.Vishwakarma@amd.com,m:Veerabadhran.Gopalakrishnan@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED66962E48A



On 07-May-26 1:31 PM, Priya Hosur wrote:
> In smu_v14_0_0_set_soft_freq_limited_range(), the gfxclk floor is
> programmed via SetHardMinGfxClk together with SetSoftMaxGfxClk. Under
> power_dpm_force_performance_level=high this pins HardMin to peak gfxclk.
> 
> In PMFW arbitration HardMin has higher priority than SoftMax, so the
> firmware thermal/PPT throttler cannot clamp gfxclk via SoftMax once
> HardMin is set to peak. Replace SetHardMinGfxClk with SetSoftMinGfxclk
> so the driver still requests peak performance but the firmware
> throttler retains the ability to clamp gfxclk under thermal/PPT
> pressure. SoftMax handling is unchanged and no other clock domains
> are affected.
> 

Though shutdown is controlled with gfx clock adjustment, is it expected 
to set hardmin for other clock domains for perf levels or should they 
all set softmin only?

Thanks,
Lijo
> Signed-off-by: Priya Hosur <Priya.Hosur@amd.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
> index c76b1f07885e..2fe006de927a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
> @@ -1231,7 +1231,8 @@ static int smu_v14_0_0_set_soft_freq_limited_range(struct smu_context *smu,
>   	switch (clk_type) {
>   	case SMU_GFXCLK:
>   	case SMU_SCLK:
> -		msg_set_min = SMU_MSG_SetHardMinGfxClk;
> +		/* SoftMin lets PMFW throttle gfxclk; HardMin would override SoftMax. */
> +		msg_set_min = SMU_MSG_SetSoftMinGfxclk;
>   		msg_set_max = SMU_MSG_SetSoftMaxGfxClk;
>   		break;
>   	case SMU_FCLK:

