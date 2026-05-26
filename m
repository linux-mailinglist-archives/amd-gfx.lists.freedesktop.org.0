Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLJOLKQJFmpNhAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 22:59:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D25DC86B
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 22:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235E10E505;
	Tue, 26 May 2026 20:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TeOlezW3";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013071.outbound.protection.outlook.com
 [40.93.196.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7654E10E505
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 20:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKSWco8Y6y8lVIjHQv7oXEEzSrdBKKob/mtF5XDq613WlK6Io/rHOXc26USB4JulUEYiqxdhLWl4O6e4AGd1kkEh70nvgarvXMt+8NhRBaZzy4avNQr6f5/mynXY9/2nUNVWkRtoU4ifPYv29GeuUuCiSr+nrg43mBxPu2L+h2lEdjShARsM+zs7gfP0MgRGrBFzu1JLNWPHTK1xSPs+ux48ZiWemqP2jj2m9eV/co1sqVcbfC7sjynYhyaDxwGY337SYKJySUqjtTD/WkYFy8bVtk+rSysJv0hAE0xkDnfLnfRyBsbIYN2hq6pGweUnl3rk3A5kV9ZGEFlIxb69Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ys8urO+0qhhITn1ba08BOVoiOQK5BMmBUdJC6YsFkco=;
 b=eW4wtOGe/JxLxeRPvjFNUSuuE8dAjz66DQAxzZH7tgjmftlzs3Lgv3Mzw6Yx4BUvi/KUwp3fzD33TlYfql/ivExnO8cJaJ68nCqHbqdz50j1t1184Jf4k2WaLMyoTEd1GCRCV134YVLngJPuvdONR3uNg17RLbBrugvGQtkJ2iR1eRIheLQQxL0vov2PrjcprinclwQWR+FmyNVBcWA9QXAdBw+E5UMunQmEecMarLNBlKGqNEL/CX99gqIkyU1ZBa+fyRj0dv0G2EinK8qQMq367PxGwT54PCmzjSxaADhIpAe7JKi0FB11NK+sSjubbhmYiNmjt04WLkOIlDAL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys8urO+0qhhITn1ba08BOVoiOQK5BMmBUdJC6YsFkco=;
 b=TeOlezW3H9J+icq0mb5HP+Ei5jihKU/bIKfTalrYMMiwx0h9OrynnmC5eEbkCjiu6tsyOIBy047B3bHcGhMHW8KOI0rhV5N4vBsc1+EipEYFdg6eM+I5Rffg+oaKIK8TyGOFSQOC8nUnLZPWqTLb5Qx1NEEwoU3Mr7WFWMZ4lpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB8464.namprd12.prod.outlook.com (2603:10b6:610:184::11)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 20:59:06 +0000
Received: from CH0PR12MB8464.namprd12.prod.outlook.com
 ([fe80::a45b:9b43:1014:eaf2]) by CH0PR12MB8464.namprd12.prod.outlook.com
 ([fe80::a45b:9b43:1014:eaf2%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 20:59:06 +0000
Message-ID: <889b0666-d250-40f7-8fe2-c4271341f6bc@amd.com>
Date: Tue, 26 May 2026 16:59:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/42] drm/amdkfd: rework MES queue reset sequence
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, sunil.khatri@amd.com, Jesse.Zhang@amd.com,
 Shaoyun.Liu@amd.com
References: <20260522002048.98506-1-alexander.deucher@amd.com>
 <20260522002048.98506-27-alexander.deucher@amd.com>
Content-Language: en-US
From: Amber Lin <Amber.Lin@amd.com>
In-Reply-To: <20260522002048.98506-27-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::11) To CH0PR12MB8464.namprd12.prod.outlook.com
 (2603:10b6:610:184::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB8464:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aae9c71-edab-4e3b-203e-08debb699fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: /wvCjqYuKUlQ3aRKxXYkivI3PS7az+arQM/qpqUMs5hn8sXawOMgSGUlJB/NMJC/gD8jznZxFcIkHkiHKDk1cD+yJ//3Itjm8yBp8BP0RhlyAr4R9mNxby9FU6h1PzLaF+BHO/uxHoWeV16zTxgGJGKNewM3Cp5203BOwYkLwdHxeLtzqnOXaBoPxybK01H+9KWckpIuksQpGjiY8OLLGgyeUKdG6EToVe9KxdHWNRTX3b6wihV4loS/PkAK6GHKfEFwvx1ICCXvo59w915zkRH7FDv5g0QjZ3YWDVDqMcM8cQG2/OpWbgjQfgJX2nLiACiuGTjv72UIpdwmo5fqjmtpsXZYCh0i3oV9YenQRdaFPJEo7IkS/vAAzws5y5l96m+0ARXAXJq3EZEcBx3tL7JfvkFcUIbWb8noaEQslKLpWsQo65+NtnXIZafFK7OeoL1DdpydfgKaHY86yCrERCcdIyjDXkmHBht60ZURDyr1pNtvr2pwxNw/4tOKxV20XVaFikzSymxMAtVuSyuRKSes8aKf8F2BXBISg6dKDy7QtVbmi95A7kG5Vs/GGhgptJ2XKlv0ZxlAjH3PVIHjIaN2EfTX++zGMJ9m/Rj1dmYrJWkHJLRj04t9zTGp9w2UIhB0JpQ8GIvoU78buu4CtmvcibygsSYDeX0HVOFY/TZicI58wBO95SVyarfn5JH3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB8464.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0UrWGxoK3AvSVRXRVBoSzliRXkxUUJsd3l5d1ZnUVh3QnZjempjMk5EVzhm?=
 =?utf-8?B?WDd2RUUrMVdab3hHWXJGZTNyd3dGd3paYlNvS1I5WVgyVzRWcXhqZnRBWmRS?=
 =?utf-8?B?dmx5dFdOU0pzZnIvZzFJdXFJYU1YTCtTUlN1MzdvOW9kb2hMa2pRYjkzRmg2?=
 =?utf-8?B?VVFVZWt5QVZqV3NoK1ZQcCtpa0RTMHBLdE9iUnNPbWY0Z2drZGs5d0hIK1Jl?=
 =?utf-8?B?OGwrc1VuZGZSc0xxYmUvYkNGOHlFVFN4aHdXa1NNLzNOUVZ6cW9OajdUbDRU?=
 =?utf-8?B?enNDaFpBVVNpUnZ4WHdwYTJ0YWszemVWMERhT255MnFWbS9Xd09yeTBwRXpn?=
 =?utf-8?B?TUhvK01zU3kwVzBHc0RweVRxY1ZvbVgrd2dHLzhJMXNOYlF1amdwRk5ha3ZP?=
 =?utf-8?B?Ui90Q1dxS3Q2cUtXd2FtVzUvWG0yMzJFYXBIYm5hbi9HS0JjQy9SaDkwd2pE?=
 =?utf-8?B?MFU1QnZZQTl5REcrUk13dVVsT0xDS3BZSjdMN2hBRTRPM3dPbWlRMkhMbWhm?=
 =?utf-8?B?amk1ZUNrZmMyWDA4ZzJxS1hkNTB0d2R5RTdRRzVXbXNnampJVmo3VTBBb0pY?=
 =?utf-8?B?QXZVaFNmTW9TcDVEcUY1cTJ4N3FZanVjMC81aitpN3NYeXA4RzFDNGlHdytq?=
 =?utf-8?B?M1dxcTcyUU15UmVjdTB1djVJSkNpbFNTS2hRblZrTmZkNXFSTFN2UU5xbGJG?=
 =?utf-8?B?UmVNWC9DRU1HaWJIYVhZb3REUUVlTnJBZ2cyc2lGc3hmUGpJK3lxc2NhR2Vv?=
 =?utf-8?B?NFVJMS95dzFJYXVTbDNwRmZXb2xRVU8vMUw0a1VOblhEVVhtZzdvdWRzK2pt?=
 =?utf-8?B?YjA0ejd2VFB6cTV2NXgxbWw5Q0oyS2VnRmplWHduZG0xMEFENUJma1psL3Fw?=
 =?utf-8?B?a3E1RlNtU2Y3SU5QN29oTlBwNlpnL3RObzJ3KzlBT3F3MlFKNGxTZ3lQSWZr?=
 =?utf-8?B?cXlld1ZYMkFLdWVnRXJ2MkJSVzJhM0VVcGVVTkpCZ0VPUzJ3Z2tTVE4ycHFE?=
 =?utf-8?B?RzJseVN3eUVycDRSdENnT3NXQjdXdzYxSFlLM1U1OXFtN0phR0JYWWk0b1ds?=
 =?utf-8?B?czJYL2RHUW8zSk1qRjc5WW9zUFU3cjBJTHQ0bVoyckJRdUFoWVBtdnhyNUJ3?=
 =?utf-8?B?YVd5bUNwUEtlVW84Qm40QXgvOUhxQmcxUHdGVFlxa0tsSlFWTG50L0J4M3Fo?=
 =?utf-8?B?cHo5Z0E0Q1piNys5NTZ6M1V2UzJrRy9kblQ5MjNvYnFJcGlQSEQ0cC9JSUwx?=
 =?utf-8?B?Y2VZWm93OHUrWHJOZ3J6V2g2UEhKeVNKazQycHhMM1lsNzFWMStMZUw0TVBB?=
 =?utf-8?B?c0h4cGp4d3dnZDZ5TWlGK1VsLzNlSDlyTVQzajNpbDhnQUZacTdWZEdyU3RG?=
 =?utf-8?B?bzY0VEF4NUhkVlBXZlBGZ2R1OVhkSEhZVDVyS0xOdWRtS3MzdXFrZUJlNWVk?=
 =?utf-8?B?QXEyakNXM3NjZzJrbnl3Q2o5d3p1RmVFT3REZlVqZFFjaVJOSzhzRmZXWnIw?=
 =?utf-8?B?WndCSWE3VkNYL0Y3dTRWcWp5cHdFNGZrYXQxQkQydnNmSVpEdFBNYjJ0anN4?=
 =?utf-8?B?c0psVjRDaFVxcGNuZWdQdjNTeVdhRGJPYnVWRlNBekNrbVBLM2YrM09zY2dt?=
 =?utf-8?B?OWtqSzFvMVFzdEd6N3NGU2J0UEV5N0Z6S0c1d21YZ2FjZ2FkWmxMNUpqeWFM?=
 =?utf-8?B?VGYvNVZYNGliOHM0YUUrRHhOV2JodDlDYUswajlldXFxb3FySGpsdHB5ejJG?=
 =?utf-8?B?MzVyVElYYzNVZCtjNURMWVFDTitZSHEyU2lzclNuWXVBeDZ3K1l4aDYzVDk4?=
 =?utf-8?B?SXRaakUzK1kxOG01TEJxNGswSnVTYWxEaGVoemxhOUgzaHpLUmdKdXlMbnVs?=
 =?utf-8?B?VnJHajBhWEh3ejFmSmUrK1BiSUllNzBpaHMyMGc1VGhmUFg0T0pFYVRLWWY0?=
 =?utf-8?B?cU82dWlFbU1mRFNsNURreC80c3FWOUlZZGZTeUk0Ky9paU54YzM3Qlpvb1h3?=
 =?utf-8?B?WHhacjhSNmhuK0l6SXBSQmpUVFBXSU93d0UrMFNINU5RWjljSUQxQjVnL1FW?=
 =?utf-8?B?MjdNQXdiem1qN3NKU0hIZjNXZU90VHhOR2w5eTRDdkpBeHY1WC9wLzdmelMx?=
 =?utf-8?B?L0srWEdIZnNDRlFhbHo5ZFB2dE16V3ZDQ0hUQjJtMmVsaXg5MTRlRXRvWG1D?=
 =?utf-8?B?cVZIOHEzc3Rqb2lnYWoySFI2WTkvVlZ0MEVlM3NOY3pOb1NSMUVpeFI2MzZT?=
 =?utf-8?B?TjFzR2pGVytEb1BzRVprcnVHdFdjZUUrZkIwSE5nTmNqUHUwNTdJeVdmSUZC?=
 =?utf-8?Q?cAWHPOM5HA7JoXfxsl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aae9c71-edab-4e3b-203e-08debb699fa6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB8464.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 20:59:05.9226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHlczcjFNq4EFxSAmWvlXB9CXC2kcK95FHe7gcQR90FNoLFzPkPWt/nOKj2EHgaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,m:Jesse.Zhang@amd.com,m:Shaoyun.Liu@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[Amber.Lin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
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
	FROM_NEQ_ENVFROM(0.00)[Amber.Lin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 152D25DC86B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 20:20, Alex Deucher wrote:
> Call MES with detect only to get the list of hung queues rather
> than detecting an resetting.  Then loop over the bad queues
> and reset them individually and finally remove them.  Skip
> queues not owned by KFD.
> 
> v2: always call resume_all after queue reset
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 21 ++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 08006ce8126c9..e323658f972cd 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -445,7 +445,7 @@ static int reset_queues_mes(struct device_queue_manager *dqm)
>   	 * Passed parameter is for targeting queues not scheduled by MES add_queue.
>   	 */
>   	r =  amdgpu_mes_detect_and_reset_hung_queues(adev, AMDGPU_RING_TYPE_COMPUTE,
> -		false, &num_hung, hung_array, ffs(dqm->dev->xcc_mask) - 1);
> +		true, &num_hung, hung_array, ffs(dqm->dev->xcc_mask) - 1);
>   
>   	if (!num_hung || r) {
>   		r = -ENOTRECOVERABLE;
> @@ -467,10 +467,9 @@ static int reset_queues_mes(struct device_queue_manager *dqm)
>   		}
>   
>   		q = find_queue_by_doorbell_offset(dqm, hung_array[i]);
> -		if (!q) {
> -			r = -ENOTRECOVERABLE;
> -			goto fail;
> -		}
> +		/* skip queues not owned by KFD */
> +		if (!q)
> +			continue;
>   
>   		pdd = kfd_get_process_device_data(q->device, q->process);
>   		if (!pdd) {
> @@ -480,6 +479,10 @@ static int reset_queues_mes(struct device_queue_manager *dqm)
>   
>   		pr_warn("Hang detected doorbell %x pipe %d queue %d type %d\n",
>   				hung_array[i], pipe, queue, queue_type);
> +		r = amdgpu_mes_reset_user_queue(adev, queue_type, hung_array[i],
> +						ffs(dqm->dev->xcc_mask) - 1);
> +		if (r)
> +			goto fail;
>   		/* Proceed remove_queue with reset=true */
>   		remove_queue_mes_on_reset_option(dqm, q, &pdd->qpd, true, false);
>   		set_queue_as_reset(dqm, q, &pdd->qpd);
The following change in suspend_all_queues_mes should not be needed, but 
since they are removed in follow-up patches in this series, this patch is

Reviewed-by: Amber Lin <Amber.Lin@amd.com>

> @@ -505,13 +508,17 @@ static int suspend_all_queues_mes(struct device_queue_manager *dqm)
>   	up_read(&adev->reset_domain->sem);
>   
>   	if (r) {
> -		if (!reset_queues_mes(dqm))
> -			return 0;
> +		if (!reset_queues_mes(dqm)) {
> +			r = 0;
> +			goto out;
> +		}
>   
>   		dev_err(adev->dev, "failed to suspend gangs from MES\n");
>   		dev_err(adev->dev, "MES might be in unrecoverable state, issue a GPU reset\n");
>   		kfd_hws_hang(dqm);
>   	}
> +out:
> +	resume_all_queues_mes(dqm);
>   
>   	return r;
>   }

-- 
Regards,
Amber

