Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V0H3LJD2K2qkIgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 14:07:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8336793F4
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 14:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=tKC1iJPD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D1410F487;
	Fri, 12 Jun 2026 12:07:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011041.outbound.protection.outlook.com
 [40.93.194.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33D310F484;
 Fri, 12 Jun 2026 12:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3AhdeuDgD7e9Cs8cE9U0k+XK7FGUwDPQ9GHJCYjcvyC+vUzDRVMK9/V5FUkd9uvJxd6GAfHlXmob+sq8ihR9GSZEhc+A2uahOmokoOOOk/48hYfdE14/SrseE+v28/KV4lPxSmBVIwCZlMIY6B9kZDFeKqMVz+5KSSgLYW7VeZ3jPVEZM1CmZI7UALcLfvWhZSjnO90++OAw/Q0gIScH/o33VxRDXr2L9rtUc17MpinmpcjwapnP5lUEtKVWq5BK1abzb77zsqnTJE8HIHAY8M7tnlrlGy+OL915vMpNutzW7H9PUFeNjP8d/L7UmosWlXmb89Qx/Yqbc6qltcwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usEABM9MaqhGIfrvPK69KOGt/YFOmbFrWFljJW3f8xQ=;
 b=bfigRxYwZW/vaDCNZsAFMuCGHPu+nCaKwpZzDE6UQ87YDFoUwlHO8Ukvt9DpDa+YJWaNj9eYZYXjhSzRWuOvz3T9IUuDvo/3LYMP2tDVPT+i6/pvMNdE4+UdAtctR80lYFly9Um9rhULZQDQkU097Ll3+T/eHxqTXEnKWKMDOsMV14lK5x4PM9a4DyFeiYMp41ivLGowParRPuBCrfe2bHmyN0UAYG4JHVC3aYMhWLpaJCbDvxCCrOgGgk53bnBA5VGPts24BfYA4xVFQWtT1aYlJlZs8HUHJT9J3JtiuK6WdF2mykgX3e5hIWZzrsGR9M+ddtluKbRqg3hj8BZOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usEABM9MaqhGIfrvPK69KOGt/YFOmbFrWFljJW3f8xQ=;
 b=tKC1iJPDFNQmCV0bkgXuXMgIXaZ/9k44QLGvYyKKc0seTIX16YR9/6jkuG1lyH0Sao3BqHuUsu51+z2ag8ZwuOkVdbbfnoSavFRVOXNXFzw8IdBvZZUivoVZQ/vbU4njqxX8u7Rs3dKBuxve72cecfVkvUC96xgJkch+pShTrEA=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 12 Jun
 2026 12:07:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Fri, 12 Jun 2026
 12:07:34 +0000
Message-ID: <e9d48794-ac52-47f9-a9d5-4e6e11d6e0cb@amd.com>
Date: Fri, 12 Jun 2026 14:07:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/18] drm/amdgpu: implement SVM attribute tree and
 helper functions
To: Huang Rui <ray.huang@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Xiaogang Chen <xiaogang.chen@amd.com>, Oak Zeng <Oak.Zeng@amd.com>,
 Jenny Liu <Jenny-Jing.Liu@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Junhua Shen <Junhua.Shen@amd.com>,
 Yiru Ma <yiru.ma@amd.com>, Honglei Huang <honghuan@amd.com>
