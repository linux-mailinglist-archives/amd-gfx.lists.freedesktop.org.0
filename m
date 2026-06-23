Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3fjLBwAFOmqu0AcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 06:01:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1249F6B3EB4
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 06:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=EpgMQ8RE;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20410E346;
	Tue, 23 Jun 2026 04:01:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9E10E346
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 04:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngkr+oIspZSSH2ZaVmtshJkzQtYR8SJ5ySQ67qd77lsAIkb5EAcgFOhCFaE6PaifB1e4T21q81kujlJZxeNSmLUi3HhMD/uhbwHUZImn6d4IDvwbCRp7HxGiRlAHCljFpTgkGKSjZj6h1izuojhiam6r0g2d2/X07x1ezLNQBScQ/ELKRJC+xF+Dgqmt/F6/7xLzoJu5OdoDh/Vw/CRh3ZObqd9dTYkoX/33nCLB6s4BDx1iVwknNZ6dSiKWF1F0+hsfxgrbcW6pbsELOrGlAt9JF9EFZ6PY6oOpjl4/sOfc/JXszjU19d0dV0XTn9eKlx/uArk6uAb+k8IjBs3u9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHQAiJ355sz5otTkRA1ygIQet7PTBPK2n/EfnBaI+vs=;
 b=X9NAxtDIrAcustypMjLa2OWLFZMbtOT6oQjYq/V7uRfjARwPE33AstlbdOrE7RuC8WV5jS8sJoMyNWxNq5RZIvirddi1rAbNpM3AfRG7M6XXIhlt2OJRqlipAov6WjZCaPy4r1/OLZp0/GrOxJNHYMycsN5itpHoiSDaflYU0jlESGpsMFGTe6PwyHtzZUXKqSAAbGo8ChAnSeycOZ2ZbZJrCmSfIxw3TKcWJ9l8Cau4PnLIbneL31pr5HfNEm1IUPOw86qRAZ7pVi+h7Y3eoR0lwzsd7/WPIVHZY7xXecfwY0KtH7ow5SZVURVoma/qUnJIPO0QcbBSw+YmtLqF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHQAiJ355sz5otTkRA1ygIQet7PTBPK2n/EfnBaI+vs=;
 b=EpgMQ8REIRg8zAQZS+EETuIga1VLxdFDKV5STZLo06d6gr+PSmlFEEjt4WJrxNIuQW6g6wLykxTtbJwoqinYSwowiRb/o3NEr5MvKPFo/pOscIk5In8HwafsKAg/y05nmiHUIwBkLiPUfFav8x8VcWJynaFXfmuN4y+aXBpYo48=
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Tue, 23 Jun
 2026 04:00:55 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%3]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 04:00:54 +0000
