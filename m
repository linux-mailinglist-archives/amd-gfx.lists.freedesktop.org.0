Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BF7AD9282
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jun 2025 18:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250F710EA23;
	Fri, 13 Jun 2025 16:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m8Y8gXRf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BCA10EA23
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Jun 2025 16:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heKmjVDbiZNAsespzSrwjDkMheMo1FHKKh19FaQzmK2kHgzT0DCMq+dR6gonb7Hco3M1+D9odgfzqjMa+ekqnR46GmNYIhLeL5M00zewOTJORHcpSt9j4LJEwhMSIWW0EaYrocOLK+lD8ars6NPaYvUT/KgMMTSD8neCJmKh7rEUaJDuJBsexuQaQYiEEADjQ4s5EftZIAFscUmSaAFXvQIZ5MC+LHt+sV14Rk0UShjWP70Lmh3Brrsu47mTMldkN5k8j5c5EAy+uL8ch0XRbnkotqyFQLxVrC+VuGOgDLTyco0xomo12JsASW7FW6h02GZO9plDt+W1Q/daKeQ1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go4sCUMivEXwscskd/sLIfhW9i5rVe2tb0rB1ib3EJQ=;
 b=i/iGq2Mx8r9dgdLS9YtSf/iTeCyDlHN+kSIBmKtXWDD76ZdCfxM/dQLOAOigkN4jlRYYv83C3IBZKNxjdKsIwAZYnPJ+ZRSd2syIhWA+Zr+sSOUY/NVTobrc57skIDaGP5UxRQG64kxhWsvOYx1dOtPMyo3SjdUXg8dFKsQ1wc4Ua9TVxeLYgfVvI5rfH0pEG6yTNPN28jQyM5E7clSQ0NH3Z9/0p8KP+gLduk0ExuidxWnc6Ypf0EtFiasXBn6XIpA84iS93vbvnpr+WQAtyJlMP6rd19S11y89c4E3w1jv7meSOIidh0ZqeBBUwaT3ut06hxiLgnlLfKAaWmGN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go4sCUMivEXwscskd/sLIfhW9i5rVe2tb0rB1ib3EJQ=;
 b=m8Y8gXRfi/lkBz17arBnOC968aTOdp+SUYShPHnzdlkut5R2gVlJwbXQj1URs05d6JibpwvoXynpObMTvl3uefmMT7oQvPlPBarkZih2rRbIx0YDlcCJhf77HxaPn5nCTT6Nbr9TYu8uZElAUC5u0vBlPJtJmdch9KYQFYWWV70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Fri, 13 Jun 2025 16:06:15 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 16:06:15 +0000
Message-ID: <32b2591e-9629-4f9c-8c3f-233b1bd9ee67@amd.com>
Date: Fri, 13 Jun 2025 21:36:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/pm: move the dpm table setting back after
 featureenablement
