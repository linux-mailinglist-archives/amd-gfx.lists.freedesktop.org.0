Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HyfHLJsMVmowygAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 12:16:59 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F5875350D
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 12:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=QBRVfRJu;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494810ECC2;
	Tue, 14 Jul 2026 10:16:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010058.outbound.protection.outlook.com
 [52.101.193.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39DA10ECC2
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 10:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RA+mcTGvANS22SXu8fL3N4eOlDaTVFZ46+1UOxUDP042CEvmxw22EzHJJjJyR/Nz7/bRa6zR1C1QPZhcO5SLzwldjAKWCM7mNqdapK52DpVu365H5Fp/VyetWNqwt+FuMoNh6Abqev1E4M+TFtRiB0ctrLVybbIo3cHvvwS1YWOBp5ibzTue5dxBWOAApjFfXyXxKitBgaOATnKOgy+8HhE9Ldy8NnbNHUTG0ykbu1+he9VQvJtWciqRm9BAcait+E62AuNA7ahaKJQbNUU91xWOq7Y2+tRYea/MJTFjC0VVESao/O6jcyjwpo/3depaoN5zqPlSKBSp7fCzrwtCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLWsgOSFGDLU3DH8+6TecdE+UMAzkXMOHXwihlkSDA8=;
 b=f0t9lgD+zuv4jAjT3pcnpZk0R/ayUWc9PFR0Z7+aXjvAnxN45wltRemQzwDTmarFp9llb3MS8C8LMBxDkeNGMOnMv43r+oj3UTLnZh3EFxizzs+8R3GBJ8m81XLgpxY1OPleI+DKJMd/8mJJhsyq70DOGCLylyb9Aja7+IVlwGFaHklc0ujRVbZHMSShYSWv1Kx/f70//twtsakPg8rYLKfJBICE+cvq12jUlkKhStD17eYhSpqZ/ftojvBi0ac+ZUpXzNws7pljQea/qWFu7+lUURzp4OfwAM0K+1zZ4MWxyuqCAwrp+UbOO/685PUGm2JP864cVjdJTN0Fr1XrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLWsgOSFGDLU3DH8+6TecdE+UMAzkXMOHXwihlkSDA8=;
 b=QBRVfRJuUqxbRrmOBlsc1wztcH4voN/g04Ywi5ZlhNcGoSwFfhE0S39ezZ/8Qb/bQHpOWItZwpbDbTgLqUtFPptJAAiH28s1mt3RZIlqsfaSY0+EZLvdOItDZOgvKgFfczgL2PWvyk8gulhFguKWgiC1/QB1dlpmrIx8JsshHYo=
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 10:16:47 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:16:47 +0000
Message-ID: <94866f41-1a60-4b5b-9ebb-89eb80697ced@amd.com>
Date: Tue, 14 Jul 2026 15:46:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/ras: initialize CPER after XGMI reset on init
To: Xiang Liu <xiang.liu@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Hawking.Zhang@amd.com, Tao.Zhou1@amd.com, Stanley.Yang@amd.com,
 YiPeng.Chai@amd.com
References: <20260714095832.52308-1-xiang.liu@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20260714095832.52308-1-xiang.liu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0275.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::13) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: a98ba6a0-b353-44e0-9e53-08dee1910323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SgrFambBm1TkFAGn0Y44SWY/tCbH6Dc89vRvbuuxiTPHEfM2ornL2BSIub6WCIJrL5nv6FE5PDdH3qhFywzVHCpbnjfEBvwWJ8/Xpk3GLNaW1MJEuTcGYwJTib2/0nKEV+VK/OvFM+X1UKbuas7OlwuxUwE5LRxFX7BzQkrk6QqY6JltImH3eaOHtUmirlCUvfmQWcoPNYZZP4dtqD8kPHeCUCJeA+0aUg+snyz0MwbLENACQIVHRPf1Om78gbTajXztQkFTZU7Bts8WJa5IKpMGZIhNzxE4G3aa46vtT63rUfPJ8OtML0m7t4F9EsO9T0JaT4tPFlLnUXGDQ7wINAwxrngVnlfKMUcjTb2KD71dg1QTedNy4qcqNV9i7AcMZAfL7b3upJjxVcRcYTBovFCJcL3vn2znBW/iWGXyxecTGsbn9mZy1Rnrekwp2w8XSlqqu11Ik0XnYtDD7peQ5ULrpYHZvHCKN3fY/bz7BGK+ULLnQpXS4SJ2FyShHh6tH044hmRCyHWRCGZgi3gZCTIH9UvTYhpo+IwT+6lsivhm+kgjqvkvAbPADOMciuepSLIAF0qAKjQC9RQ/szNv6eRe+STIxnM2hrZumPIQ31OyBZxfYPxKIgb4Ys9JJ+WxD8VvM9GVLRqv488iuYmWVCodKE15ymElY+oWTJuvaZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhIcGZqQ0lGcjNsbGtSeEFsK1VidC9Ba3FjMURSVzAwQnBqTCtwRnl6TEtX?=
 =?utf-8?B?U2pwU0JsVjhtNDUxdm5jbUlXUmJGc3QrUVQ3cDd3dDNOVDRjUTBlbEhibUR3?=
 =?utf-8?B?MHhMekdneWdndFhIZnNzT3k2VUM3dTJwWFV1NXAzTDhSS3lCOUs3R002UWl4?=
 =?utf-8?B?ek0zUTBBMHhyNnZWbDdQRGpBQlNKTWg4OWoyTzAzSTRUMWlsZG1rZUNlREs4?=
 =?utf-8?B?TTZHSUd1OTVmOVNFeHFERnhTMTVkZkQzbnUyMlFPaEY2UzF3azJTM3ZaeFZR?=
 =?utf-8?B?bmQvTk9jcmk5OW16T3IrWGttcVF5RTArT1RaTFRXQjhrT1FXTHE3Y0RWVDg2?=
 =?utf-8?B?S1dpY2JDMUFVV2Nia1ZSa0lPejBVaHhsQjAxdzFWRDVJSDYyaUVYbnUxM2tt?=
 =?utf-8?B?SERwK1JmdE5KRXVWU3FFT291STBSM1ZmOWo4aWxaZzBGVzg3TVl6ejhlT05V?=
 =?utf-8?B?aFk2TGU2T1lQR3Z5cWdRRHBoVXhZeGg1TFdYamtIVUw1c1hQQjFjTkFNZlVj?=
 =?utf-8?B?QlhVMmxkakZjaHA5ZTFBeThsRWtPd3NKWTFNV3Z4VS80M0Y2V1laVFB4NXdP?=
 =?utf-8?B?OGpyejZHbTB5eFZvV09WM2J1L2lZMTVnY2tPcjJIanFFVUk5WThKS0RaNG5r?=
 =?utf-8?B?bDBQem54YUdjUEQ2QzV4eTVYWWh6UlI2SU1PelBlM0N3M0xmdUwxbzVHTUpa?=
 =?utf-8?B?SHNTRW8vMWFNa2FLVUdmek9nZEkrQkNpeGYzNjZQTU9PYmZCVW5FR1pUTWQx?=
 =?utf-8?B?cWtwR1RzYXpzaFVxbFBsczkxVmhJVmRHdm5mdFVTOWk0eHNYM0ZaZkpDZnJ0?=
 =?utf-8?B?OWYrSFhJZ1lTNVZGVnh3K3IzV25hYkJLdzdQbHNpWmpSWXV3aStLT0pWYjRu?=
 =?utf-8?B?U0lzV2JnVXJiRGFNaHBZVGl5TW0yNDc3VFVObWs3OEx6OE5LM05pRUMxVG9i?=
 =?utf-8?B?eW5iVk0xdG1DSDBzTGxTVWVVQkpiV0lPdFFFZExxdmRoL09HVVN1eFQ4U3U4?=
 =?utf-8?B?eWFVSDg1QklvaWlWMUxUNTBxYkxKTk4rL3o5YVpHcXA5YytQV2dyRzdSY3gz?=
 =?utf-8?B?eUZVTDlJWnJEN213VGtONkk0OVFGNmM2TUtEU3p2UGtoT3hweEx0UkN1anI1?=
 =?utf-8?B?VmQycGZzVG1PekFISnN1c2dtaHlmMkNPc0c0ZktLSUdzWWVkN29Jc3pGYzUv?=
 =?utf-8?B?NFErWldDQnFqVTZUT0ZNdEsyWEpPZWw5dmVpb1M0eU83YjVnYVJaa2VyejZG?=
 =?utf-8?B?c3pJb0xZRnRJSS9CYUFhS0tyRzE2bktBRkppTUtwSkdBeS9OYnMzSktYbVdt?=
 =?utf-8?B?TG8wakt4RzBjUFcxbEI3cWFXQ2x6RzZPbER1ZHYxa1JERlZiZGU1TzZZYXdy?=
 =?utf-8?B?YUVqWkg0SFVlb2V1bFV0cG1RY2JnR1h5Yk9FRGppK21QbVJvNGVyemJlS0RK?=
 =?utf-8?B?ZysydFRZYVEzNDg4R1J6NS9FV2hKY3M4aUxzTkVocFBoOHZabnpnRWRlWldl?=
 =?utf-8?B?ZFhhRStEVEUxQkJjMndNSlRXT2tiRGhxbjlQVDRzc0FtOHhGVnpxbkNaY1VZ?=
 =?utf-8?B?MTBuNzJjK0k2dytKWndZd3hHa25ISmxvSUZTeGF0eUV0ZW1CYko2VUU1SlR1?=
 =?utf-8?B?S2FvZ3dvcGlPeVR4K2FNZUkydzg2V0lrZGt5aERsT1Z0WENvVk1ZRlp5ZDdy?=
 =?utf-8?B?N0lUc3JsR1ZtOXgwUHF3eHdobWVaQXRoanRBckR4REU2cVNiV0YzVnpEbnhV?=
 =?utf-8?B?bmNURHRFbHdtMEI3VnJpbk14NENXcUszUGlLR25CVlJSeXYwL3Q3N1d1QUVn?=
 =?utf-8?B?QWVLSUhzWUh6UFY3a2dTS0JRSHlySHlad0x2bnBMSGVkR1B0OTJYdzROS2pF?=
 =?utf-8?B?RlZsa1R3UzNMVFNHdVNjZ0JCd1hRK2FWTi8zak9lWmxwcDdvdWN5QUNldWhE?=
 =?utf-8?B?TmlMZVNITlVlQkoyd0JzV2lYVGlXN0RpZGJqRUZSc2pnU0xDSVdCV0xUc2R0?=
 =?utf-8?B?VDNjaThnZ3dkdE5nd1BxT3ZEMzNjYkVvWGFYZFdaNit3UXZCTmdKZFcraVhS?=
 =?utf-8?B?MWZoZjRRTFJhZkNhcnllRWRSVDN4aDVYQkpDT0ZkVUtMVXk4cjdIcDZzSncr?=
 =?utf-8?B?cy95dzloSzErdDlnd3BZOGlxVzQ0cXhEdE8yTGdMR3JEak83eHdITm8xR3dY?=
 =?utf-8?B?eXNDSU5tUDh2N0hPQm9SL0g0NlFTL3cyd2Q5WWQxbk9hMkRXV0JLUUkweklC?=
 =?utf-8?B?cjBlOG1rUVRFUElwMllvazErakFsYUZBbXN4TklTcDlqZmFXYmtBRThNM0RO?=
 =?utf-8?B?ZFY2T2VVYXRYbXQ5ZE0wZXdBUzVhQUJ6RVp6S3JHSGRId05yWklCZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98ba6a0-b353-44e0-9e53-08dee1910323
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:16:47.4235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIvHx/BcP7q4Y3IbLt5CF0a12U+eKWk1SzfasJ0SEEx4ILgSzdNUFRRP3k8aXXNN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
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
	FORGED_RECIPIENTS(0.00)[m:xiang.liu@amd.com,m:Hawking.Zhang@amd.com,m:Tao.Zhou1@amd.com,m:Stanley.Yang@amd.com,m:YiPeng.Chai@amd.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1F5875350D



On 14-Jul-26 3:28 PM, Xiang Liu wrote:
> The XGMI reset-on-init path can run while the device is still at the
> minimal init level, such as during an NPS memory partition switch. In
> that flow the normal RAS IP block hw_init is skipped, so unified RAS
> is not enabled when the early CPER initialization is attempted.
> 
> Resume RAS after the XGMI reset-on-init completes and retry CPER
> initialization for devices that still do not have CPER enabled. This
> lets the CPER ring come up once RAS is ready while keeping the path a
> no-op for devices where CPER was already initialized.
> 
> CPER may now be initialized after the normal debugfs setup has already
> walked the ring list, so register the CPER ring debugfs entry from the
> retry path when debugfs is available. Track CPER ring debugfs
> registration to avoid duplicate registration and clear that state when
> CPER is torn down.
> 
> Signed-off-by: Xiang Liu <xiang.liu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c    |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h    |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  5 +++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c    | 15 +++++++++++++++
>   4 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
> index 6fb129025761..7513541e6eff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
> @@ -504,6 +504,7 @@ int amdgpu_cper_fini(struct amdgpu_device *adev)
>   		return 0;
>   
>   	adev->cper.enabled = false;
> +	adev->cper.ring_debugfs_registered = false;
>   
>   	amdgpu_ring_fini(&(adev->cper.ring_buf));
>   	adev->cper.count = 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
> index d12c98077d9d..76df176eab9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
> @@ -51,6 +51,7 @@ enum amdgpu_cper_type {
>   
>   struct amdgpu_cper {
>   	bool enabled;
> +	bool ring_debugfs_registered;
>   
>   	atomic_t unique_id;
>   	struct mutex cper_lock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 3d1ede5f8de2..78130f8565c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -2184,8 +2184,13 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
>   
>   		if (!ring)
>   			continue;
> +		if (ring == &adev->cper.ring_buf &&
> +		    adev->cper.ring_debugfs_registered)
> +			continue;

Instead of a new flag, can this check if (!adev->cper.enabled)?>
>   		amdgpu_debugfs_ring_init(adev, ring);
> +		if (ring == &adev->cper.ring_buf)
> +			adev->cper.ring_debugfs_registered = true;
>   	}
>   
>   	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index b265b68e0f37..4ec8e446d377 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -1400,6 +1400,21 @@ static void amdgpu_xgmi_reset_on_init_work(struct work_struct *work)
>   		 * initialized, and for non-uniras devices.
>   		 */
>   		amdgpu_ras_resume_after_reset(tmp_adev);
> +
> +		if (!tmp_adev->cper.enabled) {
> +			r = amdgpu_cper_init(tmp_adev);
> +			if (r)
> +				dev_err(tmp_adev->dev, "failed to initialize CPER after XGMI reset-on-init\n");
> +#if defined(CONFIG_DEBUG_FS)
> +			else if (tmp_adev->cper.enabled &&
> +				 !tmp_adev->cper.ring_debugfs_registered &&
> +				 adev_to_drm(tmp_adev)->primary->debugfs_root) {
> +				amdgpu_debugfs_ring_init(tmp_adev,
> +							 &tmp_adev->cper.ring_buf);
> +				tmp_adev->cper.ring_debugfs_registered = true;
> +			}
> +#endif

Here it could then init both debugfs and cper together since cper is 
enabled only at this point.

BTW, is it possible to call both inside amdgpu_ras_resume_after_reset? 
If not, better to create a wrapper function like 
amdgpu_cper_deferred_init or similar and move inside that.

Thanks,
Lijo

> +		}
>   	}
>   }
>   

