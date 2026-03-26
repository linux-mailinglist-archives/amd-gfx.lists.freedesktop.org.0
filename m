Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKp7LO8hxWmC7AQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Mar 2026 13:09:19 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6A334F65
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Mar 2026 13:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839ED10E975;
	Thu, 26 Mar 2026 12:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Him+1a6P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010006.outbound.protection.outlook.com
 [40.93.198.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EDD10E975
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 12:09:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smz+ISrXv9KB0pO0W23l7MTbTOTy/5C+VrY658YOj0jagyr4nt3EvrLW5QHXvk31FXQb7p3GTtDzlCZ5bhI9PjIvPJCQQGDYZGUlDgE2K36u8RoOd7+DzVWoMqTA+2Auw4j13mfHeh2OMdBjaby9Oz1G5/4hDePEuzdTRhAI66+GX5T9kZ2JT5FfSel3KRf0EFvd22MMC4gL1JAFDFzcc2AcaJ595+OSBDzlaIXr/KnkpfeCoSlbHi8J09zUTVTr526Ub8cMDHP1bd29soPwrWq7cwjTeriV5VegTokXJRWGy7qGDCcZOcAVXyH2PN6Bv7TUZ5RL4EoMapLI6Yho0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFme+hvCPmml7pES2wyGqWLpktR8hCN/0S8d/x+Y8JA=;
 b=MeevrAQ0V38bb3eviL0TUwCswdW6O0b5H9bqBudYyHxtv5J0pZjA1aCGmeDKpS8DmIM/1/7/vU8i1UHDApkRZCFm51RxFL/TZyhWiOVyzxx1TXmDoH/dTLaQYqjFE5gyUiQgN0dtRIvlo+wX8AMvZaHKeARuWc1TFAW+zCpOU06NLEwsdx+pI56tcERr8vF+fLxSi2RNjX4MBKetESptat8Ghp+XSzRxFgmed0a6OuSCagrUoqC9DyhufsPLRovZ/70oDsZmlXua9RaTvtmVOQL1diNGEcGmWf/h4h5Bt7ak2yqIu4A+gjSEBlsxJXG8eJePFAT7luDVdOsw5ZQ+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFme+hvCPmml7pES2wyGqWLpktR8hCN/0S8d/x+Y8JA=;
 b=Him+1a6PoMk/u+q4Eh7JUhO7OEA1Fcbth4TZQCDr9h1aeOvqGOEBhw5RCyWOj5cUWeT5gxiaiug5P4NLsRuQod14KUaCvASUGzPpeMiHg0fOqQcf1bd3Asib8nND2xrl7xsEAGXmtdnFTADgmJjFh1RG9zXWpFO4tiqmLghejmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CYYPR12MB8749.namprd12.prod.outlook.com (2603:10b6:930:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.12; Thu, 26 Mar
 2026 12:09:12 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%5]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 12:09:12 +0000
Message-ID: <23d8f2a6-b705-4380-8897-93d0612f1237@amd.com>
Date: Thu, 26 Mar 2026 13:09:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v1 2/4] drm/amdgpu/userq: no need to use local variable
 here for return
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20260326085601.2665215-1-sunil.khatri@amd.com>
 <20260326085601.2665215-3-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260326085601.2665215-3-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CYYPR12MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: c98a5e97-c4a2-49c8-2da9-08de8b307df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: iVgBeScgWWPGd6BAXpeFKnA+M4H4RjfOSY5luXXc6k9G6y4YO6jSNvlEzM4dRLZjGDVtlI+94cd426vZlEsnW6gWvbco+DRtl91eOp4ileUHLcDDs2NIq7OXeRKaiAayUbfq4/EuANsAtqfbfT+E5MCki/qRnCV5YDXgG9eTs5MuOjbH/ed3B5x2xoaN+cM22r8xfVkrXf+X2f+aahBQxfbppax5lIKykdde0pOt/qjjzKezUI88K86uYtyQ6I/0JsupyCLXzLbgx3uO/a3Lla8GLpNaebVPXTcJmb2s+o9ASsKVVnRpi4/mdIIhNDSm+Hlv1ZQfhmGMIL0Rc1hEBq1d4Rt6RMIUVwihZO9C9NVxaod0CfgcBZ4AwFo+GowzPkdGRQnfuDLevQ3BXwcYqqkVwDwPFTznCjMOMObemwqMEBbe8X9sxRB5aPzMd/cGqE/xsBtCcSZFYSEGCvKZh093UMHYWQk/oZCzSmbvlUIJ9sFjdbChqklU6PZ7D49YsJGxtZDfEBAsQVTd7NfeOg/g5lSJwCSrIeb+SGa06qeE0Jy4kjJwCjrv2dh6Uo8++MJL9KIZSIEHxkRLY+XxlWwJrqTxs+3qwMvBSuXdy0WiStT6FbenwoaFg/jguO04z88+mVrO+Dxqw/9Oihm9qdW+vaGu7tV4N0DCv8HYb37v5hea13kSFBw1kmD6SkkKofAWOSxzKxh+YMHRBMAekwhRj++hYuxJOAeZY5fgvPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3ZHeFlOWnNWcHJsRzZQbHh4T29GQlF4eStZdXBFUnNqTHU5enQ2c3FoUzlv?=
 =?utf-8?B?MVRMWkEwZmxYcVFSekJlOEtEdjZwUWdjUStOTGUzV0M0VzB1WTI5dmFYY2lY?=
 =?utf-8?B?T2RqWEJoRHFzRTRVS2ZsN1hXdE9xcEpFYU9VVi9WK1NFcTVuUmZManVacjFD?=
 =?utf-8?B?SDZZRjd3cUt1WWVZSHNlRzVnbFVhU1F3dUwwSnlTRzVyazhMbGhCeks2NUdy?=
 =?utf-8?B?MzBrWXdabTFHeVRVVjdvdy8zWmFzbkJGOEQ0MEFZZlU3UlZ1Wmp6WW51eUlF?=
 =?utf-8?B?cWlIRllZM0xvRTlNM2d5L1preW8rM0d3UUorbTVFM0twbEc3WG9OcVlrSmdo?=
 =?utf-8?B?K01yZFNKcnkxK0thNVkxenVrSnJyVEVsQVRkUGhFS0pPYzFtMVZrSWVOcFVJ?=
 =?utf-8?B?WjVLMHAwQkE3MEdOM3UvSGxBc1BTcytyVVArZ2ZPV0daeEN1UThTL01WaVl3?=
 =?utf-8?B?K1BWODFPZXMxMlY3bTBoVytBMExQVmM4UklmRWZmbFYvUExjd3VybG5IcHV1?=
 =?utf-8?B?RTBHWWhjR1BlVlhPdkNBYXJYSmpKbVJSZzYwd2hMMVVJc2duYk1JSE9MR0dH?=
 =?utf-8?B?OW9HZC96TTFneDZETVFiMWgzQ21BcC9GSHFZa0VUc0F3QlNMdnliejNWaXNM?=
 =?utf-8?B?UCtWdkxVaUd6czB5aG83eTVzSHhjOHBiRWd2QUtZYnBxT3FnU2V5di9vUXRv?=
 =?utf-8?B?blpLUHhkL0F1ZWlUdnk2alFCcDFEckZmSjExWU5MWml1UWVHYTFMbjN0UGNl?=
 =?utf-8?B?cXA1NGtPNGNNQi9IVXdscEFIN3h1VWNWcUhIZkV1SDh4SEpOUklGUEFJYWVN?=
 =?utf-8?B?RXJmYXVibnlzTUl6eDdtN2crTnZMc0FoSUdTS1ZQTnh1TGlHL2psUFF4Qzhh?=
 =?utf-8?B?eTZCSGpCc05ydHhEblR2cVBtdWZRNjVsak9nSUxVc1Nic3ZrMmVJblVSL3hm?=
 =?utf-8?B?eVNMTS9FUlFmeE4xL3hEY0U0UVM2MnFxUlM2NU9CZjVXWXloSjZTYjVIOGdN?=
 =?utf-8?B?TTg2dkZiald1K1ZaSVdLTmlUbkk2Z1RXQWlMV2J5NC82cFIydW83dTdDK2dU?=
 =?utf-8?B?UkZTSnVCRUxXdVZNTXZFYzZPekZ1S3pXbkpGQWp2RXlGbE1SNWpKQVd2NXhm?=
 =?utf-8?B?T05UVkFrMnRPQjk3cE9FK3YxWWl3c01DQ3lhZ2xlNVIwZDhiKzlrK2xvWkl4?=
 =?utf-8?B?UlBYVWxULzVmMVZZSWtwaHhvcEV1VFM2RXk0Q2g5bnRIWWVLK25KSDBwaFFB?=
 =?utf-8?B?SlBtamhSaGJ0YTFkc0NHZ1lGMnRwSGFKeFlKb2t0OVQxZnlZdGY5Qm5FWlZR?=
 =?utf-8?B?cjE4NklTbXZSMmFPNlJDdUZKNWlsUUZ0SlNqSVJjcjdrOU1FMGkyV1BuZUdF?=
 =?utf-8?B?UE40M1hMQk5oUXUrMzUzRm8zeGk1TjNMSmFmeUw4aHRyWlJ0Z21GaWFTc1Rx?=
 =?utf-8?B?Y01lN3VsYjBlQmlFcUpaaEJzRkFFSitTOHZmdGtndmFVMXg3YnVqNFVUb0tl?=
 =?utf-8?B?cGNIUHRhSExtMkRCWEZ0cFpjN1lQa2Z1WnhJeHppUklnOE5xaVl6ZEkxY1Fo?=
 =?utf-8?B?THhxMEpsTjU3UnBNMUJoeEh3eDZOSVlPWmxQN0p1dHJlQzZUVVdoek8vckhO?=
 =?utf-8?B?ZFRxU2Jqd0NFS3JBZU14VXdYaVMwdU91amdtbEhsQ21xZmRQUHNqbHFrT3RY?=
 =?utf-8?B?emZQL295bHk3VldzdHZvcEo5QnQxMnNlM0NFR3pONlNDQUpXbWFjQzdPOGo5?=
 =?utf-8?B?L3l6eVdYQlFUMDM4RlozUmxnZ28rNEtSUldZaHRwOCtjM0d1N09lb2FPaDMr?=
 =?utf-8?B?K1ZLUkQ1YVg5ZHVkcExlb1JXTU1Cd3RaaC90QVc5OXRZZ0VLY2Z1N2V6Y1VL?=
 =?utf-8?B?ZVRqVlNxc3FydkljOTRDM0c2OXpWbjVVM2dRNVFEYW41ajAxclkvanN1WlFs?=
 =?utf-8?B?c3dSQWlKQjdadGpVVFBEUkY4L3VscFVqSXBlenJKRzZOeElNMlc1cnp2MGRH?=
 =?utf-8?B?cnNxYW1GdHlOZU1TcnBCZXZSTHM5QW1DY1hIcnN5TlhUNytHWDg5N1BIaXpH?=
 =?utf-8?B?MUoxUmpVcXJsZ0JDcmhGVHVtUVRRemw5S2ZKUkRsWTJ0dXRqdlJvakcreVRs?=
 =?utf-8?B?eEdHL2JOUVNET1RJOGl3WWxQeEZPVXFsd3Q4VTFCbHBaVC9aZzkzZXpxbzlh?=
 =?utf-8?B?V2wwbVpWdHBlT0Zldld5anV3TVQ1dlRCU3FheVRkdkhBTklFbGRRQ1ZJOFNh?=
 =?utf-8?B?Ykpsd3Z4TE9UUkxEZTdBcHZHREl6N2h1aElyNGlScU8yT2FOaktaS3pVWWFP?=
 =?utf-8?Q?NpcIXr3Sko03QJwpo6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98a5e97-c4a2-49c8-2da9-08de8b307df7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:09:12.2338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U04DVV7vrBLV/VfvmGjR+am41AOj4faqMU9RWoWBZufBdoIZhLaMarsrAl1Hl6w3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8749
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sunil.khatri@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid,resume_work.work:url]
X-Rspamd-Queue-Id: 18B6A334F65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/26 09:55, Sunil Khatri wrote:
> In function amdgpu_userq_restore_worker use directly
> the function's return value in the if condition instead
> of local variable ret.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index 2a1832fce6d2..2b07c3941927 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -1222,20 +1222,17 @@ static void amdgpu_userq_restore_worker(struct work_struct *work)
>  	struct amdgpu_userq_mgr *uq_mgr = work_to_uq_mgr(work, resume_work.work);
>  	struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
>  	struct dma_fence *ev_fence;
> -	int ret;
>  
>  	ev_fence = amdgpu_evf_mgr_get_fence(&fpriv->evf_mgr);
>  	if (!dma_fence_is_signaled(ev_fence))
>  		goto put_fence;
>  
> -	ret = amdgpu_userq_vm_validate(uq_mgr);
> -	if (ret) {
> +	if (amdgpu_userq_vm_validate(uq_mgr)) {
>  		drm_file_err(uq_mgr->file, "Failed to validate BOs to restore\n");

Again, probably a good idea to print the error code here.

Regards,
Christian.

>  		goto put_fence;
>  	}
>  
> -	ret = amdgpu_userq_restore_all(uq_mgr);
> -	if (ret)
> +	if (amdgpu_userq_restore_all(uq_mgr))
>  		drm_file_err(uq_mgr->file, "Failed to restore all queues\n");
>  
>  put_fence:

