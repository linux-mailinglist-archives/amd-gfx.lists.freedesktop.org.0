Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOpRKJ21qml9VgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 06 Mar 2026 12:08:13 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14D21F720
	for <lists+amd-gfx@lfdr.de>; Fri, 06 Mar 2026 12:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD24610ECE9;
	Fri,  6 Mar 2026 11:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xAlPnxSS";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B712C10ECE9
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Mar 2026 11:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqhILkcMGjyqahIXNdu3DZL6w7rqtuPxM3ctXMb6925bG+CjD9rKXRT+Z6uV/NO0BZ8dL+FdjC8/NJIIum6CksmrULogIwRpAV7xc7NkWE0sfv0D88Jhh/xr9mpChyHM+83sYGcDtDCmWj/zzmP4AiH11vpQ0yLsz2nj51znHVurQKUVL4339/O0QpXI2wp4Wv19/yNvfSK2IbKFgIXa3I8lOaf5vuFsV85s4P+F4wXBA7FnBDU/Glvq3en/bvZcO9UMBv89zDvKDD17f9sRMh6+DvC2fGbsFHTQppcfWouvcXnHTXhqna1zznm9vpTjnkFOXFlAuoxhB35KLqgZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UkB2+RysZ77oh6TxEa/5PBrm5D3npNH3TVDG+9Zwrs=;
 b=cWTgD5j1hvcFZg68fs51K0WsoottLUr0N5h3Jt4/5pJJ9BdZ+cKZvfQ02HUfa31bjxvpbkiAnLF37rUx16BxAlaA//09znCcTt4xdjKuW54/iUOpwEbzSnrJtvQDSoakEivxZO9KmxwIs0SUFNSHVoIm6Pd2lrNO859BaX2GU4mAkWmhww7lhihRtd9DxQbFXR1cTWp3K4pWlRWbQflkcuCI1THEFwFXufN4zhmN9dliFW2rbPUKdaGpoSxO4KnI4RAzMOm4I2IqidrOc34s3cHIW02n9AcSk0uiVIvIOQGVbL1g/o3VZ940A/+pa9zmR5YqUBD2n0lQHVvib2/YFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UkB2+RysZ77oh6TxEa/5PBrm5D3npNH3TVDG+9Zwrs=;
 b=xAlPnxSSmphwpNuDJ0reapCbukeqw484o2hHb4D14KmuaheIyuaaeq+agwjI9ziLdohF/Cd9HMKwugnsiV5nTTHRbcCsj6ChjqXLDArk4dDaXqeeICIX/iQ0QqhLZqCCkTTf6tDffH6BFVELbWovcQJcUVRmcojNwMX85ZFq2zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 11:08:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 11:08:07 +0000
