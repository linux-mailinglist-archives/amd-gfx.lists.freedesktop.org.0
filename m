Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39C9C1957
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Nov 2024 10:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B410E1B7;
	Fri,  8 Nov 2024 09:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ms/sg74K";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFC310E1B7
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Nov 2024 09:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQNvdvCA0sVOJasHr0/GJTQnIcvlfZIrergkyz4mqBcixoAFCrAPW0gWOzZWcSYzC2PilTjs//ISo3MQif3BnaeIr02Rvu7TMREQFh1DTdX86gHe2Ayxzg8CDmK92SfbsAlJ1WmEufOIibxzCuzCk+uIhuDkYN+NgxuZ64tribQCdY7fCDyEinL7UbScP5qLhQ4DIUoOZHt6sAvZQE4OSxhsLVSP98DyAyBEms/30kIZToT9xGYiZ1f8r6imOpa3/b3A2CqlAM0/sKJ/l4Br43rj+rP0ZWJCrnMPFtDt+C5b4F4ReZAjPacQje81VhM0AIjHXJbSRGZf9hjGAmqplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h359smspvV4Cybhp7h7pQQDZBvw39K3YZhfGvXNAD2A=;
 b=CJYwUzezglWyakKD14fiaS5JL3rphA/PRgigTlmFLAbb5W3R4ORg6uN2UlIGJmh8z48l8YoyCEjFlAuMXLLi3vbvCVnyELl2xKF7KZyuTP3EQ4vPDlCfRyZDPxx3QcPlqpMypAvGBogwSNgrtENxURuVXanY4v9HrblH4970TJ7X9PcUiV95m7hNTd/owGxNUELkKxM7XLryTdQNZ1lAR4/BGYe45YODjC1ogieM1Ts7r9fgV16OURG/6qKOdX1ZFLPkn/z7SC7zogomLUzW7v7mVleOQTR7qPlWUkZByxUwFXA/YdHRRp3UomQqfxM8agTz2fZwWTTSRayXzxegNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h359smspvV4Cybhp7h7pQQDZBvw39K3YZhfGvXNAD2A=;
 b=Ms/sg74KR90tfAUBZBYtC7to/nJBhIf0aQzZed3wJ+HxEa+4NLY3hQFuUzMlhc0seSkVxvGp/fgSQ+s2nctpHmIl6c6KuTE3dSgpX4/HXb5XeiUlDpuE1zjimGn9EQA9ryONVfFVAbc5S1zD5YBw3lR026npiBU2qRxKjludSHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 09:39:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 09:39:56 +0000
