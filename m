Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8381591725
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Aug 2022 00:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F329B6EB;
	Fri, 12 Aug 2022 22:05:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF2B90D6C
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Aug 2022 22:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mktyzRr8RlJUoDWxFbTeYTqWo7rpnyBOrv+T/4hcVwu4CNbNVDYjy4sByFWvqtgSTpnbVDIlGGoTBRpUkf1i8k2vQ1oqCtgyf/+VvaqtLCQUizG/PM6j0CzioMcelx8lhDfkgD+5KYNjjR2Z7zG8GYVJrVJlG/9yiD0GYmUoQr5iqHFAoVLORoprw582oMPfIGzmvyixBg/iQ/aahOJXZ73QimqdkIsQuI0/QX+KpECBMR9WM6jKas0PDgupW0krNpiUphZ17ZhUqZLm5t0b1h6YMLmmR4YZtT72oU/wB0FAKxf5fmff6C7tmFGjXAY50Z6YTS6RhbWrRUiGjZJNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWz8H+zExvGVJdAxg7QX454zpqS72Q9XM/zHdLA9DkA=;
 b=fWOnohrpy6+3Xhl1mKj1Fo6RXXQQY74SlJFa6JEJSK2RSIlIh99DDJLcUA63Y0+CzYpFrZ/gP+L+82E9xovqCH3sCjmyvnf7o7detPYrnDc53ACBlFxA/SQ8wGcR2YPd8fDxRQPczgatX4i8C4I/P3VsNMQ/w6r9xNdi1V9RuTCXv/8hfHl9jQz0a5L+dFspkJ/bK8/h+xzSmtRp7fOhs/KkUmVJyxvxYw58gR/bD2ADL3j4KYUNZyT4LJ9IcpuV+GtAPKHmhOvXATlRppdsgdjIbbO04BS5urFtPMOF9qscCtB7UqGs+y0XYQtVRziuivmxGAgrXekkdFlzrkPs4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWz8H+zExvGVJdAxg7QX454zpqS72Q9XM/zHdLA9DkA=;
 b=Y6ggEjB0QKkUhk6M+2F682L/t2+LcCAuVMx5ZRRxFWlgL1sn5up+lqJPdceC8Pey2Ax33Oyxxkg2C90bqI+ytJis+zS+UgXi4XO/fGS2LCUBxPEDRk+hDZ0LiUCfbgzLi/EUrwWFIDVgc0bXvHjUyCr+eUBRIMvetJqPz70KDn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN7PR12MB2642.namprd12.prod.outlook.com (2603:10b6:408:26::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 22:05:14 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 22:05:14 +0000
Message-ID: <ba916b22-8b3b-81f6-4f6a-812798ae4fc9@amd.com>
Date: Fri, 12 Aug 2022 18:05:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: fix reset domain xgmi hive info reference leak
Content-Language: en-US
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220811134217.138701-1-jonathan.kim@amd.com>
 <78c8501b-fbda-43a9-764b-2176eeff1243@amd.com>
 <DM6PR12MB3163B08025CE90BD591C08BB85649@DM6PR12MB3163.namprd12.prod.outlook.com>
 <cfb0bf9e-27b9-940c-ec4d-25adcdabf5e9@amd.com>
 <DM6PR12MB31638E835F7971983EAECF3485679@DM6PR12MB3163.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <DM6PR12MB31638E835F7971983EAECF3485679@DM6PR12MB3163.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::21) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e274ca35-175c-4dbe-fc20-08da7caebbc6
