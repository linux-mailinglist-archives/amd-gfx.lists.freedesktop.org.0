Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F865A8B7D7
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Apr 2025 13:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0D610E8D5;
	Wed, 16 Apr 2025 11:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yHcDuRbm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6410E8D5
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Apr 2025 11:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jadVB0Mbh9UtyXTSv4TtL8y6aiHFt7aiF9kqzlrakG/XXlycj1Mr5dW49gxaQ+LuK6szM+ONtffeT693HG2VDwxev//bJOLjK0hbmtC51xePS7blup+YeiJgmujXc+OuPR5NGw/CwP6YUUliZqVbGETgjSd0tJ8uchVQk0ZZ19eAT6yWMtBxBiS+vaXfi5GzEC8RG/OjuEg+PfCKw18k4AJwqpoERAnIWjbwizKe1gAtekPdC7uhgxC5kkNAtbGaCARPaxKt10ZF4ijpyaxHHAGyyF21yTvYZHYfcuRdceFSOxdELGmYSlc7D0JXy+G/7I2+vm9X3AuN7AZxW6kQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMDcwmY7mqYdDwj2BAgY9dlCOHmNLOw9h2ZSSLKrbQQ=;
 b=jhAP6HlU4hDx3FDH0cu2lJ1pz23imQhxdEZC8ZSKNB6z4K/NjuEIKkvfULVoGT47z2WXqYiilR3Ez5hEF3+gdSua2tqNtmxp3sUICQTtl+JvDySDfdoLjK/pw2ukafkkCGRNrqqelToY21oDqe/24/r0l2oWrW7+9FYA2ypD6GErjcDyNWiIC0rvjEs8Jfm9BMtEYw57Uztod8nWOqEQsbp2pXAgrp4r4fkY2yBbBpIY0F3/h9u+FNHOmerZyLmeKaHxDErEJbSERQbCq4OYtpWJ4PHvR5zFyF+kduZlyaSknRIYhszB8t11appxISgp439K7oKGdqo92uEXFfZuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMDcwmY7mqYdDwj2BAgY9dlCOHmNLOw9h2ZSSLKrbQQ=;
 b=yHcDuRbmYzRskBsnKeKHFR5JseQhq/UIrO4q6H2VCBQGI5BCUeHpUpbVs0NeMDJY0j6XU/N6jZ48kjEmJLAiWxAanZi1sAncvmT6J5eWfn4F2WXDg+uwGqQdgOL2elypOVPiSPb2lVoqkz2v53E1zcO0n6UJWSvyklnbmUsoo3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 11:44:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 11:44:18 +0000
Message-ID: <1567c4e7-fd5c-42d4-8278-e1bba2ce46cc@amd.com>
Date: Wed, 16 Apr 2025 13:44:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] amdgpu: async system error exception from
 hdp_v5_0_flush_hdp()
To: Alexey Klimov <alexey.klimov@linaro.org>, alexander.deucher@amd.com,
 frank.min@amd.com, amd-gfx@lists.freedesktop.org
Cc: stable@vger.kernel.org, david.belanger@amd.com, peter.chen@cixtech.com,
 cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org
