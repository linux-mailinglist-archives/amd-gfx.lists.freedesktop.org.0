Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19263AF73E
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 23:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5666E1B5;
	Mon, 21 Jun 2021 21:14:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1D56E1B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 21:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAxkot6s7nKJrHsLW6fyUaAomJsouSxbmftru/5+2ajn3S9Apb6v+mYCIhs8SOMUMD+QIQtMTvnx/4Wi6v/hCj2BTQSS4ZY+GKts71kFdLfCo8Qs+DX+3dt1gJDxATxgQTb0pmtQf/Gwq56jaaCp/A81TQiewfMhzF6QTT/e7X1qDR2qdRGYRNCxu/6/69HiLfz5zMjKisADGtC8m2wJHRxz3j4v8w6+tQkhiiOsfL5JZAObroWnxWnsJLKg7vAslfeHrgY1MuGyYtYytlJ1POxRyLZglkazZFvam2mkICZP3bsy9S5iegV+i+auo5z2j2cGj3fqs2ZuJAwNfWU/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usmsjN4/JAUlm8JY/9PFVpbbatiEJLwFVQ2VHNm12V4=;
 b=Yf0mMNNIoxV9c3xafRZWGSG2actEBYRdpIOzX8lKOWWqXW4XyGgjRhLJgGqvH8vyX+aDIYcCRBQ9fd523HNGhuVyDBH6uOuToqo3rfIBBgdwMx8iSvL8hChorVyTDlxgVWTR69kNVlkQgLTmKuZLXPdumI0L8vM3WTBio28tmDehaLaRxRojst66cyV8VklUMPg56e6lgmC+pdzRwZ7pwHNQVa94FVzb6EP3NapAUiljWsKM4niz7kT0ktLbErsTB0rNYRPLt124FdAQga4t0W7UXol9rfwGur1P1n0D39Y8XXETxslgevSiQW9anyi9kZDlRPkLtI+1kgaVFqMRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usmsjN4/JAUlm8JY/9PFVpbbatiEJLwFVQ2VHNm12V4=;
 b=N+hX8uWgEJEQCqH5Eag72q/keBp5bVe5eAc2YZxSoGaJAbxouVIfNIceyj1rJPhPhyrLSzlkx9Jy/8oI2l/7TI5OkVkt9IEMIu6D81cJPuiKW9Wg+QhiU1cQUQ7aweXWzSfbffNxwuuVoUjyayyj/EjzeRcT7ZjF6sUG5Dsr2hs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by DM6PR12MB5550.namprd12.prod.outlook.com (2603:10b6:5:1b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 21:14:20 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::ddd9:c1d8:d935:ca29]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::ddd9:c1d8:d935:ca29%6]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 21:14:20 +0000
Subject: Re: [PATCH] drm/amdgpu/display: fold DRM_AMD_DC_DCN3_1 into
 DRM_AMD_DC_DCN
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210621205809.1503370-1-alexander.deucher@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <f2a8b870-9cb6-7453-d3a5-2fd8d1f44bfd@amd.com>
Date: Mon, 21 Jun 2021 17:14:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210621205809.1503370-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To DM4PR12MB5182.namprd12.prod.outlook.com
 (2603:10b6:5:395::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.16.155] (165.204.54.211) by
 YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 21:14:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ae98a6a-77b0-45a3-9922-08d934f988e5
X-MS-TrafficTypeDiagnostic: DM6PR12MB5550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB5550D4B5F8AF9C83D01E21B1EC0A9@DM6PR12MB5550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQq2Z6qTbCL/x9f7q069UUmmiZEUHjXeHgkdkN6u2MsIRqzs925sB2PbZxCDOujF+9kFhvW3tVsla540wD9VGD8z0n+EjbyOD+nW1l9755Q+U5T+ojjTv6KwZZl6vjdUvTPFSXMzUvaJn4E+FJd6qjE4mVpP+rBwUKFwFTh9Y9AxVA1yHUhFA4Hy2HHIndXsFOX06UH7dG5Z7npRTZ/1jGDUQ6Pgq2kHHw7J/ItYrsG10fhADkdRheqGDeCrgXYqkigfumyXI1arjvTYkpu5dOB4BWFw0Yrqw5THSMMjSlW2kzaySHIN8znsmJ10yDLxipgi60dY+nIakgIUnpXrn96IOJ2v6ggLm/gH4BvyQ4aEc8keLkaWv0ah12da5qMASxitJHPQwaKWxdvSW1tX1KtCuWl9VA2bHdSvtWklL1SUCAERPgFwYNgKFr+Ryy2r4ejSOonPgnYjogNyorgFQJfx3x6YJmj/GOQyqclKNvp2QK/s07tL0SdWXk3ccCu+yoMkW0Y5nbg/PFhiQPtPvcrLdUG2fNCs44ZgcPgzvm9sV7fh2U6hYY3nVOQP663N1FhlZ2lccqYneWrG4TWiV89Jm9JCyW49J77Zawoe3vKD/YyZANikBL5t7egTqC5Q0m2l/eVqo4hTH9qQLPxjuLMX26i+O425zmA7f9C7SgRruhrSFGzlR4/WWeLQHkja
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5182.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(38100700002)(66946007)(16576012)(956004)(26005)(30864003)(53546011)(31686004)(83380400001)(2616005)(316002)(16526019)(186003)(2906002)(8936002)(478600001)(66556008)(66476007)(86362001)(36756003)(8676002)(31696002)(6486002)(5660300002)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkVKRXFOUVh4aVhQQTlFNHlKUnRrOUREMTJ3dkJYTVRPL20xWi9jRzh0by9F?=
 =?utf-8?B?VUdua3BIKzIwMWZTYTM5Q1Y3MlJ1T2o4eGdyUk96bjNXS2xqS0tLOEw4ZHlU?=
 =?utf-8?B?alFHMFR6QnJaM2JVK24rZW9DeTFhUmdaaWswMWJmRXdpRXVhUklud2RxM1Nh?=
 =?utf-8?B?aGljdk5Cd2YzbW1CR056OEE2c0YvZHZvVmdFQ2NqYlRYc3pEWkZyWU5zK3NC?=
 =?utf-8?B?UmJIR2R1Q1FqemRoZ0JSaXlGbjVKSUtNOFFWcDB2MmQvU3BUTjlZMWdydXo1?=
 =?utf-8?B?dVo3QjFNY1U0TVZGWnV4Tit3RmkvcEhJWERRQ2VBSXNHdm91QXVwbFV2SDNU?=
 =?utf-8?B?T1hZSHVxRzlGYTVtRU0weFYzRTVDY0VsSUdON0F2RXYwTmxuTURkbU1ERTF3?=
 =?utf-8?B?bjZhSmlTclU0Z09ReFdSMU9GWnVxS0t3OHAyYlpkUnZMVlZXdkRrdGVkM0pI?=
 =?utf-8?B?VHZ0N3orZ2M2ekF3YWF3ejRJZVo1U1NoaXhuc2JyOG1Sc1RMUGswVGg2bzBz?=
 =?utf-8?B?NlgxWnFXeU1FU01hL1RqTFVpQ2txdmFzM09aQVF0U2IvRGhyWG5lY3YyOWtC?=
 =?utf-8?B?cllyVVRjTGd0eTBRUVpCdUpNQUo4RTZURlE1THNTd09uS1R0MmFMWlNrby93?=
 =?utf-8?B?b2hlVU5EUk9SaW5FbTk3QWN5aEExRndDY1o4MXlmZVlvU2c4ZXVIZnBicHhp?=
 =?utf-8?B?Wk5jb3YrdCs0M0Jwak42ZTk0VVhoU0QwbDRYUElRcDRTYW5RbG12R2RGS0V1?=
 =?utf-8?B?V05TaTkrbkZJK0ZwMi9ySzJzUW4yUmVaZWNONDJnRDR3dlpCcU1kZVdTZmUr?=
 =?utf-8?B?MTNVT1Q2dDdMb2lKbFQ4bDhZZkZ5Tk1LM3oyN3FFeTJ4N0YrRUM0dnovN1BG?=
 =?utf-8?B?RkkwVENIR09SbGNoMjNxMkI4T0p6Si94WFhvaHMzQWFrUkQ1b2JKQkIveWtD?=
 =?utf-8?B?L1pRRHhSOVFmTTVjSmdIdXo3cVQxQjg4bWd2eDJiN3dzUngrTzhPM0ppWHBq?=
 =?utf-8?B?QWFhdG9GcW1xSTVaTDFyK2Q2U3RnUlM1Szk5M1NwcXpzdjE4U1lKNVltRWtR?=
 =?utf-8?B?YWlwdG5aWkxsSjd4OWpFTkdxeFgyUEJ6dElReVJVRHNvaTRDVkxEbWhvSCt0?=
 =?utf-8?B?M2pJaU9tbkxrV2FTa0k0ZFpkZGtjMGNMeG1LWnQ2S1ZRdkg5ajEvdEtUNnds?=
 =?utf-8?B?NHVpdWlrZUV5R1l0a1NxTXhBK2k5eGtTZlBNY3JacWRDbENTSlpqQmNuSGhn?=
 =?utf-8?B?Z2ZoTTlqYlpnTjNLUlNOS25ud2w1a0ZJOUhlTkNxWW9MUFhOV2d0YXF3NHVs?=
 =?utf-8?B?SWFTU0xqWUNUU1hYb3VLcDJoWFRGdDRFeHBvNXhuWndiYnNnMGNzS3RiMndy?=
 =?utf-8?B?UWNkenNtbG9jK3ZKWnBleFp4UjA1OFZyOGVpRzJpb1FHdXRjdUFrZWhvZEVm?=
 =?utf-8?B?djJ5S1ZnaGVYd0ZiNExiakFWU29FOHlXVkRIdmNaRk1UNlh2aXpVQjBnVHkr?=
 =?utf-8?B?KzNKTFdZTFZnSnBnUHVBRU0xWGt0UC9QV3BheGdHTnJ2YlRPdjI4QWZQTE1B?=
 =?utf-8?B?Z1hsajcwZ3pKcHozcHpGMlliRUpvcHVvNVRMamNqa01KUHRDVTcray9ZYlBE?=
 =?utf-8?B?SVh5empveWk1WDlkUUpxNnFHbFZHVzlSdlBjTlFaMkVDL2srdTN2M1lCeTFm?=
 =?utf-8?B?d3RKOVU4bjhmcjM0MUxkVHc1T3dwTUtCcFAvMHFhRmdPam9PQkRpY0dEREZY?=
 =?utf-8?Q?VqJ1pl7ZumC2wnF3UWu2aDYwotCcHU6g0s8lpNm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae98a6a-77b0-45a3-9922-08d934f988e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 21:14:20.0862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UTGl0dNCY4BxGU9xyFoH0OFxyLZrAcSsDkkQRQ5Pg+MKy7JMKtBf+f3ZG5/1Vw6l0HTiOrTAtOFB+IyhKUkZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5550
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2021-06-21 4:58 p.m., Alex Deucher wrote:
> No need for a separate flag now that DCN3.1 is not in bring up.
> Fold into DRM_AMD_DC_DCN like previous DCN IPs.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Regards,
Nicholas Kazlauskas

