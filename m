Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F552993F1C
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2024 09:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93C310E14E;
	Tue,  8 Oct 2024 07:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w4P1Qj5u";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F269210E14E
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2024 07:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+zr3VML6w9ROnD+jdeZh6fejbhAdTCfMAYCdUHksyHCF0vGbppXIAnneBC/FFpfczrM2DaBVPHRNbOP91PI5F4O8L+cwF1elQlDJGDFUrvfUbJK/ZsquPY9NyGqog1JPeBbMJ9m2M9/BTLKu3LWNILo8K4x+upTx0LtEUx4oKCSB8N/9pWXT2iKlnBO3fMZVvzUS39ppq6ZT1LK6yNHXENTuAVEbWRu6M0MiMc8s5t2fRQOugRRaYEMIFUHdMXPMW3HfkeDlEwrBjX6fJJll+RAd+8ExjXEgfrAsOheULZkZO5m8Kcgs8WOAttbuv+Xqls2kV1VNWxR7yA4azuvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0BX3Fe9J1QBCWM6ly3oXFyn4YNcF4TbOqPWJ/3pq3M=;
 b=Bcv3IN/+I8wqiNlFhHAsBLyOjyGVB6k2937XLZfdN+2WUWI/OQL0lfWjDELCteZ3ZD+XaLpmxgelXDNr4wN878/lSxJKQwf4n53c1xeDNfDFVghwvEN8qzKDc6HciSpMgVz0BQcWxJez2OkyTYKs7GvLemhcqxxZAal/P/6dASf8SOu/rDf0o50ReSs/AVMyxjBxBlfDTul7nq1CUpGSmb4RMkmW1z4xZhNGquSOZdy7YZzQpA30UW00ii6UnS5p2/ncIlttNffjEuSW0is4Gg2+bfWX+WzMa89Ys//dZBCuB93LQ22EwIzcNdqdES6MYU9PHh1n5eNfk8MzPw7oFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0BX3Fe9J1QBCWM6ly3oXFyn4YNcF4TbOqPWJ/3pq3M=;
 b=w4P1Qj5uVVjTDncTnZSSzB6CpksLX3NbX92LPLnmINVNVI1F2UL3jm/bMc6Xljz2oXuDuTLQQOPL13wy2SKS35C10V1jj4jIwpJ1PVm8Qzu1A9xsQ9rQq5aEH1l/czOai34oFEPqVDFwUx8IjB4xi4DAU47+X6+KJlFPDx9mpjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 PH7PR12MB9103.namprd12.prod.outlook.com (2603:10b6:510:2f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 07:03:45 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 07:03:45 +0000
Message-ID: <a4b3d506-1bcd-438e-a264-983c175c71cb@amd.com>
Date: Tue, 8 Oct 2024 12:33:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] drm/amdgpu: power vcn 2_5 by instance
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Boyuan Zhang <Boyuan.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 leo.liu@amd.com, christian.koenig@amd.com, alexander.deucher@amd.com,
 sunil.khatri@amd.com
