Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD2B965830
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2024 09:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767D810E82E;
	Fri, 30 Aug 2024 07:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="cAlqiUIU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2100.outbound.protection.outlook.com [40.107.94.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DEB10E769
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2024 18:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAGWJ/ncNNnl2E1+jZSMullnTCTrCleDiN2wJkbFwd/RzYNtSdnJXbXc8PK6AXbanRn20AFLrskktbEKJ1Skymn1nBbQDxWvBHG3W0pBPtLmkuFFILecSMij9OfxKqonApgBiRPCivIbIq7CNCtZdFzatWNXGunfC3PG5xItZUxdq5R26gbBlSq2o5rv5xJ4H+sKrKXnlLGev8POt7q8VRWP/XI/jGwvOHd3vV/SWwhzcNu/8sZvRbBvk3K2Q+xtmbMgjcsw5E+CEJZP4RXDTzBjEvUd//s+6fyMu3dUdHbPTTmKj+LNpFf3jMRAzHgIfjMLDKXfSUu2nwzVIXFMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdb3Jv/oXh+UJXbZlpzXh7K5YWD1xIDb1FqDoPOH3DA=;
 b=te9HDVXgAAxQvEW2YzbeFFmp3qo4E9ZFD8EhCl5g+KFXqvDZvlhzHZys2rajBA6il5qn4/Zu4TSi3af2ILnAeaXIuWlw/Qd+0fdYLJ/UWNdv1yBZLrZ0brPRrXJhHtDdAWHk+8LVzLejUziAl0/ardEa3dP68OVp+IDWJKd+okjhCDjHOYyhjXf9jnXacRlHMAxD48yHODk3Imxy14DPDklGNyMCu8VJ4xwpUkdX7WJZCFlQJxZsxjnNxOKIZMVmvaKcldHs5HEw1Ak5yXmqXPuFY0LZYDjv+yB+++nSpH2nadGz/v6ThituoHynhOCEw2ZDCWeyOyu7iULtTAJX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdb3Jv/oXh+UJXbZlpzXh7K5YWD1xIDb1FqDoPOH3DA=;
 b=cAlqiUIUh0ADZLEixs4sFgRKMY2rFTiIkQl0p5lhuM+UqywF2GLickMUcHJAK//bK/kb9Olf/SalX8VLdg1FP6VC00turVwDQrLZPf8stPgHV6l/xbOXP228t8S+6PsKFKYsUUvK4OHjPf436DP+k1JZrRZVeE/b7hbioRMuC0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from LV2PR01MB7792.prod.exchangelabs.com (2603:10b6:408:14f::10) by
 SA6PR01MB8976.prod.exchangelabs.com (2603:10b6:806:42a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.29; Thu, 29 Aug 2024 18:36:26 +0000
Received: from LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9]) by LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9%6]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 18:36:25 +0000
From: D Scott Phillips <scott@os.amperecomputing.com>
To: Dan Williams <dan.j.williams@intel.com>, Dan Williams
 <dan.j.williams@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, AKASHI Takahiro
 <takahiro.akashi@linaro.org>, Alison Schofield
 <alison.schofield@intel.com>, Baoquan He <bhe@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, patches@amperecomputing.com, Felix
 Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] resource: limit request_free_mem_region based on
 arch_get_mappable_range
In-Reply-To: <66cfbc08a457f_473472946a@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240709002757.2431399-1-scott@os.amperecomputing.com>
 <668c92e35c677_102cc29475@dwillia2-xfh.jf.intel.com.notmuch>
 <86cyltjqwy.fsf@scott-ph-mail.amperecomputing.com>
 <66cfbc08a457f_473472946a@dwillia2-xfh.jf.intel.com.notmuch>