Message-ID: <4bf5c85a-744a-4456-b7f7-98e37f493f34@amd.com>
Date: Fri, 8 Nov 2024 10:39:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: correct the SVM DMA device unmap direction
To: "Liang, Prike" <Prike.Liang@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
References: <20241105023332.172404-1-Prike.Liang@amd.com>
 <04d4ab32-45a1-4b88-86ee-fb0f35a0ca40@amd.com>
 <3e8ece68-d9e7-4037-bc99-d3f9b78128b5@amd.com>
 <02ddce81-b7fc-4b72-8fa6-1aee9346edbc@amd.com>
 <DS7PR12MB6005480DEC6C9C186A59F90DFB5D2@DS7PR12MB6005.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DS7PR12MB6005480DEC6C9C186A59F90DFB5D2@DS7PR12MB6005.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: FR0P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: d1798a83-4344-481e-d755-08dcffd94e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW1mcWtjU1Q0bVVKNWxTbkMvRDcydUtaV2lIVlJiVENFeWw3d1c1RnhYci85?=
 =?utf-8?B?M0UrQkpocThaRVFPdXpYMmhXSTl0Z045bGVHMlptbWhLRmMxZnIxL29VZm91?=
 =?utf-8?B?Znp6TlE3RzJ1UVFMZTJ4RjBVY1N1ZUdpb21lbGNkeEtOMld3WStudXpsR3pS?=
 =?utf-8?B?UkRnRXl2bDBrenhLc244M3ZyQTlBZHRUNjloMW9NZDUxMjFxRURaT2Rvazcr?=
 =?utf-8?B?YUl5eE04VC9PbVdDT0JaYm1EYldQMHp4Mmw3eEdUZ0VSZ3E1TVppYTI3QlI3?=
 =?utf-8?B?dzFGQ21XUWlnSnVhQUpWNWFuaGlsV08wRkx6WTcrMXZlNk5Zd1dvZnYyVlFu?=
 =?utf-8?B?QjNoZlp5SkJhdHRaeWg0c1JBSFl2NldwZS81SDVqcTNHWmhtb294d1RrRitF?=
 =?utf-8?B?TVpCM0x6Y0p2SGlZWS9sRGVoeXNRZmJ3NWY3a2toN3lWc3czdFdSUHNhVVB5?=
 =?utf-8?B?UktUS1Uwc3RENjEyS0ZOd0VkaTJHRGtKK3dnblFYbjk4UWNMZG5NTXFwaVdp?=
 =?utf-8?B?Z0NNYm1XRHM5WWN3cWd6dlVHSSt0L3UzbG9tL2ZsZXZrdHFUT3UyRUdZdk96?=
 =?utf-8?B?NUt2RWUrSXNMZnVSb3RLSEM5eDEwME1pUnhNZTl0TWFMaklydUd1SjY1UEtL?=
 =?utf-8?B?MTlUaHRMR1BwakNhUThuYVl1U1Y3VitkTksvZjdoRXRndzlNNGV5T1RKRGdW?=
 =?utf-8?B?UEd5a2NrSnB3aGtVWHdPNllxVHU1SmVLeldQQ2tEYzJZWHVHY2pWdVg3UjQ2?=
 =?utf-8?B?ZHJocEdESUtGV2NkVFg1SktPOFc2RFRXN2RPek1mQkNzdFBuTHVPNUdwRHN2?=
 =?utf-8?B?THRYOVJUZXRqVW9NbWxicENSRnIzMExoZ2NGMmk1SldzeWYyVW8yRU82K2ZU?=
 =?utf-8?B?dFRWQ0dPQnB5NWFOU2piWGVKdWFqT1pKWlh6aDZnUGFyeGRWSzBKNkxuUzBw?=
 =?utf-8?B?Yks4NnpRN01iVUtGS3FHMlMrcExqQyt3WGtmQi9WcFJvZklYWXA1VHRaNUo0?=
 =?utf-8?B?aHZTYS9icEdaTUpKdndYUWlqODloMUh1aW1sWnFST3B0OTU1STk3SGVEMTNU?=
 =?utf-8?B?enhuWjY5NTF4QWIrU2ZqQUM3NDlYUGxRdStUb0gveGhFM2RkcDZFbHR6d2FZ?=
 =?utf-8?B?Y2drY0g5M1YyOGxYc3JVY0lQc0ZoZjMvOG52eFRkbVgzQ1FBclJGWVM0WGE0?=
 =?utf-8?B?ZEZKT2NBT0JDRTVqYlIxcmM4TlhJTG5GWEVZVEsrVWhOY25hUlptYWFwL3dn?=
 =?utf-8?B?U3FyQ0pMNU9mc0hQNEJEOTdMajVEV2EwQ1VSajJjbHNENlcxUVlvWm5iUS9T?=
 =?utf-8?B?Q1ZTMmU2VmFRNDJMaVhHUnZhczc5YkRmNHNCZWdGV1J3NTRqOSt0TnY1cSta?=
 =?utf-8?B?RHJRbVFqVmRhdE56cmtyV3VmUFNMR1pYZys4bXdZTUIzcTNSdC9XRVRqdTZ3?=
 =?utf-8?B?clBFOGpKT3RUajB5L0dJcTg5MnVneHdqNkZNM2hsNjE1b3k0TFRmUFVTRmNJ?=
 =?utf-8?B?N1liMmpJNFplMzI1YXlYSzlkWnFHOWxoUlJ5eUJ4OVVpRjI1MS9mUUh0Z2FD?=
 =?utf-8?B?cmJ2NC9lUGFZUzJNQkJGblRiSzBqM0Zxc0RJWmpOZ254UzlYcU93cDQxSHdH?=
 =?utf-8?B?akdHWmVGbVd0aEw2VEpkb2Vld3hrWWVRc1pzUmNITWlUTGtFSi9HaGhSZ3VT?=
 =?utf-8?B?enVCTUs1QngzVkR0a2l1ME1GSXIyRWJlUGxmcFM1VGp0S0VRRDFNaURuQXM5?=
 =?utf-8?Q?Fhx4aaThIARNcDa/PD+FX8PSEhLJbnxsPXdxoaI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eStRM05LQzRDVUl5TW10aGczWWFEOXlLV3V2dHNqK2pDMklmdm1xa1huYlVk?=
 =?utf-8?B?bnpScFRPMGIxQ2ZRSS9YdG91Zk5hWTZZWnc3OCthTE1RZzcyazNwMENObTRS?=
 =?utf-8?B?U25kZGxsNjF5bEsxemNlNWtqcENhSU9tVzIzOGd1VDhCVE1aWlBxekg1bStj?=
 =?utf-8?B?eG5lcndwUHZlTjZpa0pEVmlnMHN4NExBbGxwcW03NS9sZ2dYd1RwY3oxb205?=
 =?utf-8?B?Q0RvWjBTQkFBN3pOUTd5Ni9ibGFpa0FMT1U1bFNiRG1NQmVYeXF4Q0dRMUpH?=
 =?utf-8?B?UkJ1R2RmNkpqVzgrMDdiNHUzdEZIeHBURE1NRm0xNW9OMVBkWDZZUkkrMGNT?=
 =?utf-8?B?NEp2U2VoWHNxRGkvNWdHZHQ1ZmZ0eHY2WHMyNmZtZzQxUzkyelA5OERKczlF?=
 =?utf-8?B?OHUxNjBySnlPbEtpdFI1bUZPRW9xZ0EzYWx5SVF5Rmsxb0YzRFNQWldrL0ZJ?=
 =?utf-8?B?Slg1ekpRZGh5MC9BYjJBRjhBVHFKRlhGbTZwclFIS2g5TEJXZThBVE1uTmlr?=
 =?utf-8?B?Q0Zlemp0RkE3d1FQU1RqbTc4MnNpK2V3aTVlVUprT0xvRlZWU01laC93Y29h?=
 =?utf-8?B?akhyT0tVVmtUU3ZwK1h2SW0zMFA5cEsvbmwrdG5vdGpWOEZoNFcrdkpKalF4?=
 =?utf-8?B?dWN6Ti8zNkpIQnJ6OThZa2tBM0gyTWRHMkVhU0hlSUszcDRJeE1EQzI2MUk1?=
 =?utf-8?B?SkVOb1FJTlgzb2dvTXU4M1kyZ0N2T1NZeWZ3a05ldlFvR1JkOC9UZ1lIK0Q1?=
 =?utf-8?B?VElaQkMyY2ZtL3dQTUUyeU04OE96bFQ4LzFXc1I0dGtYUXhCaERmTlhZek9O?=
 =?utf-8?B?elpidUljb3licldUbkdCMkZNSjE5UncxT0pGWXJYZEkrV2R3WnpNeitOaXY4?=
 =?utf-8?B?TmMrUm00SWFScGQ3RnBEN0VlWFZzMk5DOGpuenEvdjdRZkhWSThHZlU0Z3dq?=
 =?utf-8?B?N2xOQ2FKNHdtSnI5ZHpFRjR3TDd0TURhSnl6Yi8vV2Z4bUtqc3N2VFIrMld2?=
 =?utf-8?B?OHpETFVZK3NJRlNYNUZONzI3NEhjNEg3S1c3ajRuVHNqWmkyUnh6cWRRRWUr?=
 =?utf-8?B?czYxNnZMd0ZMY1QwcjZuRmlGdnY0MzUzdDd5aHhSU0tRVjRDaWFBVHBkR3pj?=
 =?utf-8?B?T1NZK0V5V1pSdElDSWRPVjJmTDVCT1ZIQURDYjFnV0JYMGZOQWNpVEdYZkMz?=
 =?utf-8?B?M2pwQWlLbGZmakJvVkxjRHBUWUxTS1JyUzEzK0FTSktQNHE3OHhvYmhnRFcx?=
 =?utf-8?B?TElRWGdJZXdsV3lmRXBVVXVhM1VDdFRoNlZiUno2NzFEMkwzZHQreENxaGx4?=
 =?utf-8?B?UGxSclUrSGwrNmpSUGpMU3NnandkYzRia3lBd0ZjRU9xTVRia0h1TEsrdDlp?=
 =?utf-8?B?Z2JuancwZEwrODRjd3EyU0NVM2tuOWtCTUxIaDlSMU4yWFJweEdaaVpSV3RT?=
 =?utf-8?B?K01RRUg4NzVTOE5CWFhuV0hUaUtpL2dxUkFvbFFKamtLcS9vMlZvU0xQL2hs?=
 =?utf-8?B?YWRUNG9yMUhWTW9TOGtTeWxpZEN0RXlBL3RXNG9UTmZUNFhlbnV4bHM3UVFD?=
 =?utf-8?B?MEFvcXNtQ3BqeHNBd3ZwZ0VDOWwzYXdwSFFabHFMbXkxajB6THVXcHNiZDNC?=
 =?utf-8?B?K094NTgyY0hWajl2ZnprZHBtWHkxRWxSU3BjL05qVC9MMlFZdzVGY1V3eC9Z?=
 =?utf-8?B?Mk5uUVI0c09STk4xeENLZis1WVFHN1V0YVpxdGNKT0U0NVBES0c5ZFdHeU1z?=
 =?utf-8?B?UnB0UG1uODF3YUh5ZFl6RlRPb1hTdHpCQlRVRnQ5ajhHQ2MrZGkvMHA5VkVh?=
 =?utf-8?B?d0c2aXVoTDduUlNjYVhtLzFNS2JISi9DN0JNQWc3NTM0d2UvUUlZdDd6dk8w?=
 =?utf-8?B?TlUvZUVzaTRlMldOM3duQ3prYS9acTFPUHpUdEpqU2RYUFlCQSs1RytXSFBV?=
 =?utf-8?B?dXErbERuWXpDR0duL0tEZVI1Tzc0eUpRUmVLRitCOVNORS91RHZIMGhrV0dk?=
 =?utf-8?B?Z2lkd0t2K2sxOUtxRmZVSTg0L0kxdU9FRnovZmxnTEFBNm4wVXJ2UC9LeXpx?=
 =?utf-8?B?dU9mVm5YeFVsMGZOUC9oODQ3ZGJTcU5PZTU5MElDREs1YTBUN1NaN0o3NFZM?=
 =?utf-8?Q?a6YV5V+csV4cwG+ALxgVMX33E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1798a83-4344-481e-d755-08dcffd94e17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 09:39:56.5522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V93hFn9DlqJU2QSNqlyIoqetEXzSuBGoyT4eB6OxMTUioYWA3DT+eU3gBZO2jq1N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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