Message-ID: <17abba43-cf16-4ab6-8de9-87f40fb04050@amd.com>
Date: Tue, 23 Jun 2026 09:30:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add check for xcp id
To: Gangliang Xie <ganglxie@amd.com>, amd-gfx@lists.freedesktop.org
Cc: tao.zhou1@amd.com
References: <20260623024809.121196-1-ganglxie@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20260623024809.121196-1-ganglxie@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::13) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|DM4PR12MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a51234-138a-4c44-6b72-08ded0dc05de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: e8pVu/4RmDHF8gJJLzRKuEybC86emUVvrULXyRYpNWo7lwQOKCoPlaPdhDmMb/MCucFILgT0QUXYqIg8AWyl056jLroC1P/JpPgsdQ5BcbGJusvwT4kYiz6V02oLAq/IqU/TftGmvnFVs60YzlmNR3VdKO+pcbKmOENTzwnNxM3NTu69DB0WsATwVXJnTANWXiKWRTHHV9ffs9mGV8Wwtt8TZx8KJJSMLCjiNpxGJGQ65qt3siUeVbIUuXNytLqcr/WZPHOnwN3nEouGMnAMVcSkmuXqE6VRTzk4ZFfQxG1yWpmKe3JPsc1GodPpu9XfIlCHThZ4s45LYrQHAIhKBo35QCjeHOmh2pMePEgfkHsk5QGYP3WTLJNDka87fSemETQqf/OxqOaf36sz3vC1HnwCO8S+rWiJnpAAYwblB6fDYIjz42M4JO9b8HT2uUFje9XP5pB5WlS0YB+Ykp1M//2NcUSHj8hU9NuRNwI8HjagKCh/SDDb1yKMdfbFkfQo8PkKKk8w/ZIDjXJU8+0+5ssEVIEqDo2Gm9yTSO1xIsb6hTXUuhNKeBiWs7hoqD1PIJG0LR/u+gjBncNjx7rw+/3UuR0c8U362LU+6eit6G2mpxjG9eMT1VjMBQJZvX0AMqqU7vGLcmfpS6HwO7WiOEa8T9dkwHGV6jrScBKqk7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzFFSExFNW9YcTRtZG9VcXZzcXJGRitRbW9HZFdGeWF0ZFVOemN4dzg5azVZ?=
 =?utf-8?B?R214R0M3UFVqbVVyNVdJN0h0VzBwU0w5SStsaWpyMTY5RHVsbjNXZDNVL0c0?=
 =?utf-8?B?Yno3cmY4eklKR1MzV2h5cVF6eTl0Mjd6Q3BwdHg4SVpnKzBBOXFkY1B3Z3VH?=
 =?utf-8?B?TzlKSGFIbHd6VkRqRUszd04zcXVySGJrdml6UWdleXpSN3F5ZGJGeEZUOWxO?=
 =?utf-8?B?L2VYU0ZNZEVwK0VwTUZ3OUZXNXBrbFIrYlJKRno3SERlRjluRGRSaFJsRnlL?=
 =?utf-8?B?Z1NaMThOL1QxcWVrbitCNVFDc3A3UmpmRVI5Vk8yMGJFdWxnVnk5T2NLS3pC?=
 =?utf-8?B?VEwvOVNZWmFmWGJLcHk2MmtDV2hZek1XVU1pczdzNENKb0NrN3ZJY21MWU9Q?=
 =?utf-8?B?TDdhZjliMWtxSENBWnJCSTV1ejA4WUtidzgrUEhRRVhNbXFkU0VZdkswbkFR?=
 =?utf-8?B?SThmb0F2MitNb0J6cExPV2dwZVlRb1RkN3NacGdJYm1IbytyR3NhTDRzUFd1?=
 =?utf-8?B?WnpFT3JrTzJsSWgweWZra3ZCOXQybXJMUk5hcnQzYVJEUW45Y0hKWHJienJw?=
 =?utf-8?B?UFpsRUlQTzFFUWFnL2k5dEt6SUhuK2RnbkRqdjU3TnVVd3lGeUpMVzJUNEFF?=
 =?utf-8?B?bTZacW1lUGRhaHUwcUVoc0tZS3J1bGxJcmdYZHFIcFRpazdMcUZvaUhGZUg4?=
 =?utf-8?B?RXE1T3g2d1MzZy9hdGZsQnhxVDY5VWpvNU1IUWhMQW90aWVCVExteDRhWkE1?=
 =?utf-8?B?VVE5UCtuK1NKVE5CbkVTSmcwTG9Fa3pvRkxJUjVIRjA3czFORGhFdCtiTU1Z?=
 =?utf-8?B?ZHNyaysyd25zdGxScEhvRjVaMmxRelY3RGx3dHBpREtONHFvMjgzUitaVVpN?=
 =?utf-8?B?QUd6MHJ4RlA2UEJkZG43Z2U5MG9qYW9ta3B1ZkhzaXVaYTBCUXphOWF0MDJx?=
 =?utf-8?B?elZEdm03Q2EvTUpnZWpLbFFzVHNaNDA0Q3pGYzJjcHZja1doUUFHVWZlVVJl?=
 =?utf-8?B?YVZNUEplamo1aThXcm1lWElHTThweUxkQVVwaWQ1Nm1iYmthOHJGYjF6OEl2?=
 =?utf-8?B?emV3YXdpWkRsVU5TVHFMbU5qUkJUL2o4MjZocSt3ZS81WGRPdDRuRSt3akdh?=
 =?utf-8?B?V2QreWRyblZ4VGxlNU14WkxudStoNzQ3TVhDTURmZ0pwUDdyd2FZOFk3eWRv?=
 =?utf-8?B?V09MWk1BQnowdjdlTjdVOEE0VzQ0Z3QvRCtYbE01MUptV2x0aklOTCtPaGRt?=
 =?utf-8?B?Z3Y1TVM4dEFPZlhwSXpmR2ZnYVFiQ05NdmlIWWloSnB0REw4MG1hVGFCMnk0?=
 =?utf-8?B?bmZXM0J1eDdjdWxwZjZRR3ZHUTNmaHVlWUVFSDBmMnVpdTd0Yjg0Z3gvbzNC?=
 =?utf-8?B?UURJZWhhMTBJRENJRWwxeWN0d25rN2RJM1NvYjdVRXhlU2ZCazBDQ2RVSU5y?=
 =?utf-8?B?Wk1mWXFBL3NkQlZHOG5RL0ZxTWVPdmRuRXVLM3duREwzNUNzc1lvK3BMdW1h?=
 =?utf-8?B?ZTdXNm01UCtTdEllUGxmZFNUTFRVRUtpc3RQNjNncGlEOEZKUGZPVkRDb0kr?=
 =?utf-8?B?emFCYUhldEREVzVrN2RMWHFvUStVb3NVaUdxMFFjaEttemE3YjBNditiWmZL?=
 =?utf-8?B?RUFUTncwSmpQbm5XRnFyUmRhalIyNHpOQktxWDFab2VoTVlreTcvRlQyUDNO?=
 =?utf-8?B?VFZpd1k4TE1KZjE4MVI4cUtkRk12QkM3SExYVXFBV0UwUzlsVkFMcVEzb01J?=
 =?utf-8?B?TjV1ZjdtMzVpYnBuK2dYOG5xYUVXbGFVUnBTVlpad1A2eHZtZVhlNlJxbTFP?=
 =?utf-8?B?SXNXcW9IWkVLVGJidFRMdHVVV2t6dWlkZlFiY0o0cVg3b2tzazA5TEx3RmY1?=
 =?utf-8?B?Z25obm9TZTZnYW5ibGgwWkcwQlFQMGJxRjI4N2l3VndaRTRhY010ZDN2SXZz?=
 =?utf-8?B?bkF3QmhyUGcwVXZPc3krNzR2cEF1dEh6SEdGUWg1OUJPVTdyMzQ4SXJoUW9G?=
 =?utf-8?B?bnFvM1l2TkpUZmVQNHdDR0VQSC9JVnNYTnhIUTR4dVBrbWoxanBNTlNycENC?=
 =?utf-8?B?QjMzcnNVZjZiR1RVZ2E1WUt6c2VMQjc5VDlqWE1Qd21JQzhkcEVKWGxQQXp1?=
 =?utf-8?B?M3EybW44dG9rWElSb25LcmhZNGFjSDA3UUZUV2xnbU9FNi9BaE1yREVZQUt1?=
 =?utf-8?B?eTJKZDBVVnhmZTZ5c0pqdGtPVU4vMnliYWFNRUM0eE1sRHJoN1pRTExJdnhT?=
 =?utf-8?B?QzFaMXNsM1dnNnZTcWdRUk4vNVo4bFBIZEdHK0V0Y1Y4bmgwN0x4R0lJL1Yw?=
 =?utf-8?B?bE1ONjFTZS9rNEJUbVJUMWM2b0p2dDVvaUV3Zzg2WUxjajdObkJ6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a51234-138a-4c44-6b72-08ded0dc05de
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 04:00:54.7107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6idOHkEoHyjhjquGAMRBNsjTBwqy/1X5mKEAxz6pJH06IrN/vzCWYdLGJlWbLBp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ganglxie@amd.com,m:tao.zhou1@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1249F6B3EB4



On 23-Jun-26 8:18 AM, Gangliang Xie wrote:
> check sel_xcp_id before its use
> 
> Signed-off-by: Gangliang Xie <ganglxie@amd.com>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> index 88e6eab91bc6..39416ff7386e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> @@ -576,6 +576,9 @@ static void amdgpu_xcp_gpu_sched_update(struct amdgpu_device *adev,
>   {
>   	unsigned int *num_gpu_sched;
>   
> +	if (sel_xcp_id >= MAX_XCP || sel_xcp_id == AMDGPU_XCP_NO_PARTITION)
> +		return;
> +
>   	num_gpu_sched = &adev->xcp_mgr->xcp[sel_xcp_id]
>   			.gpu_sched[ring->funcs->type][ring->hw_prio].num_scheds;
>   	adev->xcp_mgr->xcp[sel_xcp_id].gpu_sched[ring->funcs->type][ring->hw_prio]

