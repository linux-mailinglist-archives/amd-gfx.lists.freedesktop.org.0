Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D897D9AE
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2024 20:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F7710E010;
	Fri, 20 Sep 2024 18:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QaWA0dMf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AC810E010
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2024 18:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgSQ0341cWqHtw4/XXoojh1+fMabExbQak9ruEpH/C7q2tevhX7pELsYvfjYh7XnJyPZVsvvw7THBD1+sRCcgoGR6MFYRWZ5gPCyfdn82ovni6MhT2eJ/O4O0gm2iBHXqUVyZd4fTAaFJ8fwT7ea5EmW5gYzxJ6x3ULnlWa2V9zODQXNI+WXke1g3Spf0m+zRC+KVR5nia1thM+P9ActIQV4CEmvmbc4dC5msC3od6YmdQOwpUzJBcbAoXby12JgYcxBfu00OHWan7HGkwaIz7D9T9eQebttb331fKnhiLc2p0Xny9/gRoJouoT0t70fygPwsNlqYXsQIj1v3KgUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufPEu+GoOdnfGzpen0ympxItMhutYnETyLd8GFBiX7g=;
 b=bLI9Cti3MXX0z0JtZ8BRkXx9fR8HrQ9HdlVw9HbnJAqPDXEOAahAhR56k6CfqCwjl/MmZhtlYZg8D3G0ZOpCh8HBMp4egOarKs7d4Jw5XvRXSPmtvrAWvIJSy5APp3/g+5mW6Tya8A7AS8DfIAWYgLMsXN8F57QgFuIkBbfTmMSs2O7AG0gzIigCp8WJgLorOl5JJIlQSo/szD27sJFqvk1DvYogbTiWtfjn1qhitEjW/Yn5LL9edmFhI5YpNuexwlaP/J6DpUKIEus7QSRmRfjTeBYeUT7lAr+BFsVxh0iG6iU6Br+sASlOy9pQhsgmtzmbNtOgZ/IcMJi73GOB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufPEu+GoOdnfGzpen0ympxItMhutYnETyLd8GFBiX7g=;
 b=QaWA0dMfkM6WlUlqfkOdRRH24e4GFIUVXAKVZ2zLZuAnFwzqn6Rm3vt1ztxiJE9C4u7CPWjBQrkfrPEP6Zlt7W4nJxyv+SFj14nXElBVsh6hLkL2uo4paTosYUZskCdwnmggJAXq0NwrASnX5keWjn+mT0cDZEd6m3UAW0dOEqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 18:58:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Fri, 20 Sep 2024
 18:58:39 +0000
Message-ID: <ae062c07-dc09-4975-ad31-2f9d9ea435f9@amd.com>
Date: Fri, 20 Sep 2024 20:58:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: drivers/gpu/drm/amd/amdgpu: Fix null pointer
 deference in amdkfd_fence_get_timeline_name