QW0gMDguMTEuMjQgdW0gMTA6MTUgc2NocmllYiBMaWFuZywgUHJpa2U6DQo+IFtBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQo+DQo+PiBGcm9t
OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPj4gU2VudDog
V2VkbmVzZGF5LCBOb3ZlbWJlciA2LCAyMDI0IDg6MjQgUE0NCj4+IFRvOiBLdWVobGluZywgRmVs
aXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBMaWFuZywgUHJpa2UNCj4+IDxQcmlrZS5MaWFu
Z0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IENjOiBEZXVjaGVy
LCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4s
IEhhcmlzaA0KPj4gPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNvbT4NCj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IGNvcnJlY3QgdGhlIFNWTSBETUEgZGV2aWNlIHVubWFw
IGRpcmVjdGlvbg0KPj4NCj4+IEFtIDA1LjExLjI0IHVtIDE3OjM0IHNjaHJpZWIgRmVsaXggS3Vl
aGxpbmc6DQo+Pj4gT24gMjAyNC0xMS0wNSAwNjowNCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4+Pj4gQW0gMDUuMTEuMjQgdW0gMDM6MzMgc2NocmllYiBQcmlrZSBMaWFuZzoNCj4+Pj4+IFRo
ZSBTVk0gRE1BIGRldmljZSB1bm1hcCBkaXJlY3Rpb24gc2hvdWxkIGJlIHNhbWUgYXMgdGhlIERN
QSBtYXANCj4+Pj4+IHByb2Nlc3MuDQo+Pj4+IEF0IGxlYXN0IG9mIGhhbmQgdGhhdCBsb29rcyBs
aWtlIGl0J3Mgb25seSBwYXBlcmluZyBvdmVyIGEgbWFqb3INCj4+Pj4gcHJvYmxlbS4NCj4+Pj4N
Cj4+Pj4gV2h5IGFyZSBETUEgcmFuZ2VzIGZvciBTVk0gbWFwcGVkIHdpdGggYSBkaXJlY3Rpb24g
aW4gdGhlIGZpcnN0DQo+Pj4+IHBsYWNlPyBUaGF0IGlzIHVzdWFsbHkgbm90IHNvbWV0aGluZyB3
ZSBzaG91bGQgZG8uDQo+Pj4gVGhlc2UgYXJlIERNQSBtYXBwaW5ncyBvZiBzeXN0ZW0gbWVtb3J5
IHBhZ2VzLiBJIGd1ZXNzIHdlJ3JlIGNyZWF0aW5nDQo+Pj4gRE1BIG1hcHBpbmdzIG9ubHkgZm9y
IHRoZSBhY2Nlc3MgcmVxdWlyZWQgZm9yIHRoZSBtaWdyYXRpb24sIHdoaWNoIGlzDQo+Pj4gbm90
IGJpZGlyZWN0aW9uYWwuIEkgc2VlIHdlIGRvIHNvbWV0aGluZyBzaW1pbGFyIGZvciB1c2VycHRy
IG1hcHBpbmdzDQo+Pj4gZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIEdQVSBtYXBwaW5nIGlzIHJl
YWQtb25seSBvciByZWFkLXdyaXRlLiBJcw0KPj4+IHRoYXQgd3JvbmcgZm9yIHVzZXJwdHJzIGFz
IHdlbGw/DQo+PiBJIHRoaW5rIHNvLCB5ZXMuIFRoZSBETUEgZGlyZWN0aW9ucyBhcmUgdGhlcmUg
dG8gbWFrZSBleHBsaWNpdCBDUFUgY2FjaGUNCj4+IG1hbmFnZW1lbnQgYW5kIGJvdW5jZSBidWZm
ZXJzIHBvc3NpYmxlLg0KPj4NCj4+IFNpbmNlIHdlIHNob3VsZG4ndCBuZWVkIG9yIGV2ZW4gd2Fu
dCBlaXRoZXIgZm9yIGEgY2FjaGUgY29oZXJlbnQgUENJZSBkZXZpY2Ugd2UNCj4+IHNob3VsZCBw
cm9iYWJseSBhbHdheXMgdXNlIEJJRElSRUNUSU9OQUwuDQo+Pg0KPiBUaGUgRE1BIGNvcmUgd2ls
bCBjaGVjayB0aGUgZGlyZWN0aW9uIHdoZW4gdGhlIGRyaXZlciBwZXJmb3JtcyBETUEgdW5tYXAs
IGFuZCBpZiB0aGUgRE1BIHVubWFwIGRpcmVjdGlvbiBkb2VzIG5vdCBtYXRjaCB0aGUgbWFwIGRp
cmVjdGlvbiBzZXR0aW5nLCBpdCB3aWxsIHJlcG9ydCBhIHdhcm5pbmcgbGlrZSB0aGUgZm9sbG93
aW5nLg0KDQpZZWFoLCB0aGF0IGlzIHBlcmZlY3RseSBleHBlY3RlZC4gRG9pbmcgdGhlIHVubWFw
IHdpdGggYSBkaWZmZXJlbnQgDQpzZXR0aW5nIHRoYW4gdGhlIG1hcCBpcyBjbGVhcmx5IGEgYnVn
Lg0KDQpUaGUgcXVlc3Rpb24gaXMgcmF0aGVyIHNob3VsZCB0aGUgbWFwIG9yIHRoZSB1bm1hcCBv
cGVyYXRpb24gYmUgY2hhbmdlZD8NCg0KSW4geW91ciBwYXRjaCB5b3UgcHJvcG9zZSB0byBjaGFu
Z2UgdGhlIHVubWFwIG9wZXJhdGlvbiwgYnV0IEkgdGhpbmsgDQp0aGF0IGlzIHdyb25nIGFuZCB0
aGUgbWFwIG9wZXJhdGlvbiBzaG91bGQgdXNlIEJJRElSRUNUSU9OQUwgaW4gdGhlIA0KZmlyc3Qg
cGxhY2UuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4gICBNZWFud2hpbGUsIGZvciBzdHJl
YW0gRE1BIHVubWFwcGluZ3Mgd2l0aG91dCB0aGUgRE1BX0FUVFJfU0tJUF9DUFVfU1lOQyBhdHRy
aWJ1dGUgc2V0dGluZywgdGhlcmUgd2lsbCBiZSBhIGRpZmZlcmVudCBjYWNoZSBwb2xpY3kgZm9y
IGVhY2ggRE1BIGRpcmVjdGlvbi4gU28sIHdpbGwgdGhpcyBhZmZlY3QgdGhlIHVubWFwIHBlcmZv
cm1hbmNlIHdoZW4gYWxsIHVzaW5nIHRoZSBCSURJUkVDVElPTkFMIHNldHRpbmc/DQo+DQo+IEZv
ciB1c2VycHRyIHVubWFwcGluZ3MsIGl0IGFwcGVhcnMgdGhhdCB0aGV5IGFyZSBkb2luZyB0aGUg
Y29ycmVjdCB0aGluZyBieSB1c2luZyB0aGUgc2FtZSBkaXJlY3Rpb24gYXMgdGhlIG1hcHBpbmcg
c2V0dGluZy4NCj4NCj4gLi4uLi4uIDwgU05JUD4NCj4gRE1BLUFQSTogYW1kZ3B1IDAwMDA6MDM6
MDAuMDogZGV2aWNlIGRyaXZlciBmcmVlcyBETUEgbWVtb3J5IHdpdGggZGlmZmVyZW50IGRpcmVj
dGlvbiBbZGV2aWNlIGFkZHJlc3M9MHgwMDAwMDAwMWY4MjYzMDAwXSBbc2l6ZT00MDk2IGJ5dGVz
XSBbbWFwcGVkIHdpdGggRE1BX1RPX0RFVklDRV0gW3VubWFwcGVkIHdpdGggRE1BX0JJRElSRUNU
SU9OQUxdDQo+IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIw
MzMuMzYwMTU4XSBXQVJOSU5HOiBDUFU6IDkgUElEOiAxMTY3MSBhdCBrZXJuZWwvZG1hL2RlYnVn
LmM6MTAyOCBjaGVja191bm1hcCsweDFjYy8weDkzMA0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2Ut
cXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MDE2NV0gTW9kdWxlcyBsaW5rZWQgaW46IHZl
dGggYW1kZ3B1KE9FKSBhbWR4Y3AgZHJtX2V4ZWMgZ3B1X3NjaGVkIGRybV9idWRkeSBkcm1fdHRt
X2hlbHBlciB0dG0oT0UpIGRybV9zdWJhbGxvY19oZWxwZXIgZHJtX2Rpc3BsYXlfaGVscGVyIGRy
bV9rbXNfaGVscGVyIGRybSBpMmNfYWxnb19iaXQgdmlkZW8gdGxzIHJwY3NlY19nc3Nfa3JiNSBh
dXRoX3JwY2dzcyBuZnN2NCBuZnMgbG9ja2QgZ3JhY2UgbmV0ZnMgeHRfY29ubnRyYWNrIHh0X01B
U1FVRVJBREUgbmZfY29ubnRyYWNrX25ldGxpbmsgeGZybV91c2VyIHhmcm1fYWxnbyBpcHRhYmxl
X25hdCB4dF9hZGRydHlwZSBpcHRhYmxlX2ZpbHRlciBicl9uZXRmaWx0ZXIgbnZtZV9mYWJyaWNz
IG92ZXJsYXkgYnJpZGdlIG5mbmV0bGlua19jdHRpbWVvdXQgc3RwIGxsYyBuZm5ldGxpbmsgb3Bl
bnZzd2l0Y2ggbnNoIG5mX2Nvbm5jb3VudCBuZl9uYXQgbmZfY29ubnRyYWNrIG5mX2RlZnJhZ19p
cHY2IG5mX2RlZnJhZ19pcHY0IGxpYmNyYzMyYyBzY2hfZnFfY29kZWwgaW50ZWxfcmFwbF9tc3Ig
YW1kX2F0bCBpbnRlbF9yYXBsX2NvbW1vbiBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgc25kX2hkYV9j
b2RlY19nZW5lcmljIHNuZF9oZGFfc2NvZGVjX2NvbXBvbmVudCBzbmRfaGRhX2NvZGVjX2hkbWkg
c3VucnBjIGVkYWNfbWNlX2FtZCBzbmRfaGRhX2ludGVsIHNuZF9pbnRlbF9kc3BjZmcgc25kX2hk
YV9jb2RlYyBrdm1fYW1kIHNuZF9wY2lfYWNwNnggc25kX2hkYV9jb3JlIHNuZF9hY3BfY29uZmln
IHNuZF9zb2NfYWNwaSBzbmRfaHdkZXAgYmluZm10X21pc2Mga3ZtIHNuZF9wY20gbmxzX2lzbzg4
NTlfMSBjcmN0MTBkaWZfcGNsbXVsIHNuZF9zZXFfbWlkaSBzbmRfc2VxX21pZGlfZXZlbnQgZ2hh
c2hfY2xtdWxuaV9pbnRlbCBzaGE1MTJfc3NzZTMgc2hhMjU2X3Nzc2UzIHNuZF9yYXdtaWRpIHNo
YTFfc3NzZTMgYWVzbmlfaW50ZWwgY3J5cHRvX3NpbWQgY3J5cHRkIHNuZF9zZXEgaW5wdXRfbGVk
cyByYXBsIHNlcmlvX3JhdyB3bWlfYm1vZg0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUt
cmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MDI1NV0gIHNuZF9zZXFfZGV2aWNlIGsxMHRlbXAgc25k
X3RpbWVyIHNwNTEwMF90Y28gc25kIGNjcCBzb3VuZGNvcmUgaXBtaV9kZXZpbnRmIGNtMzIxODEg
aXBtaV9tc2doYW5kbGVyIGluZHVzdHJpYWxpbyBtYWNfaGlkIG1zciBwYXJwb3J0X3BjIHBwZGV2
IGxwIHBhcnBvcnQgZWZpX3BzdG9yZSBpcF90YWJsZXMgeF90YWJsZXMgcGNpX3N0dWIgY3JjMzJf
cGNsbXVsIG52bWUgYWhjaSBsaWJhaGNpIGkyY19waWl4NCByODE2OSBudm1lX2NvcmUgaTJjX2Rl
c2lnbndhcmVfcGNpIHJlYWx0ZWsgaTJjX2NjZ3hfdWNzaSB3bWkgY2RjX2V0aGVyIGhpZF9nZW5l
cmljIHVzYm5ldCB1c2JoaWQgcjgxNTIgaGlkIG1paSBbbGFzdCB1bmxvYWRlZDogZHJtXQ0KPiBO
b3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MDI5N10g
Q1BVOiA5IFBJRDogMTE2NzEgQ29tbTogcHRfbWFpbl90aHJlYWQgVGFpbnRlZDogRyAgICAgICAg
ICAgT0UgICAgICA2LjEwLjAtY3VzdG9tICM0OTINCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1
ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzMDFdIEhhcmR3YXJlIG5hbWU6IEFNRCBNYWpv
bGljYS1STi9NYWpvbGljYS1STiwgQklPUyBSTUoxMDA5QSAwNi8xMy8yMDIxDQo+IE5vdiAgNCAx
NTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzAzXSBSSVA6IDAw
MTA6Y2hlY2tfdW5tYXArMHgxY2MvMHg5MzANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVl
LXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzMDZdIENvZGU6IGMwIDRjIDg5IDRkIGM4IGU4IDM0
IGJmIDg2IDAwIDRjIDhiIDRkIGM4IDRjIDhiIDQ1IGMwIDQ4IDhiIDRkIGI4IDQ4IDg5IGM2IDQx
IDU3IDRjIDg5IGVhIDQ4IGM3IGM3IDgwIDQ5IGI0IDkwIGU4IGI0IDgxIGYzIGZmIDwwZj4gMGIg
NDggYzcgYzcgMDQgODMgYWMgOTAgZTggNzYgYmEgZmMgZmYgNDEgOGIgNzYgNGMgNDkgOGQgN2Ug
NTANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4z
NjAzMDhdIFJTUDogMDAxODpmZmZmOWMwZjg1NTE3OWUwIEVGTEFHUzogMDAwMTAwODYNCj4gTm92
ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzMTFdIFJB
WDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmZmZmZmOTE2NWMxMzggUkNYOiAwMDAwMDAwMDAw
MDAwMDI3DQo+IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIw
MzMuMzYwMzEzXSBSRFg6IGZmZmY4YTZmY2Y2YTE2ODggUlNJOiAwMDAwMDAwMDAwMDAwMDAxIFJE
STogZmZmZjhhNmZjZjZhMTY4MA0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVzZXQg
a2VybmVsOiBbMzUyMDMzLjM2MDMxNV0gUkJQOiBmZmZmOWMwZjg1NTE3YTMwIFIwODogMDAwMDAw
MDAwMDAwMDBjOSBSMDk6IGZmZmY5YzBmODU1MTc4NTANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtl
LXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzMTZdIFIxMDogZmZmZjljMGY4NTUxNzg0
OCBSMTE6IGZmZmZmZmZmOTBmNDYzMjggUjEyOiBmZmZmOWMwZjg1NTE3YTQwDQo+IE5vdiAgNCAx
NTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzE4XSBSMTM6IGZm
ZmY4YTZjODMxZWM3ZTAgUjE0OiBmZmZmOGE2YzgxOWNlZDgwIFIxNTogZmZmZmZmZmY5MGFjODMx
Yg0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2
MDMyMF0gRlM6ICAwMDAwN2ZmODFkYjFiNzQwKDAwMDApIEdTOmZmZmY4YTZmY2Y2ODAwMDAoMDAw
MCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUt
cmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MDMyMl0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAw
IENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVz
ZXQga2VybmVsOiBbMzUyMDMzLjM2MDMyNF0gQ1IyOiAwMDAwN2ZmMzEwMjAwMDIwIENSMzogMDAw
MDAwMDE1OGY3YTAwMCBDUjQ6IDAwMDAwMDAwMDAzNTBlZjANCj4gTm92ICA0IDE1OjQ1OjMyIHBy
aWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzMjZdIENhbGwgVHJhY2U6DQo+IE5v
diAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzI3XSAg
PFRBU0s+DQo+IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIw
MzMuMzYwMzMwXSAgPyBzaG93X3JlZ3MrMHg2ZC8weDgwDQo+IE5vdiAgNCAxNTo0NTozMiBwcmlr
ZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzM0XSAgPyBfX3dhcm4rMHg4Yy8weDE0
MA0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2
MDMzOV0gID8gY2hlY2tfdW5tYXArMHgxY2MvMHg5MzANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtl
LXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzNDNdICA/IHJlcG9ydF9idWcrMHgxOTMv
MHgxYTANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAz
My4zNjAzNDddICA/IGhhbmRsZV9idWcrMHg0Ni8weDgwDQo+IE5vdiAgNCAxNTo0NTozMiBwcmlr
ZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzUyXSAgPyBleGNfaW52YWxpZF9vcCsw
eDFkLzB4ODANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1
MjAzMy4zNjAzNTVdICA/IGFzbV9leGNfaW52YWxpZF9vcCsweDFmLzB4MzANCj4gTm92ICA0IDE1
OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzNjJdICA/IGNoZWNr
X3VubWFwKzB4MWNjLzB4OTMwDQo+IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBr
ZXJuZWw6IFszNTIwMzMuMzYwMzY3XSAgZGVidWdfZG1hX3VubWFwX3BhZ2UrMHg4Ni8weDkwDQo+
IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzcz
XSAgPyBzcnNvX3JldHVybl90aHVuaysweDUvMHg1Zg0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2Ut
cXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MDM3N10gID8gcm1hcF93YWxrKzB4MjgvMHg1
MA0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2
MDM4MF0gID8gc3Jzb19yZXR1cm5fdGh1bmsrMHg1LzB4NWYNCj4gTm92ICA0IDE1OjQ1OjMyIHBy
aWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4zNjAzODNdICA/IHJlbW92ZV9taWdyYXRp
b25fcHRlcysweDc5LzB4ODANCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtl
cm5lbDogWzM1MjAzMy4zNjAzODhdICA/IHNyc29fcmV0dXJuX3RodW5rKzB4NS8weDVmDQo+IE5v
diAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYwMzkxXSAg
ZG1hX3VubWFwX3BhZ2VfYXR0cnMrMHhmYS8weDFkMA0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2Ut
cXVldWUtcmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MDM5Nl0gIHN2bV9yYW5nZV9kbWFfdW5tYXBf
ZGV2KzB4OGEvMHhmMCBbYW1kZ3B1XQ0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUtcmVz
ZXQga2VybmVsOiBbMzUyMDMzLjM2MDYzOF0gIHN2bV9taWdyYXRlX3JhbV90b192cmFtKzB4MzYx
LzB4NzQwIFthbWRncHVdDQo+IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJu
ZWw6IFszNTIwMzMuMzYwODQwXSAgc3ZtX21pZ3JhdGVfdG9fdnJhbSsweGE4LzB4ZTAgW2FtZGdw
dV0NCj4gTm92ICA0IDE1OjQ1OjMyIHByaWtlLXF1ZXVlLXJlc2V0IGtlcm5lbDogWzM1MjAzMy4z
NjEwMzRdICBzdm1fcmFuZ2Vfc2V0X2F0dHIrMHhmZjIvMHgxNDUwIFthbWRncHVdDQo+IE5vdiAg
NCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYxMjMyXSAgc3Zt
X2lvY3RsKzB4NGEvMHg1MCBbYW1kZ3B1XQ0KPiBOb3YgIDQgMTU6NDU6MzIgcHJpa2UtcXVldWUt
cmVzZXQga2VybmVsOiBbMzUyMDMzLjM2MTQyNF0gIGtmZF9pb2N0bF9zdm0rMHg1NC8weDkwIFth
bWRncHVdDQo+IE5vdiAgNCAxNTo0NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIw
MzMuMzYxNjEzXSAga2ZkX2lvY3RsKzB4M2MyLzB4NTMwIFthbWRncHVdDQo+IE5vdiAgNCAxNTo0
NTozMiBwcmlrZS1xdWV1ZS1yZXNldCBrZXJuZWw6IFszNTIwMzMuMzYxNzk4XSAgPyBfX3BmeF9r
ZmRfaW9jdGxfc3ZtKzB4MTAvMHgxMCBbYW1kZ3B1DQo+DQo+IFJlZ2FyZHMsDQo+ICAgICAgUHJp
a2UNCj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4g
ICAgRmVsaXgNCj4+Pg0KPj4+DQo+Pj4+IFJlZ2FyZHMsDQo+Pj4+IENocmlzdGlhbi4NCj4+Pj4N
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0K
Pj4+Pj4gLS0tDQo+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbWlncmF0
ZS5jIHwgNCArKy0tDQo+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3Zt
LmMgICAgIHwgNiArKystLS0NCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9zdm0uaCAgICAgfCAzICsrLQ0KPj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9taWdyYXRlLmMNCj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX21pZ3JhdGUuYw0KPj4+Pj4gaW5kZXggZWFjZmViMzJmMzVkLi45ZDgz
YmI5ZGQwMDQgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfbWlncmF0ZS5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bWlncmF0ZS5jDQo+Pj4+PiBAQCAtNDQ1LDcgKzQ0NSw3IEBAIHN2bV9taWdyYXRlX3ZtYV90b192
cmFtKHN0cnVjdCBrZmRfbm9kZSAqbm9kZSwNCj4+Pj4+IHN0cnVjdCBzdm1fcmFuZ2UgKnByYW5n
ZSwNCj4+Pj4+ICAgICAgICBwcl9kZWJ1Zygic3VjY2Vzc2Z1bC9jcGFnZXMvbnBhZ2VzIDB4JWx4
LzB4JWx4LzB4JWx4XG4iLA0KPj4+Pj4gICAgICAgICAgICAgICAgIG1wYWdlcywgY3BhZ2VzLCBt
aWdyYXRlLm5wYWdlcyk7DQo+Pj4+PiAgICAtICAgIHN2bV9yYW5nZV9kbWFfdW5tYXBfZGV2KGFk
ZXYtPmRldiwgc2NyYXRjaCwgMCwgbnBhZ2VzKTsNCj4+Pj4+ICsgICAgc3ZtX3JhbmdlX2RtYV91
bm1hcF9kZXYoYWRldi0+ZGV2LCBzY3JhdGNoLCAwLCBucGFnZXMsDQo+Pj4+PiBETUFfVE9fREVW
SUNFKTsNCj4+Pj4+ICAgICAgb3V0X2ZyZWU6DQo+Pj4+PiAgICAgICAga3ZmcmVlKGJ1Zik7DQo+
Pj4+PiBAQCAtNzUwLDcgKzc1MCw3IEBAIHN2bV9taWdyYXRlX3ZtYV90b19yYW0oc3RydWN0IGtm
ZF9ub2RlICpub2RlLA0KPj4+Pj4gc3RydWN0IHN2bV9yYW5nZSAqcHJhbmdlLA0KPj4+Pj4gICAg
ICAgIHN2bV9taWdyYXRlX2NvcHlfZG9uZShhZGV2LCBtZmVuY2UpOw0KPj4+Pj4gICAgICAgIG1p
Z3JhdGVfdm1hX2ZpbmFsaXplKCZtaWdyYXRlKTsNCj4+Pj4+ICAgIC0gICAgc3ZtX3JhbmdlX2Rt
YV91bm1hcF9kZXYoYWRldi0+ZGV2LCBzY3JhdGNoLCAwLCBucGFnZXMpOw0KPj4+Pj4gKyAgICBz
dm1fcmFuZ2VfZG1hX3VubWFwX2RldihhZGV2LT5kZXYsIHNjcmF0Y2gsIDAsIG5wYWdlcywNCj4+
Pj4+IERNQV9GUk9NX0RFVklDRSk7DQo+Pj4+PiAgICAgIG91dF9mcmVlOg0KPj4+Pj4gICAgICAg
IGt2ZnJlZShidWYpOw0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9zdm0uYw0KPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3Zt
LmMNCj4+Pj4+IGluZGV4IDNlMjkxMTg5NWM3NC4uYzIxNDg1ZmU2Y2JiIDEwMDY0NA0KPj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5jDQo+Pj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMNCj4+Pj4+IEBAIC0yMzMsOSArMjMz
LDkgQEAgc3ZtX3JhbmdlX2RtYV9tYXAoc3RydWN0IHN2bV9yYW5nZSAqcHJhbmdlLA0KPj4+Pj4g
dW5zaWduZWQgbG9uZyAqYml0bWFwLA0KPj4+Pj4gICAgfQ0KPj4+Pj4gICAgICB2b2lkIHN2bV9y
YW5nZV9kbWFfdW5tYXBfZGV2KHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdA0KPj4+Pj4g
KmRtYV9hZGRyLA0KPj4+Pj4gLSAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG9mZnNldCwgdW5z
aWduZWQgbG9uZyBucGFnZXMpDQo+Pj4+PiArICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgb2Zm
c2V0LCB1bnNpZ25lZCBsb25nIG5wYWdlcywNCj4+Pj4+ICsgICAgICAgICAgICAgICAgZW51bSBk
bWFfZGF0YV9kaXJlY3Rpb24gZGlyKQ0KPj4+Pj4gICAgew0KPj4+Pj4gLSAgICBlbnVtIGRtYV9k
YXRhX2RpcmVjdGlvbiBkaXIgPSBETUFfQklESVJFQ1RJT05BTDsNCj4+Pj4+ICAgICAgICBpbnQg
aTsNCj4+Pj4+ICAgICAgICAgIGlmICghZG1hX2FkZHIpDQo+Pj4+PiBAQCAtMjcyLDcgKzI3Miw3
IEBAIHZvaWQgc3ZtX3JhbmdlX2RtYV91bm1hcChzdHJ1Y3Qgc3ZtX3JhbmdlDQo+Pj4+PiAqcHJh
bmdlKQ0KPj4+Pj4gICAgICAgICAgICB9DQo+Pj4+PiAgICAgICAgICAgIGRldiA9ICZwZGQtPmRl
di0+YWRldi0+cGRldi0+ZGV2Ow0KPj4+Pj4gICAgLSAgICAgICAgc3ZtX3JhbmdlX2RtYV91bm1h
cF9kZXYoZGV2LCBkbWFfYWRkciwgMCwNCj4+Pj4+IHByYW5nZS0+bnBhZ2VzKTsNCj4+Pj4+ICsg
ICAgICAgIHN2bV9yYW5nZV9kbWFfdW5tYXBfZGV2KGRldiwgZG1hX2FkZHIsIDAsIHByYW5nZS0+
bnBhZ2VzLA0KPj4+Pj4gRE1BX0JJRElSRUNUSU9OQUwpOw0KPj4+Pj4gICAgICAgIH0NCj4+Pj4+
ICAgIH0NCj4+Pj4+ICAgIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfc3ZtLmgNCj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5oDQo+
Pj4+PiBpbmRleCBiZGRkMjRmMDQ2NjkuLjUzNzBkNjhiYzViMiAxMDA2NDQNCj4+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uaA0KPj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5oDQo+Pj4+PiBAQCAtMTgyLDcgKzE4Miw4IEBA
IHZvaWQgc3ZtX3JhbmdlX2FkZF9saXN0X3dvcmsoc3RydWN0DQo+Pj4+PiBzdm1fcmFuZ2VfbGlz
dCAqc3ZtcywNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgZW51bSBzdm1fd29ya19saXN0X29w
cyBvcCk7DQo+Pj4+PiAgICB2b2lkIHNjaGVkdWxlX2RlZmVycmVkX2xpc3Rfd29yayhzdHJ1Y3Qg
c3ZtX3JhbmdlX2xpc3QgKnN2bXMpOw0KPj4+Pj4gICAgdm9pZCBzdm1fcmFuZ2VfZG1hX3VubWFw
X2RldihzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QNCj4+Pj4+ICpkbWFfYWRkciwNCj4+
Pj4+IC0gICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxvbmcgbnBh
Z2VzKTsNCj4+Pj4+ICsgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVk
IGxvbmcgbnBhZ2VzLA0KPj4+Pj4gKyAgICAgICAgICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlv
biBkaXIpOw0KPj4+Pj4gICAgdm9pZCBzdm1fcmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBzdm1fcmFu
Z2UgKnByYW5nZSk7DQo+Pj4+PiAgICBpbnQgc3ZtX3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRf
cHJvY2VzcyAqcCwgdWludDMyX3QNCj4+Pj4+ICpudW1fc3ZtX3JhbmdlcywNCj4+Pj4+ICAgICAg
ICAgICAgICAgICAgIHVpbnQ2NF90ICpzdm1fcHJpdl9kYXRhX3NpemUpOw0KDQo=