References: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eabf28f-50f5-4ad8-e1e0-08dd7cdc0581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEdkOEdBU1gxQXlpNFdsV0pQR3YxSnpRTElmNUo1NUtZcHNRK2hhdk1QaGxQ?=
 =?utf-8?B?MUk2YVBlZFZ6cmZnMkl3NnZmNDNXeExMWXNXQWRaNmFxcWR3UHNPT0xJVWVG?=
 =?utf-8?B?MmlQUDRQdFU2R2x0blBQbDFFMUFidXhGeE1aWVgyVXVNekVsMzQ4RDVqS3lT?=
 =?utf-8?B?UU5UNHp3bTl2bjdBblhHa1psOXF0QlZQNzhzWTFMVUp6bktoeHBnOXFlSWYz?=
 =?utf-8?B?b1g3L0tOWWl3SW9wYjNJSTY2TzJSRVRQZGhHUEo2YVhyenVoK3FnZ3NDd0w1?=
 =?utf-8?B?cmJ5aG44VUZaeGVTRmsxcXZHN0FXSDdIQzVHY1FIN3dKY3U2TEpEYUdhSHc3?=
 =?utf-8?B?cVh2cDE4RUZTaGNwdStzMHZpTjFVdmUvSWxaNGc4b043aG55QVZPRThQUHpQ?=
 =?utf-8?B?dmxjeHo2L1dXeFJ3ajJSckVuNjdUcmRrb2JCNVBzTzJ2VjFxWE5VdTAvcWQ2?=
 =?utf-8?B?QUNHQitqSzMwS1FBUXQydWhLT2ROWnJHUWZPM1BLTzlLRFphdlltczk0ZVJw?=
 =?utf-8?B?aXRxZk1mcnBkVHAvRWYrM0N5TVFlaHFEZWwwSnFmRlh2YXlZTUFIakpIMENH?=
 =?utf-8?B?L21zRXJjMXFWZnloQUYvdUMzc054RXRYNVNic051bTcxb2hRYVJhbjd1MGNv?=
 =?utf-8?B?bkx4MlRtOXc3UFY4SW8wc2kxYkxNT2hFTjErWjJsOVhacG5mM0xuWU5tYVkw?=
 =?utf-8?B?UzlwWHVackdVeVF4REFPNEZqQmVIV1NLNUE0aS9hQW0rdWpKMytydGM1L1dr?=
 =?utf-8?B?REl6bkMxdk5HNFQ0OTdHbm9WWTVTUG4veGhCWUFjZU9BTzVMNGUyL1JwM2Jr?=
 =?utf-8?B?bmF6blB1Z0l0dFFaN2dQSGpFaWQvZjVmbjk4T3JaOVVNYldPcmVWZnZrT05z?=
 =?utf-8?B?TTdWRlFDK2Uxc3ZiaUtrdnJiMS9XUFVLbCtMYUpuRldRcUJ1WnpvaW9xdDY1?=
 =?utf-8?B?eUNVMERzaVh2eHQ4WExqVzQ2c3dnRnRtVGpmK2tucGdQbzE1UDlpSkpqT29Q?=
 =?utf-8?B?VTVlYU9uajR4VVNpME9EYmtFVndtdGhMcGNjaWNPYkJIYzJwZFdUZHRkOE0z?=
 =?utf-8?B?ZzJveHdUc2JPNWVhY3RPd0NMY0tBT04wbDRLU2ROS28rRU9RQUc5RG54NUNI?=
 =?utf-8?B?cXluQzJpK2JXMGtFTjRxZkczQ0UwVnE0VXNaUTM1dmtPUDFiK2ZXR1kxSlFV?=
 =?utf-8?B?WHNQS3MvYkxMWFdSdnZrdjlOaTEvTG9RZ2J4RlQ2bWw2akgxUCtEanBLdUZu?=
 =?utf-8?B?WmNzOGxKWDlPdDlweWpYOXRuc21ZVGwrSWpjNEFpeWtlMzZxVFdweFhSaDFj?=
 =?utf-8?B?d3Njd2xFbVBia29PMjUwYTZOdThjRUVVbjNPODc5N2F2ci8yM3NOejh4Vitx?=
 =?utf-8?B?a3hEYVRjQ3hpdHBtV01xRFV3RkFxcnE5OVJieUJkQ2ZHQjZseENSZUZ6RW9X?=
 =?utf-8?B?YnplNU1Kbkc1ekthaGl3dlVJVG1BTkNSNGh0Sk4ycC9JdE5KdzBkWEQ4OFhK?=
 =?utf-8?B?L3V2dmk5cVpCQng3RnN3aUZKMkdlb3dQNlBOdWdjL3JFT0ZSTDVZSXpJdHhS?=
 =?utf-8?B?NWtwRUlVNE1BVjNaUlZsc2FOS2tmNWE1RlZxWCtJcnUyRE5GUW1WQnJlekpl?=
 =?utf-8?B?QmswMEZ5ajNOYTg1K1czV2FrSDZDSXRsdjFzRzZtU3F3OFp3WHFNc0xvTStU?=
 =?utf-8?B?UHRJeFJKckdreSttemcvbFJadmhadTMzczRuaytieitLcmQzQmdUYzBXYUNK?=
 =?utf-8?B?K3lOT05nSzFFd3RrRFM3cG1DNlFRTEJqdUd5dmZVcjZtNTUvZTl4Z2RFWnVQ?=
 =?utf-8?B?eUdSVHI1UW83cS9rZ0wwRkcwdDBUbDZCUjFrWmpuOU9ZUzRZdFZ5TmxINTFU?=
 =?utf-8?B?RDhxYlYwQWFLQ0NNR2NNU3JkaSs5a21Sdi9yRW9lNVVxaVBLaHlnN3hBY0FS?=
 =?utf-8?Q?pugTNjk20JU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmh1Y1Blbi9LdTJyeGdyd2hJdkExQXdtU2RHdGJSV0dpNURHei9DUGIxNkND?=
 =?utf-8?B?T0RhbGdsNzQxdG9BY2pvaDJwbDFiSi9idTlORXMzcmRUaGJhK0FnZEFoUkxi?=
 =?utf-8?B?YVBIRVFtL0dXUERGNW5JaElFeFpNQzc5Q1psVERmZjZ4b2ZGVFFkSFpxTVlP?=
 =?utf-8?B?a0FEMVY5T2hzQWpRU3RmNVFITzNTeTIrWnRub1QyRlp3RHNvTDVIL2NHTWo0?=
 =?utf-8?B?K21pd0ltSW1pRks3dVhJbmRjYzA4R2FRcXVyOTBOdkEvaXNsYTFIVHJPeS8v?=
 =?utf-8?B?OHIrY2dkVURJcEFsb1BUYXRQVEExbWRudG8xejIvNjlaQjVNcm5SSmtmckxj?=
 =?utf-8?B?NEhMTDlNVXB1ZzZ1WGdFT2xGZkUrNEJrTUxJKzRQdUVuRXd2emhOd0hkbm9t?=
 =?utf-8?B?c0psTVhqUGg5WE5idmpvN2djUmJzdDFFZGtZdDFuTFljR1pJOTgvVlFOY29R?=
 =?utf-8?B?akRlZ015bG9za1lJajhRWjJlTkx0L20wVjJCSUJmcEhUWFE3YStzVnhRajlo?=
 =?utf-8?B?WGorY2lmTElEV2ROWC9rdXRrWVpSUTMveFByYmtRNDZsUmtyZU83c2tRTTVG?=
 =?utf-8?B?MExLb3R2Q2hjYkdwZFlYcnhZbGIreVE0VElGRU0zaTRPd3QzSEJiR29zRGJB?=
 =?utf-8?B?N2N3QkhVbGZxaXdIWTlqVVJKSlYyQ05od1VLMkYxZEdIZ3M4aVg3aDd0UFdP?=
 =?utf-8?B?K1VMWHBVSi9WRTNWazdHZTRBR2VwaUMrSGtFcmJoTVc1eHl3Vk1vM21hRGl1?=
 =?utf-8?B?RGVJdVNSOHZqdkZQZEtucUpNUmtkbEFVTjl4M2l0dHJMZmtXVDR3UEhsNnhw?=
 =?utf-8?B?SHBEU2o4TG9NMy83Zmx1TU5YZ0pKMWY3Z1BmSXZCcWtSM2ZnUFlFbnJleGdU?=
 =?utf-8?B?S09ZeWsrcytETTNOeS9yQ3pBUDZRY2o0ZVhOeFczSmpIQ1h6bTBtUXlyWnVD?=
 =?utf-8?B?bXRZcW13UFNXbVRpMDIzaFVMUjJwUUtMZmtwbTBKR1VpRzlVbW9heVdOSGJx?=
 =?utf-8?B?ckErNTVPT1N4UmhFZGRMVnhvWmszQlVRcGJaQ0t6d1F6dHUwaEZTa00xdnlQ?=
 =?utf-8?B?Rlp5SUZUL0wzbkZoSW5wYmdSaGw5Y2diblZpdVhpT2VDb2p1QTJBVUEwelRW?=
 =?utf-8?B?a2pQZ2VjNHJUS1BWRVNlMm5aR2ZzU1hWc05tZmhxTzlBMXFPRmxTVmxxektY?=
 =?utf-8?B?U3I2ZE1MYWRCd1dreExOdUJNMm92R0RhQXhuZWZxQ1N4QktrS2VUZ2FMMU5O?=
 =?utf-8?B?dlh0ZlVmbGcvNVhVcm9hQTI5d1JQRUZMd2hGYlVDMkdBMThtNVljVDBUamtF?=
 =?utf-8?B?RURhcXE2N2VJTThUakRLdGUzSXpWVjVKUm5xajVYU2pjOHFFWGI2RmxKcVpw?=
 =?utf-8?B?aXJIUkdwWlFEUmF5RzJsQmMvS1FVWThWRGUwVFQwNlkrWW1yTjBheUorc0hS?=
 =?utf-8?B?RG1Ua0N4ekVFdFNpdUxlZ1Y2UTBUVjJGb213N1FNK1ByQnNhZE9VVVNGMFgr?=
 =?utf-8?B?M1dKWW5hUlozUTd0eWFZcDFJSERZOVdrZWkrTERXWUhXVlU2S2VucGdZMi9z?=
 =?utf-8?B?VS9tOElmSFk0QjBCWWZiNkpsblZ3QWxLWTQ1RHNxVFphUTd1cWx4V1BMK1py?=
 =?utf-8?B?c3prN2FlSEVtOXpjMFAybEtJSXQzdDZtTlBRM3VoUTRNNE5WN0xLS0phVTc4?=
 =?utf-8?B?VzU0OHc3QWJ5TjhmRTZaSnV2ZDlFRXQ4UGNhQjlKbk9oRDNpQkl2V0Fjdi9D?=
 =?utf-8?B?d1hDVkt2cVRIdnJsL1p5V0cweFhhTnhtNWg2c3F2cUE0alhNcWhGSEkzMFQz?=
 =?utf-8?B?WTlQdHYwaEg4SVpQN0RLaUZGdTQ5amxDWmovR2xSVFB2SlZsZkxoaTliT3Zl?=
 =?utf-8?B?WnV1aUkwaWs2YUtDMGI4VFFqZ01DQnlLRW1MOXRSNVBGeEl5ZVkvek1UM1Q4?=
 =?utf-8?B?WW01MHNMUlVjL0tJb05UVDNmdEkrak5rUUJoVEJaa0psd2pVSjF3d3FHTzdH?=
 =?utf-8?B?WXJsM3R3SkJ4R1BCblg1R0JkaHFFditaSFBZN00zOVJqT0NlMW5uQUVOcGd3?=
 =?utf-8?B?eHBjWHp2U0h3eCtSUk1wTkpSWk55Vit1RmZTVTBBdE5VbVg3QW8yenJCS0hR?=
 =?utf-8?Q?Z/MPQDLLg8qa3dMMOqwfW9ffY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eabf28f-50f5-4ad8-e1e0-08dd7cdc0581
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 11:44:18.5889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HH2i8h34YBrBlfXDPxIR6Q7gMghX04uBGq0N7IEjU1rA5bnN/8W2pEByQ+zdK9a0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
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