To: Alex Deucher <alexdeucher@gmail.com>, Kenneth Feng <kenneth.feng@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20250613144203.441129-1-kenneth.feng@amd.com>
 <CADnq5_PNf903HaK9eieL3w_tWXOfHzY7sQgivfskyvRwh8L4gw@mail.gmail.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <CADnq5_PNf903HaK9eieL3w_tWXOfHzY7sQgivfskyvRwh8L4gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::31) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|CY8PR12MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: af4ce9db-249c-4a6c-d34b-08ddaa943935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDc5VDhhQVdrRE5QZTNtQ2hjaitQRURSajJlNCtiMDRJRCtrR3pIQUljTGsx?=
 =?utf-8?B?TjRoTTZFeXJxajcxTUZ3QVJzNmNXSTBIdnBOQitaT1hnL0JuYlEyTmhxMDBL?=
 =?utf-8?B?eWJScSs4bWVHeEFUcUVPbmR3TzJVU0FOVkZkVFhJck53ZE90eXZLTktzRUs5?=
 =?utf-8?B?M2l6MUxOVkNJOGJ6Q1dFMzFBUWtNS3gvUXFqbENWT3RCVmlRUEIvem1kd3F5?=
 =?utf-8?B?VnBGYnJnYkw3b1QrKzJQclVmd0JGZGU0d282b2Qvc2V5dk4yTDFPS1JrSXdp?=
 =?utf-8?B?V0xaWTBJb0E0cmFuYzZ3Q3ZjYjNzOVhQZ2YvRlVCYXQ5Nk1lLzFkWGo3MDI0?=
 =?utf-8?B?RHkxQnUrbG5XMXZLQ1pDRlptVUtNbjR4VWpkcWE1Ly9hOWRCUWMwdGpXVFov?=
 =?utf-8?B?Mkx2TEVETzJDeDZDUkx6QjNMaHgxRXJXN3hLeGlCYzJzV2daaTY3TkxuR2Fh?=
 =?utf-8?B?TVk2L3dWN3B6OVk4WXFLTHBNNmJiaGwxMFhHUm9vK0VGQ3dDUHRJbVltM3ZT?=
 =?utf-8?B?azJRdzBwMHdvajdBRmNXbUo4SFZwSDBXaUN4Y2o2cHQ2TEcvTkJwVnBJd2J2?=
 =?utf-8?B?M2c5QnN4RHBXQktHRmNBdDd5aFM1dWZqOFQraTJHdldIQjRna0F3TUQwRUZk?=
 =?utf-8?B?OE9VdWZJdnltSHJUbHkxQjBRMHF1NlJvc2VrSnFuVGVmVGNBOC9CY2NsMzNy?=
 =?utf-8?B?NUt4czV2RzZBTEp4Y3BvaW42TGtqU3RKaGJ3MmRvM1UvSkpOVnh2cEx6T0RX?=
 =?utf-8?B?RytSRUZMOWRoRlRGWk44aDhBWkxjMklYaWltRFFyNzZjMmVyTWYzdVNaTTdB?=
 =?utf-8?B?ODdJVUh1YXZnQmFCdFpLeENreFZaWTl1YWd3UWhUUktsOGhGS1dQbnZyTjNk?=
 =?utf-8?B?ajRsNmxHeTk1K3lmbUZOZUQzNWlCTVFBUnF6d08xdmlNSEVEeHJmb3Z1RWJi?=
 =?utf-8?B?cFBvazAxdW1JbE1tdzhDeHV6YzE5cnV3cnp5RjBDczlMbndFcWRmdm4zNERK?=
 =?utf-8?B?TXRQVDdSNjdXajhaWTJmZTd6c1JQNXdzMmJpUEtLdThnRE01a0F4Yi93bm95?=
 =?utf-8?B?bFovcjl6QkN4Tkl5RWdpSlB3NWZNNDRiU2RjNzYyV05KY3JmZXprQ2lrVlBT?=
 =?utf-8?B?UktpNm1YK3JIdVdmZDdFK0dXcFhMUUpJM05MNGZtaC9zQ0FqTjBhTGxSVG1l?=
 =?utf-8?B?M2dHa1A4SHZQZ3RhTzZ1d1p2ekJrR2QzTXNabUdZMlRRbkZvdnpMTURDZ2lO?=
 =?utf-8?B?akNaVGtrdW90eDJWWHRxT1Zjc0RjU3U5MnRPUStHQTcxMGs4SFZqMWFYNWoz?=
 =?utf-8?B?RitmYlhnU01MY2hBL3pmVEI5ZjZvcUF2WWJFZnFKV0Z1NmRBYzBVSnhpcGFZ?=
 =?utf-8?B?dVRkU3VvaUZuNXNvTk1ITFpWVUlNSUgwREMrb3YySXd4RWdMMERGNVpxRUFG?=
 =?utf-8?B?dlZwL0ZFTE1uNC9BQlFCSlBpMEpKRVRQSHJ0YWhQWmtjSCtMeWdnZlZQbnp2?=
 =?utf-8?B?eW1OVDBESmY3N254d0JhYnV2bWRTZ3RCYm16dmZESjlxdnBucHhqOEFXbjYr?=
 =?utf-8?B?RWczeFNtTWpING1PMVlRUzdudzEza3lMaWJNSzg3T1dyMHZkSERPNWI0VXJ0?=
 =?utf-8?B?WldnSWJ5YjJwcFRIWko5Z0xDZ1JyZnVqUzg4QnZ4OEVIcmo0VFdhUXZVZCt5?=
 =?utf-8?B?ODZHSW5EV21IQ0o3Q1k2aUdYK2w2MGUwUCtUMUYwOGpzTkRvUXF5aW5sZG1v?=
 =?utf-8?B?bDJxMXdRVzZnSm8vZHZVdzlWbE9RSFlxODN3UUs2Rlp2V2w1YkVUbElFVyth?=
 =?utf-8?B?NUp4UEtDTmJoa1p5Tmt6cnZ4aHdDYjdmNnlFd2gvZDFON3VwcUl6blZVVGZ0?=
 =?utf-8?B?b0NvWUtTSzg1dmdPMUZGNjc2bTBxdGw5cjRnWm9mVm4rY3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3VOVHRYVlptdkNTa3ZURzJUVDRReTEyZGhHbWtYSG1WRGdKMXJTSXdiRG14?=
 =?utf-8?B?OUdxMzNzN0kxeWxRQmdSSjc2L1hXWExTTVltZWhEajljeS8yUDNJYTczUFZn?=
 =?utf-8?B?N1IzM2VPSXA5RnNmYnZjTmgrbEw4b3lITEhlRG1TTmhhaGtEZHRrU3JkUG4z?=
 =?utf-8?B?ejJiaXBwRDVoUG9ZUWlGNG1jWGdZcXhZdk9Ibm5Cd0FWVEpUWE1FWS9rZjIz?=
 =?utf-8?B?a3dwZWlhandFbFBSL3dsVm9aWjF0OHFUQTNYVzNxL0pEaWk5UytyQTNBUXZI?=
 =?utf-8?B?c0trcTZzY3pMTjlsL2g5dEJCOFhaeGsxQ0U5NEkxaXRuZldValorYUQwVytN?=
 =?utf-8?B?TGJuTFI0bko5OGorWEVUV0JFY3VCVW1zcG03dmN0L08vU0x4RU8zTkI0citj?=
 =?utf-8?B?cDNNZHd2YUxZSVFSTXhZVGhEelNVcGhNZEtsM1FZdUFza3hrMlVNRDkvNzc3?=
 =?utf-8?B?Z1BPVmU2aFc1MHdZMmpTc1hoMWljWWhlKzdONCt1SlEwZUNsT2RhWHVVU0cx?=
 =?utf-8?B?dDlvMSt2dFBWdVpDT3QrUVE0aVhZaFE2a1lKWmVzVkVaMm5sNkFkMmZTeTJ2?=
 =?utf-8?B?UUdHdG5HNnI0bmo3ZTM4REJFdExOQUEyTGFpWGYxZVZxUUFIc2dWNVBybWE4?=
 =?utf-8?B?bGhWbGVkeG9VSG5lQmJtejZtWUdHODc2aXJ0K1Fmem5BZ09INVpVVDFLVHpj?=
 =?utf-8?B?b0trYk4wNnJMK0phdlE4dkpGUnhRbThMVDE5Z0V6UWpib0pnT2g5UFhFUXBk?=
 =?utf-8?B?TjJvQXlVZlN3SEtjUE92T2lrRU43M0VBRW1oMThRZ2RvSkJ5VUNOUGpmQ1ZT?=
 =?utf-8?B?a2t1eTR2Ly8zSFB0dE85eXJhQlpzMW9KQnlWeGJoRVhzZzdQcVQwREZFM25L?=
 =?utf-8?B?WnZrVTBhczVibGlXbnZ4UzRkUm4rZjQ1RVMzZVlGb0JkUmprQnhZK0dmUkhq?=
 =?utf-8?B?akltY0pUc1VQUFRuYmlOd2YzcTQyelRRcEdqdWJKWEdUa2paQU10L0FpajNz?=
 =?utf-8?B?RGk2aFhCcWFDM01URnpMOUVoVGVXM2F4OFE4MUtweDZvNEpoYmpsOGhYV1pz?=
 =?utf-8?B?L3ZCZ2RUU2VRMlBpaW5HYVlJZVM2d0JNVkRydTcwa1JLNyt0U1dHUy9FVGta?=
 =?utf-8?B?OXBnd2cyRFU2SURLZ1JGSUNvNGhmc1J2elkyQlhqQnhBYkw1ZGVIL0FoT3U1?=
 =?utf-8?B?MzBRYXVCbmsvZzI5WG9QSGNFZnVaTGFad00yWllOR0sxNXNkTzhwYm9HMDZN?=
 =?utf-8?B?L3pQSGxKMDAvb1dQVS9iSDJ6MnhvVmNKdThKMkFScjY1UkRzY0tNZVdjdWow?=
 =?utf-8?B?aUR0R3I1L0lTV2dtSU1aSjlQUllZUnRveEN1WDhGbVhsZGQrSUVPdUU0bDVK?=
 =?utf-8?B?K0FyOXljVXlLVHBEV3RKalNPNVh2eEwzTStSZ2hrVWNOS1Q1N29pVlptU3BN?=
 =?utf-8?B?L1VFQkJpcjMrVUNzTkxXb3dqRTlvc01yMlg1OVE1a2s0NDhGOHh1bWM4ekg5?=
 =?utf-8?B?VDVlb0FrQXBNd2cveVRyMzdKQ1lVcWdBQXh3dlhGL21JQjl4c3VMaGF0NG5C?=
 =?utf-8?B?SW1yc3R0Ums1Tks4VHNPZkxQbzVQeWR0OWNhZGNBVFZQN0hPRW8xNXJyc0tP?=
 =?utf-8?B?Z0gvTll6T0Y4bGE4MjdmeXBnMWVraWMyT0EwWEZld1Vxb0JKKzBkRGY2U2Q5?=
 =?utf-8?B?UFQvQkpYUkVCazBVbktLcGFLbVVORzFnR2EyYTZpNW9xQ24vdU5rZTZzY1ZV?=
 =?utf-8?B?ODV1V1BhVkt3NVRLUTIzdUt1TjZlcHh5Um1TRGJuemdUUk5SNUxoWlg1cjZ3?=
 =?utf-8?B?SlhOazB1aktvcjhQM1NCaklPcVNqRmZIZUZWbjJqRVFTL2pPV3IvdSthNkEw?=
 =?utf-8?B?ZUhLdzhXMWNuWlZXenM1c0xIMFhvQjFMeFZ4K3hiRVR1a1FZcGtyL1prTzlR?=
 =?utf-8?B?L2hkamFnTnBoWXFVMnRzSWFmMWJGM1l0SFpvdEIrVjdYVlkvaE1sSEZkd2NI?=
 =?utf-8?B?UHkxcHNBenFCcTh1K0RyYm5paGEyV2wyZk53U3pWdFB3VmhnSWdZdkluaStY?=
 =?utf-8?B?TnYwVXNwcTF3M0xvSGlsYklqUjErcjJ6eTNVakQxMXpXOXI3eWJFeVYyODhM?=
 =?utf-8?Q?uF7O4zVwVkqDlNEVaUg46ind7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ce9db-249c-4a6c-d34b-08ddaa943935
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:06:15.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WI2SfIR17tmuDGMH32kdAPJuCLusZXS5nMfjvYDOO82Q9xEMFhzDjLFxVTFZ797
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492
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



