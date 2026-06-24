Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TSs+GjpTO2rNWAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 05:47:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E236BB28B
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 05:47:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=a7ObjTHC;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EB310ED56;
	Wed, 24 Jun 2026 03:47:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011045.outbound.protection.outlook.com
 [40.93.194.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA51F10ED56
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 03:47:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRJcgUIQwcmqlL56MXfOEE9ypiPEh10tigdmay1eZE0bPtwQmAjLTgKFQbAH9nsiA4XQWV2SMxPaiJu1xrC0Fd+XqEKJk1N2kvWcMSbz6LXvy3Rwo3hRoFbtj28kLwDSwh5XTelo0yJPT/uoxv3zpGmjw+mlqn/lrJoh58aS+zY+RghltwuY58bxuy8nGWZWa/k1zQD1Wwmwq562RSipgbBPkiKck2LPjrbFcw/Og+Ak1qVtVHRXIUEsNw+UBQv443HJ5MZ2Y/07GjPEehvIGwwNDu7qwMr4CTBAQqsiownk1PVaRSWZyK+rM3tDdiWfjkbKzFMXj52vz/WZ8meASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfkBNSKNYxMpQEPiq81CUeTh2EITvKHuFWwdxuOcOyc=;
 b=ln7Wl+xstaaeM2x4OyuKzDCcWnY9vs1v0UOHITVItMzmHsxdUrQujQ8SfUNgdi+SZnEnnFmL1XzBi/VZsEnWo/vF60BhWHAlvR/xUUoZ1sWHRWMRzrSuYTospwZvk3eB3oa/jEMppxBSmx24sCDzl9b5SNDnZx1Df6AbnS4BthFisxzTvniw0afzkdJJZLPQu5QDeSiUzcJ/+2A3LF9jz0Mq7V7yytNNErmYBSxFSLObVk8jD1VEkK4G0Mn+RUAmVHWuGUEBD3u+UziWwvD12K80fn0HRLaYWtmx4al4kiCLQfzfqQ3EQN+IdCLZS8VGYWaFIX060xMzpOC6AS9NWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfkBNSKNYxMpQEPiq81CUeTh2EITvKHuFWwdxuOcOyc=;
 b=a7ObjTHCA7dR1rYYMnmcV7IFYHwymM7/ChYBboaTEfUWwrKQvO33ShbERzzfsk60fwFnglssq7YXFbckkzHoMyBJuPba7NoDQYr+FbLvXi6NJA6irl43sdI5qG9h+g9rWVk3edBlIMiaKXey0fMotYM1rplZXwzr4mmkFYMSOtc=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 03:46:58 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 03:46:58 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Lin, Amber" <Amber.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] Revert "drm/amdkfd: Add queue reset support to
 gfx12.0"
Thread-Topic: [PATCH 1/2] Revert "drm/amdkfd: Add queue reset support to
 gfx12.0"
Thread-Index: AQHdA4tHS6Ot2navnUarRGcV1augUbZNEQ0Q
Date: Wed, 24 Jun 2026 03:46:58 +0000
Message-ID: <DM4PR12MB51521C2B1F10C362B7070553E3ED2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260624034041.78450-1-amber.lin@amd.com>
In-Reply-To: <20260624034041.78450-1-amber.lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-24T03:46:42.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|MW4PR12MB7465:EE_
x-ms-office365-filtering-correlation-id: e196b2fc-28f3-4fae-d253-08ded1a33e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|56012099006|11063799006|38070700021|6133799003;
x-microsoft-antispam-message-info: h/ZSareGTM8k60MDEcYGN9CcoR32kAlmXE9Yirag7Xvjvv4fJwShihhdn6UIdyund995jwc31zyrDMLuO6GmilQVb2QIqGwUTHMpe2AZsKCjDw4ML7pzrbCIryVeI0adVFQ4J4v9omGnFWVdpTCC2Hxi+fLogZnRsB4qlIKSVfcdDqNO/jdlS3a6BTzy6LtABLFI42YZm8AlCf+xBWCe2wPhDJEnXsuXxS0i66kjZxw1FckwvMfe+qSSlVt/8j679BYNqMdrUrXMVSeNHgOkMc3IXzKWRVn2yqnYrKCK9Wxo7v7xcC0npwINQBpvrZGfKiLBl1Ux8A8eVdSJbyY12MFdk7z7zpD+2MBy2nwcbjbZGnJxEV/vXC85A5xQWKiooWTOMLjRcpPKYA6l1r1dcu7TqRUj4FuRPyz0K9ebNWpW7xQnyMGMWGPpP7AkAHSwHCsqCRjn1VXPQ4TlkB1XwGkI04aEmgEVDf6nL8BuLYnfjDO8feUYL4eYT6Jn0FkxvhfEEhyy9Ovs9beFkhix5flcN1JF/CKv/lH0qv48CsliB/wLmxCRSBb6dhGySaqrhZ5ewU7DOU1mRspEWlTfgieGk0KQu0gkxFPSJFsJAnBV7UL1qbKFmzV418jzkBUHDCEHncPbg82LLLvkRLTy8YU6P85j45bJo6jXVu4Wgq8yO1NxRKwYbhzuH0GYz0YyA9LwTcyZQ1rYjoeD9Lh4lmA8NX+zaGjelZrgN8yoNw4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6bRnJpp1ptxV7Dv2BC9+DHD51HwgXpXue2o5mLLzGMvqJcwEmN71xS1+MKwA?=
 =?us-ascii?Q?KN8CPsBmD695hl0lKZDf0CCS6OLSckYX03ilP2wvYOyN/tcrgQ6Y5j8OWpr1?=
 =?us-ascii?Q?UdCh3SGLIr5LxO4O5Ebb4+Z1IAxc/QLZx1hUhT2jCAzprHqvG3jHqA6WNXVF?=
 =?us-ascii?Q?ug2o8inhyHHWUv9mfW1a37yhCZukn6KkOjGl4FACQCZLuT/ovRdKv2IKL1No?=
 =?us-ascii?Q?WDIYPI7ln4NRjWUurpDmlDZZrcQ+YFmQfLYK9K7QJDfHoipZVtkSaCUYLBZV?=
 =?us-ascii?Q?0MFt/oYig9pEW61Xian88hsuzxh5p8ZS+kKt69GLudLGMrvxUlI8VhghBBoS?=
 =?us-ascii?Q?6QRvn0IuybItdOPFXd/npeKvRpa1oR3NEjzHTJbmhJuMFCa9vUu/M8CMYqv2?=
 =?us-ascii?Q?s7u25ZHDrYIb1ULD7P+YEs5O8V0SLn5rpMgOpvcyIlobKmiPfx1LSwFsv6hE?=
 =?us-ascii?Q?5LKt4aO0TJ1IlXYjmqTtQ8F4I95G7yNRe/r0mutpYYQOTc7qMrJInvAePU0C?=
 =?us-ascii?Q?I1Qz2AbEnmv2vJIYi3eQypuubMzQttQDm/z94ROpKiNGC2zD70aPJ3iQzF7+?=
 =?us-ascii?Q?QgQVzGzHF5kJti1KlwOHcs8xHHOeMZ9q9yQg2iUpZx3sqYuTwV7Wv2XnVFRV?=
 =?us-ascii?Q?B3J1IUpQoT6G84FawGAWWQdFKAI+xXumAn7Fa/wkbI0QHyWGkCSdKn8kUgco?=
 =?us-ascii?Q?uBCmhnF/gLbq9s3PX4XKGsoBapLQR1G7b5O8or6pRA52NDlNadiNxNqKNcUc?=
 =?us-ascii?Q?9kFEgb5lnQ/BXCAjeVFTOB/sUsPPBSnClUt5pg5GVVaw9ZX1Yq6yFHBcWeMR?=
 =?us-ascii?Q?hqKf/KSRKtoIe9w1w376gnFl8YLGSmavLavu5WxIpFl2peBvlR5wCaVQBIgm?=
 =?us-ascii?Q?Zh44aik5YbBdtzk5JShLqvaL0VH1vTSxJ/FjBP88MAVPT3slsvjsW8AK8o7j?=
 =?us-ascii?Q?Goe0qtdBC46SNmP9RN1Q9WLYRiZ5nMoJvArtEMhfjjJTTnO5PqXj5+qbVPUc?=
 =?us-ascii?Q?PzN/Isn0EDOZ1c84unjOu/XgNedO9IAq1WrQD/vhzmwyJczS/BzqWCxnBhd/?=
 =?us-ascii?Q?LtwWWG6j7AdkMWUGMx6xrn+nthtGP76iiW5P3MBc5ZcWM0tGfvX9yiZzQMx6?=
 =?us-ascii?Q?MvKSp6X/xGxqVwUi0+hv/sevtarh7nO/PbeGzNgpx9RGfTt1J3lQPK78L/FH?=
 =?us-ascii?Q?bd0AqBeYlKvLh7EihF501/wvPECjf0nQLsqIqH6hD9azf4GiyOSlWd82orKE?=
 =?us-ascii?Q?7MWup0BRBpNhgp46Oo8gaQdqXVq6pmBtVKGR18bg47xVwGpZY2G6/N9LZYcU?=
 =?us-ascii?Q?fgRlHb7N39nodkt9RUXDWQnABT7RpE3RKqZYwcAj/066rQq3VS4fcl7hyYeO?=
 =?us-ascii?Q?+KtFHAhhC49nP51Gvyjqzux7LDRzaZr7DiM21o3MZtLOS4YFbxlpDpnyhYmo?=
 =?us-ascii?Q?XpNEIvI4MR2TnYgIzLNn9mROt++z4zdYfuXJsNO+kQEY032UZiTxv23paIo9?=
 =?us-ascii?Q?eRAs0d4W7KEW66U3coWc7/fqreU4BMv7QmrtC5nUcxeMvjb7SrB+ezR6WIsB?=
 =?us-ascii?Q?i6qifekH3qBN6ZFJ2UV7Ybk12VfQ5XvKxYCgAlAvPFCxGQ1tQUHnCsEbpTbu?=
 =?us-ascii?Q?rrw1xOcYFPKpZt0lcIgwkRjAQJjMClelkXSfEXdp+wjBIxfOESsmAd557SYQ?=
 =?us-ascii?Q?4tdEd4j8KabA0Lhzq/VaA/26RNqVe2acG+a1Kyew0SQ/QSXx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e196b2fc-28f3-4fae-d253-08ded1a33e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 03:46:58.4341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mgDo1WAmm4bpOBufoiVgjpYL/PYKaNAd3v7HiNbBvYZV3riSXTcdO5+M4dqhW8lo0yLGbzZgMfvGsZXlSjbOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:Amber.Lin@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:from_mime,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6E236BB28B

AMD General

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

> -----Original Message-----
> From: Lin, Amber <Amber.Lin@amd.com>
> Sent: Wednesday, June 24, 2026 11:41 AM
> To: amd-gfx@lists.freedesktop.org; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com=
>
> Cc: Lin, Amber <Amber.Lin@amd.com>; Lin, Amber <Amber.Lin@amd.com>
> Subject: [PATCH 1/2] Revert "drm/amdkfd: Add queue reset support to gfx12=
.0"
>
> This reverts commit ecab22cd95dbde28c17e9eb34416f4c840bd50da.
> This patch didn't exclude SRIOV
>
> Signed-off-by: Amber Lin <Amber.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index f56b55ef1edd..1bf67b6e9aac 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -2027,15 +2027,14 @@ static void kfd_topology_set_capabilities(struct
> kfd_topology_device *dev)
>                    !amdgpu_sriov_vf(dev->gpu->adev))
>                       dev->node_props.capability |=3D
> HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
>
> -             if (KFD_GC_VERSION(dev->gpu) >=3D IP_VERSION(12, 0, 0)) {
> +             if (KFD_GC_VERSION(dev->gpu) >=3D IP_VERSION(12, 0, 0))
>                       dev->node_props.capability |=3D
>
>       HSA_CAP_TRAP_DEBUG_PRECISE_ALU_OPERATIONS_SUPPORTE
> D;
> -                     dev->node_props.capability |=3D
> HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
> -             }
>
>               if (KFD_GC_VERSION(dev->gpu) >=3D IP_VERSION(12, 1, 0)) {
>                       dev->node_props.capability |=3D
>
>       HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPP
> ORTED;
> +                     dev->node_props.capability |=3D
> HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
>                       dev->node_props.capability2 |=3D
>
>       HSA_CAP2_TRAP_DEBUG_LDS_OUT_OF_ADDR_RANGE_SUPPORT
> ED;
>               }
> --
> 2.43.0