X-MS-TrafficTypeDiagnostic: BN7PR12MB2642:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8xxtl++Xc7GNPjCXkVi0eU93yrdlll6AnGn4SKjZKUjiZgcWz2bASX9JIpu/fbXKKqWvD/BeJIBdftmO5giCgPT16cmNXywqNODS4jivuBQ6fSG1arJmZc87Lkdvvww0tNEPA4AGx0K6hMZeDEkXGLwR1U63e4iXtCvZ7f1XPlV8hgYyXe7Q8iSgunqbnHNG43ESJL2XioxDukI1Gt4bAqP33pgJMC0Kn3L/OfWMAnoacufw2tKZ/ncgPTglZzXLWdcBYJyfbCsz2gxF2Aya0nskgjSp+rZmVDrd0HJgTKRloOBw9l27TvBSQ77KthgHI2ISUdRR/AUsSRqyDRLYW9vcZZl7yJunMvaYknGf0PDbNX1adxoTVVgqg59ofbv07Jm8iOeneY5lfD9jVDhT5MH6TJrcoK7qgfLzdvl8pnyLzVgHIuC3RAypGtSyfn+1lFLkw0oe4Hxi1bbS5uKeRblZADgMbTQCK1ZNguV7CgYa+7N4qI0FlKuFKssteew4gYswaxPSyx24EHE8nu0XSgdG0pfEBn0xQwHIgU06+dX1oYQWY2YoHUdbgTwsW3wRF8Rk60048Qx4RjEUxvQBHHYAykspfVicRDYZHCfcVuBjfu6HX7HJIRMxgbczKpEU8OYE0WAHmAyAEIDpPIZMfO09C8InxYqZhm9PnmiX+vO1hyiKOHLNJR3ugdKsD1hvRoXEjUzB+6bIARq55FVMeXFNYqkuhtFSXP6tAum0xHr6qXdaNtn0xy56lzyeqUGDDSq8Zfunwp9/3DmMHjQxc8bTcDCF5VZ4mi/lRerjleMEyMDcsf2r9t3wwj24AesMkpHtKTY8KVO/9mS7ipitoAe8OGJTbg+I+fmr+L5vMHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(186003)(8936002)(2616005)(83380400001)(31696002)(86362001)(38100700002)(30864003)(36756003)(2906002)(44832011)(5660300002)(66556008)(6486002)(478600001)(966005)(6512007)(6506007)(53546011)(41300700001)(31686004)(8676002)(66476007)(66946007)(316002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9nbHlMU1ZrWVRaZFpwbmFDeEFyaENUdDg4SVliQjdpeDdGV3JtSndzR3pj?=
 =?utf-8?B?MVh4SVc0N1JHcDZDeVhOTjhzMGEzU3JSZ2dab1VScXFQWFZDcitJUDVGU3Ir?=
 =?utf-8?B?N0tYbTUxUmZTQjRJOHZmcEN1SjRta2JEYVFWRk1zYktySFY3SFM1QzY3dzAz?=
 =?utf-8?B?WjJFQTZSWnlDbTRhRjMxdm5VdVZQdDJvb2RYVUJuNkdFeHoybDdVZUxocGpK?=
 =?utf-8?B?VFBPQzRIb0VoWTZYUFl2TEh0N283UGdNdFNXWktJb1ZKRHJVa2pyNmhzeTFP?=
 =?utf-8?B?djdFRFMwY3V1akZSZEZ6c1RoVlhHY2dJRWd2VmxQUjg5a2JkaGtacTJtMXlu?=
 =?utf-8?B?VnhHelA0SUtwMWdLOUl1VWl6OEdDSGpFNU41aUwwRmVUeURvOXRaa3lBQVFH?=
 =?utf-8?B?N3V4eXFjQ2N2VUN5ck53R2Fza3dCUVVDSUUxU2UxY2pZcjBuS2VqbVZSejdl?=
 =?utf-8?B?THZSaUI1bm9jTWdNYm1hRWwwbkN0Mmh6T0JwUytGVWhNbE8yL25CTmRGNEF5?=
 =?utf-8?B?TFVFcE96QWlncnh4L0FuSnA2c3B1QVM3ODFxY3ArVjhQWlJYdE16Y0lKb0Jh?=
 =?utf-8?B?RGJmRXRSSFlGM3l0VXI3bDRoU3RHQTQ5d0tmK28xcEY0VEszellnMnkwckFq?=
 =?utf-8?B?NTZPTlVKTkJUZ2xyWHhZZU1JYk90WG9td3hUcXgwRGVSdUk5V1VXb3d3b0R3?=
 =?utf-8?B?TW1ObnRYMm92d2luenlRSmdxb1dCdG5MemdidHoyWitJamhBREJXOVF5Sjlv?=
 =?utf-8?B?eFEzdUtUSjBHbDB5VWQ4Tko3UEd3cURqS2dmb09rVWJBVjNpSUxQRU51eEtW?=
 =?utf-8?B?MVhKMm15L0NmUVY0MUdJQUZ1MlVpSHArMlc2NnNLeFQxMU5lVzl6OW5mWlVZ?=
 =?utf-8?B?eVdSM1gzcjhPQ2dqVm1OZmZVaEcwSXJoeS9EN1l2eEJYREdVN3FKTzhuNVZo?=
 =?utf-8?B?V21oMDFmb3huSXR0TlNZd25nUU5SSEhpbE5qanJ3NVRrVWZwdGM3ZGVSbG8v?=
 =?utf-8?B?M3hYcC9ZZ054NXlVcWpVNDdDcGJjL2Y3Nm9sWENaWmEvRTNadUdEaldNa212?=
 =?utf-8?B?b2JDR0ZqK1F5WmVhekNMcHA2NER5cGJ1bTZLYUp1Q2x1QnV0VWc4YVJMYUhn?=
 =?utf-8?B?RTBVN1NrN3pqZS83c3VNd1IrbytpdjUvUngyWFNUeC81MElUNkZiV1dXTGhL?=
 =?utf-8?B?WVh6cFBvOTRIMEd2bm5odEVsQy8zUlFoRTFFNjNjRGExRjZ0SUkvT3JNRWpr?=
 =?utf-8?B?b2VuUlY2OWMxTFJBblhVMDhUcjdaR1hiTlB1UEtZMlNBeGtnWEtWN1ZuWUx3?=
 =?utf-8?B?UDZOcXVMSFpxanJnWkh5VnhXakg5WDY4SHRzKzdPRkcrSUtyK0doL2Vpc3JX?=
 =?utf-8?B?OVRFaEZ1eTRPTEJYQzBXQng0MFBQN3FpV2Z5eEZvMHhHOW5hU1JNSk56QTA2?=
 =?utf-8?B?RXMxMnZKS0EvbWZ5TnZOTFFVb1J6dURnek9GK1U0cGxYeEhLaHpCVUUzRkhC?=
 =?utf-8?B?dVI1aVNGUS90WnRaejZJWWxuaXZMOW9yRUNGQzlFL0FNY3dLVk0vU3F3Wmdm?=
 =?utf-8?B?YUthUWZwdXh2MGFsdHByV1Z5cTNlajdVRThTVE45aTFKQyt5TStBa0d4TjJs?=
 =?utf-8?B?RXB1YzJWVzZkazF0NkEvWUYwSUlPSzlQNkxWRDFqbWhhTkRPdGdQQTd4dHk4?=
 =?utf-8?B?azZkcmRmUXJCYTVqcTlKaTFzOVhHRndtSEk4dldkZE9pSG1TSGc5RlBLeW1w?=
 =?utf-8?B?RmRSVS9YWldtV0pPaS9NTTQxczAvMlVOWS80NThzVzR5WDlVdDBrcHh1OVJO?=
 =?utf-8?B?WTlTemV4M3I1WnpPUkdZYUdVelJyZWJUSFpOSTJQZDk2L1JITW5UUno2cFY4?=
 =?utf-8?B?a2hZTVZPSWlSRzl3aUFTWWZjbmZxa1RVWTdFdVhJRm1DakZOM0kySW9MTTA5?=
 =?utf-8?B?QXo5OG5Ud1dWSFpJQ3kwSHZEWEpoWmZDdHBrdGp4Y1RHWFRRaEhKc3JWQXc2?=
 =?utf-8?B?ZGx6SHNuZjVoVmtYNG9lNG54N0R2aldVbEtybHg0NFFQUGJQMW1CblE0VnV4?=
 =?utf-8?B?cUFBNzA2Zkg4eVYvY1ZjNlk5dzM4d2lzd1k4clRtZGJxSXRyYW5mTHNPMUJR?=
 =?utf-8?B?SFpzMlpDV3FyckYrSjU5ekRIREUzZlg2RlExckhGZ3VrcVJPeGx1TnVpd2h1?=
 =?utf-8?Q?Ds/B6kwijxK/2VGKEGGl55T3nc3KPUWgotTL9iS7s2nb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e274ca35-175c-4dbe-fc20-08da7caebbc6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 22:05:14.4911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SqfP1ko1EFXgxNJydcFjKwW/3/XvvPmrcEVEOvwbLmG3s6zxc2CcnfmF5hsmRWb7EkEfHtUBlr+DwWVDxt4MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2642
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


On 2022-08-12 14:38, Kim, Jonathan wrote:
> [Public]
>
> Hi Andrey,
>
> Here's the load/unload stack trace.  This is a 2 GPU xGMI system.  I put dbg_xgmi_hive_get/put refcount print post kobj get/put.
> It's stuck at 2 on unload.  If it's an 8 GPU system, it's stuck at 8.
>
> e.g. of sysfs leak after driver unload:
> atitest@atitest:/sys/devices/pci0000:80/0000:80:02.0/0000:81:00.0/0000:82:00.0/0000:83:00.0$ ls xgmi_hive_info/
> xgmi_hive_id
>
> Thanks,
>
> Jon


I see the leak, but how is it related to amdgpu_reset_domain ? How you 
think that he causing this ?

Andrey


>
>
> Driver load (get ref happens on both device add to hive and init per device):
> [   61.975900] amdkcl: loading out-of-tree module taints kernel.
> [   61.975973] amdkcl: module verification failed: signature and/or required key missing - tainting kernel
> [   62.065546] amdkcl: Warning: fail to get symbol cancel_work, replace it with kcl stub
> [   62.081920] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
> [   62.491119] [drm] amdgpu kernel modesetting enabled.
> [   62.491122] [drm] amdgpu version: 5.18.2
> [   62.491124] [drm] OS DRM version: 5.15.0
> [   62.491337] amdgpu: CRAT table not found
> [   62.491341] amdgpu: Virtual CRAT table created for CPU
> [   62.491360] amdgpu: Topology: Add CPU node
> [   62.603556] amdgpu: PeerDirect support was initialized successfully
> [   62.603847] amdgpu 0000:83:00.0: enabling device (0100 -> 0102)
> [   62.603987] [drm] initializing kernel modesetting (VEGA20 0x1002:0x66A1 0x1002:0x0834 0x00).
> [   62.604023] [drm] register mmio base: 0xFBD00000
> [   62.604026] [drm] register mmio size: 524288
> [   62.604171] [drm] add ip block number 0 <soc15_common>
> [   62.604175] [drm] add ip block number 1 <gmc_v9_0>
> [   62.604177] [drm] add ip block number 2 <vega20_ih>
> [   62.604180] [drm] add ip block number 3 <psp>
> [   62.604182] [drm] add ip block number 4 <powerplay>
> [   62.604185] [drm] add ip block number 5 <dm>
> [   62.604187] [drm] add ip block number 6 <gfx_v9_0>
> [   62.604190] [drm] add ip block number 7 <sdma_v4_0>
> [   62.604192] [drm] add ip block number 8 <uvd_v7_0>
> [   62.604194] [drm] add ip block number 9 <vce_v4_0>
> [   62.641771] amdgpu 0000:83:00.0: amdgpu: Fetched VBIOS from ROM BAR
> [   62.641777] amdgpu: ATOM BIOS: 113-D1630200-112
> [   62.713418] [drm] UVD(0) is enabled in VM mode
> [   62.713423] [drm] UVD(1) is enabled in VM mode
> [   62.713426] [drm] UVD(0) ENC is enabled in VM mode
> [   62.713428] [drm] UVD(1) ENC is enabled in VM mode
> [   62.713430] [drm] VCE enabled in VM mode
> [   62.713433] amdgpu 0000:83:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
> [   62.713472] [drm] GPU posting now...
> [   62.713993] amdgpu 0000:83:00.0: amdgpu: MEM ECC is active.
> [   62.713995] amdgpu 0000:83:00.0: amdgpu: SRAM ECC is active.
> [   62.714006] amdgpu 0000:83:00.0: amdgpu: RAS INFO: ras initialized successfully, hardware ability[7fff] ras_mask[7fff]
> [   62.714018] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [   62.714026] amdgpu 0000:83:00.0: amdgpu: VRAM: 32752M 0x0000008000000000 - 0x00000087FEFFFFFF (32752M used)
> [   62.714029] amdgpu 0000:83:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> [   62.714032] amdgpu 0000:83:00.0: amdgpu: AGP: 267845632M 0x0000009000000000 - 0x0000FFFFFFFFFFFF
> [   62.714043] [drm] Detected VRAM RAM=32752M, BAR=32768M
> [   62.714044] [drm] RAM width 4096bits HBM
> [   62.714050] debugfs: Directory 'ttm' with parent '/' already present!
> [   62.714146] [drm] amdgpu: 32752M of VRAM memory ready
> [   62.714149] [drm] amdgpu: 40203M of GTT memory ready.
> [   62.714170] [drm] GART: num cpu pages 131072, num gpu pages 131072
> [   62.714266] [drm] PCIE GART of 512M enabled.
> [   62.714267] [drm] PTB located at 0x0000008000000000
> [   62.731067] amdgpu 0000:83:00.0: amdgpu: PSP runtime database doesn't exist
> [   62.731075] amdgpu 0000:83:00.0: amdgpu: PSP runtime database doesn't exist
> [   62.731449] amdgpu: [powerplay] hwmgr_sw_init smu backed is vega20_smu
> [   62.743177] [drm] Found UVD firmware ENC: 1.2 DEC: .43 Family ID: 19
> [   62.743244] [drm] PSP loading UVD firmware
> [   62.744525] [drm] Found VCE firmware Version: 57.6 Binary ID: 4
> [   62.744689] [drm] PSP loading VCE firmware
> [   62.896804] [drm] reserve 0x400000 from 0x87fec00000 for PSP TMR
> [   62.979421] amdgpu 0000:83:00.0: amdgpu: HDCP: optional hdcp ta ucode is not available
> [   62.979427] amdgpu 0000:83:00.0: amdgpu: DTM: optional dtm ta ucode is not available
> [   62.979430] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is not available
> [   62.979432] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
> [   62.982386] [drm] Display Core initialized with v3.2.196!
> [   62.984514] [drm] kiq ring mec 2 pipe 1 q 0
> [   63.026846] [drm] UVD and UVD ENC initialized successfully.
> [   63.225760] [drm] VCE initialized successfully.
> [   63.244442] amdgpu: [dbg_xgmi_hive_get] ref_count 2
> [   63.244448] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   63.244454] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   63.244457] Workqueue: events work_for_cpu_fn
> [   63.244471] Call Trace:
> [   63.244474]  <TASK>
> [   63.244479]  dump_stack_lvl+0x4a/0x63
> [   63.244493]  dump_stack+0x10/0x16
> [   63.244501]  amdgpu_get_xgmi_hive+0x217/0x2a0 [amdgpu]
> [   63.245047]  amdgpu_xgmi_add_device+0xcc/0x450 [amdgpu]
> [   63.245463]  ? amdgpu_ras_recovery_init+0x13d/0x2e0 [amdgpu]
> [   63.245879]  ? vce_v4_0_hw_init.cold+0xc/0x13 [amdgpu]
> [   63.246466]  amdgpu_device_init.cold+0x15bd/0x1fe3 [amdgpu]
> [   63.247055]  ? pci_bus_read_config_word+0x4a/0x70
> [   63.247064]  ? do_pci_enable_device+0xdb/0x110
> [   63.247070]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   63.247463]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   63.247868]  local_pci_probe+0x4b/0x90
> [   63.247876]  work_for_cpu_fn+0x1a/0x30
> [   63.247881]  process_one_work+0x22b/0x3d0
> [   63.247887]  worker_thread+0x21d/0x3f0
> [   63.247893]  ? process_one_work+0x3d0/0x3d0
> [   63.247898]  kthread+0x12a/0x150
> [   63.247905]  ? set_kthread_struct+0x50/0x50
> [   63.247910]  ret_from_fork+0x22/0x30
> [   63.247922]  </TASK>
> [   63.248563] amdgpu 0000:83:00.0: amdgpu: XGMI: Add node 0, hive 0x25bbae7e3fd04cf4.
> [   63.248569] amdgpu: [dbg_xgmi_hive_get] ref_count 3
> [   63.248572] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   63.248578] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   63.248580] Workqueue: events work_for_cpu_fn
> [   63.248587] Call Trace:
> [   63.248588]  <TASK>
> [   63.248590]  dump_stack_lvl+0x4a/0x63
> [   63.248598]  dump_stack+0x10/0x16
> [   63.248604]  amdgpu_get_xgmi_hive+0x285/0x2a0 [amdgpu]
> [   63.249033]  amdgpu_device_init.cold+0x15cd/0x1fe3 [amdgpu]
> [   63.249621]  ? pci_bus_read_config_word+0x4a/0x70
> [   63.249627]  ? do_pci_enable_device+0xdb/0x110
> [   63.249632]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   63.250022]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   63.250410]  local_pci_probe+0x4b/0x90
> [   63.250416]  work_for_cpu_fn+0x1a/0x30
> [   63.250421]  process_one_work+0x22b/0x3d0
> [   63.250428]  worker_thread+0x21d/0x3f0
> [   63.250434]  ? process_one_work+0x3d0/0x3d0
> [   63.250440]  kthread+0x12a/0x150
> [   63.250445]  ? set_kthread_struct+0x50/0x50
> [   63.250450]  ret_from_fork+0x22/0x30
> [   63.250458]  </TASK>
> [   63.268869] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [   63.269180] amdgpu: sdma_bitmap: ffff
> [   63.605188] memmap_init_zone_device initialised 8388608 pages in 132ms
> [   63.605203] amdgpu: HMM registered 32752MB device memory
> [   63.605244] amdgpu: [powerplay] [MemMclks]: memclk dpm not enabled!
>
> [   63.605263] amdgpu: Virtual CRAT table created for GPU
> [   63.605651] amdgpu: [powerplay] [MemMclks]: memclk dpm not enabled!
>
> [   63.605659] amdgpu: Topology: Add dGPU node [0x66a1:0x1002]
> [   63.605670] kfd kfd: amdgpu: added device 1002:66a1
> [   63.626300] amdgpu 0000:83:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 16, active_cu_number 64
> [   63.626517] amdgpu 0000:83:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
> [   63.626522] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
> [   63.626525] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
> [   63.626529] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
> [   63.626531] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
> [   63.626534] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
> [   63.626537] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
> [   63.626540] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
> [   63.626543] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
> [   63.626546] amdgpu 0000:83:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
> [   63.626549] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 1
> [   63.626552] amdgpu 0000:83:00.0: amdgpu: ring page0 uses VM inv eng 1 on hub 1
> [   63.626555] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 4 on hub 1
> [   63.626558] amdgpu 0000:83:00.0: amdgpu: ring page1 uses VM inv eng 5 on hub 1
> [   63.626561] amdgpu 0000:83:00.0: amdgpu: ring uvd_0 uses VM inv eng 6 on hub 1
> [   63.626563] amdgpu 0000:83:00.0: amdgpu: ring uvd_enc_0.0 uses VM inv eng 7 on hub 1
> [   63.626566] amdgpu 0000:83:00.0: amdgpu: ring uvd_enc_0.1 uses VM inv eng 8 on hub 1
> [   63.626569] amdgpu 0000:83:00.0: amdgpu: ring uvd_1 uses VM inv eng 9 on hub 1
> [   63.626572] amdgpu 0000:83:00.0: amdgpu: ring uvd_enc_1.0 uses VM inv eng 10 on hub 1
> [   63.626575] amdgpu 0000:83:00.0: amdgpu: ring uvd_enc_1.1 uses VM inv eng 11 on hub 1
> [   63.626577] amdgpu 0000:83:00.0: amdgpu: ring vce0 uses VM inv eng 12 on hub 1
> [   63.626580] amdgpu 0000:83:00.0: amdgpu: ring vce1 uses VM inv eng 13 on hub 1
> [   63.626583] amdgpu 0000:83:00.0: amdgpu: ring vce2 uses VM inv eng 14 on hub 1
> [   63.636996] amdgpu: Detected AMDGPU DF Counters. # of Counters = 8.
> [   63.637046] amdgpu: Detected AMDGPU 2 Perf Events.
> [   63.637428] [drm] Initialized amdgpu 3.48.0 20150101 for 0000:83:00.0 on minor 1
> [   63.637937] amdgpu 0000:86:00.0: enabling device (0100 -> 0102)
> [   63.638043] [drm] initializing kernel modesetting (VEGA20 0x1002:0x66A1 0x1002:0x0834 0x00).
> [   63.638090] [drm] register mmio base: 0xFBB00000
> [   63.638092] [drm] register mmio size: 524288
> [   63.638261] [drm] add ip block number 0 <soc15_common>
> [   63.638263] [drm] add ip block number 1 <gmc_v9_0>
> [   63.638265] [drm] add ip block number 2 <vega20_ih>
> [   63.638266] [drm] add ip block number 3 <psp>
> [   63.638267] [drm] add ip block number 4 <powerplay>
> [   63.638269] [drm] add ip block number 5 <dm>
> [   63.638271] [drm] add ip block number 6 <gfx_v9_0>
> [   63.638272] [drm] add ip block number 7 <sdma_v4_0>
> [   63.638273] [drm] add ip block number 8 <uvd_v7_0>
> [   63.638275] [drm] add ip block number 9 <vce_v4_0>
> [   63.675838] amdgpu 0000:86:00.0: amdgpu: Fetched VBIOS from ROM BAR
> [   63.675842] amdgpu: ATOM BIOS: 113-D1630200-112
> [   63.675867] [drm] UVD(0) is enabled in VM mode
> [   63.675868] [drm] UVD(1) is enabled in VM mode
> [   63.675869] [drm] UVD(0) ENC is enabled in VM mode
> [   63.675870] [drm] UVD(1) ENC is enabled in VM mode
> [   63.675871] [drm] VCE enabled in VM mode
> [   63.675873] amdgpu 0000:86:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
> [   63.675899] [drm] GPU posting now...
> [   63.676276] amdgpu 0000:86:00.0: amdgpu: MEM ECC is active.
> [   63.676277] amdgpu 0000:86:00.0: amdgpu: SRAM ECC is active.
> [   63.676286] amdgpu 0000:86:00.0: amdgpu: RAS INFO: ras initialized successfully, hardware ability[7fff] ras_mask[7fff]
> [   63.676297] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [   63.676304] amdgpu 0000:86:00.0: amdgpu: VRAM: 32752M 0x0000008800000000 - 0x0000008FFEFFFFFF (32752M used)
> [   63.676307] amdgpu 0000:86:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> [   63.676310] amdgpu 0000:86:00.0: amdgpu: AGP: 267845632M 0x0000009000000000 - 0x0000FFFFFFFFFFFF
> [   63.676321] [drm] Detected VRAM RAM=32752M, BAR=32768M
> [   63.676322] [drm] RAM width 4096bits HBM
> [   63.676363] [drm] amdgpu: 32752M of VRAM memory ready
> [   63.676365] [drm] amdgpu: 40203M of GTT memory ready.
> [   63.676388] [drm] GART: num cpu pages 131072, num gpu pages 131072
> [   63.676481] [drm] PCIE GART of 512M enabled.
> [   63.676482] [drm] PTB located at 0x0000008800000000
> [   63.676730] amdgpu 0000:86:00.0: amdgpu: PSP runtime database doesn't exist
> [   63.676733] amdgpu 0000:86:00.0: amdgpu: PSP runtime database doesn't exist
> [   63.677088] amdgpu: [powerplay] hwmgr_sw_init smu backed is vega20_smu
> [   63.678862] [drm] Found UVD firmware ENC: 1.2 DEC: .43 Family ID: 19
> [   63.678918] [drm] PSP loading UVD firmware
> [   63.679487] [drm] Found VCE firmware Version: 57.6 Binary ID: 4
> [   63.679619] [drm] PSP loading VCE firmware
> [   63.831730] [drm] reserve 0x400000 from 0x8ffec00000 for PSP TMR
> [   63.914508] amdgpu 0000:86:00.0: amdgpu: HDCP: optional hdcp ta ucode is not available
> [   63.914513] amdgpu 0000:86:00.0: amdgpu: DTM: optional dtm ta ucode is not available
> [   63.914516] amdgpu 0000:86:00.0: amdgpu: RAP: optional rap ta ucode is not available
> [   63.914518] amdgpu 0000:86:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
> [   63.917458] [drm] Display Core initialized with v3.2.196!
> [   63.919616] [drm] kiq ring mec 2 pipe 1 q 0
> [   63.961950] [drm] UVD and UVD ENC initialized successfully.
> [   64.160863] [drm] VCE initialized successfully.
> [   64.179285] amdgpu: [dbg_xgmi_hive_get] ref_count 4
> [   64.179291] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   64.179297] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   64.179299] Workqueue: events work_for_cpu_fn
> [   64.179311] Call Trace:
> [   64.179315]  <TASK>
> [   64.179320]  dump_stack_lvl+0x4a/0x63
> [   64.179331]  dump_stack+0x10/0x16
> [   64.179340]  amdgpu_get_xgmi_hive+0x217/0x2a0 [amdgpu]
> [   64.179904]  amdgpu_xgmi_add_device+0xcc/0x450 [amdgpu]
> [   64.180318]  ? amdgpu_ras_recovery_init+0x13d/0x2e0 [amdgpu]
> [   64.180733]  ? vce_v4_0_hw_init.cold+0xc/0x13 [amdgpu]
> [   64.181321]  amdgpu_device_init.cold+0x15bd/0x1fe3 [amdgpu]
> [   64.181909]  ? pci_bus_read_config_word+0x4a/0x70
> [   64.181917]  ? do_pci_enable_device+0xdb/0x110
> [   64.181923]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   64.182315]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   64.182703]  local_pci_probe+0x4b/0x90
> [   64.182710]  work_for_cpu_fn+0x1a/0x30
> [   64.182715]  process_one_work+0x22b/0x3d0
> [   64.182722]  worker_thread+0x21d/0x3f0
> [   64.182728]  ? process_one_work+0x3d0/0x3d0
> [   64.182734]  kthread+0x12a/0x150
> [   64.182740]  ? set_kthread_struct+0x50/0x50
> [   64.182745]  ret_from_fork+0x22/0x30
> [   64.182756]  </TASK>
> [   64.184561] amdgpu 0000:86:00.0: amdgpu: XGMI: Add node 1, hive 0x25bbae7e3fd04cf4.
> [   64.184568] amdgpu: [dbg_xgmi_hive_get] ref_count 5
> [   64.184571] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   64.184576] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   64.184578] Workqueue: events work_for_cpu_fn
> [   64.184585] Call Trace:
> [   64.184587]  <TASK>
> [   64.184589]  dump_stack_lvl+0x4a/0x63
> [   64.184596]  dump_stack+0x10/0x16
> [   64.184602]  amdgpu_get_xgmi_hive+0x285/0x2a0 [amdgpu]
> [   64.185041]  amdgpu_device_init.cold+0x15cd/0x1fe3 [amdgpu]
> [   64.185624]  ? pci_bus_read_config_word+0x4a/0x70
> [   64.185631]  ? do_pci_enable_device+0xdb/0x110
> [   64.185636]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   64.186027]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   64.186416]  local_pci_probe+0x4b/0x90
> [   64.186422]  work_for_cpu_fn+0x1a/0x30
> [   64.186428]  process_one_work+0x22b/0x3d0
> [   64.186434]  worker_thread+0x21d/0x3f0
> [   64.186439]  ? process_one_work+0x3d0/0x3d0
> [   64.186445]  kthread+0x12a/0x150
> [   64.186450]  ? set_kthread_struct+0x50/0x50
> [   64.186455]  ret_from_fork+0x22/0x30
> [   64.186464]  </TASK>
> [   64.206119] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [   64.206433] amdgpu: sdma_bitmap: ffff
> [   64.552064] memmap_init_zone_device initialised 8388608 pages in 132ms
> [   64.552080] amdgpu: HMM registered 32752MB device memory
> [   64.552116] amdgpu: [powerplay] [MemMclks]: memclk dpm not enabled!
>
> [   64.552138] amdgpu: Virtual CRAT table created for GPU
> [   64.552978] amdgpu: [powerplay] [MemMclks]: memclk dpm not enabled!
>
> [   64.552988] amdgpu: Topology: Add dGPU node [0x66a1:0x1002]
> [   64.552999] kfd kfd: amdgpu: added device 1002:66a1
> [   64.570314] amdgpu 0000:86:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 16, active_cu_number 64
> [   64.570527] amdgpu 0000:86:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
> [   64.570531] amdgpu 0000:86:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
> [   64.570535] amdgpu 0000:86:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
> [   64.570538] amdgpu 0000:86:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
> [   64.570541] amdgpu 0000:86:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
> [   64.570544] amdgpu 0000:86:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
> [   64.570547] amdgpu 0000:86:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
> [   64.570550] amdgpu 0000:86:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
> [   64.570552] amdgpu 0000:86:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
> [   64.570556] amdgpu 0000:86:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
> [   64.570559] amdgpu 0000:86:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 1
> [   64.570562] amdgpu 0000:86:00.0: amdgpu: ring page0 uses VM inv eng 1 on hub 1
> [   64.570565] amdgpu 0000:86:00.0: amdgpu: ring sdma1 uses VM inv eng 4 on hub 1
> [   64.570567] amdgpu 0000:86:00.0: amdgpu: ring page1 uses VM inv eng 5 on hub 1
> [   64.570570] amdgpu 0000:86:00.0: amdgpu: ring uvd_0 uses VM inv eng 6 on hub 1
> [   64.570573] amdgpu 0000:86:00.0: amdgpu: ring uvd_enc_0.0 uses VM inv eng 7 on hub 1
> [   64.570576] amdgpu 0000:86:00.0: amdgpu: ring uvd_enc_0.1 uses VM inv eng 8 on hub 1
> [   64.570579] amdgpu 0000:86:00.0: amdgpu: ring uvd_1 uses VM inv eng 9 on hub 1
> [   64.570581] amdgpu 0000:86:00.0: amdgpu: ring uvd_enc_1.0 uses VM inv eng 10 on hub 1
> [   64.570584] amdgpu 0000:86:00.0: amdgpu: ring uvd_enc_1.1 uses VM inv eng 11 on hub 1
> [   64.570587] amdgpu 0000:86:00.0: amdgpu: ring vce0 uses VM inv eng 12 on hub 1
> [   64.570589] amdgpu 0000:86:00.0: amdgpu: ring vce1 uses VM inv eng 13 on hub 1
> [   64.570592] amdgpu 0000:86:00.0: amdgpu: ring vce2 uses VM inv eng 14 on hub 1
> [   64.581070] amdgpu: [dbg_xgmi_hive_get] ref_count 6
> [   64.581075] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   64.581079] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   64.581081] Workqueue: events work_for_cpu_fn
> [   64.581089] Call Trace:
> [   64.581091]  <TASK>
> [   64.581094]  dump_stack_lvl+0x4a/0x63
> [   64.581103]  dump_stack+0x10/0x16
> [   64.581109]  amdgpu_get_xgmi_hive+0x285/0x2a0 [amdgpu]
> [   64.581489]  amdgpu_xgmi_set_pstate+0xe/0x30 [amdgpu]
> [   64.581723]  amdgpu_device_ip_late_init+0x2dc/0x380 [amdgpu]
> [   64.581943]  amdgpu_device_init.cold+0x1805/0x1fe3 [amdgpu]
> [   64.582288]  ? pci_bus_read_config_word+0x4a/0x70
> [   64.582295]  ? do_pci_enable_device+0xdb/0x110
> [   64.582298]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   64.582520]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   64.582738]  local_pci_probe+0x4b/0x90
> [   64.582743]  work_for_cpu_fn+0x1a/0x30
> [   64.582746]  process_one_work+0x22b/0x3d0
> [   64.582750]  worker_thread+0x21d/0x3f0
> [   64.582753]  ? process_one_work+0x3d0/0x3d0
> [   64.582756]  kthread+0x12a/0x150
> [   64.582761]  ? set_kthread_struct+0x50/0x50
> [   64.582764]  ret_from_fork+0x22/0x30
> [   64.582772]  </TASK>
> [   64.582774] amdgpu: [dbg_xgmi_hive_put] ref_count 5
> [   64.582775] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   64.582778] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   64.582779] Workqueue: events work_for_cpu_fn
> [   64.582782] Call Trace:
> [   64.582783]  <TASK>
> [   64.582784]  dump_stack_lvl+0x4a/0x63
> [   64.582789]  dump_stack+0x10/0x16
> [   64.582792]  amdgpu_put_xgmi_hive.part.0+0x26/0x30 [amdgpu]
> [   64.583028]  amdgpu_xgmi_set_pstate+0x1b/0x30 [amdgpu]
> [   64.583262]  amdgpu_device_ip_late_init+0x2dc/0x380 [amdgpu]
> [   64.583482]  amdgpu_device_init.cold+0x1805/0x1fe3 [amdgpu]
> [   64.583833]  ? pci_bus_read_config_word+0x4a/0x70
> [   64.583836]  ? do_pci_enable_device+0xdb/0x110
> [   64.583840]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   64.584072]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   64.584304]  local_pci_probe+0x4b/0x90
> [   64.584307]  work_for_cpu_fn+0x1a/0x30
> [   64.584311]  process_one_work+0x22b/0x3d0
> [   64.584314]  worker_thread+0x21d/0x3f0
> [   64.584318]  ? process_one_work+0x3d0/0x3d0
> [   64.584321]  kthread+0x12a/0x150
> [   64.584324]  ? set_kthread_struct+0x50/0x50
> [   64.584327]  ret_from_fork+0x22/0x30
> [   64.584333]  </TASK>
> [   64.584342] amdgpu: [dbg_xgmi_hive_get] ref_count 6
> [   64.584344] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   64.584347] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   64.584348] Workqueue: events work_for_cpu_fn
> [   64.584352] Call Trace:
> [   64.584353]  <TASK>
> [   64.584354]  dump_stack_lvl+0x4a/0x63
> [   64.584358]  dump_stack+0x10/0x16
> [   64.584362]  amdgpu_get_xgmi_hive+0x285/0x2a0 [amdgpu]
> [   64.584610]  amdgpu_xgmi_set_pstate+0xe/0x30 [amdgpu]
> [   64.584856]  amdgpu_device_ip_late_init+0x2dc/0x380 [amdgpu]
> [   64.585086]  amdgpu_device_init.cold+0x1805/0x1fe3 [amdgpu]
> [   64.585437]  ? pci_bus_read_config_word+0x4a/0x70
> [   64.585440]  ? do_pci_enable_device+0xdb/0x110
> [   64.585443]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   64.585679]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   64.585922]  local_pci_probe+0x4b/0x90
> [   64.585926]  work_for_cpu_fn+0x1a/0x30
> [   64.585929]  process_one_work+0x22b/0x3d0
> [   64.585932]  worker_thread+0x21d/0x3f0
> [   64.585936]  ? process_one_work+0x3d0/0x3d0
> [   64.585939]  kthread+0x12a/0x150
> [   64.585942]  ? set_kthread_struct+0x50/0x50
> [   64.585945]  ret_from_fork+0x22/0x30
> [   64.585950]  </TASK>
> [   64.585951] amdgpu: [dbg_xgmi_hive_put] ref_count 5
> [   64.585953] CPU: 10 PID: 397 Comm: kworker/10:2 Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [   64.585956] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [   64.585957] Workqueue: events work_for_cpu_fn
> [   64.585960] Call Trace:
> [   64.585961]  <TASK>
> [   64.585963]  dump_stack_lvl+0x4a/0x63
> [   64.585967]  dump_stack+0x10/0x16
> [   64.585970]  amdgpu_put_xgmi_hive.part.0+0x26/0x30 [amdgpu]
> [   64.586213]  amdgpu_xgmi_set_pstate+0x1b/0x30 [amdgpu]
> [   64.586458]  amdgpu_device_ip_late_init+0x2dc/0x380 [amdgpu]
> [   64.586688]  amdgpu_device_init.cold+0x1805/0x1fe3 [amdgpu]
> [   64.587037]  ? pci_bus_read_config_word+0x4a/0x70
> [   64.587040]  ? do_pci_enable_device+0xdb/0x110
> [   64.587043]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [   64.587277]  amdgpu_pci_probe+0x18d/0x3a0 [amdgpu]
> [   64.587509]  local_pci_probe+0x4b/0x90
> [   64.587512]  work_for_cpu_fn+0x1a/0x30
> [   64.587515]  process_one_work+0x22b/0x3d0
> [   64.587519]  worker_thread+0x21d/0x3f0
> [   64.587523]  ? process_one_work+0x3d0/0x3d0
> [   64.587526]  kthread+0x12a/0x150
> [   64.587529]  ? set_kthread_struct+0x50/0x50
> [   64.587532]  ret_from_fork+0x22/0x30
> [   64.587537]  </TASK>
> [   64.587619] amdgpu: Detected AMDGPU DF Counters. # of Counters = 8.
> [   64.587663] amdgpu: Detected AMDGPU 2 Perf Events.
> [   64.588081] [drm] Initialized amdgpu 3.48.0 20150101 for 0000:86:00.0 on minor 2
>
> Then driver unload (reference stuck at 2):
> [  110.117018] amdgpu 0000:86:00.0: amdgpu: amdgpu: finishing device.
> [  110.131638] [drm] free PSP TMR buffer
> [  110.420529] amdgpu: [dbg_xgmi_hive_put] ref_count 4
> [  110.420537] CPU: 27 PID: 1748 Comm: modprobe Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [  110.420545] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [  110.420548] Call Trace:
> [  110.420551]  <TASK>
> [  110.420556]  dump_stack_lvl+0x4a/0x63
> [  110.420569]  dump_stack+0x10/0x16
> [  110.420578]  amdgpu_put_xgmi_hive.part.0+0x26/0x30 [amdgpu]
> [  110.421001]  amdgpu_xgmi_remove_device+0x11d/0x1c0 [amdgpu]
> [  110.421380]  amdgpu_device_fini_sw+0x63/0x4c0 [amdgpu]
> [  110.421724]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
> [  110.422070]  drm_dev_release+0x28/0x50 [drm]
> [  110.422145]  devm_drm_dev_init_release+0x38/0x60 [drm]
> [  110.422190]  devm_action_release+0x15/0x20
> [  110.422198]  release_nodes+0x40/0xb0
> [  110.422205]  devres_release_all+0x9e/0xe0
> [  110.422212]  device_release_driver_internal+0x117/0x1f0
> [  110.422218]  driver_detach+0x4c/0xa0
> [  110.422222]  bus_remove_driver+0x6c/0xf0
> [  110.422227]  driver_unregister+0x31/0x50
> [  110.422231]  pci_unregister_driver+0x40/0x90
> [  110.422238]  amdgpu_exit+0x15/0x446 [amdgpu]
> [  110.422791]  __x64_sys_delete_module+0x14e/0x260
> [  110.422801]  ? do_syscall_64+0x69/0xc0
> [  110.422809]  ? __x64_sys_read+0x1a/0x20
> [  110.422817]  ? do_syscall_64+0x69/0xc0
> [  110.422821]  ? ksys_read+0x67/0xf0
> [  110.422825]  do_syscall_64+0x5c/0xc0
> [  110.422830]  ? __x64_sys_read+0x1a/0x20
> [  110.422834]  ? do_syscall_64+0x69/0xc0
> [  110.422839]  ? syscall_exit_to_user_mode+0x27/0x50
> [  110.422846]  ? __x64_sys_openat+0x20/0x30
> [  110.422853]  ? do_syscall_64+0x69/0xc0
> [  110.422857]  ? do_syscall_64+0x69/0xc0
> [  110.422862]  ? irqentry_exit+0x1d/0x30
> [  110.422868]  ? exc_page_fault+0x89/0x170
> [  110.422874]  entry_SYSCALL_64_after_hwframe+0x61/0xcb
> [  110.422885] RIP: 0033:0x7f1576682a6b
> [  110.422892] Code: 73 01 c3 48 8b 0d 25 c4 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 c3 0c 00 f7 d8 64 89 01 48
> [  110.422897] RSP: 002b:00007ffcb96e0bf8 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
> [  110.422904] RAX: ffffffffffffffda RBX: 000056347ba57550 RCX: 00007f1576682a6b
> [  110.422908] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000056347ba575b8
> [  110.422911] RBP: 000056347ba57550 R08: 0000000000000000 R09: 0000000000000000
> [  110.422913] R10: 00007f15766feac0 R11: 0000000000000206 R12: 000056347ba575b8
> [  110.422916] R13: 0000000000000000 R14: 000056347ba575b8 R15: 000056347ba57550
> [  110.422921]  </TASK>
> [  110.425941] [drm] amdgpu: ttm finalized
> [  110.489186] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
> [  110.504025] [drm] free PSP TMR buffer
> [  110.762272] amdgpu: [dbg_xgmi_hive_put] ref_count 3
> [  110.762280] CPU: 27 PID: 1748 Comm: modprobe Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [  110.762288] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [  110.762290] Call Trace:
> [  110.762294]  <TASK>
> [  110.762298]  dump_stack_lvl+0x4a/0x63
> [  110.762313]  dump_stack+0x10/0x16
> [  110.762319]  amdgpu_put_xgmi_hive.part.0+0x26/0x30 [amdgpu]
> [  110.762663]  amdgpu_xgmi_remove_device+0x11d/0x1c0 [amdgpu]
> [  110.762965]  amdgpu_device_fini_sw+0x63/0x4c0 [amdgpu]
> [  110.763231]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
> [  110.763519]  drm_dev_release+0x28/0x50 [drm]
> [  110.763569]  devm_drm_dev_init_release+0x38/0x60 [drm]
> [  110.763609]  devm_action_release+0x15/0x20
> [  110.763617]  release_nodes+0x40/0xb0
> [  110.763624]  devres_release_all+0x9e/0xe0
> [  110.763631]  device_release_driver_internal+0x117/0x1f0
> [  110.763636]  driver_detach+0x4c/0xa0
> [  110.763640]  bus_remove_driver+0x6c/0xf0
> [  110.763646]  driver_unregister+0x31/0x50
> [  110.763650]  pci_unregister_driver+0x40/0x90
> [  110.763657]  amdgpu_exit+0x15/0x446 [amdgpu]
> [  110.764153]  __x64_sys_delete_module+0x14e/0x260
> [  110.764164]  ? do_syscall_64+0x69/0xc0
> [  110.764172]  ? __x64_sys_read+0x1a/0x20
> [  110.764180]  ? do_syscall_64+0x69/0xc0
> [  110.764184]  ? ksys_read+0x67/0xf0
> [  110.764189]  do_syscall_64+0x5c/0xc0
> [  110.764193]  ? __x64_sys_read+0x1a/0x20
> [  110.764197]  ? do_syscall_64+0x69/0xc0
> [  110.764202]  ? syscall_exit_to_user_mode+0x27/0x50
> [  110.764209]  ? __x64_sys_openat+0x20/0x30
> [  110.764217]  ? do_syscall_64+0x69/0xc0
> [  110.764221]  ? do_syscall_64+0x69/0xc0
> [  110.764226]  ? irqentry_exit+0x1d/0x30
> [  110.764232]  ? exc_page_fault+0x89/0x170
> [  110.764238]  entry_SYSCALL_64_after_hwframe+0x61/0xcb
> [  110.764248] RIP: 0033:0x7f1576682a6b
> [  110.764255] Code: 73 01 c3 48 8b 0d 25 c4 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 c3 0c 00 f7 d8 64 89 01 48
> [  110.764260] RSP: 002b:00007ffcb96e0bf8 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
> [  110.764267] RAX: ffffffffffffffda RBX: 000056347ba57550 RCX: 00007f1576682a6b
> [  110.764270] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000056347ba575b8
> [  110.764273] RBP: 000056347ba57550 R08: 0000000000000000 R09: 0000000000000000
> [  110.764275] R10: 00007f15766feac0 R11: 0000000000000206 R12: 000056347ba575b8
> [  110.764278] R13: 0000000000000000 R14: 000056347ba575b8 R15: 000056347ba57550
> [  110.764283]  </TASK>
> [  110.764326] amdgpu: [dbg_xgmi_hive_put] ref_count 2
> [  110.764329] CPU: 27 PID: 1748 Comm: modprobe Tainted: G           OE     5.15.0-46-generic #49~20.04.1-Ubuntu
> [  110.764334] Hardware name: Supermicro X10DRi/X10DRi-T, BIOS 3.1 09/14/2018
> [  110.764336] Call Trace:
> [  110.764337]  <TASK>
> [  110.764339]  dump_stack_lvl+0x4a/0x63
> [  110.764347]  dump_stack+0x10/0x16
> [  110.764354]  amdgpu_put_xgmi_hive.part.0+0x26/0x30 [amdgpu]
> [  110.764624]  amdgpu_xgmi_remove_device+0x1ad/0x1c0 [amdgpu]
> [  110.764791]  amdgpu_device_fini_sw+0x63/0x4c0 [amdgpu]
> [  110.764937]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
> [  110.765085]  drm_dev_release+0x28/0x50 [drm]
> [  110.765108]  devm_drm_dev_init_release+0x38/0x60 [drm]
> [  110.765130]  devm_action_release+0x15/0x20
> [  110.765134]  release_nodes+0x40/0xb0
> [  110.765137]  devres_release_all+0x9e/0xe0
> [  110.765141]  device_release_driver_internal+0x117/0x1f0
> [  110.765144]  driver_detach+0x4c/0xa0
> [  110.765146]  bus_remove_driver+0x6c/0xf0
> [  110.765148]  driver_unregister+0x31/0x50
> [  110.765150]  pci_unregister_driver+0x40/0x90
> [  110.765154]  amdgpu_exit+0x15/0x446 [amdgpu]
> [  110.765434]  __x64_sys_delete_module+0x14e/0x260
> [  110.765438]  ? do_syscall_64+0x69/0xc0
> [  110.765441]  ? __x64_sys_read+0x1a/0x20
> [  110.765444]  ? do_syscall_64+0x69/0xc0
> [  110.765446]  ? ksys_read+0x67/0xf0
> [  110.765449]  do_syscall_64+0x5c/0xc0
> [  110.765451]  ? __x64_sys_read+0x1a/0x20
> [  110.765454]  ? do_syscall_64+0x69/0xc0
> [  110.765456]  ? syscall_exit_to_user_mode+0x27/0x50
> [  110.765460]  ? __x64_sys_openat+0x20/0x30
> [  110.765464]  ? do_syscall_64+0x69/0xc0
> [  110.765466]  ? do_syscall_64+0x69/0xc0
> [  110.765469]  ? irqentry_exit+0x1d/0x30
> [  110.765472]  ? exc_page_fault+0x89/0x170
> [  110.765476]  entry_SYSCALL_64_after_hwframe+0x61/0xcb
> [  110.765480] RIP: 0033:0x7f1576682a6b
> [  110.765482] Code: 73 01 c3 48 8b 0d 25 c4 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 c3 0c 00 f7 d8 64 89 01 48
> [  110.765485] RSP: 002b:00007ffcb96e0bf8 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
> [  110.765488] RAX: ffffffffffffffda RBX: 000056347ba57550 RCX: 00007f1576682a6b
> [  110.765489] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000056347ba575b8
> [  110.765491] RBP: 000056347ba57550 R08: 0000000000000000 R09: 0000000000000000
> [  110.765492] R10: 00007f15766feac0 R11: 0000000000000206 R12: 000056347ba575b8
> [  110.765494] R13: 0000000000000000 R14: 000056347ba575b8 R15: 000056347ba57550
> [  110.765496]  </TASK>
> [  110.768091] [drm] amdgpu: ttm finalized
>
>> -----Original Message-----
>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>> Sent: August 11, 2022 12:43 PM
>> To: Kim, Jonathan <Jonathan.Kim@amd.com>; Kuehling, Felix
>> <Felix.Kuehling@amd.com>; amd-gfx@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/amdgpu: fix reset domain xgmi hive info reference
>> leak
>>
>>
>> On 2022-08-11 11:34, Kim, Jonathan wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Kuehling, Felix <Felix.Kuehling@amd.com>
>>>> Sent: August 11, 2022 11:19 AM
>>>> To: amd-gfx@lists.freedesktop.org; Kim, Jonathan
>> <Jonathan.Kim@amd.com>
>>>> Subject: Re: [PATCH] drm/amdgpu: fix reset domain xgmi hive info reference
>>>> leak
>>>>
>>>> Am 2022-08-11 um 09:42 schrieb Jonathan Kim:
>>>>> When an xgmi node is added to the hive, it takes another hive
>>>>> reference for its reset domain.
>>>>>
>>>>> This extra reference was not dropped on device removal from the
>>>>> hive so drop it.
>>>>>
>>>>> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>>>> index 1b108d03e785..560bf1c98f08 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>>>> @@ -731,6 +731,9 @@ int amdgpu_xgmi_remove_device(struct
>>>> amdgpu_device *adev)
>>>>>       mutex_unlock(&hive->hive_lock);
>>>>>
>>>>>       amdgpu_put_xgmi_hive(hive);
>>>>> +   /* device is removed from the hive so remove its reset domain
>>>> reference */
>>>>> +   if (adev->reset_domain && adev->reset_domain == hive-
>>>>> reset_domain)
>>>>> +           amdgpu_put_xgmi_hive(hive);
>>>> This is some messed up reference counting. If you need an extra
>>>> reference from the reset_domain to the hive, that should be owned by the
>>>> reset_domain and dropped when the reset_domain is destroyed. And it's
>>>> only one reference for the reset_domain, not one reference per adev in
>>>> the reset_domain.
>>> Cc'ing Andrey.
>>>
>>> What you're saying seems to make more sense to me, but what I got from an
>> offline conversation with Andrey
>>> was that the reset domain reference per device was intentional.
>>> Maybe Andrey can comment here.
>>>
>>>> What you're doing here looks like every adev that's in a reset_domain of
>>>> its hive has two references to the hive. And if you're dropping the
>>>> extra reference here, it still leaves the reset_domain with a dangling
>>>> pointer to a hive that may no longer exist. So this extra reference is
>>>> kind of pointless.
>>
>> reset_domain doesn't have any references to the hive, the hive has a
>> reference to reset_domain
>>
>>
>>> Yes.  Currently one reference is fetched from the device's lifetime on the hive
>> and the other is from the
>>> per-device reset domain.
>>>
>>> Snippet from amdgpu_device_ip_init:
>>>           /**
>>>            * In case of XGMI grab extra reference for reset domain for this device
>>>            */
>>>           if (adev->gmc.xgmi.num_physical_nodes > 1) {
>>>                   if (amdgpu_xgmi_add_device(adev) == 0) { <- [JK] reference is
>> fetched here
>>
>>
>> amdgpu_xgmi_add_device calls  amdgpu_get_xgmi_hive and only on the first
>> time amdgpu_get_xgmi_hive is called and hive is actually allocated and
>> initialized  will we proceed
>> to creating the reset domain either from scratch (first creation of the
>> hive) or by taking reference from adev (see [1])
>>
>>
>>
>> [1] -
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/a
>> mdgpu_xgmi.c#L394
>>
>>>                           struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>> <- [JK] then here again
>>
>>
>> So here I don't see how an extra reference to reset_domain is taken if
>> amdgpu_get_xgmi_hive returns early since the hive already created and
>> exists in the global hive container ?
>>
>> Johantan - can u please show the exact flow how recount leak on
>> reset_domain is happening ?
>>
>> Andrey
>>
>>
>>>                           if (!hive->reset_domain ||
>>>                               !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
>>>                                   r = -ENOENT;
>>>                                   goto init_failed;
>>>                           }
>>>
>>>                           /* Drop the early temporary reset domain we created for device
>> */
>>>                           amdgpu_reset_put_reset_domain(adev->reset_domain);
>>>                           adev->reset_domain = hive->reset_domain;
>>>                   }
>>>           }
>>>
>>> One of these never gets dropped so a leak happens.
>>> So either the extra reference has to be dropped on device removal from the
>> hive or from what you've mentioned,
>>> the reset_domain reference fetch should be fixed to grab at the
>> hive/reset_domain level.
>>> Thanks,
>>>
>>> Jon
>>>
>>>> Regards,
>>>>      Felix
>>>>
>>>>
>>>>>       adev->hive = NULL;
>>>>>
>>>>>       if (atomic_dec_return(&hive->number_devices) == 0) {