References: <20241004184444.435356-1-boyuan.zhang@amd.com>
 <20241004184444.435356-12-boyuan.zhang@amd.com>
 <4a7b5736-f60b-433b-a021-fef2cf4f2338@amd.com>
 <2d260d2c-d052-4b07-9cbf-0e5fc4199f98@amd.com>
 <5f4babf7-f8b9-4a93-8858-849b8b32c3b9@amd.com>
 <CADnq5_NK2fQMo=N=KEnnw3Not9PnWAw4nBK4+JUfY-Km7dX1Aw@mail.gmail.com>
 <7d48c870-2313-4af8-baea-6b0c423406ba@amd.com>
 <CADnq5_NWsADDzLhQbN2xVdiskX7Bm7abg2NSmP-iWXN===OORA@mail.gmail.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <CADnq5_NWsADDzLhQbN2xVdiskX7Bm7abg2NSmP-iWXN===OORA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|PH7PR12MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5bfa38-4597-4eab-ab10-08dce7675977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGY0cGY3bmdsYy9xWEFQT3hJZno2bXVjNzRqTEJrdWlZRVJzQ3hMczBkcEZa?=
 =?utf-8?B?d2E2MmQ2ZW5tM3dER1JEWmdmY0NxbEk3WmtiVWZRbTJTa1g3SS9MWEdaSFpn?=
 =?utf-8?B?Zm1rM1VXbkpkdzFtZWdaejI1TWZ0K2JzQXRqamJXbS9VamRZZEREam9Oc215?=
 =?utf-8?B?emtZZ2xZREUrc2N2cU00a2h4UE02RmNXU0JJcDBwV3diK3VFNnZIT0IzSVpY?=
 =?utf-8?B?cXhUakcwd0pESE1SS1lVK3A3U0IrQUl5bldWNExzU2hWMUl3WFpWT1hEZ0NI?=
 =?utf-8?B?aDNrNFVCT1ZRYzhsY2lDbSs2c1NpS0t0Qyt4bW1ZcWVXQjR5aFhTVXFHRC9o?=
 =?utf-8?B?cWd3a3JtSXgyM0NwU2VDMHN1TXNzbXFOOUI2RlFUMEJMbm1FNlFmcCtubjNx?=
 =?utf-8?B?L29LZ3VzNTRwSkM3ckp3a0MrSXE0bjBYVnBXNHdOVWJ2bTFwRVJLV29nL1Ex?=
 =?utf-8?B?V1BUTHA5eWFRS25WSFhTR2lMU1U1VVhuSktEbGxIYzRiUk4vQWw1MHl1bzFP?=
 =?utf-8?B?eFI4WCtQZ3puU0ZIZkYwQ2ZOWGNRNGVteUd3bmNrWG5HeXR3QXpqZlVuOXNP?=
 =?utf-8?B?M2hMWTJ0WVk0K2FVVGZLQXJMeGp1QTZDKzZVajl3RDBmVkVSaU1aL3dJVlky?=
 =?utf-8?B?ajRZNnRHbDJuL3U2dkZ1S3BDL2xFYUg4WWRYRGg3UkpCL0VlQVN2V3BsUFJt?=
 =?utf-8?B?bDJjRkwwcmdod0FnaitTRXhGU3hFUjJNWHR1dlE0dHNjSlhnUHFzVWFoQkN6?=
 =?utf-8?B?SFEwOTJNMUtJSnBiY1Jia2g1Qjc4Y0RYTklkUDd4SW9kSUg3VVI5bHJTeitD?=
 =?utf-8?B?eG56eXlHOVNzWFBCRmpWSzNuWlR0ek0rZ1pqNDJTY0Z4eXdsMWZtRkNFck14?=
 =?utf-8?B?RzdWcHZsU1gvd0dpUHQwTENEblBwbFAveGh0SjZMZXZaV2t0VkRYbE8rZUN0?=
 =?utf-8?B?WUFQZWx0Z3R1RE9QcTVEQmRXWitpcDUxR09QdEVNZWw2WHlmSTdvQTBLWXVl?=
 =?utf-8?B?eFdSRm5MazhmVlBocG5WU1ZKSHhFMWVsVEkrbE9mMzFIck15K1RDdm91THpN?=
 =?utf-8?B?ZENxNHUxR3B2OWZMVERneHd0WVNCeDR4bHJKcktDaWNnSjZqR1FiNmpwTXJt?=
 =?utf-8?B?bVYyR1pNVGF2V3FhMkZEckR0ZElGY1pyUGR1YWMwK0NEdWJVbDg5TGVFaHBa?=
 =?utf-8?B?STRIekh0aEs1dWdzT2lEKysweDF3R0JXVjlqZElZTmxGRVF5OTI4Vk9UdGQx?=
 =?utf-8?B?MkUyWGw5TVRlYkRqMjVGanlPdk0rcC94ZjdjZzdhME16VWcrRTFyRGtyekQ3?=
 =?utf-8?B?Y2JleDEwWjhNZVdybkV1R0ZPaU02UEdzcnFpNmtMTldDSlJoaVd1RDZueTgv?=
 =?utf-8?B?VGJUY0kxSXhBaG5FMXRqTk9FQkNQdGl1U0M1akh3eHpzSzJMOVdmWjdjSGJQ?=
 =?utf-8?B?RTdGM1VmTC9CMXZoODFOdkVVanpqK0tRU3YwdmkxZHhCbSs0eENFMUZQY2Fl?=
 =?utf-8?B?ODk5WlI0S21IK1M1YlRiT2U4M2x1ZkpOczdMY2FiRWVDRFpFeldRcEk3ZW1F?=
 =?utf-8?B?ekdKZVdwTm84VEpMRDlRZVNXdUpLL1l1Q2ZpVWJWZHdFNVk3UlhhenpTbEow?=
 =?utf-8?B?TUZPcnk5dFZaMlYxdjB0anZKdWpVaFUzMzhOK3JPdFM4dlRPd0xsclRtUHdS?=
 =?utf-8?B?ZDI1S3VRTjBYRFR1dERFL2dOUWxVTXdrN3U5dTFrTnZsMU9VdkwxWi9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5zVmRsRUpESzBDNmV5TnNxUWRSZzlvTTFXVEFodU9uRURUOFdWWVFwejA1?=
 =?utf-8?B?TWVBcVVSclU1U2RkUzhFYk8vRXc3dHdxNzNQTzYxaHA4SjVlamNUK204bEtZ?=
 =?utf-8?B?am9GMlo5U1JJcWh5RlUzS2tLOFFaSFhzVEdSWEZEejJ2VHQ3by9SQ1lpR2Rk?=
 =?utf-8?B?WFFnVVFSbElSekJrcVVKREJjUzNwa1kxSmRjWlpuRXZsTzloQ252SXBIaHM3?=
 =?utf-8?B?RC9LZTV1c3B2S2d3MFpxTjZSMG1oRDdCdTAyZ2JWcHNpb1FQLzg1TmRsUUp4?=
 =?utf-8?B?UGIrdGZhOExaMWhlNW1reHowdnpXT0lPWWViRHBWa1BQZDZ5eXpIZEVDUHlt?=
 =?utf-8?B?YzdybHNFVVVSUzliSnNzQ1dJR1ArNFN3QnBSQWxPSzNOek9NVko5OThpWStJ?=
 =?utf-8?B?ZU9SaW14QXhnREptM0M3M3FxK2JudkJVblF2RzB0WWdGSnFLVDhvNXVzbVEv?=
 =?utf-8?B?K3hjbjl1cmFQSlBqZUx4aWZySnZJM3ljQThBaXJuNXYvaWwzUU5NMXB4RnZH?=
 =?utf-8?B?eW13SHdDbEZnclVTTHJVZWxQL0RmdW5rUDdha1I3RHdQT2VwU2VlTEIzNXlC?=
 =?utf-8?B?WmZsc2tWdnpML3FXV09pakp0eTkvZ0lOeVBDN3BDekU5RHVSbXVNQk1DQXlu?=
 =?utf-8?B?VVE2OXFISFFvTnVuR3JuRkE5L3JUVWh1ZWx0RHN2MVl6MG5YVmo4ZlEwalpW?=
 =?utf-8?B?RjNOdE9SMitBWlBQSW4vbTd6S0NMRElMWnoySWF2bXhScjkvV21aNTNlQjZy?=
 =?utf-8?B?Um1lT28xMktWVFR6TWNsQW1xU0xjQktHeUhMaUJnNk9Ra1hKTWx4N3JnUGcv?=
 =?utf-8?B?MEhYcW9CMUxqL1dDMXkxWm1HMTdWaGd0ekVkdFVEaysyN2YzT2NZNmpMWS9t?=
 =?utf-8?B?MXdpNW80RmJhSm1weWVaWkw3R2g2RUpTZEk5TWhCTmVwcnUzYXpmWW1UWVNK?=
 =?utf-8?B?UWFCWm9yWnBxWXdoMzk4WGlhYUVCRjV2bTA0RlRnVEZXUWREYzBRcnhFdnA0?=
 =?utf-8?B?U1JRd2dvSFNCK0JMNm9QUFZtS24vaW83Q3FldVpDYzhLYmN1VTMzZ0FNQkcw?=
 =?utf-8?B?Y2hNdG9mV2xuV3g4VTA2VkUvaFNPckZzOVZWZkZLcGtPMXVUeVJyamtzQndw?=
 =?utf-8?B?citXeGkzdURDNTJ6Y3VwQmRnQkNQZkVmd1JLYlN3SlFwU0dwZFRrN2RmZk1U?=
 =?utf-8?B?RGVQK1ZuREF1VzhhOTkycWZxRURHWXpySGticlFJalVMUENybFo1WVRKaDlr?=
 =?utf-8?B?RURzTDEvVjRXdHczNHBVT1lzM2ZReHhFWHdkQUUyWXcrS0JrYStkd1lYV1JK?=
 =?utf-8?B?RENDNURLb2lwRk1BRk5Zb1FuY2Z3TjBHNXFtdkFsU0VodWRyMUY2VlVXU1ht?=
 =?utf-8?B?L3VGS0prcDFyNmdYT2EvZDlqR2VoN2hqM0EvcXY2dmNJcUNVeG84NHl5cWlN?=
 =?utf-8?B?dFRsK0tVcGxvSE4wN1dVUVhUa0xsWThGZzdmMGdtN2dYMzJNNFJUS2tSbnRr?=
 =?utf-8?B?eVpRODBNNHRjZ3ZCMy9vMTZFMU9MeUs1VWo4Z0pNMlkwcjhoQmYxWmlhU0dt?=
 =?utf-8?B?TkluODBZai9RQXFiRlpBdjJNTWJScnhkaFFLS214Mml2N2RibXM5OGRqckx4?=
 =?utf-8?B?dDl3WkJ0K1pEeksyYTJib2FGOXdOTEl1dnJRcVo1SEFvZW5PZjcrc3ZjU0FC?=
 =?utf-8?B?d1BNcTZqSlhiMnRUQTVWUWdCQWxLLzdDdS9WQ2FodXZnL1BvMVRVMmFjOEI3?=
 =?utf-8?B?ZHBVZjBUYVRnS0p4cXJrdXcwV0xYSEZDV0pzcld5SjN5WVJaQUVTUXZCUHVN?=
 =?utf-8?B?bGJ1akVYT0lDYUNmVm54NSt4bDMybjBFa3BaR2t6TGRjaVEzaXlkNXN3QUF0?=
 =?utf-8?B?NVdNT01UZ1h4eWkwczZBUzZkbXk1eW9ObzZDNXY1RDdHR2o2UldLeG1VQVRH?=
 =?utf-8?B?NDhRWHZMQ0htZWZTY21yOGZoRmo1QklZcDM1eFhhME5SaXFmZGRKdWV1NnJw?=
 =?utf-8?B?cGdpOVQzL25ZMnZQYWVMZjBPNTBnT2lQWUhTa0k5ZlhLYTdPbFc3UWl5Zloz?=
 =?utf-8?B?M05URFp6YVMrcWhtUE1pVkVPSlI4OUd6N1JRSXphaFQ5MVhtK093bDB3OE56?=
 =?utf-8?Q?+8NzofnmQvX7IUnXuHp3sfk+3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5bfa38-4597-4eab-ab10-08dce7675977
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:03:45.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/pF/yD1VbnFkKxFztL3zECM8Hx34pYOKf6pQroiiArZBWHYFTwp9Py2hZT18QAG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9103
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