To: Dipendra Khadka <kdipendra88@gmail.com>
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240920090959.30755-1-kdipendra88@gmail.com>
 <ac13994c-b77b-48f2-b2cf-20299f02c2e8@amd.com>
 <CAEKBCKMg0c5AW7YggDMR+Kg7OGq3dXApLK-=RTR71H0KHO73+g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAEKBCKMg0c5AW7YggDMR+Kg7OGq3dXApLK-=RTR71H0KHO73+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b38320-9a29-440b-47d8-08dcd9a63cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SElLaU9KL0FMYzE5V2F4NHE2bU1pK0d1TG8rM241dVhBV1B5M1N6TTlxWkNo?=
 =?utf-8?B?enE1RmNXd29kT2JPVit6OS80RVgwUEtyNkVlRnFXNHlGM0E0OGV6eFhRYi9U?=
 =?utf-8?B?VVBobjNyMVN3eEp4U3NIVzNKQm5pcC8xTUVzLzFUbUVxN2J0eUw5dm9nV2xs?=
 =?utf-8?B?MjVqelBsSDNZVlJZWnFGL3l3K0RDenlndjlxZDFrQkt6M0FuUmtBOGJZdlRj?=
 =?utf-8?B?K3VkVFFnakxvV0JWclNIbFU5L3VvSk5YVFc3cGNaM1RpRVhNM3phZWp0ZmJj?=
 =?utf-8?B?KzFTeUVtVTl1b1ZUaStpL3ByM0lndTZRV1A1Qk1YVTBCai9VTkpMRUpVN2Y1?=
 =?utf-8?B?MHAvUmgyRnBsNUZ1NHIwWFo4ZG9UQkNOZVA1SU5PUzQ0L0h1OTN5V2ZsbU5Y?=
 =?utf-8?B?RzJxSFQ5SlFhdGRoMllIT1NxOVdNS1k5c3JYWHkvMy80TUJ5RUd5aGI2NnRP?=
 =?utf-8?B?bHRocCt0VFRUeHg1QUtNWHB4K2hFQWtwcmFIQ29vZTBqMllGdU5NZ3Z4K3lT?=
 =?utf-8?B?YUxvYWtBSUNnZlp1c21nSVFXMll0cU9qZ1ZQRWd0MFoyRnVmY2V6K0hEaEFF?=
 =?utf-8?B?d2I2aDFkdyt1ck5NZTZPdU5lVml0OTh3engxWktrUENDR3huVEtvSytnYm9y?=
 =?utf-8?B?a2w5eUxTRWNpR3E2TldoQlh6OGJRWkJ2aVRVcytiTkFNZ0xQQlRnU2dFbDJH?=
 =?utf-8?B?ZCtzbExnREFWb2owaU1oSW1laGR3RWxnc3k5NHk1V1JubkFaUTdQNFlTNnl6?=
 =?utf-8?B?ZmNqZWJRYSsyM1ZpRUZDN2dPb0xyOS9JUU1IU0IraXEwRlBnbitMNmdUUERz?=
 =?utf-8?B?eHpIRXY2cDd3U2R5c09JcUVhSVRkYmpEekxUNmhoallpNW9sZ0I0bzRJK1dJ?=
 =?utf-8?B?N0tUWVE0TE9CSlByVU4vNEpLNG9BK3EzTkxYUXBMc0lGeWNJMFZjWkJMMUVw?=
 =?utf-8?B?dTZSU3FiOEVzekgvem5rL3FOYWI0QVRZMXZlSVdCY0Y4dzRTK1h2OEtEZUhD?=
 =?utf-8?B?cWoyc1RUSmx1bUJFMUxNaExLZlFJTWpoMjdhZUV6c01EMjMweTA4M1NVSEU5?=
 =?utf-8?B?Wnh2S0piSmtXM2JNU2pNc1RLeUlhRFhFOWJ6N3VmVWlwUk8xK2R0ak5oZG9Q?=
 =?utf-8?B?aTFEM1VlRldyQklhRzlYYU80d29BcXdQcmpSR2t6VGF0Wm9QVld0VmE1QVc5?=
 =?utf-8?B?emFlamtTLzJESHpOZEw1REZsWnhMVUh0a1N1anVvS0VsOS9WWjVyQUZZUDVQ?=
 =?utf-8?B?ZDV4VUFLSStzL1hIVDRFcTEyRzI0Z3A2QUxUSEdxenJHQ1VRWmlWVms4VE9k?=
 =?utf-8?B?QXJaUFNEV1RTVlhCakxkYk1TTE5Mdm1GVEtCYkI0YVdFRUp3SnhFbnZoWFNq?=
 =?utf-8?B?NHFFRGZVRVJOeGtyN2E4UFc4YU5QcHFYSHZNWU9VN1VIcUNpbm1XUUNJUm15?=
 =?utf-8?B?bGpMOVNxOHBGRnJObm9BeXVETzg0MVJCYmwzNmRkVWRDdkRxWjJTaWFnQ0R0?=
 =?utf-8?B?U2lpWUl2WEs2RkVpOFoyOXNTTXlpeW1vNnJZaVpUaDNTMnlUUmR4eVpXTjZ1?=
 =?utf-8?B?WmxIbXAxeHg5RnVsWHhsaFJveWtmYlRyLy96YlhPcTRmbDBlWGpJdS9uWHBs?=
 =?utf-8?B?aTZ2UVlIVVJQTmtyRlNtSUdNWE5kQmpaRG1tbWgwamkxK05ZVUppZjZLTjV6?=
 =?utf-8?B?bUVoelRrQUdYbVg3Q1AwQWZFTjVINDZ4TnRqa2liV3RSQUJpMkdBWitQWDA5?=
 =?utf-8?B?VnhiOHBGMjVXcFlFRzltaGpiaVNZeGcxN0lFdFYvSzcwRDdzdkNmSWNEbThJ?=
 =?utf-8?B?Z1FkVnVKRkZoN2hPUlRKZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1c2a09WQTZUd0VvOTFMYnRPUHR2NmFJWWJyRTBXMWpMRmp4bjF4cTByWkRm?=
 =?utf-8?B?Z2xyN1NtcTBSbExjQXFReXRzRklIbWhqbEM4MXl4cWxZQTlndnVSZ3BMNHhy?=
 =?utf-8?B?eHpIRXJyRFBVV21IZ0ZpVGliNG44NUQ3dDJZWitMVWZpZlhYeDIwa0RhS3ZG?=
 =?utf-8?B?NzhwZlRuNUNzRGFJemsxUGIwd3E4dWRDekFsSWRDbnVsdjZxanR3RGNPNUZm?=
 =?utf-8?B?cThuUUpYK3QxK3RkUHVTS2JVaFdtbG1oTE1PbkhwUDk2M0ozMU5ZUjR5c0hm?=
 =?utf-8?B?QVVVVG4rTkpaK1djK013eStEbTd4MzUvTU8waWV1WVRRYVJSK1FiNW9uVnBo?=
 =?utf-8?B?MnQ5VUZhR0l6YUQrYWhERnkxOFBReDNSV01GZ29XbHkrbjA3dzZydnBBdlBp?=
 =?utf-8?B?SG1UVlpmVXZ0UUJ3TENEellCWVhaNXorcUMwUnh1aFdGejhMVGpBbEliWWNu?=
 =?utf-8?B?ZE5odU5ReWdXYjFRd2xubThXQkhwZUV6a1VaUWYycjdCRmZxM3NYMzJaL3lh?=
 =?utf-8?B?VGVxQUdFeTZuS2J0RnBqdmpNcUtwQWZicUEyNzZMcC9CTFBIVlZ2OEpNQXBa?=
 =?utf-8?B?ZmRhQVJxalFDa0laTGRiMi9RaVMzTzJmOWZJVVM5RGNFN0wxNUZjdnBYNDZ5?=
 =?utf-8?B?N2dJbnlUMWpRT1FsSlZwOTlHYTJqbE1HUkZ0ZjJrS05QN0l2OVhDUXJldFhq?=
 =?utf-8?B?aHllRitmUXJJSVBDbVVOdk1wOHJ2REgrUGd3bEtnaVN2SXdJOE92T0h5RjlJ?=
 =?utf-8?B?NWxWYXFaZmp1L0wvMjZpU3hxMmNPZGJnbEhtQ3FoTVhTQWoyOTNYUGdPbThr?=
 =?utf-8?B?Y3dZK3kxN2dWeTJhanRIRVJ6YzlZSmlWeG5Cb0Z5aVdWR0RKM1Y4Y0E0K1VN?=
 =?utf-8?B?TkNQQlFaRzBGMkZETGxnSUxXTGVWVXdDakpZNHR5NFdJaExxUlQvRmUyTVVh?=
 =?utf-8?B?QTBIcUdTTTVlRWNVbWZhZ3d4WG9JcmlDZkpEdkVvNFBOc0doeWY1VVpMeVI2?=
 =?utf-8?B?aFIvN21mVElGRWJ5TCtvQTVuVHlESEdHRk5kVXVCQ2JsU3UyWWJWdTcra3Ar?=
 =?utf-8?B?NUkxVmpGZS9wNHlhdXdac0FoY29HWnQ4bnBTeWtZTDNhQ1BRM2xBaDNZM216?=
 =?utf-8?B?eEs1cThJZ25DYThsQ2RLQjg1VzlaUEd1MUQzcEhwdnJuUzA0Nm56UkVpckQv?=
 =?utf-8?B?ZFpJMm4rSFRtYjNWbXhDQ1J2VHV3N0x2RFpKTG1yKzZUOCtnUHduKzJxcTF2?=
 =?utf-8?B?RFNGSFlCUExEdkVqaE9vWHV0NndEdThsRHkyL1dlNlY4a1psVTk5cE5XWUE3?=
 =?utf-8?B?NFJXZ29BbFQvWlFBeFVpRVZNN0RSTU4wNE9MWit5c0kxTUQxOHlhdDdJQllD?=
 =?utf-8?B?T0VNVitDdHREUHlDWHdUSzk4R3FjVFUrQytRd1JVK1pVdllJZlRzM1hJZnNL?=
 =?utf-8?B?UEw4VE92REVwOVJtU3Y2cHpoY29yT0k4WTFrYytoRGNoU29yY3FIRTVBajZk?=
 =?utf-8?B?TkM3b2NpeTdGM0ZHS09vYWtMZklUM0hPaG10K2thRjJOMUZUTVpsSndoeU9N?=
 =?utf-8?B?WmFyamN4Z2FNOUpIVnlONlMyaWpvL0xpR3pzQVZpR2kxSGdTQmU2a2RzdCtI?=
 =?utf-8?B?S3R3MUNyYTNaZnA0U3pvSFAvUVBpZ0NHWlhrcDZPeVRVUWJNeUp3cU9Uc1NH?=
 =?utf-8?B?RHh4NXlMUEJXazJIWjU4MThJOUZaZVBDV2VGS2d2aGRTQ21GQmkxTXFNRHJs?=
 =?utf-8?B?RGZtNVkxeGNJNUFXWU9NcHlwM3o0NXF1UTY0SHd3NUpFQXNqMVBHMFVkZXVE?=
 =?utf-8?B?czg3YmFCaGxZWnBObGM4aWRRcVA2WmRqV0tjNFZ1bE5pYlpIZDRHbkRZMDQr?=
 =?utf-8?B?RTZuVUdMR3d6NE1PVzRMVjdPZ3YxQjNWUGJqU3hLeldWUFdJWnNEeFNuYjF6?=
 =?utf-8?B?WnlXdW05cEx1NkxFc2FXZnZNUDhBNWEyd0hTeGhsbG01S0dBM2VEMitSU1R3?=
 =?utf-8?B?RlhHZkFXSkV2WkgxVFFPS3VQWjlsRDBKWHFYY1ZiSFlnSFdyaUJ5SVJHNis1?=
 =?utf-8?B?UmdiSkdPbldQN0RNak05MGw1S1U5WS9rVXZ2VVoxN2d4a3RibENmWkNCTTk3?=
 =?utf-8?Q?5ciM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b38320-9a29-440b-47d8-08dcd9a63cdc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 18:58:39.2230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7E2vIg3sllhAuA4XBLUiHvcAu7S3XynmKX4H08AwUD+fNY96Mp41lSdW63Gid9+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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

Am 20.09.24 um 18:31 schrieb Dipendra Khadka:
> On Fri, 20 Sept 2024 at 16:01, Christian König <christian.koenig@amd.com> wrote:
>> Am 20.09.24 um 11:09 schrieb Dipendra Khadka:
>>> '''
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:108:9: error: Null pointer dereference: fence [nullPointer]
>>>    return fence->timeline_name;
>>>           ^
>>> '''
>>>
>>> The method to_amdgpu_amdkfd_fence can return NULL incase of empty f
>>> or f->ops != &amdkfd_fence_ops.Hence, check has been added .
>>> If fence is null , then null is returned.
>> Well NAK, completely nonsense. Calling the function with a NULL fence is
>> illegal.
> Thanks for enlightening me .

Well sorry to be so direct, but what the heck did you tried to do here?

I mean that is broken on so many different levels that I can't 
understand why somebody is suggesting something like that.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> index 1ef758ac5076..2313babcc944 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> @@ -105,6 +105,9 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
>>>    {
>>>        struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>>>
>>> +     if (!fence)
>>> +             return NULL;
>>> +
>>>        return fence->timeline_name;
>>>    }
>>>
> Regards,
> Dipendra Khadka