Message-ID: <4158cd00-b61d-4023-960d-309edd904bbd@amd.com>
Date: Fri, 6 Mar 2026 12:08:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: fix warning for potentially insecure string
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20260306102418.1944604-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260306102418.1944604-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0359.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 212d232e-5001-4f24-dda4-08de7b70a4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: jCOiBLceOecQGjoVSsaTaRLX9B8R5i5ceWSO3mQYeq4MEBDK908lMknadC651qtNd0gvZo/EF9sSIhVqSuiDbQC3s5lKqjKVPMz8DpiRrtUHQJOYu1RBryaHHZUJc+kYjPEMi/HOngmzesBNk1hZbRnqIQIUSlH0buwBovAkPQH4g2RCR5hjQaOnneMex2XY+nF5LAnMMIGsIDxdO+671YGdt4UOJ8G74tmEyK41jV7Ma9KUWzeZa4jYxmhmPVOQJugcfBWaTBydNcE2XLwRKLWb8lzi9yVkpXL8SP3GcOu6QqsO6OnRi68rerk1wyDB3EAZzUo4MKphlg39vuGRDywjkP3QRTC2N8+MNWSJCzVWitWP3sime5F+6nymBHWAhGS/izf0acIbwVkMDhTX6vGQTtMy47cJG5PmpPw3lGlrit1vtPWb3AJocmVv6zGbTyRUf38WIVjqMIw1JKw4gOjbKXcEFX+e4nCrjJzB7Ry8MsaamgP4K0FCVZkKPKCvQv/cQolRAKkW48u3CdFnnGAY4O4j/1L/9nknHFbEBS1/6LNxhjLN+kEuwQVrISMNcbm4YxQNM2jfy2F0MPs3koM127vejtgzsamP0ZI+l2Oq67uEoMkxZDB5bXRTNKSsQdjEqYzSFjXBnpJq7J3WmESiPO1mqgdAUAq5vq2erVdZQjBGxiDKNF6uFjwJU9bHEb9fZTGg3uYw3/2XdiPM9yOaginZWPdA/v2twt1uKkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1oUE5FUm11aVBKWkg5YVVjRkYwVWpkS1MvWmtDZHRENlRDUmZHbW1zVmhU?=
 =?utf-8?B?bEpLSEFSc2hYTmx1czNRalVlN05TSnVlWTcwaW4xOVJDcTB1MUZiWU05aU1C?=
 =?utf-8?B?YnlOTEh4OGxiV3F6NFNVMURmZ29Vdk1UclNXWUxMOW1TMXE1dzZSSk8xM2R1?=
 =?utf-8?B?VlQxSllmaExSS3h3MC9GcGtzL0V0K2F6TkZOSmhzL1VZUkxocDd0OUczLzMz?=
 =?utf-8?B?T2hMTFAvK2ttek4xQzVNWEFXcEZyUW16Y2grTEpkM3RzUWkrSnBrZ1dtUDdx?=
 =?utf-8?B?N0NEWkppNVVROUJjYmJLMzA4SThVQkVhbVRpakZNMGQ0Mk1YdnFXVGJmTXhj?=
 =?utf-8?B?bXkzT0xnWm14RGpmaHNuNzBMck5uVG1qMUlXZUhBbkFheDJyYjJLZFhBYm5s?=
 =?utf-8?B?OGM5MTVDMzFiMm1EL1ZiVzlhNSs0OUtqbjJlWXIxc2s0b1ZFa1VOdDJqUDBI?=
 =?utf-8?B?ZWhlaHFZc0VreURtbTVaRE5hOW11K0FRU3FHVVh3NFRjSW1jbktYbWJRZjJx?=
 =?utf-8?B?N05oaWlJazVQRjJQYTBOc0tIaWZvY1M0QzdLellUYTVuUHgxYno4dVQ4TGM1?=
 =?utf-8?B?NWJwOEljSFpGUXBXTUlkeHE5MCtPMk9PSEU2OUZuUmZ6M3FuVUpleTNTSTBI?=
 =?utf-8?B?R3lHaGw4MEZ0YkFnVUVSSG9CUkFuSlV5YkIvaXRSK0UyWnF2UlUxcUhDNHJF?=
 =?utf-8?B?M2hKTmFYMkN6M1VFM09NOTQvdjE5SmlEQml1c0h6RmhLUkhldlVSTXpzZFB2?=
 =?utf-8?B?dDA5VUtaQTNMQUhRS1JJTVZoeGdkMFEwSG1KUElRL2N4YnZrb0xGVVdwZE5X?=
 =?utf-8?B?YmYybU04NEcwVTFpLzQ1NVlDUzVNelR5d2tVR1ZZWkd5VlU4RHFhK09sSVAr?=
 =?utf-8?B?L1MwcTJUN2h4RzBPQXJvRTNreDBrWm5iN0NKK2hReWFPTXlvTVZvZzgxOGZ2?=
 =?utf-8?B?S2FDSDl6SE8wNUc0a1hMMDcxekVVWWMzQnJCMFNveVBpa2ErQ05heUh6WXVR?=
 =?utf-8?B?Z1dnQVpKbFRxMGdSTWJta3ZtU1ZreDZ2MzM4N01qdm9oTnEyYmNQTG56UE9I?=
 =?utf-8?B?TDhKVkZmeDZleFNTc0M2STZSZW1iSHZhMkk4dVJTbnRFMXBsOTljNllnQ1Iw?=
 =?utf-8?B?UmhGZGlyV1VkU3NVeFhxWWNaSll3aVlKZlhZMVhjNEppY09XZTZjNUh6bURR?=
 =?utf-8?B?VktXWVQ5Q3hpemVVQXlpVlIwQnoycVpKaWVOVGpLQ2x4YmdiZ0JseEFsNHNh?=
 =?utf-8?B?Vzl5dWljNHpIblg4UFUrMU9tbFpIZEh6L2NDV0tpeXJGc3hZMUlOSU9IZUgy?=
 =?utf-8?B?WkJVenZFWEhRaGgzQkRSK3ArRTMra0pFWW91OWQrdzJSU0M1WUNqd2ZzVEFP?=
 =?utf-8?B?OHJGMS9XYjdxU09TWDZoWTdlS3lzdkxBYTBmTXZWVXRIL0Z2SGRjY2V3cC8w?=
 =?utf-8?B?MndWemNjQVRvMGgzcUlvaGxpZkdHVUxhait1cVNTN1VveGRCblpMR04wc2tj?=
 =?utf-8?B?ZTJDMWowSDBvM1NFL2ZadzNQNm5JZVI3emQ5Rk9wZFRSdTF4UjZxenB3TWJn?=
 =?utf-8?B?WWRSM1k1R2pzMHNLS1F3ZjNyT1gzWDF2cGNFMkQyVlNLQWdRaHZnTW9aZmg3?=
 =?utf-8?B?UDhkSjMzcmVQOVJac2MvUWJMNDAva3hCNnNZOW1qUmx5clFXTnhDTVZaNmFX?=
 =?utf-8?B?TFp2RDFXcjhUOHlOYkg2UDJEOE45OEZkNVY4UTdLV1JtVnIzYlRCZlBtQVVZ?=
 =?utf-8?B?TGhHTHhHOFFZZ09zMVhEUy8wbWpCUDNRc1dWRkJpOGx5ZGpSMkNuVi9GeHJX?=
 =?utf-8?B?QzdMRjNHRXpGT1lLTGc5TXZhS2pBWlJ3aUViQWYxaW82cjI0T0JJb0wvNlo5?=
 =?utf-8?B?VWIvc1BGMFJyWEV2YngwQ2dlMzYySU5PTEwzQkppQ0tCY3NLdDNVNGpYamFz?=
 =?utf-8?B?Nld6WkROZW5BZmFXZXpiYnBmaTI5U2c3YUNkY0cvNnc2VTJxV3ZtUnZoaEVG?=
 =?utf-8?B?S0VVMWtTMjRHUzNlbkhZRUZQVjZ0OVhwVC8yNjlKVytTVVNtWGpxSjJDUmZa?=
 =?utf-8?B?RU1vMGdmdmt2b0lyRDQvbFY1Rkk4UnFBdUFrOXdvQmR1Z1FmbHdMdXdaU0Jy?=
 =?utf-8?B?bUZtNlZYTVQ2L0pLbGJ4ZCtNdURpaW45N1NBdlkrcHJQU0ZXQWNQZkFRaWEv?=
 =?utf-8?B?OVl3dUlBNEFPRXlGZnFDL0Z4b1RXMnFUajVwVWxKekNhU05kSTBJRWxVeEhl?=
 =?utf-8?B?aDI2ckhPMVYzTWJhYnp5Q05lazlaOXJnSnBlaUJ5ZjVVVmk5cWFFVFhUTTB1?=
 =?utf-8?Q?TURSybKOfZOgxMs/5h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212d232e-5001-4f24-dda4-08de7b70a4f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 11:08:07.0266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFc4YcZp/NaeziJQy3F6xXgscneBF4MK2rKo/SJea7bwTtS3/AhEoLzms1gY7vsB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009
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
X-Rspamd-Queue-Id: 1E14D21F720
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sunil.khatri@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 11:24, Sunil Khatri wrote:
> linux/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:2358:24: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>                         sprintf(ring->name, amdgpu_sw_ring_name(i));
>                                             ^~~~~~~~~~~~~~~~~~~~~~
> linux/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:2358:24: note: treat the string as an argument to avoid this
>                         sprintf(ring->name, amdgpu_sw_ring_name(i));
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 7e9d753f4a80..95be105671ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2355,7 +2355,7 @@ static int gfx_v9_0_sw_init(struct amdgpu_ip_block *ip_block)
>  		for (i = 0; i < GFX9_NUM_SW_GFX_RINGS; i++) {
>  			ring = &adev->gfx.sw_gfx_ring[i];
>  			ring->ring_obj = NULL;
> -			sprintf(ring->name, amdgpu_sw_ring_name(i));
> +			strscpy(ring->name, amdgpu_sw_ring_name(i), sizeof(ring->name));
>  			ring->use_doorbell = true;
>  			ring->doorbell_index = adev->doorbell_index.gfx_ring0 << 1;
>  			ring->is_sw_ring = true;

