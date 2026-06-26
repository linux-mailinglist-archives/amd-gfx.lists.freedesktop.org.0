Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rVtHLCsPmpMKAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 18:45:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC46CF37F
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 18:45:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=HF1spe6M;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A1E10E3EB;
	Fri, 26 Jun 2026 16:45:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010051.outbound.protection.outlook.com
 [52.101.193.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF5C10E3EB;
 Fri, 26 Jun 2026 16:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEXcXDXRZtOItuDyb6151CNNL69Y8z7v/fyXLvAfErH/eQEQWZ3Oo6hSI98k3c8yAtXv6DdklFi2Sldyhj7qanVTZuBfVGnHTPrxMQoXrvJSpjR6JVT54ssbZ+Mebsi3dkeCQksZ/tuyVgEkiMZypjhtmnRPs2FWpWNRmqzMhl+Duz3eQkP8+J1Xg7qo0Hwmz6hpzHhIcvODh//1w5uaEY6yZbJB/K/0985KZ/WGYS8tUyYhIqu9L/bVl1lmyW5tKVgff0tcB1XlXVXRhljvOd80PeoxXn2yfUHiH13bPq3QEFQgGHeC0yXfF8vYWXRlbpnnqn7ca918fb4XdFl9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH8j8iyzMjFTXiHrXjUl2gFZvDRe8f7DcLsM9Td28Zk=;
 b=p5C1SJoQHjY3PLP84/hSAuQT64czSXE+tHZC0/JsLGugsPTFCGRWi9MmZ92I8oVxkTncVCKmAnH3T5Jv/7nUGjLOiNIJik8AlTtDooOGLVzK+ImxhO0dCjrNS7j8ZJUQhNsc0/nchOdazYmla0CJOQaZPMmJUErxWVpmTHAR8rqqVDRmMx79b42VjXutLIe7AnSXOXWeEskVdm02XJkF34IchHwkpMKGc8GHxwwoGDKAvymicATQobFyooBq2wuCS7jsp81sV4BqiZnIxgu+8n0lLqlPz/hkami9hP11RkhG8rXEsy07Gye2Ibehjo+BBy3StOtDXCKkx1DBTw0ykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH8j8iyzMjFTXiHrXjUl2gFZvDRe8f7DcLsM9Td28Zk=;
 b=HF1spe6MibXKsqr6ViNTYfniPPwl/gJd4TZOntkstvlYzqFBJj9UIGQ6IcYtKMyRxqmTTqSkNQy0z8DsPQ2NIhGprRHmRZcV/OnjWSCe/iacUUaitnPsb7DXh+WK0u874SY+HSf59s+KZA0Ow5u+uMqc1SH6COZfgJ/Sw0axo/Y=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 16:45:27 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 16:45:26 +0000
Message-ID: <35dee3d1-f114-4eda-8185-244bc429c021@amd.com>
Date: Fri, 26 Jun 2026 11:45:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix: drm/amd/display: dm_update_crtc_state: skip_modeset
 path leaves new_stream dangling, causing double release
Content-Language: en-US
To: WenTao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: siqueira@igalia.com, alex.hung@amd.com, superm1@kernel.org,
 timur.kristof@gmail.com, ivan.lipski@amd.com, aurabindo.pillai@amd.com,
 chen-yu.chen@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260626124128.36625-1-vulab@iscas.ac.cn>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260626124128.36625-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::28) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|MW4PR12MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e068c59-22ed-4cb3-1f54-08ded3a2530c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|7416014|376014|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8L0kK9rc/EK+SjVVefqlB65+Wo2YuNxm140XB+gH5pZRl1YViNB8k/nf+DXVPQkU1hRdcVQphPgjrkZ2aEdu3IRm4/4eNofSRRfO5irVfkUfvxKVi8ZlNmWRXPUOWYfYfxC1/Ie2nCVVcNg7UzlmN8ZpaCPUYXGnJLgg4ZNnd6CghA6WlVU0pedPF+DjBO1Gxc68LUuMm7UNk7Pi4t2RJ/JZGixsiVdA7fpxR4NIh6KmCatuFXBhnebDPHl+7YhcE5OuXhLYnSg2vofpiUa60APCfLaImXWokipj5lkHAZBps556Wj2v38Ajs2OoFuD07zwJNaT2Pbc50aVJ/Ap4li0EkAUGuXgtjx0kiSbaR9YALKDnwqySo0GsyeWM2QerlqYM1D9fuX0c2+cYz3+gmJzJVn1cc8of2k/mCOlWXmlgp8Ll0DjlTU9KpmA+X6dyRcl0lxq6TXa1jYgDF3tZAB4wVXLcPZuIRrolgrcmQIdD6sMOd2xXQHq4TzDgA7yRvINi96V86sreU6yKXszLCyph6q0w2HcMpbYbsntTZx4G8QkEIFPahTg0hS+AmYw3Y4oPjl6XHBQnSYhH/DzD4YUa+3QIJJz9PTjM7/8tgOP2pKT+gkDMStqDuFaa4UUashBNJ3DPtfLpcAQ68EtKVhxUW8/bpi0c2vBxnvymSYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6914.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2R3V3RMbVNFVnFlci9qVGNEaFRqNWp3Tmszd3FEMmJvNlJJaTU2VVE3R3JM?=
 =?utf-8?B?Y0Y5YjNTNGREeTNqaXVNQnVrdjh4ZnNLcitPcDIzUHU3QzA2K2Q1cHhTRkwz?=
 =?utf-8?B?ZGM3OXNITlJNb01FUEJBM1Irc1VKc3d0Q09QU01aWHRObTcwei9paDloUnl0?=
 =?utf-8?B?dGh5KzJWTThxaERoby9NNjJCdTZrWkM5d3N1OHF0RnlJZFRiTnhSc2ZPVS8z?=
 =?utf-8?B?MG93aHgvVVBqZHhDRFFyNjV5OGwwVHM3L09GU0kwQjJDdTFlVzY3cTlRUXlS?=
 =?utf-8?B?dVpLYjJ3Y3Bxb0VMcndIS3BVQk1NWVM5dzVKQ1FPYjlocDVvR2hwVWdiWmhG?=
 =?utf-8?B?RiswOE1SMm5pN081N1VpOVVNeEpHUCtUS2w1SE9ZK3hBUnA0S3I0UVB1UFE2?=
 =?utf-8?B?VzcrejhGZXNYaDNRYVZtVlJKNURQKzdXTWV4UXZOcnpUajVmNG03K0l6OVE1?=
 =?utf-8?B?eEFJZ3FhUTVubkRyOHdkNU1tckNnYWNlTXJBN2gvZ29YU0hYZTdpcElKaG5U?=
 =?utf-8?B?RE1WbHhYdEE4TS9Wb0ozclJMYlRVdmhXVXdsZ2dzMkROQzFpTFBQVDR5R29o?=
 =?utf-8?B?WFNCbXcrVkpjRzZVdzgxQVZRNnoyVCtYU05jWGtQNnJFVWVyTUxWWFRibXMx?=
 =?utf-8?B?SWlxbzFKeWcyb01oR1AwSE8rZDJvakwxOGhGZ2MxSkFkVzM2QWtyZUxjS2k3?=
 =?utf-8?B?WnlaODF0TXpsK1F4R2NrUEZxWEN4K1Z5QlhKaG1UQ1NSdVZReE1XYWVhVERC?=
 =?utf-8?B?K0M2TW15VWFaQndhYXlyckRRZzJFL0R1YnRGMkFKWGVBN3VBSFNvckJjRVJX?=
 =?utf-8?B?WXFhaFZ5cFJiTDFyVkdRRmdUMTdnWjU4VnZvckNwWVpJRGVDdWR4TjlBTnhE?=
 =?utf-8?B?UG1VZzBqMmtWZXh1ekVIV2VVT3lwOTJmMThhdS8rTFF1dVdUUWdZMTYzUU53?=
 =?utf-8?B?dm55Y2NwWnErdmUzaTVuc1ZTWVJacGxid1pDeVdwUXhLYmhTVjN4bkd0RDZV?=
 =?utf-8?B?Z2ljcTgyZ1cwamVHanNGNkpKSjE1MERReHBhdUFzZVNrZ1NaaWR5TmYxOE11?=
 =?utf-8?B?Z0c2SWNOQmZGeFVxMi9JZE50QnNSbFQ1Q09TQlhQblQ0S1hwYUp3OEhBeHZZ?=
 =?utf-8?B?bzRCdWFpUy9TVjh1V21ESVhVRVROaU9yNFhJZ2F2ZmJMZ0FueHhFcjdwUUpu?=
 =?utf-8?B?MncrQ1BLUTJJaVZOUmVqRkNRMVJJdEt6RHNMYlMrS25FWG9wdUFMa25WcUZZ?=
 =?utf-8?B?Sk4rUTdPdHoxWVZoSFdJVTBlVitDMUxqQUdKNmlXUjRRL0t0eDBUUzJFdEw0?=
 =?utf-8?B?dVRWUFBHb1FXQkh3UG54dE04ajVvWHcwY1BiMGFXeWo0VGNSUlBzcHQ3NWtD?=
 =?utf-8?B?ekdZU0gzczgrUzN0bDlrTTB6SGtLNlVuU3djUGsvR2dWNWRpcHBmWjcrbkFu?=
 =?utf-8?B?Y3dYSzFnc3Y4RkloWVlkNGY3enlXMS9rUVdIVGFKOG05Z3hjUVp2K1BJSHQw?=
 =?utf-8?B?ZDR6OHUvcGJUUGNvVTEwYnRsNUowRmFJUjl4emx4SVhURG9DNmp5bm1PYUVo?=
 =?utf-8?B?cW9hZzhuYUZpelREVUVVRUhSMmxKWWQyVmo3dE9tSGR1QlZzRHpNaEIrcTlS?=
 =?utf-8?B?NnNBMVlSL2FjQU9DeWJaeTVXVmY4TlpialQ3bkJvS25aL1ZSM3h0Z1ZrWlE3?=
 =?utf-8?B?ajdFemRJVTZnemRQMXFZVVVoWkZnQWNOZmVQQW5pQWdIZ3dRV3h6d0JRMlk1?=
 =?utf-8?B?NXA2SlZKT2NhQ0Z6bktzUXFBK2FVOUJ6eHhYUWhKRytYSjFqOU5FS2JzNG55?=
 =?utf-8?B?bW1ML0JxWGVpd0l3ejlCTFhFMzdoWmwwYTVyTVVoV1FwcHpsUklhLyt5UGFE?=
 =?utf-8?B?ZmpDRGtEaWN6aTBLdzZlYWEwQmQwLy9tV0s2R1NJZFZmcjc3NDZ2T1JIMVZj?=
 =?utf-8?B?NDIvUEd0MWlPbUNCY0JselcrQ1V1NmRPTzNDYTBud20zcmRmOXF4TitIUUhO?=
 =?utf-8?B?Ym5GUHUxcFlRdllXNnBkeUNVd2pqMlpRbzNvNWpyUUwrQWJKTUhzbndhRkUx?=
 =?utf-8?B?bkhGYTBEKzJUa1RJb2hiaHJDNW9hRndadmJDZDM5SmlRRXVKVEx4ZEFwSTI1?=
 =?utf-8?B?OER2M0hmeDhwbFJQY250VUpnb2U1aDc1U040UlNRcEtqMzF1S0ZmeE14bEs3?=
 =?utf-8?B?YXFoS0NSbkNGQk1COWFxWEIvVm5qNXZ3akJXYWhJYUtkUGxJWEp3Yit1Y2NI?=
 =?utf-8?B?eWpuY05YdFBTQXM5UDZZVDVub2kvRGdLMjVNTU1ic0prNktOVlQzTVNjZ2V2?=
 =?utf-8?Q?gntRYsFeT2jjvmL4w0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e068c59-22ed-4cb3-1f54-08ded3a2530c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:45:26.6646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQK/qjQsfQkk7Tf/s+rlWRKCUAtT5u7i7iXpuVfhttpSR8GZDBS7Bov4O5SgxkWefT/43RQzRDXv77R/8eoyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[iscas.ac.cn,amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,kernel.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,iscas.ac.cn:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FCC46CF37F



On 6/26/26 07:41, WenTao Liang wrote:
> The skip_modeset path calls dc_stream_release(new_stream) but does not
>    set new_stream to NULL. If a subsequent error (e.g., color management
>    failure) triggers goto fail, the fail label executes a second
>    dc_stream_release on the same pointer, causing a use-after-free or excess
>    put on the stream reference.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3ce51649cdf2 ("drm/amdgpu/display: add quirk handling for stutter mode")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>

The code change looks good to me, but this Fixes hash doesn't really 
make sense to me.

Are you sure about that?

I /think/ this is the correct hash:

Fixes: 9b690ef3c7042 ("drm/amd/display: Avoid full modeset when not 
required")

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5fc5d5608506..acf0b01d6f62 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -11708,6 +11708,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>   	/* Release extra reference */
>   	if (new_stream)
>   		dc_stream_release(new_stream);
> +	new_stream = NULL;
>   
>   	/*
>   	 * We want to do dc stream updates that do not require a