> ---
>   drivers/gpu/drm/amd/display/Kconfig           |  7 ------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 +------------------
>   .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |  4 ----
>   drivers/gpu/drm/amd/display/dc/Makefile       |  2 --
>   .../drm/amd/display/dc/bios/bios_parser2.c    |  7 +-----
>   .../display/dc/bios/command_table_helper2.c   |  6 +----
>   .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  2 --
>   .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  7 ------
>   .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |  2 --
>   drivers/gpu/drm/amd/display/dc/core/dc.c      |  8 +++----
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c |  6 ++---
>   .../gpu/drm/amd/display/dc/core/dc_resource.c | 10 ++-------
>   .../gpu/drm/amd/display/dc/core/dc_stream.c   |  4 ----
>   drivers/gpu/drm/amd/display/dc/dc.h           | 14 +++++-------
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  3 +--
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |  3 +--
>   .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |  6 -----
>   .../display/dc/dce110/dce110_hw_sequencer.c   |  4 ++--
>   .../drm/amd/display/dc/dcn10/dcn10_hubbub.h   |  9 +-------
>   .../amd/display/dc/dcn10/dcn10_link_encoder.h |  9 +-------
>   .../gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h |  8 -------
>   .../drm/amd/display/dc/dcn20/dcn20_hubbub.h   |  2 --
>   .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h | 10 ---------
>   .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    | 19 +++-------------
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c | 16 ++++----------
>   .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  2 --
>   .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    |  2 --
>   drivers/gpu/drm/amd/display/dc/dm_cp_psp.h    |  2 --
>   drivers/gpu/drm/amd/display/dc/dml/Makefile   |  6 -----
>   .../dc/dml/dcn31/display_mode_vba_31.c        |  2 --
>   .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  3 ---
>   .../drm/amd/display/dc/dml/display_mode_lib.c |  9 ++------
>   .../drm/amd/display/dc/dml/display_mode_lib.h |  2 --
>   .../amd/display/dc/dml/display_mode_structs.h |  4 ----
>   .../drm/amd/display/dc/dml/display_mode_vba.c | 12 ----------
>   .../drm/amd/display/dc/dml/display_mode_vba.h |  6 -----
>   .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |  2 --
>   .../drm/amd/display/dc/gpio/hw_translate.c    |  2 --
>   .../gpu/drm/amd/display/dc/inc/core_types.h   |  6 -----
>   .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |  2 --
>   drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h  |  6 -----
>   .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |  2 --
>   .../drm/amd/display/dc/inc/hw/link_encoder.h  | 14 +++++-------
>   .../gpu/drm/amd/display/dc/inc/hw/mem_input.h |  2 --
>   .../amd/display/dc/inc/hw/timing_generator.h  |  2 --
>   .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  2 --
>   drivers/gpu/drm/amd/display/dc/irq/Makefile   |  2 --
>   .../display/dc/irq/dcn31/irq_service_dcn31.h  |  3 ---
>   drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |  8 -------
>   .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 14 +-----------
>   drivers/gpu/drm/amd/display/dmub/src/Makefile |  6 +----
>   .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  4 ----
>   .../gpu/drm/amd/display/include/dal_asic_id.h |  2 --
>   .../gpu/drm/amd/display/include/dal_types.h   |  2 --
>   .../drm/amd/display/modules/hdcp/hdcp_log.c   |  2 --
>   .../drm/amd/display/modules/hdcp/hdcp_psp.c   | 18 ++++-----------
>   .../drm/amd/display/modules/hdcp/hdcp_psp.h   | 13 ++---------
>   .../drm/amd/display/modules/inc/mod_hdcp.h    | 10 ---------
>   58 files changed, 45 insertions(+), 319 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 5b5f36c80efb..7dffc04a557e 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -31,13 +31,6 @@ config DRM_AMD_DC_SI
>   	  by default. This includes Tahiti, Pitcairn, Cape Verde, Oland.
>   	  Hainan is not supported by AMD DC and it has no physical DCE6.
>   
> -config DRM_AMD_DC_DCN3_1
> -        bool "DCN 3.1 family"
> -        depends on DRM_AMD_DC_DCN
> -        help
> -            Choose this option if you want to have
> -            DCN3.1 family support for display engine
> -
>   config DEBUG_KERNEL_DC
>   	bool "Enable kgdb break in DC"
>   	depends on DRM_AMD_DC
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d069661abe45..b5b5ccf0ed71 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -110,10 +110,8 @@ MODULE_FIRMWARE(FIRMWARE_VANGOGH_DMUB);
>   MODULE_FIRMWARE(FIRMWARE_DIMGREY_CAVEFISH_DMUB);
>   #define FIRMWARE_BEIGE_GOBY_DMUB "amdgpu/beige_goby_dmcub.bin"
>   MODULE_FIRMWARE(FIRMWARE_BEIGE_GOBY_DMUB);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   #define FIRMWARE_YELLOW_CARP_DMUB "amdgpu/yellow_carp_dmcub.bin"
>   MODULE_FIRMWARE(FIRMWARE_YELLOW_CARP_DMUB);
> -#endif
>   
>   #define FIRMWARE_RAVEN_DMCU		"amdgpu/raven_dmcu.bin"
>   MODULE_FIRMWARE(FIRMWARE_RAVEN_DMCU);
> @@ -1145,16 +1143,10 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>   		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
>   			init_data.flags.disable_dmcu = true;
>   		break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	case CHIP_VANGOGH:
> -		init_data.flags.gpu_vm_support = true;
> -		break;
> -#endif
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case CHIP_YELLOW_CARP:
>   		init_data.flags.gpu_vm_support = true;
>   		break;
> -#endif
>   	default:
>   		break;
>   	}
> @@ -1411,9 +1403,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
>   	case CHIP_DIMGREY_CAVEFISH:
>   	case CHIP_BEIGE_GOBY:
>   	case CHIP_VANGOGH:
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case CHIP_YELLOW_CARP:
> -#endif
>   		return 0;
>   	case CHIP_NAVI12:
>   		fw_name_dmcu = FIRMWARE_NAVI12_DMCU;
> @@ -1532,12 +1522,10 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>   		dmub_asic = DMUB_ASIC_DCN303;
>   		fw_name_dmub = FIRMWARE_BEIGE_GOBY_DMUB;
>   		break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case CHIP_YELLOW_CARP:
>   		dmub_asic = DMUB_ASIC_DCN31;
>   		fw_name_dmub = FIRMWARE_YELLOW_CARP_DMUB;
>   		break;
> -#endif
>   
>   	default:
>   		/* ASIC doesn't support DMUB. */
> @@ -2232,7 +2220,7 @@ static int dm_resume(void *handle)
>   					= 0xffffffff;
>   			}
>   		}
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   		/*
>   		 * Resource allocation happens for link encoders for newer ASIC in
>   		 * dc_validate_global_state, so we need to revalidate it.
> @@ -3786,9 +3774,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   	switch (adev->asic_type) {
>   	case CHIP_SIENNA_CICHLID:
>   	case CHIP_NAVY_FLOUNDER:
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case CHIP_YELLOW_CARP:
> -#endif
>   	case CHIP_RENOIR:
>   		if (register_outbox_irq_handlers(dm->adev)) {
>   			DRM_ERROR("DM: Failed to initialize IRQ\n");
> @@ -3893,9 +3879,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   	case CHIP_DIMGREY_CAVEFISH:
>   	case CHIP_BEIGE_GOBY:
>   	case CHIP_VANGOGH:
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case CHIP_YELLOW_CARP:
> -#endif
>   		if (dcn10_register_irq_handlers(dm->adev)) {
>   			DRM_ERROR("DM: Failed to initialize IRQ\n");
>   			goto fail;
> @@ -4067,13 +4051,11 @@ static int dm_early_init(void *handle)
>   		adev->mode_info.num_hpd = 6;
>   		adev->mode_info.num_dig = 6;
>   		break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case CHIP_YELLOW_CARP:
>   		adev->mode_info.num_crtc = 4;
>   		adev->mode_info.num_hpd = 4;
>   		adev->mode_info.num_dig = 4;
>   		break;
> -#endif
>   	case CHIP_NAVI14:
>   	case CHIP_DIMGREY_CAVEFISH:
>   		adev->mode_info.num_crtc = 5;
> @@ -4311,9 +4293,7 @@ fill_gfx9_tiling_info_from_device(const struct amdgpu_device *adev,
>   	    adev->asic_type == CHIP_NAVY_FLOUNDER ||
>   	    adev->asic_type == CHIP_DIMGREY_CAVEFISH ||
>   	    adev->asic_type == CHIP_BEIGE_GOBY ||
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	    adev->asic_type == CHIP_YELLOW_CARP ||
> -#endif
>   	    adev->asic_type == CHIP_VANGOGH)
>   		tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
>   }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> index 64c6ed50990d..e63c6885c757 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> @@ -467,13 +467,11 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
>   	display->dig_fe = config->dig_fe;
>   	link->dig_be = config->dig_be;
>   	link->ddc_line = aconnector->dc_link->ddc_hw_inst + 1;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	display->stream_enc_idx = config->stream_enc_idx;
>   	link->link_enc_idx = config->link_enc_idx;
>   	link->phy_idx = config->phy_idx;
>   	link->hdcp_supported_informational = dc_link_is_hdcp14(aconnector->dc_link,
>   			aconnector->dc_sink->sink_signal) ? 1 : 0;
> -#endif
>   	link->dp.rev = aconnector->dc_link->dpcd_caps.dpcd_rev.raw;
>   	link->dp.assr_enabled = config->assr_enabled;
>   	link->dp.mst_enabled = config->mst_enabled;
> @@ -657,12 +655,10 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
>   		INIT_DELAYED_WORK(&hdcp_work[i].property_validate_dwork, event_property_validate);
>   
>   		hdcp_work[i].hdcp.config.psp.handle = &adev->psp;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   		if (dc->ctx->dce_version == DCN_VERSION_3_1) {
>   			hdcp_work[i].hdcp.config.psp.caps.dtm_v3_supported = 1;
>   			hdcp_work[i].hdcp.config.psp.caps.opm_state_query_supported = false;
>   		}
> -#endif
>   		hdcp_work[i].hdcp.config.ddc.handle = dc_get_link_at_index(dc, i);
>   		hdcp_work[i].hdcp.config.ddc.funcs.write_i2c = lp_write_i2c;
>   		hdcp_work[i].hdcp.config.ddc.funcs.read_i2c = lp_read_i2c;
> diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
> index 34fc36e77595..943fcb164876 100644
> --- a/drivers/gpu/drm/amd/display/dc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/Makefile
> @@ -34,10 +34,8 @@ DC_LIBS += dcn30
>   DC_LIBS += dcn301
>   DC_LIBS += dcn302
>   DC_LIBS += dcn303
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   DC_LIBS += dcn31
>   endif
> -endif
>   
>   DC_LIBS += dce120
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 840d7aca17cf..6dbde74c1e06 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -576,13 +576,11 @@ static struct device_id device_type_from_device_id(uint16_t device_id)
>   		result_device_id.device_type = DEVICE_TYPE_LCD;
>   		result_device_id.enum_id = 1;
>   		break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   
>   	case ATOM_DISPLAY_LCD2_SUPPORT:
>   		result_device_id.device_type = DEVICE_TYPE_LCD;
>   		result_device_id.enum_id = 2;
>   		break;
> -#endif
>   
>   	case ATOM_DISPLAY_DFP1_SUPPORT:
>   		result_device_id.device_type = DEVICE_TYPE_DFP;
> @@ -2162,7 +2160,6 @@ static enum bp_result get_integrated_info_v2_1(
>   	return BP_RESULT_OK;
>   }
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   static enum bp_result get_integrated_info_v2_2(
>   	struct bios_parser *bp,
>   	struct integrated_info *info)
> @@ -2262,7 +2259,7 @@ static enum bp_result get_integrated_info_v2_2(
>   
>   	return BP_RESULT_OK;
>   }
> -#endif
> +
>   /*
>    * construct_integrated_info
>    *
> @@ -2310,11 +2307,9 @@ static enum bp_result construct_integrated_info(
>   			case 1:
>   				result = get_integrated_info_v2_1(bp, info);
>   				break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   			case 2:
>   				result = get_integrated_info_v2_2(bp, info);
>   				break;
> -#endif
>   			default:
>   				return result;
>   			}
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> index 3ac4dc01f8e1..cb3fd44cb1ed 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> @@ -72,13 +72,9 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
>   	case DCN_VERSION_2_1:
>   	case DCN_VERSION_3_0:
>   	case DCN_VERSION_3_01:
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> -	case DCN_VERSION_3_1:
> -		*h = dal_cmd_tbl_helper_dce112_get_table2();
> -		return true;
> -#endif
>   	case DCN_VERSION_3_02:
>   	case DCN_VERSION_3_03:
> +	case DCN_VERSION_3_1:
>   		*h = dal_cmd_tbl_helper_dce112_get_table2();
>   		return true;
>   #endif
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> index 713251547d1c..7fa0b007a7ea 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> @@ -135,9 +135,7 @@ endif
>   AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_DCN301))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
> -endif
>   
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   ###############################################################################
>   # DCN31
>   ###############################################################################
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
> index f652f491c419..bb31541f8072 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
> @@ -41,9 +41,7 @@
>   #include "dcn21/rn_clk_mgr.h"
>   #include "dcn30/dcn30_clk_mgr.h"
>   #include "dcn301/vg_clk_mgr.h"
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   #include "dcn31/dcn31_clk_mgr.h"
> -#endif
>   
>   
>   int clk_mgr_helper_get_active_display_cnt(
> @@ -273,9 +271,6 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
>   			return &clk_mgr->base.base;
>   		}
>   		break;
> -#endif
> -
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case FAMILY_YELLOW_CARP: {
>   		struct clk_mgr_dcn31 *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
>   
> @@ -325,12 +320,10 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
>   			vg_clk_mgr_destroy(clk_mgr);
>   		break;
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case FAMILY_YELLOW_CARP:
>   		if (ASICREV_IS_YELLOW_CARP(clk_mgr_base->ctx->asic_id.hw_internal_rev))
>   			dcn31_clk_mgr_destroy(clk_mgr);
>   		break;
> -#endif
>   
>   	default:
>   		break;
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
> index 9d1db74de36d..6e0c5c664fdc 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
> @@ -386,10 +386,8 @@ void dcn2_update_clocks_fpga(struct clk_mgr *clk_mgr,
>   	// Both fclk and ref_dppclk run on the same scemi clock.
>   	clk_mgr_int->dccg->ref_dppclk = clk_mgr->clks.fclk_khz;
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	/* TODO: set dtbclk in correct place */
>   	clk_mgr->clks.dtbclk_en = false;
> -#endif
>   	dm_set_dcn_clocks(clk_mgr->ctx, &clk_mgr->clks);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index be1dbd3136ec..605e297b7a59 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -1524,7 +1524,7 @@ static uint8_t get_stream_mask(struct dc *dc, struct dc_state *context)
>   	return stream_mask;
>   }
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   void dc_z10_restore(struct dc *dc)
>   {
>   	if (dc->hwss.z10_restore)
> @@ -1544,9 +1544,7 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
>   	struct dc_stream_state *dc_streams[MAX_STREAMS] = {0};
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	dc_z10_restore(dc);
> -#endif
>   	dc_allow_idle_optimizations(dc, false);
>   #endif
>   
> @@ -2626,7 +2624,7 @@ static void commit_planes_for_stream(struct dc *dc,
>   	int i, j;
>   	struct pipe_ctx *top_pipe_to_program = NULL;
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	dc_z10_restore(dc);
>   #endif
>   
> @@ -3085,7 +3083,7 @@ void dc_set_power_state(
>   	case DC_ACPI_CM_POWER_STATE_D0:
>   		dc_resource_state_construct(dc, dc->current_state);
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   		dc_z10_restore(dc);
>   #endif
>   		if (dc->ctx->dmub_srv)
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index a033bec2cc4c..6132b645bfd1 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -2661,7 +2661,7 @@ bool dc_link_set_psr_allow_active(struct dc_link *link, bool allow_active,
>   		return false;
>   
>   	link->psr_settings.psr_allow_active = allow_active;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	if (!allow_active)
>   		dc_z10_restore(dc);
>   #endif
> @@ -2842,7 +2842,7 @@ bool dc_link_setup_psr(struct dc_link *link,
>   	psr_context->psr_level.u32all = 0;
>   
>   	/*skip power down the single pipe since it blocks the cstate*/
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	if (link->ctx->asic_id.chip_family >= FAMILY_RV) {
>   		psr_context->psr_level.bits.SKIP_CRTC_DISABLE = true;
>   		if (link->ctx->asic_id.chip_family == FAMILY_YELLOW_CARP && !dc->debug.disable_z10)
> @@ -3191,7 +3191,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
>   		/*stream_enc_inst*/
>   		config.dig_fe = (uint8_t) pipe_ctx->stream_res.stream_enc->stream_enc_inst;
>   		config.dig_be = pipe_ctx->stream->link->link_enc_hw_inst;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   		config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
>   		config.link_enc_idx = pipe_ctx->stream->link->link_enc->transmitter - TRANSMITTER_UNIPHY_A;
>   		config.phy_idx = pipe_ctx->stream->link->link_enc->transmitter - TRANSMITTER_UNIPHY_A;
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 3feb19f7e117..a6a67244a322 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -58,9 +58,7 @@
>   #include "dcn301/dcn301_resource.h"
>   #include "dcn302/dcn302_resource.h"
>   #include "dcn303/dcn303_resource.h"
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> -#include "../dcn31/dcn31_resource.h"
> -#endif
> +#include "dcn31/dcn31_resource.h"
>   #endif
>   
>   #define DC_LOGGER_INIT(logger)
> @@ -141,9 +139,7 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
>   	case FAMILY_VGH:
>   		dc_version = DCN_VERSION_3_01;
>   		break;
> -#endif
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case FAMILY_YELLOW_CARP:
>   		if (ASICREV_IS_YELLOW_CARP(asic_id.hw_internal_rev))
>   			dc_version = DCN_VERSION_3_1;
> @@ -233,11 +229,9 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
>   	case DCN_VERSION_3_03:
>   		res_pool = dcn303_create_resource_pool(init_data, dc);
>   		break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case DCN_VERSION_3_1:
>   		res_pool = dcn31_create_resource_pool(init_data, dc);
>   		break;
> -#endif
>   #endif
>   	default:
>   		break;
> @@ -2142,7 +2136,7 @@ enum dc_status dc_validate_global_state(
>   
>   	if (!new_ctx)
>   		return DC_ERROR_UNEXPECTED;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   
>   	/*
>   	 * Update link encoder to stream assignment.
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 5420fda47bb7..45931ee14a6e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -294,9 +294,7 @@ bool dc_stream_set_cursor_attributes(
>   	stream->cursor_attributes = *attributes;
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	dc_z10_restore(dc);
> -#endif
>   	/* disable idle optimizations while updating cursor */
>   	if (dc->idle_optimizations_allowed) {
>   		dc_allow_idle_optimizations(dc, false);
> @@ -358,9 +356,7 @@ bool dc_stream_set_cursor_position(
>   	dc = stream->ctx->dc;
>   	res_ctx = &dc->current_state->res_ctx;
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	dc_z10_restore(dc);
> -#endif
>   
>   	/* disable idle optimizations if enabling cursor */
>   	if (dc->idle_optimizations_allowed && !stream->cursor_position.enable && position->enable) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 7674535654ec..5101a4f8f69f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -352,7 +352,7 @@ enum dcn_pwr_state {
>   	DCN_PWR_STATE_LOW_POWER = 3,
>   };
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   enum dcn_z9_support_state {
>   	DCN_Z9_SUPPORT_UNKNOWN,
>   	DCN_Z9_SUPPORT_ALLOW,
> @@ -376,7 +376,7 @@ struct dc_clocks {
>   	int phyclk_khz;
>   	int dramclk_khz;
>   	bool p_state_change_support;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	enum dcn_z9_support_state z9_support;
>   	bool dtbclk_en;
>   #endif
> @@ -501,7 +501,7 @@ struct dc_debug_options {
>   	bool disable_pplib_clock_request;
>   	bool disable_clock_gate;
>   	bool disable_mem_low_power;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	bool pstate_enabled;
>   #endif
>   	bool disable_dmcu;
> @@ -522,8 +522,6 @@ struct dc_debug_options {
>   	unsigned int force_odm_combine; //bit vector based on otg inst
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>   	unsigned int force_odm_combine_4to1; //bit vector based on otg inst
> -#endif
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	bool disable_z9_mpc;
>   #endif
>   	unsigned int force_fclk_khz;
> @@ -567,7 +565,7 @@ struct dc_debug_options {
>   	bool force_enable_edp_fec;
>   	/* FEC/PSR1 sequence enable delay in 100us */
>   	uint8_t fec_enable_delay_in100us;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	bool disable_z10;
>   	bool enable_sw_cntl_psr;
>   #endif
> @@ -595,7 +593,7 @@ struct dc_phy_addr_space_config {
>   		uint64_t page_table_start_addr;
>   		uint64_t page_table_end_addr;
>   		uint64_t page_table_base_addr;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   		bool base_addr_is_mc_addr;
>   #endif
>   	} gart_config;
> @@ -1335,7 +1333,7 @@ void dc_hardware_release(struct dc *dc);
>   #endif
>   
>   bool dc_set_psr_allow_active(struct dc *dc, bool enable);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   void dc_z10_restore(struct dc *dc);
>   #endif
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index 36b6fbcc0441..360f3199ea6f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -185,7 +185,7 @@ bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
>   		       dmub, DMUB_GPINT__IDLE_OPT_NOTIFY_STREAM_MASK,
>   		       stream_mask, timeout) == DMUB_STATUS_OK;
>   }
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   bool dc_dmub_srv_is_restore_required(struct dc_dmub_srv *dc_dmub_srv)
>   {
>   	struct dmub_srv *dmub;
> @@ -207,7 +207,6 @@ bool dc_dmub_srv_is_restore_required(struct dc_dmub_srv *dc_dmub_srv)
>   
>   	return boot_status.bits.restore_required;
>   }
> -#endif
>   
>   bool dc_dmub_srv_get_dmub_outbox0_msg(const struct dc *dc, struct dmcub_trace_buf_entry *entry)
>   {
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
> index 0d5680198937..3e35eee7188c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
> @@ -62,9 +62,8 @@ bool dc_dmub_srv_cmd_with_reply_data(struct dc_dmub_srv *dc_dmub_srv, union dmub
>   bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
>   				    unsigned int stream_mask);
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   bool dc_dmub_srv_is_restore_required(struct dc_dmub_srv *dc_dmub_srv);
> -#endif
> +
>   bool dc_dmub_srv_get_dmub_outbox0_msg(const struct dc *dc, struct dmcub_trace_buf_entry *entry);
>   
>   void dc_dmub_trace_event_control(struct dc *dc, bool enable);
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
> index 8817a834383a..df6539e4c730 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
> @@ -1106,22 +1106,18 @@ struct dce_hwseq_registers {
>   	type PANEL_DIGON_OVRD;\
>   	type PANEL_PWRSEQ_TARGET_STATE_R;
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   #define HWSEQ_DCN31_REG_FIELD_LIST(type) \
>   	type DOMAIN_POWER_FORCEON;\
>   	type DOMAIN_POWER_GATE;\
>   	type DOMAIN_PGFSM_PWR_STATUS;\
>   	type HPO_HDMISTREAMCLK_G_GATE_DIS;
>   
> -#endif
>   struct dce_hwseq_shift {
>   	HWSEQ_REG_FIELD_LIST(uint8_t)
>   	HWSEQ_DCN_REG_FIELD_LIST(uint8_t)
>   	HWSEQ_DCN3_REG_FIELD_LIST(uint8_t)
>   	HWSEQ_DCN301_REG_FIELD_LIST(uint8_t)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	HWSEQ_DCN31_REG_FIELD_LIST(uint8_t)
> -#endif
>   };
>   
>   struct dce_hwseq_mask {
> @@ -1129,9 +1125,7 @@ struct dce_hwseq_mask {
>   	HWSEQ_DCN_REG_FIELD_LIST(uint32_t)
>   	HWSEQ_DCN3_REG_FIELD_LIST(uint32_t)
>   	HWSEQ_DCN301_REG_FIELD_LIST(uint32_t)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	HWSEQ_DCN31_REG_FIELD_LIST(uint32_t)
> -#endif
>   };
>   
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index d76e19535c66..2938caaa2299 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -48,7 +48,7 @@
>   #include "link_encoder.h"
>   #include "link_hwss.h"
>   #include "dc_link_dp.h"
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   #include "dccg.h"
>   #endif
>   #include "clock_source.h"
> @@ -2090,7 +2090,7 @@ static void dce110_setup_audio_dto(
>   
>   			build_audio_output(context, pipe_ctx, &audio_output);
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   			/* For DCN3.1, audio to HPO FRL encoder is using audio DTBCLK DTO */
>   			if (dc->res_pool->dccg && dc->res_pool->dccg->funcs->set_audio_dtbclk_dto) {
>   				/* disable audio DTBCLK DTO */
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
> index 83c3f944e9ab..8d7e92d5d3e4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
> @@ -139,7 +139,6 @@ struct dcn_hubbub_registers {
>   	uint32_t DCHVM_CLK_CTRL;
>   	uint32_t DCHVM_RIOMMU_CTRL0;
>   	uint32_t DCHVM_RIOMMU_STAT0;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	uint32_t DCHUBBUB_DET0_CTRL;
>   	uint32_t DCHUBBUB_DET1_CTRL;
>   	uint32_t DCHUBBUB_DET2_CTRL;
> @@ -155,7 +154,6 @@ struct dcn_hubbub_registers {
>   	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C;
>   	uint32_t DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D;
>   	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D;
> -#endif
>   };
>   
>   /* set field name */
> @@ -292,7 +290,7 @@ struct dcn_hubbub_registers {
>   		type HOSTVM_POWERSTATUS; \
>   		type RIOMMU_ACTIVE; \
>   		type HOSTVM_PREFETCH_DONE
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   #define HUBBUB_RET_REG_FIELD_LIST(type) \
>   		type DET_DEPTH;\
>   		type DET0_SIZE;\
> @@ -315,25 +313,20 @@ struct dcn_hubbub_registers {
>   		type DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C;\
>   		type DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D;\
>   		type DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D
> -#endif
>   
>   
>   struct dcn_hubbub_shift {
>   	DCN_HUBBUB_REG_FIELD_LIST(uint8_t);
>   	HUBBUB_STUTTER_REG_FIELD_LIST(uint8_t);
>   	HUBBUB_HVM_REG_FIELD_LIST(uint8_t);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	HUBBUB_RET_REG_FIELD_LIST(uint8_t);
> -#endif
>   };
>   
>   struct dcn_hubbub_mask {
>   	DCN_HUBBUB_REG_FIELD_LIST(uint32_t);
>   	HUBBUB_STUTTER_REG_FIELD_LIST(uint32_t);
>   	HUBBUB_HVM_REG_FIELD_LIST(uint32_t);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	HUBBUB_RET_REG_FIELD_LIST(uint32_t);
> -#endif
>   };
>   
>   struct dc;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
> index ba47553081a7..d8b22618b79e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.h
> @@ -160,14 +160,12 @@ struct dcn10_link_enc_registers {
>   	uint32_t PHYA_LINK_CNTL2;
>   	uint32_t PHYB_LINK_CNTL2;
>   	uint32_t PHYC_LINK_CNTL2;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	uint32_t DIO_LINKA_CNTL;
>   	uint32_t DIO_LINKB_CNTL;
>   	uint32_t DIO_LINKC_CNTL;
>   	uint32_t DIO_LINKD_CNTL;
>   	uint32_t DIO_LINKE_CNTL;
>   	uint32_t DIO_LINKF_CNTL;
> -#endif
>   };
>   
>   #define LE_SF(reg_name, field_name, post_fix)\
> @@ -467,29 +465,24 @@ struct dcn10_link_enc_registers {
>   	type DPCS_TX_DATA_SWAP_10_BIT;\
>   	type DPCS_TX_DATA_ORDER_INVERT_18_BIT;\
>   	type RDPCS_TX_CLK_EN
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   #define DCN31_LINK_ENCODER_REG_FIELD_LIST(type) \
>   	type ENC_TYPE_SEL;\
>   	type HPO_DP_ENC_SEL;\
>   	type HPO_HDMI_ENC_SEL
> -#endif
>   
>   struct dcn10_link_enc_shift {
>   	DCN_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
>   	DCN20_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
>   	DCN30_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCN31_LINK_ENCODER_REG_FIELD_LIST(uint8_t);
> -#endif
>   };
>   
>   struct dcn10_link_enc_mask {
>   	DCN_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
>   	DCN20_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
>   	DCN30_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCN31_LINK_ENCODER_REG_FIELD_LIST(uint32_t);
> -#endif
>   };
>   
>   struct dcn10_link_encoder {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
> index 62904d7ca100..ede65100a050 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
> @@ -140,7 +140,6 @@
>   	type PHYCSYMCLK_FORCE_EN;\
>   	type PHYCSYMCLK_FORCE_SRC_SEL;
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   #define DCCG31_REG_FIELD_LIST(type) \
>   	type PHYDSYMCLK_FORCE_EN;\
>   	type PHYDSYMCLK_FORCE_SRC_SEL;\
> @@ -171,22 +170,17 @@
>   	type DCCG_AUDIO_DTO_SEL;\
>   	type DCCG_AUDIO_DTO0_SOURCE_SEL;\
>   	type DENTIST_DISPCLK_CHG_MODE;
> -#endif
>   
>   struct dccg_shift {
>   	DCCG_REG_FIELD_LIST(uint8_t)
>   	DCCG3_REG_FIELD_LIST(uint8_t)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCCG31_REG_FIELD_LIST(uint8_t)
> -#endif
>   };
>   
>   struct dccg_mask {
>   	DCCG_REG_FIELD_LIST(uint32_t)
>   	DCCG3_REG_FIELD_LIST(uint32_t)
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCCG31_REG_FIELD_LIST(uint32_t)
> -#endif
>   };
>   
>   struct dccg_registers {
> @@ -199,7 +193,6 @@ struct dccg_registers {
>   	uint32_t PHYASYMCLK_CLOCK_CNTL;
>   	uint32_t PHYBSYMCLK_CLOCK_CNTL;
>   	uint32_t PHYCSYMCLK_CLOCK_CNTL;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	uint32_t PHYDSYMCLK_CLOCK_CNTL;
>   	uint32_t PHYESYMCLK_CLOCK_CNTL;
>   	uint32_t DTBCLK_DTO_MODULO[MAX_PIPES];
> @@ -212,7 +205,6 @@ struct dccg_registers {
>   	uint32_t SYMCLK32_SE_CNTL;
>   	uint32_t SYMCLK32_LE_CNTL;
>   	uint32_t DENTIST_DISPCLK_CNTL;
> -#endif
>   };
>   
>   struct dcn_dccg {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h
> index a4fc70fa0957..10af257d90ef 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h
> @@ -83,7 +83,6 @@ struct dcn20_hubbub {
>   	int num_vmid;
>   	struct dcn20_vmid vmid[16];
>   	unsigned int detile_buf_size;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	unsigned int crb_size_segs;
>   	unsigned int compbuf_size_segments;
>   	unsigned int pixel_chunk_size;
> @@ -91,7 +90,6 @@ struct dcn20_hubbub {
>   	unsigned int det1_size;
>   	unsigned int det2_size;
>   	unsigned int det3_size;
> -#endif
>   };
>   
>   void hubbub2_construct(struct dcn20_hubbub *hubbub,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
> index 2652d6abe9e3..eea2254b15e4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
> @@ -216,32 +216,22 @@
>   	type ROW_TTU_MODE; \
>   	type NUM_PKRS
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   #define DCN31_HUBP_REG_FIELD_VARIABLE_LIST(type) \
>   	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(type);\
>   	type HUBP_UNBOUNDED_REQ_MODE;\
>   	type CURSOR_REQ_MODE;\
>   	type HUBP_SOFT_RESET
> -#endif
>   
>   struct dcn_hubp2_registers {
>   	DCN30_HUBP_REG_COMMON_VARIABLE_LIST;
>   };
>   
>   struct dcn_hubp2_shift {
> -#if   defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
> -#else
> -	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
> -#endif
>   };
>   
>   struct dcn_hubp2_mask {
> -#if   defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
> -#else
> -	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
> -#endif
>   };
>   
>   struct dcn20_hubp {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> index d0d6a94e4992..5c2853654cca 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> @@ -1270,9 +1270,7 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
>   		new_pipe->update_flags.bits.gamut_remap = 1;
>   		new_pipe->update_flags.bits.scaler = 1;
>   		new_pipe->update_flags.bits.viewport = 1;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   		new_pipe->update_flags.bits.det_size = 1;
> -#endif
>   		if (!new_pipe->top_pipe && !new_pipe->prev_odm_pipe) {
>   			new_pipe->update_flags.bits.odm = 1;
>   			new_pipe->update_flags.bits.global_sync = 1;
> @@ -1307,10 +1305,9 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
>   			new_pipe->update_flags.bits.global_sync = 1;
>   	}
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	if (old_pipe->det_buffer_size_kb != new_pipe->det_buffer_size_kb)
>   		new_pipe->update_flags.bits.det_size = 1;
> -#endif
> +
>   	/*
>   	 * Detect opp / tg change, only set on change, not on enable
>   	 * Assume mpcc inst = pipe index, if not this code needs to be updated
> @@ -1426,10 +1423,9 @@ static void dcn20_update_dchubp_dpp(
>   			&pipe_ctx->ttu_regs,
>   			&pipe_ctx->rq_regs,
>   			&pipe_ctx->pipe_dlg_param);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   		if (hubp->funcs->set_unbounded_requesting)
>   			hubp->funcs->set_unbounded_requesting(hubp, pipe_ctx->unbounded_req);
> -#endif
>   	}
>   	if (pipe_ctx->update_flags.bits.hubp_interdependent)
>   		hubp->funcs->hubp_setup_interdependent(
> @@ -1609,11 +1605,9 @@ static void dcn20_program_pipe(
>   			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
>   	}
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	if (dc->res_pool->hubbub->funcs->program_det_size && pipe_ctx->update_flags.bits.det_size)
>   		dc->res_pool->hubbub->funcs->program_det_size(
>   			dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
> -#endif
>   
>   	if (pipe_ctx->update_flags.raw || pipe_ctx->plane_state->update_flags.raw || pipe_ctx->stream->update_flags.raw)
>   		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
> @@ -1705,12 +1699,10 @@ void dcn20_program_front_end_for_ctx(
>   	for (i = 0; i < dc->res_pool->pipe_count; i++)
>   		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
>   				|| context->res_ctx.pipe_ctx[i].update_flags.bits.opp_changed) {
> -		#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   			struct hubbub *hubbub = dc->res_pool->hubbub;
>   
>   			if (hubbub->funcs->program_det_size && context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
>   				hubbub->funcs->program_det_size(hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
> -		#endif
>   			hws->funcs.plane_atomic_disconnect(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
>   			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
>   		}
> @@ -1828,11 +1820,9 @@ void dcn20_prepare_bandwidth(
>   					&context->bw_ctx.bw.dcn.watermarks,
>   					dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000,
>   					false);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	/* decrease compbuf size */
>   	if (hubbub->funcs->program_compbuf_size)
>   		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, false);
> -#endif
>   }
>   
>   void dcn20_optimize_bandwidth(
> @@ -1851,11 +1841,9 @@ void dcn20_optimize_bandwidth(
>   			dc->clk_mgr,
>   			context,
>   			true);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	/* increase compbuf size */
>   	if (hubbub->funcs->program_compbuf_size)
>   		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, true);
> -#endif
>   }
>   
>   bool dcn20_update_bandwidth(
> @@ -2561,10 +2549,9 @@ void dcn20_fpga_init_hw(struct dc *dc)
>   
>   		tg->funcs->tg_init(tg);
>   	}
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   	if (dc->res_pool->hubbub->funcs->init_crb)
>   		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
> -#endif
>   }
>   #ifndef TRIM_FSFT
>   bool dcn20_optimize_timing_for_fsft(struct dc *dc,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 1b670c5de1aa..1b05a37b674d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -3069,7 +3069,6 @@ static void dcn20_calculate_wm(
>   	context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
>   }
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
>   {
>   	int i;
> @@ -3079,7 +3078,6 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
>   	}
>   	return false;
>   }
> -#endif
>   
>   void dcn20_calculate_dlg_params(
>   		struct dc *dc, struct dc_state *context,
> @@ -3088,9 +3086,7 @@ void dcn20_calculate_dlg_params(
>   		int vlevel)
>   {
>   	int i, pipe_idx;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	int plane_count;
> -#endif
>   
>   	/* Writeback MCIF_WB arbitration parameters */
>   	dc->res_pool->funcs->set_mcif_arb_params(dc, context, pipes, pipe_cnt);
> @@ -3105,7 +3101,7 @@ void dcn20_calculate_dlg_params(
>   		context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb]
>   							!= dm_dram_clock_change_unsupported;
>   	context->bw_ctx.bw.dcn.clk.dppclk_khz = 0;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   	context->bw_ctx.bw.dcn.clk.z9_support = (context->bw_ctx.dml.vba.StutterPeriod > 5000.0) ?
>   			DCN_Z9_SUPPORT_ALLOW : DCN_Z9_SUPPORT_DISALLOW;
>   
> @@ -3119,7 +3115,6 @@ void dcn20_calculate_dlg_params(
>   		context->bw_ctx.bw.dcn.clk.z9_support = DCN_Z9_SUPPORT_ALLOW;
>   
>   	context->bw_ctx.bw.dcn.clk.dtbclk_en = is_dtbclk_required(dc, context);
> -#endif
>   
>   	if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk_khz)
>   		context->bw_ctx.bw.dcn.clk.dispclk_khz = dc->debug.min_disp_clk_khz;
> @@ -3131,10 +3126,9 @@ void dcn20_calculate_dlg_params(
>   		pipes[pipe_idx].pipe.dest.vupdate_offset = get_vupdate_offset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
>   		pipes[pipe_idx].pipe.dest.vupdate_width = get_vupdate_width(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
>   		pipes[pipe_idx].pipe.dest.vready_offset = get_vready_offset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> -			context->res_ctx.pipe_ctx[i].det_buffer_size_kb = context->bw_ctx.dml.ip.det_buffer_size_kbytes;
> -			context->res_ctx.pipe_ctx[i].unbounded_req = pipes[pipe_idx].pipe.src.unbounded_req_mode;
> -#endif
> +		context->res_ctx.pipe_ctx[i].det_buffer_size_kb = context->bw_ctx.dml.ip.det_buffer_size_kbytes;
> +		context->res_ctx.pipe_ctx[i].unbounded_req = pipes[pipe_idx].pipe.src.unbounded_req_mode;
> +
>   		if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000)
>   			context->bw_ctx.bw.dcn.clk.dppclk_khz = pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
>   		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =
> @@ -3148,10 +3142,8 @@ void dcn20_calculate_dlg_params(
>   	context->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz = context->bw_ctx.dml.soc.clock_limits[vlevel].dppclk_mhz * 1000;
>   	context->bw_ctx.bw.dcn.clk.max_supported_dispclk_khz = context->bw_ctx.dml.soc.clock_limits[vlevel].dispclk_mhz * 1000;
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	context->bw_ctx.bw.dcn.compbuf_size_kb = context->bw_ctx.dml.ip.config_return_buffer_size_in_kbytes
>   						- context->bw_ctx.dml.ip.det_buffer_size_kbytes * pipe_idx;
> -#endif
>   
>   	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
>   		bool cstate_en = context->bw_ctx.dml.vba.PrefetchMode[vlevel][context->bw_ctx.dml.vba.maxMpcComb] != 2;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index 5642172e0df8..c68e3a708a33 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -655,10 +655,8 @@ void dcn30_init_hw(struct dc *dc)
>   	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
>   		dc->res_pool->hubbub->funcs->force_pstate_change_control(
>   				dc->res_pool->hubbub, false, false);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	if (dc->res_pool->hubbub->funcs->init_crb)
>   		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
> -#endif
>   
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
> index cf1779588f96..fc1fc1a4bf8b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
> @@ -299,10 +299,8 @@ void dcn31_init_hw(struct dc *dc)
>   	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
>   		dc->res_pool->hubbub->funcs->force_pstate_change_control(
>   				dc->res_pool->hubbub, false, false);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	if (dc->res_pool->hubbub->funcs->init_crb)
>   		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
> -#endif
>   }
>   
>   void dcn31_dsc_pg_control(
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h b/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h
> index 8381c8f9ddb7..a9170b9f84d3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h
> @@ -32,11 +32,9 @@ struct cp_psp_stream_config {
>   	uint8_t otg_inst;
>   	uint8_t dig_be;
>   	uint8_t dig_fe;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	uint8_t link_enc_idx;
>   	uint8_t stream_enc_idx;
>   	uint8_t phy_idx;
> -#endif
>   	uint8_t assr_enabled;
>   	uint8_t mst_enabled;
>   	void *dm_stream_ctx;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 11ab03abc0fe..d34024fd798a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -62,10 +62,8 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) -Wframe-larger-than=2048
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
> -endif
>   CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_rcflags)
> @@ -76,10 +74,8 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_rcflags)
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_rcflags)
> -endif
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_rcflags)
>   endif
>   CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
> @@ -94,10 +90,8 @@ DML += display_mode_vba.o dcn20/display_rq_dlg_calc_20.o dcn20/display_mode_vba_
>   DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
>   DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
>   DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   DML += dcn31/display_mode_vba_31.o dcn31/display_rq_dlg_calc_31.o
>   endif
> -endif
>   
>   AMD_DAL_DML = $(addprefix $(AMDDALPATH)/dc/dml/,$(DML))
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index 718d5a99dada..a9667068c690 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -23,7 +23,6 @@
>    *
>    */
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   #include "dc.h"
>   #include "dc_link.h"
>   #include "../display_mode_lib.h"
> @@ -7509,4 +7508,3 @@ static bool UnboundedRequest(enum unbounded_requesting_policy UseUnboundedReques
>   	return (ret_val);
>   }
>   
> -#endif /* CONFIG_DRM_AMD_DC_DCN3_1 */
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> index dc8b3afef301..3def093ef88e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> @@ -23,8 +23,6 @@
>    *
>    */
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
> -
>   #include "../display_mode_lib.h"
>   #include "../display_mode_vba.h"
>   #include "../dml_inline_defs.h"
> @@ -1724,4 +1722,3 @@ void dml31_rq_dlg_get_dlg_reg(
>   	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
>   }
>   
> -#endif
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
> index 9bb3b00e8be1..8a5bd919aec8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
> @@ -33,11 +33,9 @@
>   #include "dcn21/display_rq_dlg_calc_21.h"
>   #include "dcn30/display_mode_vba_30.h"
>   #include "dcn30/display_rq_dlg_calc_30.h"
> -#include "dml_logger.h"
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   #include "dcn31/display_mode_vba_31.h"
>   #include "dcn31/display_rq_dlg_calc_31.h"
> -#endif
> +#include "dml_logger.h"
>   
>   const struct dml_funcs dml20_funcs = {
>   	.validate = dml20_ModeSupportAndSystemConfigurationFull,
> @@ -66,14 +64,13 @@ const struct dml_funcs dml30_funcs = {
>   	.rq_dlg_get_dlg_reg = dml30_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml30_rq_dlg_get_rq_reg
>   };
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   const struct dml_funcs dml31_funcs = {
>   	.validate = dml31_ModeSupportAndSystemConfigurationFull,
>   	.recalculate = dml31_recalculate,
>   	.rq_dlg_get_dlg_reg = dml31_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml31_rq_dlg_get_rq_reg
>   };
> -#endif
>   
>   void dml_init_instance(struct display_mode_lib *lib,
>   		const struct _vcs_dpi_soc_bounding_box_st *soc_bb,
> @@ -96,13 +93,11 @@ void dml_init_instance(struct display_mode_lib *lib,
>   	case DML_PROJECT_DCN30:
>   		lib->funcs = dml30_funcs;
>   		break;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case DML_PROJECT_DCN31:
>   	case DML_PROJECT_DCN31_FPGA:
>   		lib->funcs = dml31_funcs;
>   		break;
>   
> -#endif
>   	default:
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
> index 7b7f1500a91e..d42a0aeca6be 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.h
> @@ -38,10 +38,8 @@ enum dml_project {
>   	DML_PROJECT_NAVI10v2,
>   	DML_PROJECT_DCN21,
>   	DML_PROJECT_DCN30,
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	DML_PROJECT_DCN31,
>   	DML_PROJECT_DCN31_FPGA,
> -#endif
>   };
>   
>   struct display_mode_lib;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
> index bdd075576573..64daa0507393 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
> @@ -74,10 +74,8 @@ struct _vcs_dpi_soc_bounding_box_st {
>   	unsigned int num_states;
>   	double sr_exit_time_us;
>   	double sr_enter_plus_exit_time_us;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	double sr_exit_z8_time_us;
>   	double sr_enter_plus_exit_z8_time_us;
> -#endif
>   	double urgent_latency_us;
>   	double urgent_latency_pixel_data_only_us;
>   	double urgent_latency_pixel_mixed_with_vm_data_us;
> @@ -213,14 +211,12 @@ struct _vcs_dpi_ip_params_st {
>   	unsigned int is_line_buffer_bpp_fixed;
>   	unsigned int line_buffer_fixed_bpp;
>   	unsigned int dcc_supported;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	unsigned int config_return_buffer_size_in_kbytes;
>   	unsigned int compressed_buffer_segment_size_in_kbytes;
>   	unsigned int meta_fifo_size_in_kentries;
>   	unsigned int zero_size_buffer_entries;
>   	unsigned int compbuf_reserved_space_64b;
>   	unsigned int compbuf_reserved_space_zs;
> -#endif
>   
>   	unsigned int IsLineBufferBppFixed;
>   	unsigned int LineBufferFixedBpp;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> index 0ea9b18662e3..d3b1b6d4ce2f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> @@ -89,12 +89,10 @@ dml_get_attr_func(wm_memory_trip, mode_lib->vba.UrgentLatency);
>   dml_get_attr_func(wm_writeback_urgent, mode_lib->vba.WritebackUrgentWatermark);
>   dml_get_attr_func(wm_stutter_exit, mode_lib->vba.StutterExitWatermark);
>   dml_get_attr_func(wm_stutter_enter_exit, mode_lib->vba.StutterEnterPlusExitWatermark);
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   dml_get_attr_func(wm_z8_stutter_exit, mode_lib->vba.Z8StutterExitWatermark);
>   dml_get_attr_func(wm_z8_stutter_enter_exit, mode_lib->vba.Z8StutterEnterPlusExitWatermark);
>   dml_get_attr_func(stutter_efficiency_z8, mode_lib->vba.Z8StutterEfficiency);
>   dml_get_attr_func(stutter_num_bursts_z8, mode_lib->vba.Z8NumberOfStutterBurstsPerFrame);
> -#endif
>   dml_get_attr_func(wm_dram_clock_change, mode_lib->vba.DRAMClockChangeWatermark);
>   dml_get_attr_func(wm_writeback_dram_clock_change, mode_lib->vba.WritebackDRAMClockChangeWatermark);
>   dml_get_attr_func(stutter_efficiency, mode_lib->vba.StutterEfficiency);
> @@ -163,10 +161,8 @@ dml_get_pipe_attr_func(vstartup, mode_lib->vba.VStartup);
>   dml_get_pipe_attr_func(vupdate_offset, mode_lib->vba.VUpdateOffsetPix);
>   dml_get_pipe_attr_func(vupdate_width, mode_lib->vba.VUpdateWidthPix);
>   dml_get_pipe_attr_func(vready_offset, mode_lib->vba.VReadyOffsetPix);
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   dml_get_pipe_attr_func(vready_at_or_after_vsync, mode_lib->vba.VREADY_AT_OR_AFTER_VSYNC);
>   dml_get_pipe_attr_func(min_dst_y_next_start, mode_lib->vba.MIN_DST_Y_NEXT_START);
> -#endif
>   
>   double get_total_immediate_flip_bytes(
>   		struct display_mode_lib *mode_lib,
> @@ -235,7 +231,6 @@ static void fetch_socbb_params(struct display_mode_lib *mode_lib)
>   	mode_lib->vba.WritebackLatency = soc->writeback_latency_us;
>   	mode_lib->vba.SRExitTime = soc->sr_exit_time_us;
>   	mode_lib->vba.SREnterPlusExitTime = soc->sr_enter_plus_exit_time_us;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	mode_lib->vba.PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency = soc->pct_ideal_sdp_bw_after_urgent;
>   	mode_lib->vba.PercentOfIdealDRAMBWReceivedAfterUrgLatencyPixelMixedWithVMData = soc->pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm;
>   	mode_lib->vba.PercentOfIdealDRAMBWReceivedAfterUrgLatencyPixelDataOnly = soc->pct_ideal_dram_sdp_bw_after_urgent_pixel_only;
> @@ -244,7 +239,6 @@ static void fetch_socbb_params(struct display_mode_lib *mode_lib)
>   			soc->max_avg_sdp_bw_use_normal_percent;
>   	mode_lib->vba.SRExitZ8Time = soc->sr_exit_z8_time_us;
>   	mode_lib->vba.SREnterPlusExitZ8Time = soc->sr_enter_plus_exit_z8_time_us;
> -#endif
>   	mode_lib->vba.DRAMClockChangeLatency = soc->dram_clock_change_latency_us;
>   	mode_lib->vba.DummyPStateCheck = soc->dram_clock_change_latency_us == soc->dummy_pstate_latency_us;
>   	mode_lib->vba.DRAMClockChangeSupportsVActive = !soc->disable_dram_clock_change_vactive_support ||
> @@ -319,7 +313,6 @@ static void fetch_ip_params(struct display_mode_lib *mode_lib)
>   	mode_lib->vba.MaxPSCLToLBThroughput = ip->max_pscl_lb_bw_pix_per_clk;
>   	mode_lib->vba.ROBBufferSizeInKByte = ip->rob_buffer_size_kbytes;
>   	mode_lib->vba.DETBufferSizeInKByte[0] = ip->det_buffer_size_kbytes;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	mode_lib->vba.ConfigReturnBufferSizeInKByte = ip->config_return_buffer_size_in_kbytes;
>   	mode_lib->vba.CompressedBufferSegmentSizeInkByte = ip->compressed_buffer_segment_size_in_kbytes;
>   	mode_lib->vba.MetaFIFOSizeInKEntries = ip->meta_fifo_size_in_kentries;
> @@ -328,7 +321,6 @@ static void fetch_ip_params(struct display_mode_lib *mode_lib)
>   	mode_lib->vba.COMPBUF_RESERVED_SPACE_ZS = ip->compbuf_reserved_space_zs;
>   	mode_lib->vba.MaximumDSCBitsPerComponent = ip->maximum_dsc_bits_per_component;
>   	mode_lib->vba.DSC422NativeSupport = ip->dsc422_native_support;
> -#endif
>   
>   	mode_lib->vba.PixelChunkSizeInKByte = ip->pixel_chunk_size_kbytes;
>   	mode_lib->vba.MetaChunkSize = ip->meta_chunk_size_kbytes;
> @@ -457,11 +449,9 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
>   		mode_lib->vba.VTAPsChroma[mode_lib->vba.NumberOfActivePlanes] = taps->vtaps_c;
>   		mode_lib->vba.HTotal[mode_lib->vba.NumberOfActivePlanes] = dst->htotal;
>   		mode_lib->vba.VTotal[mode_lib->vba.NumberOfActivePlanes] = dst->vtotal;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   		mode_lib->vba.VFrontPorch[mode_lib->vba.NumberOfActivePlanes] = dst->vfront_porch;
>   		mode_lib->vba.DCCFractionOfZeroSizeRequestsLuma[mode_lib->vba.NumberOfActivePlanes] = src->dcc_fraction_of_zs_req_luma;
>   		mode_lib->vba.DCCFractionOfZeroSizeRequestsChroma[mode_lib->vba.NumberOfActivePlanes] = src->dcc_fraction_of_zs_req_chroma;
> -#endif
>   		mode_lib->vba.DCCEnable[mode_lib->vba.NumberOfActivePlanes] =
>   				src->dcc_use_global ?
>   						ip->dcc_supported : src->dcc && ip->dcc_supported;
> @@ -708,13 +698,11 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
>   		}
>   	}
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	mode_lib->vba.UseUnboundedRequesting = dm_unbounded_requesting;
>   	for (k = 0; k < mode_lib->vba.cache_num_pipes; ++k) {
>   		if (pipes[k].pipe.src.unbounded_req_mode == 0)
>   			mode_lib->vba.UseUnboundedRequesting = dm_unbounded_requesting_disable;
>   	}
> -#endif
>   	// TODO: ODMCombineEnabled => 2 * DPPPerPlane...actually maybe not since all pipes are specified
>   	// Do we want the dscclk to automatically be halved? Guess not since the value is specified
>   	mode_lib->vba.SynchronizedVBlank = pipes[0].pipe.dest.synchronized_vblank_all_planes;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> index fad7bb57e668..d18a021d4d32 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> @@ -39,12 +39,10 @@ dml_get_attr_decl(wm_memory_trip);
>   dml_get_attr_decl(wm_writeback_urgent);
>   dml_get_attr_decl(wm_stutter_exit);
>   dml_get_attr_decl(wm_stutter_enter_exit);
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   dml_get_attr_decl(wm_z8_stutter_exit);
>   dml_get_attr_decl(wm_z8_stutter_enter_exit);
>   dml_get_attr_decl(stutter_efficiency_z8);
>   dml_get_attr_decl(stutter_num_bursts_z8);
> -#endif
>   dml_get_attr_decl(wm_dram_clock_change);
>   dml_get_attr_decl(wm_writeback_dram_clock_change);
>   dml_get_attr_decl(stutter_efficiency_no_vblank);
> @@ -108,10 +106,8 @@ dml_get_pipe_attr_decl(vstartup);
>   dml_get_pipe_attr_decl(vupdate_offset);
>   dml_get_pipe_attr_decl(vupdate_width);
>   dml_get_pipe_attr_decl(vready_offset);
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   dml_get_pipe_attr_decl(vready_at_or_after_vsync);
>   dml_get_pipe_attr_decl(min_dst_y_next_start);
> -#endif
>   
>   double get_total_immediate_flip_bytes(
>   		struct display_mode_lib *mode_lib,
> @@ -933,7 +929,6 @@ struct vba_vars_st {
>   	bool ClampMinDCFCLK;
>   	bool AllowDramClockChangeOneDisplayVactive;
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	double MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation;
>   	double PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency;
>   	double PercentOfIdealDRAMBWReceivedAfterUrgLatencyPixelMixedWithVMData;
> @@ -974,7 +969,6 @@ struct vba_vars_st {
>   	int Z8NumberOfStutterBurstsPerFrame;
>   	unsigned int MaximumDSCBitsPerComponent;
>   	unsigned int NotEnoughUrgentLatencyHidingA[DC__VOLTAGE_STATES][2];
> -#endif
>   };
>   
>   bool CalculateMinAndMaxPrefetchMode(
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
> index fbf71ff0a402..c5c840a06050 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
> @@ -112,9 +112,7 @@ bool dal_hw_factory_init(
>   	case DCN_VERSION_3_01:
>   	case DCN_VERSION_3_02:
>   	case DCN_VERSION_3_03:
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case DCN_VERSION_3_1:
> -#endif
>   		dal_hw_factory_dcn30_init(factory);
>   		return true;
>   #endif
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
> index 89794687f6a0..4a9848308766 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
> @@ -107,9 +107,7 @@ bool dal_hw_translate_init(
>   	case DCN_VERSION_3_01:
>   	case DCN_VERSION_3_02:
>   	case DCN_VERSION_3_03:
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case DCN_VERSION_3_1:
> -#endif
>   		dal_hw_translate_dcn30_init(translate);
>   		return true;
>   #endif
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
> index 0d1c3260b68e..45a6216dfa2a 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
> @@ -338,9 +338,7 @@ union pipe_update_flags {
>   		uint32_t scaler : 1;
>   		uint32_t viewport : 1;
>   		uint32_t plane_changed : 1;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   		uint32_t det_size : 1;
> -#endif
>   	} bits;
>   	uint32_t raw;
>   };
> @@ -368,10 +366,8 @@ struct pipe_ctx {
>   	struct _vcs_dpi_display_ttu_regs_st ttu_regs;
>   	struct _vcs_dpi_display_rq_regs_st rq_regs;
>   	struct _vcs_dpi_display_pipe_dest_params_st pipe_dlg_param;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	int det_buffer_size_kb;
>   	bool unbounded_req;
> -#endif
>   #endif
>   	union pipe_update_flags update_flags;
>   	struct dwbc *dwbc;
> @@ -422,9 +418,7 @@ struct dcn_bw_output {
>   	struct dc_clocks clk;
>   	struct dcn_watermark_set watermarks;
>   	struct dcn_bw_writeback bw_writeback;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	int compbuf_size_kb;
> -#endif
>   };
>   
>   union bw_output {
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
> index 90dbe26bf954..a17e5de3b100 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
> @@ -91,9 +91,7 @@ struct clk_limit_table_entry {
>   	unsigned int dispclk_mhz;
>   	unsigned int dppclk_mhz;
>   	unsigned int phyclk_mhz;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	unsigned int wck_ratio;
> -#endif
>   };
>   
>   /* This table is contiguous */
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
> index fc11f8e1ab59..0afa2364a986 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
> @@ -29,7 +29,6 @@
>   #include "dc_types.h"
>   #include "hw_shared.h"
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   enum phyd32clk_clock_source {
>   	PHYD32CLKA,
>   	PHYD32CLKB,
> @@ -55,18 +54,15 @@ enum dentist_dispclk_change_mode {
>   	DISPCLK_CHANGE_MODE_IMMEDIATE,
>   	DISPCLK_CHANGE_MODE_RAMPING,
>   };
> -#endif
>   
>   struct dccg {
>   	struct dc_context *ctx;
>   	const struct dccg_funcs *funcs;
>   	int pipe_dppclk_khz[MAX_PIPES];
>   	int ref_dppclk;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	int dtbclk_khz[MAX_PIPES];
>   	int audio_dtbclk_khz;
>   	int ref_dtbclk_khz;
> -#endif
>   };
>   
>   struct dccg_funcs {
> @@ -83,7 +79,6 @@ struct dccg_funcs {
>   	void (*otg_drop_pixel)(struct dccg *dccg,
>   			uint32_t otg_inst);
>   	void (*dccg_init)(struct dccg *dccg);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   
>   	void (*set_physymclk)(
>   			struct dccg *dccg,
> @@ -105,7 +100,6 @@ struct dccg_funcs {
>   	void (*set_dispclk_change_mode)(
>   			struct dccg *dccg,
>   			enum dentist_dispclk_change_mode change_mode);
> -#endif
>   };
>   
>   #endif //__DAL_DCCG_H__
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
> index d2611b865695..0638b337f143 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
> @@ -152,11 +152,9 @@ struct hubbub_funcs {
>   	void (*force_pstate_change_control)(struct hubbub *hubbub, bool force, bool allow);
>   
>   	void (*init_watermarks)(struct hubbub *hubbub);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	void (*program_det_size)(struct hubbub *hubbub, int hubp_inst, unsigned det_buffer_size_in_kbyte);
>   	void (*program_compbuf_size)(struct hubbub *hubbub, unsigned compbuf_size_kb, bool safe_to_increase);
>   	void (*init_crb)(struct hubbub *hubbub);
> -#endif
>   };
>   
>   struct hubbub {
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
> index f643fe3ed064..9eaf345aa2a1 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/link_encoder.h
> @@ -127,13 +127,11 @@ struct link_enc_state {
>   
>   };
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> -	enum encoder_type_select {
> -		ENCODER_TYPE_DIG = 0,
> -		ENCODER_TYPE_HDMI_FRL = 1,
> -		ENCODER_TYPE_DP_128B132B = 2
> -	};
> -#endif
> +enum encoder_type_select {
> +	ENCODER_TYPE_DIG = 0,
> +	ENCODER_TYPE_HDMI_FRL = 1,
> +	ENCODER_TYPE_DP_128B132B = 2
> +};
>   
>   struct link_encoder_funcs {
>   	void (*read_state)(
> @@ -193,12 +191,10 @@ struct link_encoder_funcs {
>   
>   	enum signal_type (*get_dig_mode)(
>   		struct link_encoder *enc);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	void (*set_dio_phy_mux)(
>   		struct link_encoder *enc,
>   		enum encoder_type_select sel,
>   		uint32_t hpo_inst);
> -#endif
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
> index dd562dcd03b2..8798cfa11a4d 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
> @@ -33,10 +33,8 @@
>   struct dchub_init_data;
>   struct cstate_pstate_watermarks_st {
>   	uint32_t cstate_exit_ns;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	uint32_t cstate_exit_z8_ns;
>   	uint32_t cstate_enter_plus_exit_z8_ns;
> -#endif
>   	uint32_t cstate_enter_plus_exit_ns;
>   	uint32_t pstate_change_ns;
>   };
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
> index 8f06e273e703..03f47f23fb65 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
> @@ -173,9 +173,7 @@ struct timing_generator_funcs {
>   
>   	bool (*enable_crtc)(struct timing_generator *tg);
>   	bool (*disable_crtc)(struct timing_generator *tg);
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	bool (*immediate_disable_crtc)(struct timing_generator *tg);
> -#endif
>   	bool (*is_counter_moving)(struct timing_generator *tg);
>   	void (*get_position)(struct timing_generator *tg,
>   				struct crtc_position *position);
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> index e3ab4e43f673..5ab008e62b82 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> @@ -236,9 +236,7 @@ struct hw_sequencer_funcs {
>   			const struct tg_color *solid_color,
>   			int width, int height, int offset);
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	void (*z10_restore)(struct dc *dc);
> -#endif
>   
>   	void (*update_visual_confirm_color)(struct dc *dc,
>   			struct pipe_ctx *pipe_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/Makefile b/drivers/gpu/drm/amd/display/dc/irq/Makefile
> index ea4943c5d552..0d09181227c5 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/irq/Makefile
> @@ -117,9 +117,7 @@ IRQ_DCN3_03 = irq_service_dcn303.o
>   AMD_DAL_IRQ_DCN3_03 = $(addprefix $(AMDDALPATH)/dc/irq/dcn303/,$(IRQ_DCN3_03))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN3_03)
> -endif
>   
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   ###############################################################################
>   # DCN 31
>   ###############################################################################
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.h b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.h
> index d6c845f6bfbf..67efbfe9b7aa 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.h
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.h
> @@ -23,8 +23,6 @@
>    *
>    */
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> -
>   #ifndef __DAL_IRQ_SERVICE_DCN31_H__
>   #define __DAL_IRQ_SERVICE_DCN31_H__
>   
> @@ -34,4 +32,3 @@ struct irq_service *dal_irq_service_dcn31_create(
>   	struct irq_service_init_data *init_data);
>   
>   #endif /* __DAL_IRQ_SERVICE_DCN31_H__ */
> -#endif /* CONFIG_DRM_AMD_DC_DCN3_1 */
> diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
> index 2bf5e7207744..abbf7ae584c9 100644
> --- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
> +++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
> @@ -73,9 +73,7 @@ extern "C" {
>   /* Forward declarations */
>   struct dmub_srv;
>   struct dmub_srv_common_regs;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   struct dmub_srv_dcn31_regs;
> -#endif
>   
>   struct dmcub_trace_buf_entry;
>   
> @@ -97,9 +95,7 @@ enum dmub_asic {
>   	DMUB_ASIC_DCN301,
>   	DMUB_ASIC_DCN302,
>   	DMUB_ASIC_DCN303,
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	DMUB_ASIC_DCN31,
> -#endif
>   	DMUB_ASIC_MAX,
>   };
>   
> @@ -238,9 +234,7 @@ struct dmub_srv_hw_params {
>   	uint32_t psp_version;
>   	bool load_inst_const;
>   	bool skip_panel_power_sequence;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	bool disable_z10;
> -#endif
>   };
>   
>   /**
> @@ -400,9 +394,7 @@ struct dmub_srv {
>   
>   	/* private: internal use only */
>   	const struct dmub_srv_common_regs *regs;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	const struct dmub_srv_dcn31_regs *regs_dcn31;
> -#endif
>   
>   	struct dmub_srv_base_funcs funcs;
>   	struct dmub_srv_hw_funcs hw_funcs;
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> index 707c7d0e370a..7c4734f905d9 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -362,11 +362,7 @@ union dmub_fw_boot_options {
>   		uint32_t skip_phy_access : 1; /**< 1 if PHY access should be skipped */
>   		uint32_t disable_clk_gate: 1; /**< 1 if clock gating should be disabled */
>   		uint32_t skip_phy_init_panel_sequence: 1; /**< 1 to skip panel init seq */
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   		uint32_t z10_disable: 1; /**< 1 to disable z10 */
> -#else
> -		uint32_t reserved_unreleased: 1; /**< reserved for an unreleased feature */
> -#endif
>   		uint32_t reserved : 25; /**< reserved */
>   	} bits; /**< boot bits */
>   	uint32_t all; /**< 32-bit access to bits */
> @@ -631,7 +627,6 @@ enum dmub_cmd_type {
>   	 * Command type used for OUTBOX1 notification enable
>   	 */
>   	DMUB_CMD__OUTBOX1_ENABLE = 71,
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	/**
>   	 * Command type used for all idle optimization commands.
>   	 */
> @@ -644,7 +639,6 @@ enum dmub_cmd_type {
>   	 * Command type used for all panel control commands.
>   	 */
>   	DMUB_CMD__PANEL_CNTL = 74,
> -#endif
>   	/**
>   	 * Command type used for EDID CEA parsing
>   	 */
> @@ -854,8 +848,6 @@ struct dmub_rb_cmd_mall {
>   	uint8_t reserved2; /**< Reserved bits */
>   };
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
> -
>   /**
>    * enum dmub_cmd_idle_opt_type - Idle optimization command type.
>    */
> @@ -900,7 +892,7 @@ struct dmub_rb_cmd_clk_mgr_notify_clocks {
>   	struct dmub_cmd_header header; /**< header */
>   	struct dmub_clocks clocks; /**< clock data */
>   };
> -#endif
> +
>   /**
>    * struct dmub_cmd_digx_encoder_control_data - Encoder control data.
>    */
> @@ -2111,7 +2103,6 @@ struct dmub_rb_cmd_drr_update {
>   		struct dmub_optc_state dmub_optc_state_req;
>   };
>   
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   /**
>    * enum dmub_cmd_panel_cntl_type - Panel control command.
>    */
> @@ -2146,7 +2137,6 @@ struct dmub_rb_cmd_panel_cntl {
>   	struct dmub_cmd_header header; /**< header */
>   	struct dmub_cmd_panel_cntl_data data; /**< payload */
>   };
> -#endif
>   
>   /**
>    * Data passed from driver to FW in a DMUB_CMD__VBIOS_LVTMA_CONTROL command.
> @@ -2307,7 +2297,6 @@ union dmub_rb_cmd {
>   	 * Definition of a DMUB_CMD__MALL command.
>   	 */
>   	struct dmub_rb_cmd_mall mall;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   	/**
>   	 * Definition of a DMUB_CMD__IDLE_OPT_DCN_RESTORE command.
>   	 */
> @@ -2322,7 +2311,6 @@ union dmub_rb_cmd {
>   	 * Definition of DMUB_CMD__PANEL_CNTL commands.
>   	 */
>   	struct dmub_rb_cmd_panel_cntl panel_cntl;
> -#endif
>   	/**
>   	 * Definition of a DMUB_CMD__ABM_SET_PIPE command.
>   	 */
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
> index 80b9fe225208..0495bcdd3463 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
> +++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
> @@ -21,12 +21,8 @@
>   #
>   
>   DMUB = dmub_srv.o dmub_srv_stat.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
> -DMUB += dmub_dcn30.o dmub_dcn301.o
> -DMUB += dmub_dcn302.o
> -DMUB += dmub_dcn303.o
> -ifdef CONFIG_DRM_AMD_DC_DCN3_1
> +DMUB += dmub_dcn30.o dmub_dcn301.o dmub_dcn302.o dmub_dcn303.o
>   DMUB += dmub_dcn31.o
> -endif
>   
>   AMD_DAL_DMUB = $(addprefix $(AMDDALPATH)/dmub/src/,$(DMUB))
>   
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> index a195734b4ddf..fd7e996ab1d7 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> @@ -31,9 +31,7 @@
>   #include "dmub_dcn301.h"
>   #include "dmub_dcn302.h"
>   #include "dmub_dcn303.h"
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   #include "dmub_dcn31.h"
> -#endif
>   #include "os_types.h"
>   /*
>    * Note: the DMUB service is standalone. No additional headers should be
> @@ -208,7 +206,6 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
>   			funcs->setup_windows = dmub_dcn30_setup_windows;
>   		}
>   		break;
> -#ifdef CONFIG_DRM_AMD_DC_DCN3_1
>   
>   	case DMUB_ASIC_DCN31:
>   		funcs->reset = dmub_dcn31_reset;
> @@ -241,7 +238,6 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
>   		funcs->get_current_time = dmub_dcn31_get_current_time;
>   
>   		break;
> -#endif
>   
>   	default:
>   		return false;
> diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
> index d615a8e00f8c..381c17caace1 100644
> --- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
> +++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
> @@ -224,7 +224,6 @@ enum {
>   #define ASICREV_IS_GREEN_SARDINE(eChipRev) ((eChipRev >= GREEN_SARDINE_A0) && (eChipRev < 0xFF))
>   #endif
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   #define FAMILY_YELLOW_CARP                     146
>   
>   #define YELLOW_CARP_A0 0x01
> @@ -234,7 +233,6 @@ enum {
>   #ifndef ASICREV_IS_YELLOW_CARP
>   #define ASICREV_IS_YELLOW_CARP(eChipRev) ((eChipRev >= YELLOW_CARP_A0) && (eChipRev < YELLOW_CARP_UNKNOWN))
>   #endif
> -#endif
>   
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
> index 59453ced9ece..fe75ec834892 100644
> --- a/drivers/gpu/drm/amd/display/include/dal_types.h
> +++ b/drivers/gpu/drm/amd/display/include/dal_types.h
> @@ -55,9 +55,7 @@ enum dce_version {
>   	DCN_VERSION_3_01,
>   	DCN_VERSION_3_02,
>   	DCN_VERSION_3_03,
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	DCN_VERSION_3_1,
> -#endif
>   	DCN_VERSION_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
> index 62dd89cf70bb..1a0f7c3dc964 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
> @@ -172,10 +172,8 @@ char *mod_hdcp_status_to_str(int32_t status)
>   		return "MOD_HDCP_STATUS_HDCP2_REAUTH_LINK_INTEGRITY_FAILURE";
>   	case MOD_HDCP_STATUS_HDCP2_DEVICE_COUNT_MISMATCH_FAILURE:
>   		return "MOD_HDCP_STATUS_HDCP2_DEVICE_COUNT_MISMATCH_FAILURE";
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	case MOD_HDCP_STATUS_UNSUPPORTED_PSP_VER_FAILURE:
>   		return "MOD_HDCP_STATUS_UNSUPPORTED_PSP_VER_FAILURE";
> -#endif
>   	default:
>   		return "MOD_HDCP_STATUS_UNKNOWN";
>   	}
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> index fc88fe249a50..1b02056bc8bd 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> @@ -44,13 +44,9 @@ static void hdcp2_message_init(struct mod_hdcp *hdcp,
>   	in->process.msg3_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
>   	in->process.msg3_desc.msg_size = 0;
>   }
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   static enum mod_hdcp_status mod_hdcp_remove_display_from_topology_v2(
>   		struct mod_hdcp *hdcp, uint8_t index)
> -#else
> -enum mod_hdcp_status mod_hdcp_remove_display_from_topology(
> -		struct mod_hdcp *hdcp, uint8_t index)
> -#endif
>   {
>   	struct psp_context *psp = hdcp->config.psp.handle;
>   	struct ta_dtm_shared_memory *dtm_cmd;
> @@ -84,7 +80,7 @@ enum mod_hdcp_status mod_hdcp_remove_display_from_topology(
>   	mutex_unlock(&psp->dtm_context.mutex);
>   	return status;
>   }
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   static enum mod_hdcp_status mod_hdcp_remove_display_from_topology_v3(
>   		struct mod_hdcp *hdcp, uint8_t index)
>   {
> @@ -136,14 +132,9 @@ enum mod_hdcp_status mod_hdcp_remove_display_from_topology(
>   
>   	return status;
>   }
> -#endif
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +
>   static enum mod_hdcp_status mod_hdcp_add_display_to_topology_v2(
>   		struct mod_hdcp *hdcp, struct mod_hdcp_display *display)
> -#else
> -enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
> -					       struct mod_hdcp_display *display)
> -#endif
>   {
>   	struct psp_context *psp = hdcp->config.psp.handle;
>   	struct ta_dtm_shared_memory *dtm_cmd;
> @@ -189,7 +180,6 @@ enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
>   	return status;
>   }
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   static enum mod_hdcp_status mod_hdcp_add_display_to_topology_v3(
>   		struct mod_hdcp *hdcp, struct mod_hdcp_display *display)
>   {
> @@ -254,7 +244,7 @@ enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
>   
>   	return status;
>   }
> -#endif
> +
>   enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
>   {
>   
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h
> index b0b2544eaa9d..2937b4b61461 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h
> @@ -44,12 +44,8 @@ enum bgd_security_hdcp2_content_type {
>   enum ta_dtm_command {
>   	TA_DTM_COMMAND__UNUSED_1 = 1,
>   	TA_DTM_COMMAND__TOPOLOGY_UPDATE_V2,
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	TA_DTM_COMMAND__TOPOLOGY_ASSR_ENABLE,
>   	TA_DTM_COMMAND__TOPOLOGY_UPDATE_V3
> -#else
> -	TA_DTM_COMMAND__TOPOLOGY_ASSR_ENABLE
> -#endif
>   };
>   
>   /* DTM related enumerations */
> @@ -91,7 +87,6 @@ struct ta_dtm_topology_update_input_v2 {
>   	uint32_t max_hdcp_supported_version;
>   };
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   /* For security reason/HW may change value, these encoder type enum values are not HW register values */
>   /* Security code will check real HW register values and these SW enum values */
>   enum ta_dtm_encoder_type {
> @@ -117,7 +112,7 @@ struct ta_dtm_topology_update_input_v3 {
>   	uint32_t phy_id;
>   	uint32_t link_hdcp_cap;
>   };
> -#endif
> +
>   struct ta_dtm_topology_assr_enable {
>   	uint32_t display_topology_dig_be_index;
>   };
> @@ -131,9 +126,7 @@ struct ta_dtm_topology_assr_enable {
>   union ta_dtm_cmd_input {
>   	struct ta_dtm_topology_update_input_v2 topology_update_v2;
>   	struct ta_dtm_topology_assr_enable topology_assr_enable;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	struct ta_dtm_topology_update_input_v3 topology_update_v3;
> -#endif
>   };
>   
>   union ta_dtm_cmd_output {
> @@ -313,10 +306,8 @@ enum ta_hdcp2_version {
>   	TA_HDCP2_VERSION_UNKNOWN = 0,
>   	TA_HDCP2_VERSION_2_0 = 20,
>   	TA_HDCP2_VERSION_2_1 = 21,
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
> +	TA_HDCP2_VERSION_2_2 = 22,
>   	TA_HDCP2_VERSION_2_3 = 23,
> -#endif
> -	TA_HDCP2_VERSION_2_2 = 22
>   };
>   
>   /* input/output structures for HDCP commands */
> diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h b/drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h
> index 2197c269e0a7..c590493fd293 100644
> --- a/drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h
> +++ b/drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h
> @@ -97,9 +97,7 @@ enum mod_hdcp_status {
>   	MOD_HDCP_STATUS_HDCP2_REAUTH_REQUEST,
>   	MOD_HDCP_STATUS_HDCP2_REAUTH_LINK_INTEGRITY_FAILURE,
>   	MOD_HDCP_STATUS_HDCP2_DEVICE_COUNT_MISMATCH_FAILURE,
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	MOD_HDCP_STATUS_UNSUPPORTED_PSP_VER_FAILURE,
> -#endif
>   };
>   
>   struct mod_hdcp_displayport {
> @@ -123,13 +121,11 @@ enum mod_hdcp_display_state {
>   	MOD_HDCP_DISPLAY_ENCRYPTION_ENABLED
>   };
>   
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   struct mod_hdcp_psp_caps {
>   	uint8_t dtm_v3_supported;
>   	uint8_t opm_state_query_supported;
>   };
>   
> -#endif
>   enum mod_hdcp_display_disable_option {
>   	MOD_HDCP_DISPLAY_NOT_DISABLE = 0,
>   	MOD_HDCP_DISPLAY_DISABLE_AUTHENTICATION,
> @@ -162,9 +158,7 @@ struct mod_hdcp_ddc {
>   struct mod_hdcp_psp {
>   	void *handle;
>   	void *funcs;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	struct mod_hdcp_psp_caps caps;
> -#endif
>   };
>   
>   struct mod_hdcp_display_adjustment {
> @@ -240,9 +234,7 @@ struct mod_hdcp_display {
>   	uint8_t index;
>   	uint8_t controller;
>   	uint8_t dig_fe;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	uint8_t stream_enc_idx;
> -#endif
>   	union {
>   		uint8_t vc_id;
>   	};
> @@ -255,11 +247,9 @@ struct mod_hdcp_link {
>   	enum mod_hdcp_operation_mode mode;
>   	uint8_t dig_be;
>   	uint8_t ddc_line;
> -#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
>   	uint8_t link_enc_idx;
>   	uint8_t phy_idx;
>   	uint8_t hdcp_supported_informational;
> -#endif
>   	union {
>   		struct mod_hdcp_displayport dp;
>   		struct mod_hdcp_hdmi hdmi;
> 

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