References: <20260612090928.29682-1-ray.huang@amd.com>
 <20260612090928.29682-5-ray.huang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260612090928.29682-5-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:408:ff::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: e922c91d-56ff-46e6-627b-08dec87b2fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|921020|3023799007|56012099006|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: gifl3ILwtyrj7tSMNG39TOcH/3c39MT2PMa3IcNDdWIvAi0IDW+2aM7tuEWK7MqG9dAKT8jLrrwNjeSNJZDa305NIaej6JklBxJXgcr4TVoiwkQKYEfcGBVKo+Nv7NfTYxBSVwc570qkPhSxWwX+dwLzzqEx2u4j/M3T7HYyYFibYjGMvWFOejp0Z1oTfjq16gjwzVbihuQGRVW/3FQiBGMU5kWvPWLbGSfxprDP3yOf7fXugEKD1Be7HwO3BxTpIStDa76q2HhqCaiUiC2/NijXx/5ZmuHFsD7Z9VS/MH1KVCJaepqZzGnpcWBZ5rRHXtujua0s8tRmPWk3lmbBjsIgwszYuPWhQf5TKotdex9qZ/UH5YlWM31G+aBWPTa5Up9wcHq6itDdhWeWjqQ3j4iUI3lOEj8BUp424CVno/NAmAX3reIIy3rkrqdc3HkCBbaj44C5Ab2dsLp94B7Fwe0+FHn59eDAtzvTCbLCDsQVb8qxXbVPZQyeWiouBeX9IAkgg5Zb1OPxsmFfou689/NzbL0QD4ai+UxvuLbtZmNqdRJqtMh39L6iml/uq0jI+PABkUNqTgo0KRYNOIuuhvqbcJwDrQJZr3qblo2mESDGAVCtCvq0LChTUL99/qzAH0xb3NZxb1xh4QlceqqKvWaIcyPbIAsqJ9aZZkXcX0tjC/3TSh9FboNliuFMuYMiFRT7jFiC+psURmpO2nd+cTPTn5331U0ToXf30Fzp6iE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(921020)(3023799007)(56012099006)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VJUTRqb0xrZjUxZVE2anIwMzVoQzZmbFJid25VdWFZSmVaUjJvUklGSVIv?=
 =?utf-8?B?Q1U4dk85cENJeEUxcmtKQkM3alR1bEdndEdvSzhSekI3eUZOeCtnT1ZKNzBJ?=
 =?utf-8?B?L3ZxSWV4VU5scDd4TGk1dzdvbVY5cTFsTmhEN2dabUxDMWVrdHJBUnd6OHpC?=
 =?utf-8?B?UDBPSGFqeHFvMW9leTVtaDJ4eXF0NjdvNXpKa3c4L0djeThZbFg3c0l5bzhm?=
 =?utf-8?B?L2dvNklSOTJGQS9McEtpR2J1UUFmZ24yL2hxNUZVU0I1NUF5cTluemtCbmJx?=
 =?utf-8?B?QkRlSU03blRmUFgyMXNyMVd0T2srTnhhRkFNbWcrWkpySXlzdExuT3lqNEVj?=
 =?utf-8?B?dVhPZEw5QjA3ZElZUWtyclhQMllFTkt3WEs1RE9zaDRVS29YWVZNZXRNYlBp?=
 =?utf-8?B?SGlhQnF1dDZQZVVxOEFkWStGVVlOTUJhUzdkV1UxSzFBZnRkWnlTeUxsV1JC?=
 =?utf-8?B?N2pxWlZBdThjZFZLZURuQ3U3Mzg1UXZUajJWNFBtZTdBcUFoTVg5SVRnZFk4?=
 =?utf-8?B?YjVqTjd5MEtnVTA2U0JzMmJiYWVzYXBEV3oxZzlsWjhQcmZCRi82R2dnNE9u?=
 =?utf-8?B?NjVQRVBBWFlLWFQ2L2xQdVM0cDZkd3FnaW00ZmFyb0h6VnlrVUgwMDV6Q1FI?=
 =?utf-8?B?dW10Ym1LdlZWU2dRWWRMMk0zWGRVdDFiVUhZTVN6TlpkV3hKLy9zeUYvaXg0?=
 =?utf-8?B?U2NDRHpleGplNWZrWmdYVFp6Z2lJcE82VVA3N3V2eENxei92cDBWSGkvTmpj?=
 =?utf-8?B?YVNuU1JhaHVVVmMrampiRVNaMW42QkozMG5SMFpiSktkdUo4MU8zU0h1eUNq?=
 =?utf-8?B?elB6bVBzeGNvL2tIZEtVQk1qclB5YTFIU2U3Q1dNU3NudHdnTVZ3c1JVQ09t?=
 =?utf-8?B?TnhQNnhQNnFYTk11bVE5V01nbWxEK3lucUZkQWRoNUpFcENjY0RDWEhuVjFJ?=
 =?utf-8?B?SWUxOUZ4K0poaEFLZlVLclM0Vm4rVzlVUDhGR05EU1BPb3VJQTRhS2x0cmt5?=
 =?utf-8?B?aFczK0JBVXhYcm5aVDZCaGZKRmEveTRtY1FSSm44YlZ4enN1U3ZpS0R2bDZN?=
 =?utf-8?B?QkdjV0dweCtFWmN2cUJ4T2NUYTZKNGRLLzVMWk5Cc2lzK0hFVTR5R0p1OSt4?=
 =?utf-8?B?NHIzRnBZMndJZnViM2orQTlvWk1iNytaOWNVcGZ6ci94SGhQbHByTVZKUkpS?=
 =?utf-8?B?N3BaSFBadEhMNlVyOTlRN0paV0ZqN3kyU2JBZTBlVkR1ZUNHK0ppUjRQMWFq?=
 =?utf-8?B?YmJkeE1taW1EUkJLdXRTYlJaUmpNc3hoL3JUUVZ4Y2dOUmlyVFQ3L2hiemZi?=
 =?utf-8?B?UStpN2lIYWw2NGxtMitTNm9jMEFHck1ycTQ0WWlmc3VqM2pyNW12YjZyRTN5?=
 =?utf-8?B?RmMxN3RDSmVuQXVZcm9ycTFjRU1tMWJlU3BzZkJQQlJrUUVwYVdrb2FSakVz?=
 =?utf-8?B?aWNheGZCS3hWQWdkdGJxUWNuWkFoUTRMU09lZ0VwWjI2QllzU2FIcngraFMz?=
 =?utf-8?B?QlRKeGhXQjFlS2wvbUQxZStiVi9pV3g0Rm0wazEzSjhsZ3g5UmtVWDZMb0lu?=
 =?utf-8?B?bFNqQU5FWDVXd0t2VkdRZGlUSy8vMzRVOC96aTRtZzBrTUtyZ1VIekhBQmI4?=
 =?utf-8?B?ZFJMZDZJdVpCSnRhWTZNWWZVNit5Njdqa3d3bW1xZTB6RU5xSFZBQktBQW5V?=
 =?utf-8?B?cHRZTHNHT085RFZLRHYybkhpbjdpNW83WXFINUhOOHlHMTNrMFAyN0xRM2RS?=
 =?utf-8?B?UnFpYmJUQ01kcXNQbHh1elVmSCtyMnFKNzA1THBWNzhFM3UxWHd5NzlLTkF2?=
 =?utf-8?B?bCtGdlk4VktyUGRTOVdjSWZ2YnFIcFdZVEx1V2dyQzVIWGJRTXBrcm5uTncw?=
 =?utf-8?B?ajBTWVg2V3p0aFlRc2dScTgwTS9SdzlEU0kwKzdrRUttOXRoMEVRdC9Mbmlh?=
 =?utf-8?B?UitnQlp6Ym4xMFpZbzJoQmdzblV0cmNQNW5BYjVKc2JBU1ZRcGFXcDNVanE4?=
 =?utf-8?B?Tk1ybzFRQjZjQlJnMW9mUmpjNXM5QS93VGp1NEhGTnpiY0ZMei9xUDdUQi8v?=
 =?utf-8?B?MzkwclNueGRDVUpWSHN2TVJmZkFKL2U2OWtrMmhXcEpEQnZoOVlsNTBUUzUy?=
 =?utf-8?B?eWZDUlV2aHpxOWJ5aDJDZk5VaS9nYThlK3lOaWErU0hPa0wxcUNrOUhkcldB?=
 =?utf-8?B?SVVvVFlQNXNXOUY4TXJkMkp6RlR6ZTFVOHdpellrMUd3dFhkWlZOdnIrcGRI?=
 =?utf-8?B?VURab2Yzb1pUb2htM3VBY2xCT2ExNytmalJxd1ovd043RWtxWjVXbjQxL0Jh?=
 =?utf-8?Q?zT7TBw6K8Bkxp2y6WD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e922c91d-56ff-46e6-627b-08dec87b2fa4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:07:34.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae7CASIW+4bTYDgjjjzhOlPlABh4XmSjjph7zIMFRWKmrnd5vDGhARcd3XSCGN5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C8336793F4