On 6/13/2025 9:31 PM, Alex Deucher wrote:
> On Fri, Jun 13, 2025 at 10:42 AM Kenneth Feng <kenneth.feng@amd.com> wrote:
>>
>> move the dpm table setting back after featureenablemend due to dependancy.
> 
> What is the dependency?  Can you provide more details?
> 

For SMUv13.0.6, there is no pptable. We get all the frequency tables
from FW during this callback. Those frequency tables are available
through FW metrics and it needs DPM to be enabled.

Thanks,
Lijo

> Alex
> 
>>
>> Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
>> ---
>>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> index 824fcc6dd32a..cf4ac3914b68 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -1687,17 +1687,6 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>>                 }
>>         }
>>
>> -       /*
>> -        * Set initialized values (get from vbios) to dpm tables context such as
>> -        * gfxclk, memclk, dcefclk, and etc. And enable the DPM feature for each
>> -        * type of clks.
>> -        */
>> -       ret = smu_set_default_dpm_table(smu);
>> -       if (ret) {
>> -               dev_err(adev->dev, "Failed to setup default dpm clock tables!\n");
>> -               return ret;
>> -       }
>> -
>>         if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN5)
>>                 pcie_gen = 4;
>>         else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN4)
>> @@ -1739,6 +1728,17 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>>                 return ret;
>>         }
>>
>> +       /*
>> +        * Set initialized values (get from vbios) to dpm tables context such as
>> +        * gfxclk, memclk, dcefclk, and etc. And enable the DPM feature for each
>> +        * type of clks.
>> +        */
>> +       ret = smu_set_default_dpm_table(smu);
>> +       if (ret) {
>> +               dev_err(adev->dev, "Failed to setup default dpm clock tables!\n");
>> +               return ret;
>> +       }
>> +
>>         smu_init_xgmi_plpd_mode(smu);
>>
>>         ret = smu_feature_get_enabled_mask(smu, &features_supported);
>> --
>> 2.34.1
>>