Date: Thu, 29 Aug 2024 10:19:04 -0700
Message-ID: <86v7zjl01j.fsf@scott-ph-mail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To LV2PR01MB7792.prod.exchangelabs.com
 (2603:10b6:408:14f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR01MB7792:EE_|SA6PR01MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3328d4-4b5a-4d86-fcb0-08dcc8597ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dT81gO1HNYugHtxm4XkZ7VH9v+8i3npm4z9RSzXRpcPXktv9S/gvlIPpU2xV?=
 =?us-ascii?Q?pRuiMkEV0cq8FqHWY+/CKbLatx/Dx8f6dQAIU5tz4bYfWCtLfpNRFQVEWhpa?=
 =?us-ascii?Q?h3sYVXVlFM2csdD4bKdZhTHGY5O08Fz1KUM36cEN6LgI0jyBDL6104vrlqLa?=
 =?us-ascii?Q?s3NYqtJthhbpKhoB3j7HjwZR6phqPLMSY7GAk4t98U8jPcos2+u+2RIvWCre?=
 =?us-ascii?Q?Taj7Bbj8P2r+Fbm7ibHbdA7jPtPk1qOU2PO2R1FhrgY+RedVW+UFoiiMKDsv?=
 =?us-ascii?Q?6CIHRdQ9/i3fA8kcmD9oIAtNBVovm8XUwAK4vvznmBW/f+dmRTsn7IEZ5JIV?=
 =?us-ascii?Q?pNYHalxcog2CwUNCPdzVVToeIdBQHf4SJEL2SzhM42Drqebh4TGE3HJ06EiT?=
 =?us-ascii?Q?L0W3Dt3BEubrtAB29zeswn+ghIpu2S9+5Zx1pWks8X6DhsSvV6Jaz8IFd95G?=
 =?us-ascii?Q?PquxLnY7eSPMOLIX/lrY040YuzVLQLMM6TivZB6dWcr5KiKIzQiY4TFxQNdk?=
 =?us-ascii?Q?akZTEJiUnniyMMiSH38AiG3u4xUqRIdkzHB3GMnY3cPirgpHxI2iKansSP65?=
 =?us-ascii?Q?kvTLvEpA8Bmj4YrnSzn5h00mzphKdks3AQRiNDy2XCxLTr2yQZF6BBButW2i?=
 =?us-ascii?Q?295mBBCxiq6jtldihTq4Rm9jprpuvL90D0sgDS0489ZlxcwE0YTNXV0JA8PL?=
 =?us-ascii?Q?h0sFhFgb2cqKEhLMFPbg6I63tceppHItmnUq4afi0NyFFEU4THCkOh47lStF?=
 =?us-ascii?Q?0DCYyLlCRksRrwF6G5DQaGxWGpC6/e/+wxXgGuOJ1lvGH60t+Uj6PBXmI9dq?=
 =?us-ascii?Q?PurkzKII39zu5nZgel6hl7Kn5ksiJqChmg6P/a3OBdHzaMTA4OBrdj5wlEdy?=
 =?us-ascii?Q?rXBrOEV44B/AkyjG9RLkgZyPF7UblCTYQBZWhKe91r+THRt9yb1nbNvme2wT?=
 =?us-ascii?Q?QWz3g9mf33tqrBz1jTWBAuPG8s/Ap1FVL+aP0T2Mcpf5u6g0YA7yDN5l0nKh?=
 =?us-ascii?Q?2F4nSvWlhwWrygzAFwhOo1pKIkmlHI627Wh6xHszTyCP6Dj7aauemVK6LpWO?=
 =?us-ascii?Q?gfQC1eBZnXY422rmuHd3R16flt+q5TMX/y0/c68qp1EKOfdYWnbq7Vo8ny21?=
 =?us-ascii?Q?FcnUCVMazW2dljGS8Mf0basWuksJ/t93S4+msstZijFSdjy6NQX4KiS+OukD?=
 =?us-ascii?Q?tL1+V0LC3YfrcJM0DoQSrVVcreSYnqffse6MFU37+j9z8R2kpTBGEGhKVx4V?=
 =?us-ascii?Q?A3Qm2pFbdIn68DQ7p5GSnuvoql3EvfihiWjy73mQYN6t378HN/gKdD0Fl/4t?=
 =?us-ascii?Q?9BuPgqeYBqUmrkZ50HqXlBCRILKLj8Z7nCd9sZhun8Y+c1dGo3kTjIdFUHfn?=
 =?us-ascii?Q?+hL2ML3G+AHMMiHK/d5GqF8CLj5xneSKm8bRjaq5KDHQIYBFRwSnBpOZ/5xO?=
 =?us-ascii?Q?uJaCP6nqRwU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR01MB7792.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yQY/SnVdp+ytbUPYY+h2lMZG1kA0NBBD1cTkzPp6U7OxoaCTFYNI0MF7bx78?=
 =?us-ascii?Q?3s4HNZUC8CVPJCEaHR+PcMP48GCAv2TyrtQlvYuDz3WExKhQvyy3ZhxdwsWP?=
 =?us-ascii?Q?ZL0Dabr16wZgGfoeNtv6W0W6f24vyn4lMsvgpNJruIWzaUujOk4VW5TWTMd/?=
 =?us-ascii?Q?yyk6x4k+0o+iZSvw+McsjzjtVLbeRDQfHM3oSXYpwbeRdHD6L5M6RMbEnuRl?=
 =?us-ascii?Q?3qzw7E4PnC9eOC5CfnrmwKuW/78aWwpMdmlu+HbTjyhFmY9bkmxee1nwHqxn?=
 =?us-ascii?Q?n7Ib/gYIoY40NqQLuXUwhq6vJsC3Fjsu+aHc0pRJgwXZG++WOqokLGb1vFpt?=
 =?us-ascii?Q?sL4qNwBrMft5CFq3U969mxqwyg6uoDIT2MLuXcNOEnrAGAFeJD8GIiZ67Vbe?=
 =?us-ascii?Q?SOReqKS5MAuRDmq+1bcy9RQ2kirwVy/tTlSibU4Yw84tAvYuCHljC4d7cki3?=
 =?us-ascii?Q?5oHS239HBNoJTyk5lKuvFsI9hrVGG7YtLzMI191ceaKswDWnxTYIeUqRria1?=
 =?us-ascii?Q?PDUrNwlgg3JEGECiT8ADYpMFyB6jdezxtzGqgvZX2kEcsXSd7nByfcanAyr5?=
 =?us-ascii?Q?R6S67+PdC/b8UIzeNuLOlXEdtiFIOuvzzRx05CHat3s8XnG2IFpRtZcoc+HC?=
 =?us-ascii?Q?5qjOSrjwtzY1ojax+FAk7YUMwzPd7bt4zPQ2LGQfVVHDGAQ9tNIOQCNxALxm?=
 =?us-ascii?Q?cItnvadD/2LLutoPRjUcSCVlN5khgaJzckSqbrP24qHnEhX5+i++tzy1dXga?=
 =?us-ascii?Q?F7HAOscl4Ioz2l52N6wyILH3KPeHJbZfKw2/3Q48Gdxj4FuFT0drZBZJ5SHE?=
 =?us-ascii?Q?nSj2FbRzp5Zm+kEl44tHXf6aecNvFwTiXcoGWpFODaTZEAse1oYlvTQI5vbS?=
 =?us-ascii?Q?Kc3QSlKRUaOuQ1P55X5WRtTM1Ia3dp4GJ0vpHs9r+AcSHE2shV7FLWPB7eYK?=
 =?us-ascii?Q?2ozw9McuJtsYKfhfvbkCI2kq/M2ag+ehgYOINhXF9snQWiV5X2JKZPBvI6qt?=
 =?us-ascii?Q?WHRaeFD+aoObkfHJAtQ4SwrZIPWbjgngJH6pLBCNwyHLG5aQplGEc0OyaBlA?=
 =?us-ascii?Q?t6qi5LIry/FKWXZBKqtrXYq2wcw8jflLGhbpoXZ1bcGtIjaKVzWWuDMFgp+o?=
 =?us-ascii?Q?mwX1Z9yNeRhjkfD3yMP1b1MJd09gRu5dFDhlXkyIH7F5/0wqPIXOskKL9SnL?=
 =?us-ascii?Q?PVnp5GFLe15zVDIdypHj536cbzaDDlz07/AOWo8/QZUNW9WAZWbVEnei76F0?=
 =?us-ascii?Q?MSiqY03w7hnD8JKvWIMVJFKBPXMEIXTev/F4vl2bqLdjSZ8FIA4NQltWP0qV?=
 =?us-ascii?Q?vmNF7x+cIUezULTyWmkMfokGJV/td8JmfwfEvLioFYRNSjEB5bj1cDtbL4pY?=
 =?us-ascii?Q?yeXqO8f8OqjiJo3oKaaLLEGQ1Z4IUfgfMI489QzmvUG7PhlokkZ/PGdqbu1P?=
 =?us-ascii?Q?ByQmIfREH5c+B+gZRPt+twuN/hl/390aHyu01Nd5PRTfPiGMfG3QKdruYnwk?=
 =?us-ascii?Q?ioWkbPptwGu4tX1hO2WYAXvRZ9P+QBU9wwc1Rf6DBdmyaAjPtxxsbcZc7gQV?=
 =?us-ascii?Q?en4HA6/Nwi6/u3lPkCL0mKu2QeTPzcLSKw8OvevbQXC84APNz4qFQh+qrh4P?=
 =?us-ascii?Q?0uJSG5cnh3gpo7h0oFUS8aY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3328d4-4b5a-4d86-fcb0-08dcc8597ce5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7792.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 18:36:25.6887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCoJFyukhPJGky0N5YX5v/pHNmlBspOJBOlSdkCDqnje2Gpf7Pey49g50oS9ELCyRNRV4NS7t3AS5nK+JaB8c9F/Xw0Y2va1KMvm3idZ7ztxx+tEp3BfVOrgq7L+B/mK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8976
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:15:59 +0000
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

Dan Williams <dan.j.williams@intel.com> writes:

> D Scott Phillips wrote:
> [..]
>> Hi Dan, sorry for my incredibly delayed response, I lost your message to
>> a filter on my end :(
>> 
>> I'm happy to work toward your preferred approach here, though I'm not
>> sure I know how to achieve it. I think I understand how cxl is keeping
>> device_private_memory out, but I don't think I understand the resource
>> system well enough to see how amdgpu can make a properly trimmed
>> resource for request_free_mem_region. My novice attempt would be
>> something like:
>> 
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 8ee3d07ffbdfa..d84de6d66ac45 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -1038,7 +1039,14 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>                 pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
>>                 pgmap->type = MEMORY_DEVICE_COHERENT;
>>         } else {
>> -               res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>> +               struct range mappable;
>> +               struct resource root;
>> +
>> +               mappable = arch_get_mappable_range();
>> +               root.start = mappable.start;
>> +               root.end = mappable.end;
>> +               root.child = iomem_resource.child;
>> +               res = devm_request_free_mem_region(adev->dev, &root, size);
>>                 if (IS_ERR(res))
>>                         return PTR_ERR(res);
>>                 pgmap->range.start = res->start;
>> 
>> Apart from this being wrong with respect to resource_lock, is that sort
>> of the idea? or am I missing the sensible way to hoist the vmemmap range
>> into iomem_resource? or maybe I'm just totally off in the weeds.
>
> You have the right idea, however, I think a better solution has appeared
> in the meantime. See this recent fix from Thomas regarding collisions
> between KASLR and request_free_mem_region():
>
> http://lore.kernel.org/172418629773.2215.4158024254077335422.tip-bot2@tip-bot2
>
> ...in that case KASLR is limiting the maximum possible usable address
> range that request_free_mem_region() can play. For this
> arch_get_mappable_range() restriction can you adjust the new
> @physmem_end variable for the same effect?

Oh perfect, yes I think that very directly addresses my problem, I'll
handle it that way. Thanks for the pointer Dan.