Am 15.04.25 um 20:28 schrieb Alexey Klimov:
> #regzbot introduced: v6.12..v6.13
>
> I use RX6600 on arm64 Orion o6 board and it seems that amdgpu is broken on recent kernels, fails on boot:

Well in general we already had tons of problems with low end ARM64 boards. So first question of all is that board SBSA certified?

If not then the chances of that board actually working correctly are very low unfortunately.

> [drm] amdgpu: 7886M of GTT memory ready.
> [drm] GART: num cpu pages 131072, num gpu pages 131072
> SError Interrupt on CPU11, code 0x00000000be000011 -- SError

Any idea what that error code means?

Thanks,
Christian.

> CPU: 11 UID: 0 PID: 255 Comm: (udev-worker) Tainted: G S                  6.15.0-rc2+ #1 VOLUNTARY
> Tainted: [S]=CPU_OUT_OF_SPEC
> Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Orion O6, BIOS 1.0 Jan  1 1980
> pstate: 83400009 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : amdgpu_device_rreg+0x60/0xe4 [amdgpu]
> lr : hdp_v5_0_flush_hdp+0x6c/0x80 [amdgpu]
> sp : ffffffc08321b490
> x29: ffffffc08321b490 x28: ffffff80b8b80000 x27: ffffff80b8bd0178
> x26: ffffff80b8b8fe88 x25: 0000000000000001 x24: ffffff8081647000
> x23: ffffffc079d6e000 x22: ffffff80b8bd5000 x21: 000000000007f000
> x20: 000000000001fc00 x19: 00000000ffffffff x18: 00000000000015fc
> x17: 00000000000015fc x16: 00000000000015cf x15: 00000000000015ce
> x14: 00000000000015d0 x13: 00000000000015d1 x12: 00000000000015d2
> x11: 00000000000015d3 x10: 000000000000ec00 x9 : 00000000000015fd
> x8 : 00000000000015fd x7 : 0000000000001689 x6 : 0000000000555401
> x5 : 0000000000000001 x4 : 0000000000100000 x3 : 0000000000100000
> x2 : 0000000000000000 x1 : 000000000007f000 x0 : 0000000000000000
> Kernel panic - not syncing: Asynchronous SError Interrupt
> CPU: 11 UID: 0 PID: 255 Comm: (udev-worker) Tainted: G S                  6.15.0-rc2+ #1 VOLUNTARY
> Tainted: [S]=CPU_OUT_OF_SPEC
> Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Orion O6, BIOS 1.0 Jan  1 1980
> Call trace:
>  show_stack+0x2c/0x84 (C)
>  dump_stack_lvl+0x60/0x80
>  dump_stack+0x18/0x24
>  panic+0x148/0x330
>  add_taint+0x0/0xbc
>  arm64_serror_panic+0x64/0x7c
>  do_serror+0x28/0x68
>  el1h_64_error_handler+0x30/0x48
>  el1h_64_error+0x6c/0x70
>  amdgpu_device_rreg+0x60/0xe4 [amdgpu] (P)
>  hdp_v5_0_flush_hdp+0x6c/0x80 [amdgpu]
>  gmc_v10_0_hw_init+0xec/0x1fc [amdgpu]
>  amdgpu_device_init+0x19f8/0x2480 [amdgpu]
>  amdgpu_driver_load_kms+0x20/0xb0 [amdgpu]
>  amdgpu_pci_probe+0x1b8/0x5d4 [amdgpu]
>  pci_device_probe+0xbc/0x1a8
>  really_probe+0xc0/0x39c
>  __driver_probe_device+0x7c/0x14c
>  driver_probe_device+0x3c/0x120
>  __driver_attach+0xc4/0x200
>  bus_for_each_dev+0x68/0xb4
>  driver_attach+0x24/0x30
>  bus_add_driver+0x110/0x240
>  driver_register+0x68/0x124
>  __pci_register_driver+0x44/0x50
>  amdgpu_init+0x84/0xf94 [amdgpu]
>  do_one_initcall+0x60/0x1e0
>  do_init_module+0x54/0x200
>  load_module+0x18f8/0x1e68
>  init_module_from_file+0x74/0xa0
>  __arm64_sys_finit_module+0x1e0/0x3f0
>  invoke_syscall+0x64/0xe4
>  el0_svc_common.constprop.0+0x40/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x34/0xd0
>  el0t_64_sync_handler+0x10c/0x138
>  el0t_64_sync+0x198/0x19c
> SMP: stopping secondary CPUs
> Kernel Offset: disabled
> CPU features: 0x1000,000000e0,f169a650,9b7ff667
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
>
> (bios version seems to be 45 years old but that is the state of the board
> when I received it)
>
> Also saw this crash with RX6700. Old radeons like HD5450 and nvidia gt1030
> work fine on that board.
>
> A little bit of testing showed that it was introduced between 6.12 and 6.13.
> Also it seems that changes were taken by some distro kernels already and
> different iso images I tried failed to boot before I bumped into some iso
> with kernel 6.8 that worked just fine.
>
> The only change related to hdp_v5_0_flush_hdp() was
> cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing HDP
>
> Reverting that commit ^^ did help and resolved that problem. Before sending
> revert as-is I was interested to know if there supposed to be a proper fix
> for this or maybe someone is interested to debug this or have any suggestions.
>
> In theory I also need to confirm that exactly that change introduced the
> regression.
>
> Thanks,
> Alexey
>