On 10/7/2024 8:54 PM, Alex Deucher wrote:
> On Mon, Oct 7, 2024 at 10:32 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>>
>>
>>
>> On 10/7/2024 7:47 PM, Alex Deucher wrote:
>>> On Mon, Oct 7, 2024 at 9:58 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/7/2024 7:03 PM, Boyuan Zhang wrote:
>>>>>
>>>>> On 2024-10-07 01:22, Lazar, Lijo wrote:
>>>>>>
>>>>>> On 10/5/2024 12:14 AM, boyuan.zhang@amd.com wrote:
>>>>>>> From: Boyuan Zhang <boyuan.zhang@amd.com>
>>>>>>>
>>>>>>> For vcn 2_5, add ip_block for each vcn instance during discovery stage.
>>>>>>>
>>>>>>> And only powering on/off one of the vcn instance using the
>>>>>>> instance value stored in ip_block, instead of powering on/off all
>>>>>>> vcn instances. Modify the existing functions to use the instance value
>>>>>>> in ip_block, and remove the original for loop for all vcn instances.
>>>>>>>
>>>>>>> v2: rename "i"/"j" to "inst" for instance value.
>>>>>>>
>>>>>>> Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |   4 +-
>>>>>>>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         | 565 +++++++++---------
>>>>>>>   2 files changed, 280 insertions(+), 289 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>>>>> index 9f9a1867da72..de1053cc2a2b 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>>>>> @@ -2278,6 +2278,7 @@ static int
>>>>>>> amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
>>>>>>>     static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device
>>>>>>> *adev)
>>>>>>>   {
>>>>>>> +    int i;
>>>>>>>       if (amdgpu_ip_version(adev, VCE_HWIP, 0)) {
>>>>>>>           switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
>>>>>>>           case IP_VERSION(7, 0, 0):
>>>>>>> @@ -2321,7 +2322,8 @@ static int
>>>>>>> amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
>>>>>>>           case IP_VERSION(2, 0, 3):
>>>>>>>               break;
>>>>>>>           case IP_VERSION(2, 5, 0):
>>>>>>> -            amdgpu_device_ip_block_add(adev, &vcn_v2_5_ip_block);
>>>>>>> +            for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
>>>>>>> +                amdgpu_device_ip_block_add(adev, &vcn_v2_5_ip_block);
>>>>>>
>>>>>> This introduces a totally confusing design now. At a higher level an IP
>>>>>> block type manages multiple instances and their power states. Now there
>>>>>> is a mix where no definition can be attributed to an IP block. Or, if
>>>>>> this were to be done uniformly for other IPs, then for some SOCs there
>>>>>> could be 16 SDMA blocks, 8 GFX blocks and so forth.
>>>>>>
>>>>>> What is the reason to do this way? Can't VCN IP block maintain the state
>>>>>> of multiple instances within itself?
>>>>>>
>>>>>> Thanks,
>>>>>> Lijo
>>>>> This is part of the fundamental design change for separating IP block
>>>>> per instance, in order to
>>>>> handle each instance separately within same IP block (e.g. separate
>>>>> power/clock management).
>>>>>
>>>>> Part 1, Change all adev ptr handle to amdgpu_ip_block ptr in all
>>>>> callbacks (hw_init/fini, sw_init/fini,
>>>>> suspend, etc...) for all IP blocks, so that each IP knows which IP_block
>>>>> (and which instance) the
>>>>> callback is for. Most parts of this changes have been submitted by Sunil.
>>>>>
>>>>> Part 2, Separate IP block per instance.
>>>>>
>>>>> Part 3, Since callbacks can pass in IP_block now after Part 1 change and
>>>>> instance value can be
>>>>> obtained from each IP block in Part 2, IP can then choose to handle
>>>>> callbacks ONLY for the given
>>>>> instance of a given IP block (or still handling for all instances as
>>>>> before).
>>>>> For VCN, all callbacks will be handled only for the given one instance,
>>>>> instead of the original for-
>>>>> loop for all instance. As a result, each VCN instance can be
>>>>> start/stop/int/fini/suspend separately.
>>>>>
>>>>> Part 4, Change all VCN helper functions to handle only the given
>>>>> instance, instead of the original
>>>>> for-loop for all instance.
>>>>>
>>>>> Each instance can have its own states, so we think it makes more sense
>>>>> to separate them on IP
>>>>> block level to handle each of them separately.
>>>>
>>>>
>>>> Such a change should not be done unless all IPs follow the same design.
>>>> You didn't answer the question - what necessitates this change? What is
>>>> special about VCN that it cannot manage the states of multiple instances
>>>> within the IP block?
>>>
>>> We want to be able to manage the powergating independently for each
>>> VCN instance for both power management and VCN reset.  Right now power
>>> gating is handled at the IP level so it's not easy or clean to handle
>>> powergating of individual IP instances.
>>>
>>
>> Still VCN block can manage the powergated instances (FWIW, it's just an
>> array in SMU block). Also vcn block gets to run the idle worker and
>> knows the rings (and corresponding VCN instances) that are idle.
>> Maintaining instance states in VCN block and modifying idle worker to
>> just idle that instance alone doesn't look like a complex change.
> 
> 
> We already went down that road and it's really ugly.  We end up
> duplicating a bunch of code paths for different driver flows because
> set_powergating_state() and set_clockgating_state are at the IP level
> and we want per instance gating.  We could add a num_instances member
> at the IP block level and then convert all of the high level code that
> calls the IP functions loop over the number of instances, but that
> seems like just as much work and it's not quite as clean IMHO.
> 

Sorry, I'm not seeing much difference in this design. All it does is
just split instances to IP block at the same time it's going to keep an
instance parameter in IP block APIs.

	amdgpu_device_ip_set_clockgating_state(blocktype, instance);
	amdgpu_device_ip_set_powergating_state(blocktype, instance);

Also, VCN continues to maintain an array of amdgpu_vcn_inst. I think
it's easier manage this with changes to amdgpu_vcn_inst. Since it is
continued to be maintained, what about just moving the states and
idle_work inside amdgpu_vcn_inst.
	
	int inst;
	enum amd_powergating_state cur_pg_state;
	enum amd_clockgating_state state cur_cg_state;
	struct delayed_work     idle_work;

At the end of ring usage of corresponding instance, just invoke the
corresponding instance's idle work.

schedule_delayed_work(&ring->adev->vcn.inst[ring->me].idle_work,
idle_time_out);

I don't see any change in this series for other IP block APIs.

Thanks,
Lijo

> Alex
> 
>>
>> Moving to IP block per instance for VCN alone is not a change that helps
>> to define an IP block. If that needs to be done for every other IP type,
>> that's also a massive change.
>>
>> Also, then it's no longer possible to have something static like this -
>>         struct amdgpu_ip_block          ip_blocks[AMDGPU_MAX_IP_NUM];
>>
>>
>> Thanks,
>> Lijo
>>
>>> Alex
>>>
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>>
>>>>> Thanks,
>>>>> Boyuan
>>>>>>
>>>>>>>               amdgpu_device_ip_block_add(adev, &jpeg_v2_5_ip_block);
>>>>>>>               break;
>>>>>>>           case IP_VERSION(2, 6, 0):
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>>>>>> index d00df51bc400..1f8738ae360a 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>>>>>> @@ -158,35 +158,34 @@ static int vcn_v2_5_early_init(struct
>>>>>>> amdgpu_ip_block *ip_block)
>>>>>>>   static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>>>>>   {
>>>>>>>       struct amdgpu_ring *ring;
>>>>>>> -    int i, j, r;
>>>>>>> +    int i, r;
>>>>>>>       uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_2_5);
>>>>>>>       uint32_t *ptr;
>>>>>>>       struct amdgpu_device *adev = ip_block->adev;
>>>>>>> +    int inst = ip_block->instance;
>>>>>>>   -    for (j = 0; j < adev->vcn.num_vcn_inst; j++) {
>>>>>>> -        if (adev->vcn.harvest_config & (1 << j))
>>>>>>> -            continue;
>>>>>>> -        /* VCN DEC TRAP */
>>>>>>> -        r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[j],
>>>>>>> -                VCN_2_0__SRCID__UVD_SYSTEM_MESSAGE_INTERRUPT,
>>>>>>> &adev->vcn.inst[j].irq);
>>>>>>> -        if (r)
>>>>>>> -            return r;
>>>>>>> -
>>>>>>> -        /* VCN ENC TRAP */
>>>>>>> -        for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>>>>>> -            r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[j],
>>>>>>> -                i + VCN_2_0__SRCID__UVD_ENC_GENERAL_PURPOSE,
>>>>>>> &adev->vcn.inst[j].irq);
>>>>>>> -            if (r)
>>>>>>> -                return r;
>>>>>>> -        }
>>>>>>> +    if (adev->vcn.harvest_config & (1 << inst))
>>>>>>> +        goto sw_init;
>>>>>>> +    /* VCN DEC TRAP */
>>>>>>> +    r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[inst],
>>>>>>> +            VCN_2_0__SRCID__UVD_SYSTEM_MESSAGE_INTERRUPT,
>>>>>>> &adev->vcn.inst[inst].irq);
>>>>>>> +    if (r)
>>>>>>> +        return r;
>>>>>>>   -        /* VCN POISON TRAP */
>>>>>>> -        r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[j],
>>>>>>> -            VCN_2_6__SRCID_UVD_POISON,
>>>>>>> &adev->vcn.inst[j].ras_poison_irq);
>>>>>>> +    /* VCN ENC TRAP */
>>>>>>> +    for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>>>>>> +        r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[inst],
>>>>>>> +            i + VCN_2_0__SRCID__UVD_ENC_GENERAL_PURPOSE,
>>>>>>> &adev->vcn.inst[inst].irq);
>>>>>>>           if (r)
>>>>>>>               return r;
>>>>>>>       }
>>>>>>>   +    /* VCN POISON TRAP */
>>>>>>> +    r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[inst],
>>>>>>> +        VCN_2_6__SRCID_UVD_POISON,
>>>>>>> &adev->vcn.inst[inst].ras_poison_irq);
>>>>>>> +    if (r)
>>>>>>> +        return r;
>>>>>>> +sw_init:
>>>>>>>       r = amdgpu_vcn_sw_init(adev);
>>>>>>>       if (r)
>>>>>>>           return r;
>>>>>>> @@ -197,76 +196,74 @@ static int vcn_v2_5_sw_init(struct
>>>>>>> amdgpu_ip_block *ip_block)
>>>>>>>       if (r)
>>>>>>>           return r;
>>>>>>>   -    for (j = 0; j < adev->vcn.num_vcn_inst; j++) {
>>>>>>> -        volatile struct amdgpu_fw_shared *fw_shared;
>>>>>>> +    volatile struct amdgpu_fw_shared *fw_shared;
>>>>>>>   -        if (adev->vcn.harvest_config & (1 << j))
>>>>>>> -            continue;
>>>>>>> -        adev->vcn.internal.context_id =
>>>>>>> mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.internal.ib_vmid =
>>>>>>> mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.internal.ib_bar_low =
>>>>>>> mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.internal.ib_bar_high =
>>>>>>> mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.internal.gp_scratch8 =
>>>>>>> mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>>>>>> -
>>>>>>> -        adev->vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.inst[j].external.scratch9 = SOC15_REG_OFFSET(VCN,
>>>>>>> j, mmUVD_SCRATCH9);
>>>>>>> -        adev->vcn.internal.data0 =
>>>>>>> mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.inst[j].external.data0 = SOC15_REG_OFFSET(VCN, j,
>>>>>>> mmUVD_GPCOM_VCPU_DATA0);
>>>>>>> -        adev->vcn.internal.data1 =
>>>>>>> mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.inst[j].external.data1 = SOC15_REG_OFFSET(VCN, j,
>>>>>>> mmUVD_GPCOM_VCPU_DATA1);
>>>>>>> -        adev->vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.inst[j].external.cmd = SOC15_REG_OFFSET(VCN, j,
>>>>>>> mmUVD_GPCOM_VCPU_CMD);
>>>>>>> -        adev->vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>>>>>> -        adev->vcn.inst[j].external.nop = SOC15_REG_OFFSET(VCN, j,
>>>>>>> mmUVD_NO_OP);
>>>>>>> -
>>>>>>> -        ring = &adev->vcn.inst[j].ring_dec;
>>>>>>> +    if (adev->vcn.harvest_config & (1 << inst))
>>>>>>> +        goto done;
>>>>>>> +    adev->vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.internal.ib_bar_low =
>>>>>>> mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.internal.ib_bar_high =
>>>>>>> mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>>>>>> +
>>>>>>> +    adev->vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.inst[inst].external.scratch9 = SOC15_REG_OFFSET(VCN,
>>>>>>> inst, mmUVD_SCRATCH9);
>>>>>>> +    adev->vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.inst[inst].external.data0 = SOC15_REG_OFFSET(VCN,
>>>>>>> inst, mmUVD_GPCOM_VCPU_DATA0);
>>>>>>> +    adev->vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.inst[inst].external.data1 = SOC15_REG_OFFSET(VCN,
>>>>>>> inst, mmUVD_GPCOM_VCPU_DATA1);
>>>>>>> +    adev->vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.inst[inst].external.cmd = SOC15_REG_OFFSET(VCN, inst,
>>>>>>> mmUVD_GPCOM_VCPU_CMD);
>>>>>>> +    adev->vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>>>>>> +    adev->vcn.inst[inst].external.nop = SOC15_REG_OFFSET(VCN, inst,
>>>>>>> mmUVD_NO_OP);
>>>>>>> +
>>>>>>> +    ring = &adev->vcn.inst[inst].ring_dec;
>>>>>>> +    ring->use_doorbell = true;
>>>>>>> +
>>>>>>> +    ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 <<
>>>>>>> 1) +
>>>>>>> +            (amdgpu_sriov_vf(adev) ? 2*inst : 8*inst);
>>>>>>> +
>>>>>>> +    if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(2, 5, 0))
>>>>>>> +        ring->vm_hub = AMDGPU_MMHUB1(0);
>>>>>>> +    else
>>>>>>> +        ring->vm_hub = AMDGPU_MMHUB0(0);
>>>>>>> +
>>>>>>> +    sprintf(ring->name, "vcn_dec_%d", inst);
>>>>>>> +    r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst[inst].irq,
>>>>>>> +                 0, AMDGPU_RING_PRIO_DEFAULT, NULL);
>>>>>>> +    if (r)
>>>>>>> +        return r;
>>>>>>> +
>>>>>>> +    for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>>>>>> +        enum amdgpu_ring_priority_level hw_prio =
>>>>>>> amdgpu_vcn_get_enc_ring_prio(i);
>>>>>>> +
>>>>>>> +        ring = &adev->vcn.inst[inst].ring_enc[i];
>>>>>>>           ring->use_doorbell = true;
>>>>>>>             ring->doorbell_index =
>>>>>>> (adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
>>>>>>> -                (amdgpu_sriov_vf(adev) ? 2*j : 8*j);
>>>>>>> +                (amdgpu_sriov_vf(adev) ? (1 + i + 2*inst) : (2 + i +
>>>>>>> 8*inst));
>>>>>>>   -        if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(2,
>>>>>>> 5, 0))
>>>>>>> +        if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
>>>>>>> +            IP_VERSION(2, 5, 0))
>>>>>>>               ring->vm_hub = AMDGPU_MMHUB1(0);
>>>>>>>           else
>>>>>>>               ring->vm_hub = AMDGPU_MMHUB0(0);
>>>>>>>   -        sprintf(ring->name, "vcn_dec_%d", j);
>>>>>>> -        r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst[j].irq,
>>>>>>> -                     0, AMDGPU_RING_PRIO_DEFAULT, NULL);
>>>>>>> +        sprintf(ring->name, "vcn_enc_%d.%d", inst, i);
>>>>>>> +        r = amdgpu_ring_init(adev, ring, 512,
>>>>>>> +                     &adev->vcn.inst[inst].irq, 0,
>>>>>>> +                     hw_prio, NULL);
>>>>>>>           if (r)
>>>>>>>               return r;
>>>>>>> -
>>>>>>> -        for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>>>>>> -            enum amdgpu_ring_priority_level hw_prio =
>>>>>>> amdgpu_vcn_get_enc_ring_prio(i);
>>>>>>> -
>>>>>>> -            ring = &adev->vcn.inst[j].ring_enc[i];
>>>>>>> -            ring->use_doorbell = true;
>>>>>>> -
>>>>>>> -            ring->doorbell_index =
>>>>>>> (adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
>>>>>>> -                    (amdgpu_sriov_vf(adev) ? (1 + i + 2*j) : (2 + i
>>>>>>> + 8*j));
>>>>>>> -
>>>>>>> -            if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
>>>>>>> -                IP_VERSION(2, 5, 0))
>>>>>>> -                ring->vm_hub = AMDGPU_MMHUB1(0);
>>>>>>> -            else
>>>>>>> -                ring->vm_hub = AMDGPU_MMHUB0(0);
>>>>>>> -
>>>>>>> -            sprintf(ring->name, "vcn_enc_%d.%d", j, i);
>>>>>>> -            r = amdgpu_ring_init(adev, ring, 512,
>>>>>>> -                         &adev->vcn.inst[j].irq, 0,
>>>>>>> -                         hw_prio, NULL);
>>>>>>> -            if (r)
>>>>>>> -                return r;
>>>>>>> -        }
>>>>>>> -
>>>>>>> -        fw_shared = adev->vcn.inst[j].fw_shared.cpu_addr;
>>>>>>> -        fw_shared->present_flag_0 =
>>>>>>> cpu_to_le32(AMDGPU_VCN_MULTI_QUEUE_FLAG);
>>>>>>> -
>>>>>>> -        if (amdgpu_vcnfw_log)
>>>>>>> -            amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
>>>>>>>       }
>>>>>>>   +    fw_shared = adev->vcn.inst[inst].fw_shared.cpu_addr;
>>>>>>> +    fw_shared->present_flag_0 =
>>>>>>> cpu_to_le32(AMDGPU_VCN_MULTI_QUEUE_FLAG);
>>>>>>> +
>>>>>>> +    if (amdgpu_vcnfw_log)
>>>>>>> +        amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
>>>>>>> +done:
>>>>>>>       if (amdgpu_sriov_vf(adev)) {
>>>>>>>           r = amdgpu_virt_alloc_mm_table(adev);
>>>>>>>           if (r)
>>>>>>> @@ -1005,197 +1002,192 @@ static int vcn_v2_5_start_dpg_mode(struct
>>>>>>> amdgpu_device *adev, int inst_idx, boo
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>>   -static int vcn_v2_5_start(struct amdgpu_device *adev)
>>>>>>> +static int vcn_v2_5_start(struct amdgpu_device *adev, unsigned int
>>>>>>> inst)
>>>>>>>   {
>>>>>>>       struct amdgpu_ring *ring;
>>>>>>>       uint32_t rb_bufsz, tmp;
>>>>>>> -    int i, j, k, r;
>>>>>>> +    int j, k, r;
>>>>>>>   -    for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>>>>> -        if (adev->pm.dpm_enabled)
>>>>>>> -            amdgpu_dpm_enable_vcn(adev, true, i);
>>>>>>> -    }
>>>>>>> -
>>>>>>> -    for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>>>>> -        if (adev->vcn.harvest_config & (1 << i))
>>>>>>> -            continue;
>>>>>>> -        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>>>>>> -            r = vcn_v2_5_start_dpg_mode(adev, i,
>>>>>>> adev->vcn.indirect_sram);
>>>>>>> -            continue;
>>>>>>> -        }
>>>>>>> +    if (adev->pm.dpm_enabled)
>>>>>>> +        amdgpu_dpm_enable_vcn(adev, true, inst);
>>>>>>>   -        /* disable register anti-hang mechanism */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_POWER_STATUS), 0,
>>>>>>> -            ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
>>>>>>> +    if (adev->vcn.harvest_config & (1 << inst))
>>>>>>> +        return 0;
>>>>>>>   -        /* set uvd status busy */
>>>>>>> -        tmp = RREG32_SOC15(VCN, i, mmUVD_STATUS) |
>>>>>>> UVD_STATUS__UVD_BUSY;
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_STATUS, tmp);
>>>>>>> +    if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>>>>>> +        r = vcn_v2_5_start_dpg_mode(adev, inst,
>>>>>>> adev->vcn.indirect_sram);
>>>>>>> +        return r;
>>>>>>>       }
>>>>>>>   +    /* disable register anti-hang mechanism */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_POWER_STATUS), 0,
>>>>>>> +        ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
>>>>>>> +
>>>>>>> +    /* set uvd status busy */
>>>>>>> +    tmp = RREG32_SOC15(VCN, inst, mmUVD_STATUS) | UVD_STATUS__UVD_BUSY;
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_STATUS, tmp);
>>>>>>> +
>>>>>>>       if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>>>>>>           return 0;
>>>>>>>         /*SW clock gating */
>>>>>>>       vcn_v2_5_disable_clock_gating(adev);
>>>>>>>   -    for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>>>>> -        if (adev->vcn.harvest_config & (1 << i))
>>>>>>> -            continue;
>>>>>>> -        /* enable VCPU clock */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL),
>>>>>>> -            UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
>>>>>>> -
>>>>>>> -        /* disable master interrupt */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_MASTINT_EN), 0,
>>>>>>> -            ~UVD_MASTINT_EN__VCPU_EN_MASK);
>>>>>>> -
>>>>>>> -        /* setup mmUVD_LMI_CTRL */
>>>>>>> -        tmp = RREG32_SOC15(VCN, i, mmUVD_LMI_CTRL);
>>>>>>> -        tmp &= ~0xff;
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_LMI_CTRL, tmp | 0x8|
>>>>>>> -            UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK    |
>>>>>>> -            UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
>>>>>>> -            UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
>>>>>>> -            UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
>>>>>>> -
>>>>>>> -        /* setup mmUVD_MPC_CNTL */
>>>>>>> -        tmp = RREG32_SOC15(VCN, i, mmUVD_MPC_CNTL);
>>>>>>> -        tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
>>>>>>> -        tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_MPC_CNTL, tmp);
>>>>>>> -
>>>>>>> -        /* setup UVD_MPC_SET_MUXA0 */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_MPC_SET_MUXA0,
>>>>>>> -            ((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
>>>>>>> -            (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
>>>>>>> -            (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
>>>>>>> -            (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
>>>>>>> -
>>>>>>> -        /* setup UVD_MPC_SET_MUXB0 */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_MPC_SET_MUXB0,
>>>>>>> -            ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
>>>>>>> -            (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
>>>>>>> -            (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
>>>>>>> -            (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
>>>>>>> -
>>>>>>> -        /* setup mmUVD_MPC_SET_MUX */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_MPC_SET_MUX,
>>>>>>> -            ((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
>>>>>>> -            (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
>>>>>>> -            (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
>>>>>>> -    }
>>>>>>> +    if (adev->vcn.harvest_config & (1 << inst))
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    /* enable VCPU clock */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_VCPU_CNTL),
>>>>>>> +        UVD_VCPU_CNTL__CLK_EN_MASK, ~UVD_VCPU_CNTL__CLK_EN_MASK);
>>>>>>> +
>>>>>>> +    /* disable master interrupt */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_MASTINT_EN), 0,
>>>>>>> +        ~UVD_MASTINT_EN__VCPU_EN_MASK);
>>>>>>> +
>>>>>>> +    /* setup mmUVD_LMI_CTRL */
>>>>>>> +    tmp = RREG32_SOC15(VCN, inst, mmUVD_LMI_CTRL);
>>>>>>> +    tmp &= ~0xff;
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_LMI_CTRL, tmp | 0x8|
>>>>>>> +        UVD_LMI_CTRL__WRITE_CLEAN_TIMER_EN_MASK    |
>>>>>>> +        UVD_LMI_CTRL__MASK_MC_URGENT_MASK |
>>>>>>> +        UVD_LMI_CTRL__DATA_COHERENCY_EN_MASK |
>>>>>>> +        UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK);
>>>>>>> +
>>>>>>> +    /* setup mmUVD_MPC_CNTL */
>>>>>>> +    tmp = RREG32_SOC15(VCN, inst, mmUVD_MPC_CNTL);
>>>>>>> +    tmp &= ~UVD_MPC_CNTL__REPLACEMENT_MODE_MASK;
>>>>>>> +    tmp |= 0x2 << UVD_MPC_CNTL__REPLACEMENT_MODE__SHIFT;
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_MPC_CNTL, tmp);
>>>>>>> +
>>>>>>> +    /* setup UVD_MPC_SET_MUXA0 */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_MPC_SET_MUXA0,
>>>>>>> +        ((0x1 << UVD_MPC_SET_MUXA0__VARA_1__SHIFT) |
>>>>>>> +        (0x2 << UVD_MPC_SET_MUXA0__VARA_2__SHIFT) |
>>>>>>> +        (0x3 << UVD_MPC_SET_MUXA0__VARA_3__SHIFT) |
>>>>>>> +        (0x4 << UVD_MPC_SET_MUXA0__VARA_4__SHIFT)));
>>>>>>> +
>>>>>>> +    /* setup UVD_MPC_SET_MUXB0 */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_MPC_SET_MUXB0,
>>>>>>> +        ((0x1 << UVD_MPC_SET_MUXB0__VARB_1__SHIFT) |
>>>>>>> +        (0x2 << UVD_MPC_SET_MUXB0__VARB_2__SHIFT) |
>>>>>>> +        (0x3 << UVD_MPC_SET_MUXB0__VARB_3__SHIFT) |
>>>>>>> +        (0x4 << UVD_MPC_SET_MUXB0__VARB_4__SHIFT)));
>>>>>>> +
>>>>>>> +    /* setup mmUVD_MPC_SET_MUX */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_MPC_SET_MUX,
>>>>>>> +        ((0x0 << UVD_MPC_SET_MUX__SET_0__SHIFT) |
>>>>>>> +        (0x1 << UVD_MPC_SET_MUX__SET_1__SHIFT) |
>>>>>>> +        (0x2 << UVD_MPC_SET_MUX__SET_2__SHIFT)));
>>>>>>>         vcn_v2_5_mc_resume(adev);
>>>>>>>   -    for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>>>>> -        volatile struct amdgpu_fw_shared *fw_shared =
>>>>>>> adev->vcn.inst[i].fw_shared.cpu_addr;
>>>>>>> -        if (adev->vcn.harvest_config & (1 << i))
>>>>>>> -            continue;
>>>>>>> -        /* VCN global tiling registers */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_GFX8_ADDR_CONFIG,
>>>>>>> -            adev->gfx.config.gb_addr_config);
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_GFX8_ADDR_CONFIG,
>>>>>>> -            adev->gfx.config.gb_addr_config);
>>>>>>> +    volatile struct amdgpu_fw_shared *fw_shared =
>>>>>>> adev->vcn.inst[inst].fw_shared.cpu_addr;
>>>>>>> +    if (adev->vcn.harvest_config & (1 << inst))
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    /* VCN global tiling registers */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_GFX8_ADDR_CONFIG,
>>>>>>> +        adev->gfx.config.gb_addr_config);
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_GFX8_ADDR_CONFIG,
>>>>>>> +        adev->gfx.config.gb_addr_config);
>>>>>>>   -        /* enable LMI MC and UMC channels */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_LMI_CTRL2), 0,
>>>>>>> -            ~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
>>>>>>> +    /* enable LMI MC and UMC channels */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_LMI_CTRL2), 0,
>>>>>>> +        ~UVD_LMI_CTRL2__STALL_ARB_UMC_MASK);
>>>>>>>   -        /* unblock VCPU register access */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_RB_ARB_CTRL), 0,
>>>>>>> -            ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
>>>>>>> +    /* unblock VCPU register access */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_RB_ARB_CTRL), 0,
>>>>>>> +        ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
>>>>>>>   -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL), 0,
>>>>>>> -            ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_VCPU_CNTL), 0,
>>>>>>> +        ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>>   -        for (k = 0; k < 10; ++k) {
>>>>>>> -            uint32_t status;
>>>>>>> -
>>>>>>> -            for (j = 0; j < 100; ++j) {
>>>>>>> -                status = RREG32_SOC15(VCN, i, mmUVD_STATUS);
>>>>>>> -                if (status & 2)
>>>>>>> -                    break;
>>>>>>> -                if (amdgpu_emu_mode == 1)
>>>>>>> -                    msleep(500);
>>>>>>> -                else
>>>>>>> -                    mdelay(10);
>>>>>>> -            }
>>>>>>> -            r = 0;
>>>>>>> +    for (k = 0; k < 10; ++k) {
>>>>>>> +        uint32_t status;
>>>>>>> +
>>>>>>> +        for (j = 0; j < 100; ++j) {
>>>>>>> +            status = RREG32_SOC15(VCN, inst, mmUVD_STATUS);
>>>>>>>               if (status & 2)
>>>>>>>                   break;
>>>>>>> +            if (amdgpu_emu_mode == 1)
>>>>>>> +                msleep(500);
>>>>>>> +            else
>>>>>>> +                mdelay(10);
>>>>>>> +        }
>>>>>>> +        r = 0;
>>>>>>> +        if (status & 2)
>>>>>>> +            break;
>>>>>>>   -            DRM_ERROR("VCN decode not responding, trying to reset
>>>>>>> the VCPU!!!\n");
>>>>>>> -            WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL),
>>>>>>> -                UVD_VCPU_CNTL__BLK_RST_MASK,
>>>>>>> -                ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>> -            mdelay(10);
>>>>>>> -            WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL), 0,
>>>>>>> -                ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>> +        DRM_ERROR("VCN decode not responding, trying to reset the
>>>>>>> VCPU!!!\n");
>>>>>>> +        WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_VCPU_CNTL),
>>>>>>> +            UVD_VCPU_CNTL__BLK_RST_MASK,
>>>>>>> +            ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>> +        mdelay(10);
>>>>>>> +        WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_VCPU_CNTL), 0,
>>>>>>> +            ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>>   -            mdelay(10);
>>>>>>> -            r = -1;
>>>>>>> -        }
>>>>>>> +        mdelay(10);
>>>>>>> +        r = -1;
>>>>>>> +    }
>>>>>>>   -        if (r) {
>>>>>>> -            DRM_ERROR("VCN decode not responding, giving up!!!\n");
>>>>>>> -            return r;
>>>>>>> -        }
>>>>>>> +    if (r) {
>>>>>>> +        DRM_ERROR("VCN decode not responding, giving up!!!\n");
>>>>>>> +        return r;
>>>>>>> +    }
>>>>>>>   -        /* enable master interrupt */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_MASTINT_EN),
>>>>>>> -            UVD_MASTINT_EN__VCPU_EN_MASK,
>>>>>>> -            ~UVD_MASTINT_EN__VCPU_EN_MASK);
>>>>>>> +    /* enable master interrupt */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_MASTINT_EN),
>>>>>>> +        UVD_MASTINT_EN__VCPU_EN_MASK,
>>>>>>> +        ~UVD_MASTINT_EN__VCPU_EN_MASK);
>>>>>>>   -        /* clear the busy bit of VCN_STATUS */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_STATUS), 0,
>>>>>>> -            ~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
>>>>>>> +    /* clear the busy bit of VCN_STATUS */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_STATUS), 0,
>>>>>>> +        ~(2 << UVD_STATUS__VCPU_REPORT__SHIFT));
>>>>>>>   -        WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_VMID, 0);
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_LMI_RBC_RB_VMID, 0);
>>>>>>>   -        ring = &adev->vcn.inst[i].ring_dec;
>>>>>>> -        /* force RBC into idle state */
>>>>>>> -        rb_bufsz = order_base_2(ring->ring_size);
>>>>>>> -        tmp = REG_SET_FIELD(0, UVD_RBC_RB_CNTL, RB_BUFSZ, rb_bufsz);
>>>>>>> -        tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_BLKSZ, 1);
>>>>>>> -        tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_FETCH, 1);
>>>>>>> -        tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_UPDATE, 1);
>>>>>>> -        tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_RPTR_WR_EN, 1);
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RBC_RB_CNTL, tmp);
>>>>>>> +    ring = &adev->vcn.inst[inst].ring_dec;
>>>>>>> +    /* force RBC into idle state */
>>>>>>> +    rb_bufsz = order_base_2(ring->ring_size);
>>>>>>> +    tmp = REG_SET_FIELD(0, UVD_RBC_RB_CNTL, RB_BUFSZ, rb_bufsz);
>>>>>>> +    tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_BLKSZ, 1);
>>>>>>> +    tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_FETCH, 1);
>>>>>>> +    tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_UPDATE, 1);
>>>>>>> +    tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_RPTR_WR_EN, 1);
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RBC_RB_CNTL, tmp);
>>>>>>>   -        fw_shared->multi_queue.decode_queue_mode |=
>>>>>>> FW_QUEUE_RING_RESET;
>>>>>>> -        /* program the RB_BASE for ring buffer */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>>>>>>> -            lower_32_bits(ring->gpu_addr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
>>>>>>> -            upper_32_bits(ring->gpu_addr));
>>>>>>> +    fw_shared->multi_queue.decode_queue_mode |= FW_QUEUE_RING_RESET;
>>>>>>> +    /* program the RB_BASE for ring buffer */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>>>>>>> +        lower_32_bits(ring->gpu_addr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
>>>>>>> +        upper_32_bits(ring->gpu_addr));
>>>>>>>   -        /* Initialize the ring buffer's read and write pointers */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RBC_RB_RPTR, 0);
>>>>>>> +    /* Initialize the ring buffer's read and write pointers */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RBC_RB_RPTR, 0);
>>>>>>>   -        ring->wptr = RREG32_SOC15(VCN, i, mmUVD_RBC_RB_RPTR);
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RBC_RB_WPTR,
>>>>>>> -                lower_32_bits(ring->wptr));
>>>>>>> -        fw_shared->multi_queue.decode_queue_mode &=
>>>>>>> ~FW_QUEUE_RING_RESET;
>>>>>>> +    ring->wptr = RREG32_SOC15(VCN, inst, mmUVD_RBC_RB_RPTR);
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RBC_RB_WPTR,
>>>>>>> +            lower_32_bits(ring->wptr));
>>>>>>> +    fw_shared->multi_queue.decode_queue_mode &= ~FW_QUEUE_RING_RESET;
>>>>>>>   -        fw_shared->multi_queue.encode_generalpurpose_queue_mode |=
>>>>>>> FW_QUEUE_RING_RESET;
>>>>>>> -        ring = &adev->vcn.inst[i].ring_enc[0];
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_RPTR, lower_32_bits(ring->wptr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_WPTR, lower_32_bits(ring->wptr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_BASE_LO, ring->gpu_addr);
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_BASE_HI,
>>>>>>> upper_32_bits(ring->gpu_addr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_SIZE, ring->ring_size / 4);
>>>>>>> -        fw_shared->multi_queue.encode_generalpurpose_queue_mode &=
>>>>>>> ~FW_QUEUE_RING_RESET;
>>>>>>> -
>>>>>>> -        fw_shared->multi_queue.encode_lowlatency_queue_mode |=
>>>>>>> FW_QUEUE_RING_RESET;
>>>>>>> -        ring = &adev->vcn.inst[i].ring_enc[1];
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_RPTR2,
>>>>>>> lower_32_bits(ring->wptr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_WPTR2,
>>>>>>> lower_32_bits(ring->wptr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_BASE_LO2, ring->gpu_addr);
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_BASE_HI2,
>>>>>>> upper_32_bits(ring->gpu_addr));
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_RB_SIZE2, ring->ring_size / 4);
>>>>>>> -        fw_shared->multi_queue.encode_lowlatency_queue_mode &=
>>>>>>> ~FW_QUEUE_RING_RESET;
>>>>>>> -    }
>>>>>>> +    fw_shared->multi_queue.encode_generalpurpose_queue_mode |=
>>>>>>> FW_QUEUE_RING_RESET;
>>>>>>> +    ring = &adev->vcn.inst[inst].ring_enc[0];
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_RPTR, lower_32_bits(ring->wptr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_WPTR, lower_32_bits(ring->wptr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_BASE_LO, ring->gpu_addr);
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_BASE_HI,
>>>>>>> upper_32_bits(ring->gpu_addr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_SIZE, ring->ring_size / 4);
>>>>>>> +    fw_shared->multi_queue.encode_generalpurpose_queue_mode &=
>>>>>>> ~FW_QUEUE_RING_RESET;
>>>>>>> +
>>>>>>> +    fw_shared->multi_queue.encode_lowlatency_queue_mode |=
>>>>>>> FW_QUEUE_RING_RESET;
>>>>>>> +    ring = &adev->vcn.inst[inst].ring_enc[1];
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_RPTR2, lower_32_bits(ring->wptr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_WPTR2, lower_32_bits(ring->wptr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_BASE_LO2, ring->gpu_addr);
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_BASE_HI2,
>>>>>>> upper_32_bits(ring->gpu_addr));
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_RB_SIZE2, ring->ring_size / 4);
>>>>>>> +    fw_shared->multi_queue.encode_lowlatency_queue_mode &=
>>>>>>> ~FW_QUEUE_RING_RESET;
>>>>>>>         return 0;
>>>>>>>   }
>>>>>>> @@ -1424,72 +1416,69 @@ static int vcn_v2_5_stop_dpg_mode(struct
>>>>>>> amdgpu_device *adev, int inst_idx)
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>>   -static int vcn_v2_5_stop(struct amdgpu_device *adev)
>>>>>>> +static int vcn_v2_5_stop(struct amdgpu_device *adev, unsigned int inst)
>>>>>>>   {
>>>>>>>       uint32_t tmp;
>>>>>>> -    int i, r = 0;
>>>>>>> +    int r = 0;
>>>>>>>   -    for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>>>>> -        if (adev->vcn.harvest_config & (1 << i))
>>>>>>> -            continue;
>>>>>>> -        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>>>>>> -            r = vcn_v2_5_stop_dpg_mode(adev, i);
>>>>>>> -            continue;
>>>>>>> -        }
>>>>>>> +    if (adev->vcn.harvest_config & (1 << inst))
>>>>>>> +        goto done;
>>>>>>>   -        /* wait for vcn idle */
>>>>>>> -        r = SOC15_WAIT_ON_RREG(VCN, i, mmUVD_STATUS,
>>>>>>> UVD_STATUS__IDLE, 0x7);
>>>>>>> -        if (r)
>>>>>>> -            return r;
>>>>>>> +    if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>>>>>> +        r = vcn_v2_5_stop_dpg_mode(adev, inst);
>>>>>>> +        goto done;
>>>>>>> +    }
>>>>>>>   -        tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
>>>>>>> -            UVD_LMI_STATUS__READ_CLEAN_MASK |
>>>>>>> -            UVD_LMI_STATUS__WRITE_CLEAN_MASK |
>>>>>>> -            UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
>>>>>>> -        r = SOC15_WAIT_ON_RREG(VCN, i, mmUVD_LMI_STATUS, tmp, tmp);
>>>>>>> -        if (r)
>>>>>>> -            return r;
>>>>>>> +    /* wait for vcn idle */
>>>>>>> +    r = SOC15_WAIT_ON_RREG(VCN, inst, mmUVD_STATUS,
>>>>>>> UVD_STATUS__IDLE, 0x7);
>>>>>>> +    if (r)
>>>>>>> +        return r;
>>>>>>>   -        /* block LMI UMC channel */
>>>>>>> -        tmp = RREG32_SOC15(VCN, i, mmUVD_LMI_CTRL2);
>>>>>>> -        tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_LMI_CTRL2, tmp);
>>>>>>> +    tmp = UVD_LMI_STATUS__VCPU_LMI_WRITE_CLEAN_MASK |
>>>>>>> +        UVD_LMI_STATUS__READ_CLEAN_MASK |
>>>>>>> +        UVD_LMI_STATUS__WRITE_CLEAN_MASK |
>>>>>>> +        UVD_LMI_STATUS__WRITE_CLEAN_RAW_MASK;
>>>>>>> +    r = SOC15_WAIT_ON_RREG(VCN, inst, mmUVD_LMI_STATUS, tmp, tmp);
>>>>>>> +    if (r)
>>>>>>> +        return r;
>>>>>>>   -        tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK|
>>>>>>> -            UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
>>>>>>> -        r = SOC15_WAIT_ON_RREG(VCN, i, mmUVD_LMI_STATUS, tmp, tmp);
>>>>>>> -        if (r)
>>>>>>> -            return r;
>>>>>>> +    /* block LMI UMC channel */
>>>>>>> +    tmp = RREG32_SOC15(VCN, inst, mmUVD_LMI_CTRL2);
>>>>>>> +    tmp |= UVD_LMI_CTRL2__STALL_ARB_UMC_MASK;
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_LMI_CTRL2, tmp);
>>>>>>>   -        /* block VCPU register access */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_RB_ARB_CTRL),
>>>>>>> -            UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
>>>>>>> -            ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
>>>>>>> +    tmp = UVD_LMI_STATUS__UMC_READ_CLEAN_RAW_MASK|
>>>>>>> +        UVD_LMI_STATUS__UMC_WRITE_CLEAN_RAW_MASK;
>>>>>>> +    r = SOC15_WAIT_ON_RREG(VCN, inst, mmUVD_LMI_STATUS, tmp, tmp);
>>>>>>> +    if (r)
>>>>>>> +        return r;
>>>>>>>   -        /* reset VCPU */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL),
>>>>>>> -            UVD_VCPU_CNTL__BLK_RST_MASK,
>>>>>>> -            ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>> +    /* block VCPU register access */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_RB_ARB_CTRL),
>>>>>>> +        UVD_RB_ARB_CTRL__VCPU_DIS_MASK,
>>>>>>> +        ~UVD_RB_ARB_CTRL__VCPU_DIS_MASK);
>>>>>>>   -        /* disable VCPU clock */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_VCPU_CNTL), 0,
>>>>>>> -            ~(UVD_VCPU_CNTL__CLK_EN_MASK));
>>>>>>> +    /* reset VCPU */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_VCPU_CNTL),
>>>>>>> +        UVD_VCPU_CNTL__BLK_RST_MASK,
>>>>>>> +        ~UVD_VCPU_CNTL__BLK_RST_MASK);
>>>>>>>   -        /* clear status */
>>>>>>> -        WREG32_SOC15(VCN, i, mmUVD_STATUS, 0);
>>>>>>> +    /* disable VCPU clock */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_VCPU_CNTL), 0,
>>>>>>> +        ~(UVD_VCPU_CNTL__CLK_EN_MASK));
>>>>>>>   -        vcn_v2_5_enable_clock_gating(adev);
>>>>>>> +    /* clear status */
>>>>>>> +    WREG32_SOC15(VCN, inst, mmUVD_STATUS, 0);
>>>>>>>   -        /* enable register anti-hang mechanism */
>>>>>>> -        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_POWER_STATUS),
>>>>>>> -            UVD_POWER_STATUS__UVD_POWER_STATUS_MASK,
>>>>>>> -            ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
>>>>>>> -    }
>>>>>>> +    vcn_v2_5_enable_clock_gating(adev);
>>>>>>>   -    for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>>>>> -        if (adev->pm.dpm_enabled)
>>>>>>> -            amdgpu_dpm_enable_vcn(adev, false, i);
>>>>>>> -    }
>>>>>>> +    /* enable register anti-hang mechanism */
>>>>>>> +    WREG32_P(SOC15_REG_OFFSET(VCN, inst, mmUVD_POWER_STATUS),
>>>>>>> +        UVD_POWER_STATUS__UVD_POWER_STATUS_MASK,
>>>>>>> +        ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
>>>>>>> +done:
>>>>>>> +    if (adev->pm.dpm_enabled)
>>>>>>> +        amdgpu_dpm_enable_vcn(adev, false, inst);
>>>>>>>         return 0;
>>>>>>>   }
>>>>>>> @@ -1838,9 +1827,9 @@ static int
>>>>>>> vcn_v2_5_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>>>>>>           return 0;
>>>>>>>         if (state == AMD_PG_STATE_GATE)
>>>>>>> -        ret = vcn_v2_5_stop(adev);
>>>>>>> +        ret = vcn_v2_5_stop(adev, inst);
>>>>>>>       else
>>>>>>> -        ret = vcn_v2_5_start(adev);
>>>>>>> +        ret = vcn_v2_5_start(adev, inst);
>>>>>>>         if (!ret)
>>>>>>>           adev->vcn.cur_state[inst] = state;