On 6/12/26 11:09, Huang Rui wrote:
> From: Honglei Huang <honghuan@amd.com>
> 
> Implement attribute tree foundations in amdgpu_svm_attr.c:
> - Slab cache management: amdgpu_svm_attr_cache_init/fini

That's superflous as far as I can see. Why is not simply kmalloc used?

> - Default attribute initialization: amdgpu_svm_attr_set_default
> - Device memory and VRAM preference helpers
> - VMA validity checker: amdgpu_svm_check_vma
> - Attribute equality comparison: attr_equal
> - Interval tree CRUD operations: find, get_bounds,
>   alloc, insert, and remove
> - attr_set_interval helper for range boundary updates

You need to squash that patch together with the one who adds the header.

> 
> Signed-off-by: Honglei Huang <honghuan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_svm_attr.c | 234 +++++++++++++++++++
>  1 file changed, 234 insertions(+)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_svm_attr.c
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_attr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_attr.c
> new file mode 100644
> index 0000000000000..ba09aa3c3fe4d
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_attr.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include "amdgpu_svm.h"
> +#include "amdgpu_svm_attr.h"
> +#include "amdgpu.h"
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
> +#include <linux/lockdep.h>
> +#include <linux/minmax.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +
> +static struct kmem_cache *amdgpu_svm_attr_range_cache;
> +
> +struct attr_set_ctx {
> +	struct amdgpu_svm_attrs old_attrs;
> +	struct amdgpu_svm_attrs new_attrs;
> +	unsigned long start_page;
> +	unsigned long last_page;
> +};
> +
> +struct attr_get_ctx {
> +	int32_t preferred_loc;
> +	int32_t prefetch_loc;
> +	enum amdgpu_ioctl_svm_access access;
> +	uint32_t granularity;
> +	uint32_t flags_and;
> +	bool has_range;
> +};
> +
> +bool amdgpu_svm_attr_prefer_vram(const struct amdgpu_svm_attrs *attrs)
> +{
> +	if (attrs->preferred_loc != AMDGPU_SVM_LOCATION_UNDEFINED &&
> +	    attrs->preferred_loc != AMDGPU_SVM_LOCATION_SYSMEM)
> +		return true;
> +
> +	if (attrs->prefetch_loc != AMDGPU_SVM_LOCATION_UNDEFINED &&
> +	    attrs->prefetch_loc != AMDGPU_SVM_LOCATION_SYSMEM)
> +		return true;
> +
> +	return false;
> +}
> +
> +struct vm_area_struct *amdgpu_svm_check_vma(struct mm_struct *mm,
> +					unsigned long addr)
> +{
> +	const unsigned long flags = VM_IO | VM_PFNMAP | VM_MIXEDMAP;

That needs a better name.

> +	struct vm_area_struct *vma = vma_lookup(mm, addr);
> +
> +	if (!vma)
> +		return ERR_PTR(-EFAULT);
> +
> +	if (vma->vm_flags & flags)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	return vma;
> +}
> +
> +int amdgpu_svm_attr_cache_init(void)
> +{
> +	amdgpu_svm_attr_range_cache = AMDGPU_SVM_KMEM_CACHE_CREATE(
> +				"amdgpu_svm_attr_range_cache", struct amdgpu_svm_attr_range);
> +	if (!amdgpu_svm_attr_range_cache)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +void amdgpu_svm_attr_cache_fini(void)
> +{
> +	AMDGPU_SVM_KMEM_CACHE_DESTROY(amdgpu_svm_attr_range_cache);
> +}
> +
> +static void attr_set_interval(struct amdgpu_svm_attr_range *range,
> +				unsigned long start_page,
> +				unsigned long last_page)
> +{
> +	range->it_node.start = start_page;
> +	range->it_node.last = last_page;
> +}
> +
> +void amdgpu_svm_attr_set_default(struct amdgpu_svm *svm,
> +				 struct amdgpu_svm_attrs *attrs)
> +{
> +	attrs->preferred_loc = AMDGPU_SVM_LOCATION_UNDEFINED;
> +	attrs->prefetch_loc = AMDGPU_SVM_LOCATION_UNDEFINED;
> +	attrs->granularity = svm->default_granularity;
> +	attrs->flags = AMDGPU_SVM_ATTR_BIT_HOST_ACCESS | AMDGPU_SVM_ATTR_BIT_COHERENT;
> +	attrs->access = svm->xnack_enabled ?
> +		AMDGPU_SVM_ACCESS_ALLOW_MIGRATE : AMDGPU_SVM_ACCESS_INACCESSIBLE;
> +}
> +
> +struct amdgpu_svm_attr_range *
> +amdgpu_svm_attr_find_locked(struct amdgpu_svm_attr_tree *attr_tree,
> +			   unsigned long page)
> +{
> +	struct interval_tree_node *node;
> +
> +	node = interval_tree_iter_first(&attr_tree->tree, page, page);
> +	if (node)
> +		return container_of(node, struct amdgpu_svm_attr_range, it_node);
> +
> +	return NULL;
> +}
> +
> +struct amdgpu_svm_attr_range *
> +amdgpu_svm_attr_get_bounds_locked(struct amdgpu_svm_attr_tree *attr_tree,
> +				  unsigned long page,
> +				  unsigned long *start_page,
> +				  unsigned long *last_page)
> +{
> +	struct amdgpu_svm_attr_range *attr_range;
> +	struct interval_tree_node *node;
> +	struct rb_node *rb;
> +
> +	attr_range = amdgpu_svm_attr_find_locked(attr_tree, page);
> +	if (attr_range) {
> +		*start_page = amdgpu_svm_attr_start_page(attr_range);
> +		*last_page = amdgpu_svm_attr_last_page(attr_range);
> +		return attr_range;
> +	}
> +
> +	*start_page = 0;
> +	*last_page = ULONG_MAX;
> +
> +	if (page == ULONG_MAX)
> +		return NULL;
> +
> +	node = interval_tree_iter_first(&attr_tree->tree, page + 1, ULONG_MAX);
> +	if (node) {
> +		if (node->start > page)
> +			*last_page = node->start - 1;
> +
> +		rb = rb_prev(&node->rb);
> +		if (rb) {
> +			node = container_of(rb, struct interval_tree_node, rb);
> +			if (node->last < page)
> +				*start_page = node->last + 1;
> +		}
> +	} else {
> +		rb = rb_last(&attr_tree->tree.rb_root);
> +
> +		if (rb) {
> +			node = container_of(rb, struct interval_tree_node, rb);
> +			if (node->last < page)
> +				*start_page = node->last + 1;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool attr_equal(const struct amdgpu_svm_attrs *a,
> +				 const struct amdgpu_svm_attrs *b)
> +{
> +	return a->flags == b->flags &&
> +	       a->preferred_loc == b->preferred_loc &&
> +	       a->prefetch_loc == b->prefetch_loc &&
> +		       a->granularity == b->granularity &&
> +		       a->access == b->access;
> +}
> +
> +struct amdgpu_svm_attr_range *
> +amdgpu_svm_attr_range_alloc(unsigned long start_page,
> +			   unsigned long last_page,
> +			   const struct amdgpu_svm_attrs *attrs)
> +{
> +	struct amdgpu_svm_attr_range *range;
> +
> +	range = kmem_cache_zalloc(amdgpu_svm_attr_range_cache, GFP_KERNEL);
> +	if (!range)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&range->list);
> +	attr_set_interval(range, start_page, last_page);
> +	range->attrs = *attrs;
> +	return range;
> +}
> +
> +void amdgpu_svm_attr_range_insert_locked(struct amdgpu_svm_attr_tree *attr_tree,
> +					 struct amdgpu_svm_attr_range *range)
> +{
> +	struct interval_tree_node *node;
> +	struct amdgpu_svm_attr_range *next;
> +
> +	lockdep_assert_held(&attr_tree->lock);
> +
> +	node = interval_tree_iter_first(&attr_tree->tree, amdgpu_svm_attr_start_page(range),
> +					ULONG_MAX);
> +	if (node) {
> +		next = container_of(node, struct amdgpu_svm_attr_range, it_node);
> +		list_add_tail(&range->list, &next->list);
> +	} else {
> +		list_add_tail(&range->list, &attr_tree->range_list);
> +	}
> +
> +	interval_tree_insert(&range->it_node, &attr_tree->tree);
> +}
> +
> +static void attr_remove_range_locked(struct amdgpu_svm_attr_tree *attr_tree,
> +					  struct amdgpu_svm_attr_range *range,
> +					  bool free_range)
> +{
> +	lockdep_assert_held(&attr_tree->lock);
> +
> +	interval_tree_remove(&range->it_node, &attr_tree->tree);
> +	list_del_init(&range->list);
> +	if (free_range)
> +		kmem_cache_free(amdgpu_svm_attr_range_cache, range);
> +}

