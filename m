Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910E3F2DDD
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Aug 2021 16:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8C26EAA0;
	Fri, 20 Aug 2021 14:19:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0B6EAA0
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Aug 2021 14:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdAGzqJ8Nnz0DCJ7Mh4fc4yi3PX+0wSw2aRuotZFeqA6tCuUXoa1Y0qeHkuwWLD7SnccMYUjn0mRn4cN4IUkbFxsONDj+ywOCkuLqYhICjGbhEUpStAw0tR1mYCP4u2+u4hg43OUFSxSVM5W5OnrRPfArfaHgsEtoHoQ/AVGDIVuk0roH9bG3OyxUPqc9wgLdDO6g6spZ9RllkULGQg3GlM9/mgbLUufi0BJWjPIav7TZeAY43MBdMWWWj+Rh6tC3NvuKB+fVWksHVtNITRBHvIX3K8A/OuGqCbxM715YBw6ziEXPnft1oHhpqm+zenMQYa2hgqC15MjN3wjqVoD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE/8YdR4uZNUc6sCVfj+GgzUH6M2DNY6JZB85pZOo1s=;
 b=ENlZpAcoLGzoHQOh/A9fwqVK3XhWP5bE+R/Xx9yXg8/zxtkWE04I+f1j1MjOJOc+/8g9PCynvf6X5LFApCQnGM0TF8SXWV5BYCvAJEyuzESeiUMvgl8XTkT7jVfEp5LwctHf0JDGmwaa53iSeaZ/upYOLA2uAEpvLOysm+rfR/HAgh9gMnUozAUcMC8Eau71Id7Lkq3RZKIgw3Sv3ytKXixcScYelJSIriO/zW2buqob5Z27fKj3RpM5jEzU+/1JFbX1pUw9vMkdUG8z7w9eitfG1giE3vtFgNsJQtd633bUJYbd2yY9KL+Oc9tcdigF6EuRct06U7IwVAPBwbC8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE/8YdR4uZNUc6sCVfj+GgzUH6M2DNY6JZB85pZOo1s=;
 b=oIMfdCuhHzPhNcfHxQntE8PaDFlhKMBD1Rh5mSN1OABSAaC64XtcaG1kyQwPKndV4u4hsU3jT1g/WVqaZdmR36VHg2c3a/qOj7Rs0sdMId5JYwfAzPwL1awgNqLFS1L9VCVrHd1/oGzJ0BioXO2yN1asTfvPBxmWsBnG5r6NYek=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by DM6PR12MB5535.namprd12.prod.outlook.com (2603:10b6:5:20a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 14:19:51 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::812c:c10a:1b16:6e71]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::812c:c10a:1b16:6e71%4]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 14:19:51 +0000
Subject: Re: [PATCH v3 6/6] drm/amd/display: Add DP 2.0 SST DC Support
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 harry.wentland@amd.com
Cc: wayne.lin@amd.com
References: <20210819185840.3682559-1-Jerry.Zuo@amd.com>
 <20210819185840.3682559-7-Jerry.Zuo@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <782c16d1-f295-fefe-a78e-d676712bf7d1@amd.com>
Date: Fri, 20 Aug 2021 10:19:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210819185840.3682559-7-Jerry.Zuo@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To DM4PR12MB5182.namprd12.prod.outlook.com
 (2603:10b6:5:395::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.16.161] (165.204.54.211) by
 YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 14:19:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33203521-90d0-4557-b14c-08d963e592d2
X-MS-TrafficTypeDiagnostic: DM6PR12MB5535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB5535A5E9218625DFE60AE539ECC19@DM6PR12MB5535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F5/QzBs0NoH9e05mAO1Li6KLrBorShv2ajVmtGnwTH9FKRwjVUJ6sIXD4kcKNcSun+GLrE2Cv9BD0q2CDJ8+FD/wqHkP7q/1uB+/tJA/ts4D1oK3Jd2vB3zqHH/WAOG2oLy1Cyqq/EUlG6OtALsWblRSOyYmzh6MJYjgvchDU3MSa7SNxWxWE+RaJT5vHFRewKpJiXJLPXLLWQyy84y0d4mA6glvWb56LGR4v+weg12gr2ie7Oup133+1Dvf60k9AstcTvuiLEdEZn/SH3o3M4NX26m7MopFJfhWc6sxrgN5ZHiMEdvR9YVo6qb7c4Eb38OJoUyKm/pZMCGn53VjRrtLOxwNMbXt3Ro1xv0kRnu9HZi708jXRVrnqsCaNAeXfQwZ2vQ3yenCvu+axgLtIFysuaRC9AawkbzYbd/M0lp2YvEYoQcZWUuNs4pVx9HDgskfBG6IrHf4X4Ie1f/ATcqOvJn0KKy+cs5+IcaU24puOEJhWI5Y5icy8IhsF1HUW/CCewex/V+mH8KvpwDBHRzuztRMfZuudFkswATWQ3gHA5QVeEZ0zKvLfO/EjcHtLGGiUwpadRj3EbHR/IvsoOm9euahnzRmi30xnSQnC/fpTGPBLKKAwVncBLYYUczcpk2PiGhC98Tsfa3K7kjoOvTuFvVL2oDkWTZHQirkjFekw86LT7Oq6ZB0FbQIiBCfGUSc/+79f30ditM47W6dLWKZFRx3pklzqaivss56UabYxR0eWGL0IIN2qIsnruOiUHPEDIZWiwHS44yZNUOP9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5182.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(30864003)(66946007)(186003)(26005)(53546011)(38100700002)(31686004)(83380400001)(316002)(31696002)(86362001)(2906002)(6486002)(16576012)(8936002)(2616005)(66556008)(36756003)(956004)(66476007)(8676002)(5660300002)(6636002)(508600001)(334744004)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rys3OUtJaklXdzl1NDlnWDZONythTVFjcktjdUpZd1I3enlxck9PblA3bi9O?=
 =?utf-8?B?ZEdQNURhajU2V1Q2MXg1TUVQRGFnMGJQRGc0UW9rbGVXY1hnZjcrTmlaS2NP?=
 =?utf-8?B?WGtnS001MDZjTDdwQWFSbzg3MTEyZ3JNTjRNcjhjbHFMMGpBaDN6eVI1UEh1?=
 =?utf-8?B?dUM0aC82N2pBaUVqNHo2OTlwY25zM0tFd2sxUzN2RHZRSG8rUm5raGk0cjI3?=
 =?utf-8?B?NlZLcXphSnVYUjZCaW9LUjZodXlxR0lZNHNRTm80dnM5bVlPeHdiNzQ1SzNR?=
 =?utf-8?B?MWI0cjFhQnplUG9iNzFXemVlOTlYZ2pqL3JaUnRrNWxQU0NLWTdmd2I4OW5r?=
 =?utf-8?B?NkhsdmY5aHlOaXpkcmZzRHBxYllJUTQ2L0NSSXlERElnSGNuWldqV29LeVBQ?=
 =?utf-8?B?SmZDOTAzL0xBbjk3dFplSHg3UDM3Sk5aSGs5ZjNhd0o3R0xrZUJkN1RuMXc0?=
 =?utf-8?B?UzFxcTBWb28ycEhUcEtvSjVYMVRJSDAyTTB0ZHNOU09veW9rZE1md1I0Nk5i?=
 =?utf-8?B?UUY2b0x0Wnl4MGNBdTJLNUloN0RaQ2JKR2lGY0pHbXI4eHFQdTBOTWtqWmtT?=
 =?utf-8?B?d1hkYVYyWmdMOUp5OC9JNm5zT0g3bFNYY29vamhlblJwd3NJKzJ0UmNxSGla?=
 =?utf-8?B?R3lVcUlweVRDUzl1bXF5LzEyeDRVVVVaQ2VTS015L2JjQmlRRGorMUVRZ3cr?=
 =?utf-8?B?QjZSWCsvMUJMOVVCOHpaQzFQUGJPSmJaMlhMZ25uVWluS1Q3NDRHYlBTYkY2?=
 =?utf-8?B?S2t4dURoa2NMZXAvTTdySHVZSUYzc0NPeS9IYnlSUHVEb3FKWmJNUWhWYjEv?=
 =?utf-8?B?SnFrdzRKMm4zdWFjM0l5a2dYNHhlMEVnMnRnNU1FdXdtMHV4Vm5KbjZ5TzdI?=
 =?utf-8?B?NmFoRXgyQVYxTytMOW5ldjZ2YjJYd2RMTFd2aXhGWjFQNTNrK1BiZ2JNRDdk?=
 =?utf-8?B?ZzBmeEVRbzBCSW84b3VQalV1dXBKRmZvakY1ZmoxR253T3pZdDFQRUtwZC80?=
 =?utf-8?B?RzY1cGd4NERNdjhMSVJ5Zi9nak1wYkN3clBTY2VBaE55Z25hS1dZQmN5Wm9M?=
 =?utf-8?B?d2tWUm9UTVpRdDVWRGtJZmpYUGJxZTZpQWNwb0hoNFFXZ1NmNVIrb2h1L25F?=
 =?utf-8?B?a29rdFBxc2hCeUtDUG1QaDRnNXlEUXYwNG12OVJMUUJqQ3VxRGkrd2ovWDNx?=
 =?utf-8?B?bTRsUFpjZ21mZWhDZFVZZEd0a3hodlcyWThqTDE3Q0FnaXJ4ZFJxamZFbUlx?=
 =?utf-8?B?UXBwOHJRVmpzNzM0Y2F2aXJBc0IyWnRXbXNsdmpaZDZ4aWNIZ3ZFMkVvS1Iw?=
 =?utf-8?B?ZmFiYWRnSnp1dUZwbUg4UW10bTNMNENJd1FNTlNaRVR1YkRVREZ3RU1Qa2V6?=
 =?utf-8?B?bEtmNkRtV0hnL1hZM21uYnVhSDBtMHVDZDFValBUcXZvYUZRWWNycFFTVTRH?=
 =?utf-8?B?Lzh1ZkdhdzZGckhhMVVZVGF4bWRnQTBXOW5PVGdLa25YVDM1VHQ3UExTRmFG?=
 =?utf-8?B?a2d6dUxTejlxeXlUaHp0c3VlUzVxZTl5eVk0b09qTnRTQ3RFTWJGeGl1NXNJ?=
 =?utf-8?B?VWJISWpFc095TnNoQnNQOEx2OXNTRVkzME8rRlorajJPMkl1WW5YbWgrTWVS?=
 =?utf-8?B?WXRsdEk2TXJ2ZGhOYzBsamhUZENjZHVQRmFPWnprOXBZZVRPN2RnZ0p1L3Bu?=
 =?utf-8?B?eUtzQ2JvV1FWMjZrYzlUWk1xRTFlQ3dzU3YrRHNHTFJIKysrb3JrMUovSVhj?=
 =?utf-8?Q?3y+uAonhg6UOvudAjOCS6EXzGjzd2yNPqjZFwWw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33203521-90d0-4557-b14c-08d963e592d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 14:19:51.4445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxhjnEgsmjuEN/ClzWeoXJV33oK5F90KhazjdW07IFP73xqNoRRgYsjeZyzMYUwmM9sztubUnR/Tq086nRA2+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5535
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

On 2021-08-19 2:58 p.m., Fangzhi Zuo wrote:
> 1. Retrieve 128/132b link cap.
> 2. 128/132b link training and payload allocation.
> 3. UHBR10 link rate support.
> 
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>

Minor nitpick with some of the guarding, but otherwise this is probably 
okay to merge in. Series is

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Please make sure you fix the guarding mentioned on the other patch 
before merge though.

Regards,
Nicholas Kazlauskas

> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |    8 +
>   drivers/gpu/drm/amd/display/dc/core/dc.c      |   21 +
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c |  520 +++++++-
>   .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 1168 ++++++++++++++++-
>   .../drm/amd/display/dc/core/dc_link_hwss.c    |  314 ++++-
>   .../gpu/drm/amd/display/dc/core/dc_resource.c |  118 ++
>   drivers/gpu/drm/amd/display/dc/dc.h           |   27 +-
>   drivers/gpu/drm/amd/display/dc/dc_dp_types.h  |  222 ++++
>   drivers/gpu/drm/amd/display/dc/dc_link.h      |    3 +
>   drivers/gpu/drm/amd/display/dc/dc_types.h     |   21 +
>   .../display/dc/dce110/dce110_hw_sequencer.c   |  104 +-
>   .../amd/display/dc/dcn10/dcn10_link_encoder.c |    9 +
>   .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   26 +-
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |    4 +
>   .../drm/amd/display/dc/dcn31/dcn31_resource.c |   18 +-
>   drivers/gpu/drm/amd/display/dc/dm_cp_psp.h    |    1 +
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    2 +
>   .../gpu/drm/amd/display/dc/inc/dc_link_dp.h   |   22 +
>   .../amd/display/dc/inc/hw_sequencer_private.h |    3 +
>   drivers/gpu/drm/amd/display/dc/inc/resource.h |    5 +
>   .../gpu/drm/amd/display/include/dpcd_defs.h   |   16 +
>   .../amd/display/include/link_service_types.h  |   24 +-
>   .../drm/amd/display/include/logger_types.h    |    6 +
>   23 files changed, 2619 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 6fee12c91ef5..22ddd8d71bcf 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -751,3 +751,11 @@ void dm_helpers_mst_enable_stream_features(const struct dc_stream_state *stream)
>   					 &new_downspread.raw,
>   					 sizeof(new_downspread));
>   }
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +void dm_set_phyd32clk(struct dc_context *ctx, int freq_khz)
> +{
> +       // FPGA programming for this clock in diags framework that
> +       // needs to go through dm layer, therefore leave dummy interace here
> +}
> +#endif
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 7a442fcfa6ac..8d4d804df5b2 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -186,6 +186,9 @@ static bool create_links(
>   	int i;
>   	int connectors_num;
>   	struct dc_bios *bios = dc->ctx->dc_bios;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	int dp_hpo_link_count = 0;
> +#endif
>   
>   	dc->link_count = 0;
>   
> @@ -255,6 +258,24 @@ static bool create_links(
>   			goto failed_alloc;
>   		}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) &&
> +				dc->caps.dp_hpo &&
> +				link->dc->res_pool->res_cap->num_hpo_dp_link_encoder > 0) {
> +			/* FPGA case - Allocate HPO DP link encoder */
> +			if (i < link->dc->res_pool->res_cap->num_hpo_dp_link_encoder) {
> +				link->hpo_dp_link_enc = link->dc->res_pool->hpo_dp_link_enc[i];
> +
> +				if (link->hpo_dp_link_enc == NULL) {
> +					BREAK_TO_DEBUGGER();
> +					goto failed_alloc;
> +				}
> +				link->hpo_dp_link_enc->hpd_source = link->link_enc->hpd_source;
> +				link->hpo_dp_link_enc->transmitter = link->link_enc->transmitter;
> +			}
> +		}
> +#endif
> +
>   		link->link_status.dpcd_caps = &link->dpcd_caps;
>   
>   		enc_init.ctx = dc->ctx;
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 8bd7f42a8053..bb06d8e3312e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -64,6 +64,31 @@
>   /*******************************************************************************
>    * Private functions
>    ******************************************************************************/
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static bool add_dp_hpo_link_encoder_to_link(struct dc_link *link)
> +{
> +	struct hpo_dp_link_encoder *enc = resource_get_unused_hpo_dp_link_encoder(
> +					link->dc->res_pool);
> +
> +	if (!link->hpo_dp_link_enc && enc) {
> +		link->hpo_dp_link_enc = enc;
> +		link->hpo_dp_link_enc->transmitter = link->link_enc->transmitter;
> +		link->hpo_dp_link_enc->hpd_source = link->link_enc->hpd_source;
> +	}
> +
> +	return (link->hpo_dp_link_enc != NULL);
> +}
> +
> +static void remove_dp_hpo_link_encoder_from_link(struct dc_link *link)
> +{
> +	if (link->hpo_dp_link_enc) {
> +		link->hpo_dp_link_enc->hpd_source = HPD_SOURCEID_UNKNOWN;
> +		link->hpo_dp_link_enc->transmitter = TRANSMITTER_UNKNOWN;
> +		link->hpo_dp_link_enc = NULL;
> +	}
> +}
> +#endif
> +
>   static void dc_link_destruct(struct dc_link *link)
>   {
>   	int i;
> @@ -91,6 +116,12 @@ static void dc_link_destruct(struct dc_link *link)
>   		link->link_enc->funcs->destroy(&link->link_enc);
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (link->hpo_dp_link_enc) {
> +		remove_dp_hpo_link_encoder_from_link(link);
> +	}
> +#endif
> +
>   	if (link->local_sink)
>   		dc_sink_release(link->local_sink);
>   
> @@ -928,6 +959,11 @@ static bool dc_link_detect_helper(struct dc_link *link,
>   				return false;
>   			}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (dp_get_link_encoding_format(&link->reported_link_cap) == DP_128b_132b_ENCODING)
> +				add_dp_hpo_link_encoder_to_link(link);
> +#endif
> +
>   			if (link->type == dc_connection_mst_branch) {
>   				LINK_INFO("link=%d, mst branch is now Connected\n",
>   					  link->link_index);
> @@ -1173,6 +1209,11 @@ static bool dc_link_detect_helper(struct dc_link *link,
>   			       sizeof(link->mst_stream_alloc_table.stream_allocations));
>   		}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
> +			reset_dp_hpo_stream_encoders_for_link(link);
> +#endif
> +
>   		link->type = dc_connection_none;
>   		sink_caps.signal = SIGNAL_TYPE_NONE;
>   		/* When we unplug a passive DP-HDMI dongle connection, dongle_max_pix_clk
> @@ -1549,6 +1590,9 @@ static bool dc_link_construct(struct dc_link *link,
>   	}
>   
>   	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
> +#endif
>   
>   	/* Update link encoder tracking variables. These are used for the dynamic
>   	 * assignment of link encoders to streams.
> @@ -1741,17 +1785,36 @@ static enum dc_status enable_link_dp(struct dc_state *state,
>   	/* get link settings for video mode timing */
>   	decide_link_settings(stream, &link_settings);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&link_settings) == DP_128b_132b_ENCODING &&
> +			pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT) {
> +		dp_enable_mst_on_sink(link, true);
> +	}
> +#endif
> +
>   	if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP) {
>   		/*in case it is not on*/
>   		link->dc->hwss.edp_power_control(link, true);
>   		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&link_settings) == DP_128b_132b_ENCODING) {
> +		/* TODO - DP2.0 HW: calculate 32 symbol clock for HPO encoder */
> +	} else {
> +		pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
> +				link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
> +		if (state->clk_mgr && !apply_seamless_boot_optimization)
> +			state->clk_mgr->funcs->update_clocks(state->clk_mgr,
> +					state, false);
> +	}
> +#else
>   	pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
> -			link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
> +		link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
>   	if (state->clk_mgr && !apply_seamless_boot_optimization)
>   		state->clk_mgr->funcs->update_clocks(state->clk_mgr,
> -						     state, false);
> +											state, false);
> +#endif
>   
>   	// during mode switch we do DP_SET_POWER off then on, and OUI is lost
>   	dpcd_set_source_specific_data(link);
> @@ -1780,7 +1843,12 @@ static enum dc_status enable_link_dp(struct dc_state *state,
>   	else
>   		fec_enable = true;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING)
> +		dp_set_fec_enable(link, fec_enable);
> +#else
>   	dp_set_fec_enable(link, fec_enable);
> +#endif
>   
>   	// during mode set we do DP_SET_POWER off then on, aux writes are lost
>   	if (link->dpcd_sink_ext_caps.bits.oled == 1 ||
> @@ -2284,6 +2352,9 @@ static void disable_link(struct dc_link *link, enum signal_type signal)
>   
>   	if (dc_is_dp_signal(signal)) {
>   		/* SST DP, eDP */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		struct dc_link_settings link_settings = link->cur_link_settings;
> +#endif
>   		if (dc_is_dp_sst_signal(signal))
>   			dp_disable_link_phy(link, signal);
>   		else
> @@ -2291,8 +2362,15 @@ static void disable_link(struct dc_link *link, enum signal_type signal)
>   
>   		if (dc_is_dp_sst_signal(signal) ||
>   				link->mst_stream_alloc_table.stream_count == 0) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
> +				dp_set_fec_enable(link, false);
> +				dp_set_fec_ready(link, false);
> +			}
> +#else
>   			dp_set_fec_enable(link, false);
>   			dp_set_fec_ready(link, false);
> +#endif
>   		}
>   	} else {
>   		if (signal != SIGNAL_TYPE_VIRTUAL)
> @@ -2475,9 +2553,14 @@ static bool dp_active_dongle_validate_timing(
>   		break;
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dpcd_caps->dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER &&
> +			dongle_caps->extendedCapValid == true) {
> +#else
>   	if (dpcd_caps->dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER ||
>   		dongle_caps->extendedCapValid == false)
>   		return true;
> +#endif
>   
>   	/* Check Pixel Encoding */
>   	switch (timing->pixel_encoding) {
> @@ -2520,6 +2603,87 @@ static bool dp_active_dongle_validate_timing(
>   	if (get_timing_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
>   		return false;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	}
> +
> +	if (dongle_caps->dfp_cap_ext.supported) {
> +
> +		if (dongle_caps->dfp_cap_ext.max_pixel_rate_in_mps < (timing->pix_clk_100hz / 10000))
> +			return false;
> +
> +		if (dongle_caps->dfp_cap_ext.max_video_h_active_width < timing->h_addressable)
> +			return false;
> +
> +		if (dongle_caps->dfp_cap_ext.max_video_v_active_height < timing->v_addressable)
> +			return false;
> +
> +		if (timing->pixel_encoding == PIXEL_ENCODING_RGB) {
> +			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
> +				return false;
> +			if (timing->display_color_depth == COLOR_DEPTH_666 &&
> +					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_6bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_888 &&
> +					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_8bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
> +					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_10bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
> +					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_12bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
> +					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_16bpc)
> +				return false;
> +		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR444) {
> +			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
> +				return false;
> +			if (timing->display_color_depth == COLOR_DEPTH_888 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_8bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_10bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_12bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_16bpc)
> +				return false;
> +		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
> +			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
> +				return false;
> +			if (timing->display_color_depth == COLOR_DEPTH_888 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_8bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_10bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_12bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_16bpc)
> +				return false;
> +		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420) {
> +			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
> +				return false;
> +			if (timing->display_color_depth == COLOR_DEPTH_888 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_8bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_10bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_12bpc)
> +				return false;
> +			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
> +					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_16bpc)
> +				return false;
> +		}
> +	}
> +#endif
> +
>   	return true;
>   }
>   
> @@ -3016,6 +3180,159 @@ static void update_mst_stream_alloc_table(
>   		link->mst_stream_alloc_table.stream_allocations[i] =
>   				work_table[i];
>   }
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +/* TODO: Temp function for Diags FPGA */
> +static void dp2_update_mst_stream_alloc_table(
> +	struct dc_link *link,
> +	struct stream_encoder *dio_stream_enc,
> +	struct hpo_dp_stream_encoder *hpo_dp_stream_enc,
> +	const struct dp_mst_stream_allocation_table *proposed_table)
> +{
> +	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = {
> +			{ 0 } };
> +	struct link_mst_stream_allocation *dc_alloc;
> +
> +	int i;
> +	int j;
> +
> +	/* if DRM proposed_table has more than one new payload */
> +	ASSERT(proposed_table->stream_count -
> +			link->mst_stream_alloc_table.stream_count < 2);
> +
> +	/* copy proposed_table to link, add stream encoder */
> +	for (i = 0; i < proposed_table->stream_count; i++) {
> +
> +		for (j = 0; j < link->mst_stream_alloc_table.stream_count; j++) {
> +			dc_alloc =
> +			&link->mst_stream_alloc_table.stream_allocations[j];
> +
> +			if (dc_alloc->vcp_id ==
> +				proposed_table->stream_allocations[i].vcp_id) {
> +
> +				work_table[i] = *dc_alloc;
> +				break; /* exit j loop */
> +			}
> +		}
> +
> +		/* new vcp_id */
> +		if (j == link->mst_stream_alloc_table.stream_count) {
> +			work_table[i].vcp_id =
> +				proposed_table->stream_allocations[i].vcp_id;
> +			work_table[i].slot_count =
> +				proposed_table->stream_allocations[i].slot_count;
> +			work_table[i].stream_enc = dio_stream_enc;
> +			work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
> +		}
> +	}
> +
> +	/* update link->mst_stream_alloc_table with work_table */
> +	link->mst_stream_alloc_table.stream_count =
> +			proposed_table->stream_count;
> +	for (i = 0; i < MAX_CONTROLLER_NUM; i++)
> +		link->mst_stream_alloc_table.stream_allocations[i] =
> +				work_table[i];
> +}
> +
> +/*
> + * Payload allocation/deallocation for SST introduced in DP2.0
> + */
> +enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx, bool allocate)
> +{
> +	struct dc_stream_state *stream = pipe_ctx->stream;
> +	struct dc_link *link = stream->link;
> +	struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
> +	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
> +	struct link_mst_stream_allocation_table proposed_table = {0};
> +	struct fixed31_32 avg_time_slots_per_mtp;
> +	DC_LOGGER_INIT(link->ctx->logger);
> +
> +	/* slot X.Y for SST payload deallocate */
> +	if (!allocate) {
> +		avg_time_slots_per_mtp = dc_fixpt_from_int(0);
> +
> +		DC_LOG_DP2("SST Update Payload: set_throttled_vcp_size slot X.Y for SST stream"
> +				"X: %d "
> +				"Y: %d",
> +				dc_fixpt_floor(
> +					avg_time_slots_per_mtp),
> +				dc_fixpt_ceil(
> +					dc_fixpt_shl(
> +						dc_fixpt_sub_int(
> +							avg_time_slots_per_mtp,
> +							dc_fixpt_floor(
> +									avg_time_slots_per_mtp)),
> +						26)));
> +
> +		hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
> +				hpo_dp_link_encoder,
> +				hpo_dp_stream_encoder->inst,
> +				avg_time_slots_per_mtp);
> +	}
> +
> +	/* calculate VC payload and update branch with new payload allocation table*/
> +	if (!dpcd_write_128b_132b_sst_payload_allocation_table(
> +			stream,
> +			link,
> +			&proposed_table,
> +			allocate)) {
> +		DC_LOG_ERROR("SST Update Payload: Failed to update "
> +						"allocation table for "
> +						"pipe idx: %d\n",
> +						pipe_ctx->pipe_idx);
> +	}
> +
> +	proposed_table.stream_allocations[0].hpo_dp_stream_enc = hpo_dp_stream_encoder;
> +
> +	ASSERT(proposed_table.stream_count == 1);
> +
> +	//TODO - DP2.0 Logging: Instead of hpo_dp_stream_enc pointer, log instance id
> +	DC_LOG_DP2("SST Update Payload: hpo_dp_stream_enc: %p      "
> +		"vcp_id: %d      "
> +		"slot_count: %d\n",
> +		(void *) proposed_table.stream_allocations[0].hpo_dp_stream_enc,
> +		proposed_table.stream_allocations[0].vcp_id,
> +		proposed_table.stream_allocations[0].slot_count);
> +
> +	/* program DP source TX for payload */
> +	hpo_dp_link_encoder->funcs->update_stream_allocation_table(
> +			hpo_dp_link_encoder,
> +			&proposed_table);
> +
> +	/* poll for ACT handled */
> +	if (!dpcd_poll_for_allocation_change_trigger(link)) {
> +		// Failures will result in blackscreen and errors logged
> +		BREAK_TO_DEBUGGER();
> +	}
> +
> +	/* slot X.Y for SST payload allocate */
> +	if (allocate) {
> +		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, link);
> +
> +		DC_LOG_DP2("SST Update Payload: "
> +				"slot.X: %d      "
> +				"slot.Y: %d",
> +				dc_fixpt_floor(
> +					avg_time_slots_per_mtp),
> +				dc_fixpt_ceil(
> +					dc_fixpt_shl(
> +						dc_fixpt_sub_int(
> +							avg_time_slots_per_mtp,
> +							dc_fixpt_floor(
> +									avg_time_slots_per_mtp)),
> +						26)));
> +
> +		hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
> +				hpo_dp_link_encoder,
> +				hpo_dp_stream_encoder->inst,
> +				avg_time_slots_per_mtp);
> +	}
> +
> +	/* Always return DC_OK.
> +	 * If part of sequence fails, log failure(s) and show blackscreen
> +	 */
> +	return DC_OK;
> +}
> +#endif
>   
>   /* convert link_mst_stream_alloc_table to dm dp_mst_stream_alloc_table
>    * because stream_encoder is not exposed to dm
> @@ -3203,6 +3520,11 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
>   		config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
>   		config.link_enc_idx = pipe_ctx->stream->link->link_enc->transmitter - TRANSMITTER_UNIPHY_A;
>   		config.phy_idx = pipe_ctx->stream->link->link_enc->transmitter - TRANSMITTER_UNIPHY_A;
> +		if (is_dp_128b_132b_signal(pipe_ctx)) {
> +			config.stream_enc_idx = pipe_ctx->stream_res.hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0;
> +			config.link_enc_idx = pipe_ctx->stream->link->hpo_dp_link_enc->inst;
> +			config.dp2_enabled = 1;
> +		}
>   #endif
>   		config.dpms_off = dpms_off;
>   		config.dm_stream_ctx = pipe_ctx->stream->dm_stream_context;
> @@ -3214,6 +3536,88 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
>   }
>   #endif
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pipe_ctx *pipe_ctx)
> +{
> +	struct dc *dc = pipe_ctx->stream->ctx->dc;
> +	struct dc_stream_state *stream = pipe_ctx->stream;
> +	struct link_mst_stream_allocation_table proposed_table = {0};
> +	struct fixed31_32 avg_time_slots_per_mtp;
> +	uint8_t req_slot_count = 0;
> +	uint8_t vc_id = 1; /// VC ID always 1 for SST
> +
> +	struct dc_link_settings link_settings = {0};
> +	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
> +
> +	decide_link_settings(stream, &link_settings);
> +	stream->link->cur_link_settings = link_settings;
> +
> +	/*  Enable clock, Configure lane count, and Enable Link Encoder*/
> +	enable_dp_hpo_output(stream->link, &stream->link->cur_link_settings);
> +
> +#ifdef DIAGS_BUILD
> +	/* Workaround for FPGA HPO capture DP link data:
> +	 * HPO capture will set link to active mode
> +	 * This workaround is required to get a capture from start of frame
> +	 */
> +	if (!dc->debug.fpga_hpo_capture_en) {
> +		struct encoder_set_dp_phy_pattern_param params = {0};
> +		params.dp_phy_pattern = DP_TEST_PATTERN_VIDEO_MODE;
> +
> +		/* Set link active */
> +		stream->link->hpo_dp_link_enc->funcs->set_link_test_pattern(
> +				stream->link->hpo_dp_link_enc,
> +				&params);
> +	}
> +#endif
> +
> +	/* Enable DP_STREAM_ENC */
> +	dc->hwss.enable_stream(pipe_ctx);
> +
> +	/* Set DPS PPS SDP (AKA "info frames") */
> +	if (pipe_ctx->stream->timing.flags.DSC) {
> +		dp_set_dsc_pps_sdp(pipe_ctx, true);
> +	}
> +
> +	/* Allocate Payload */
> +	if ((stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) && (state->stream_count > 1)) {
> +		// MST case
> +		uint8_t i;
> +
> +		proposed_table.stream_count = state->stream_count;
> +		for (i = 0; i < state->stream_count; i++) {
> +			avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(state->streams[i], state->streams[i]->link);
> +			req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
> +			proposed_table.stream_allocations[i].slot_count = req_slot_count;
> +			proposed_table.stream_allocations[i].vcp_id = i+1;
> +			/* NOTE: This makes assumption that pipe_ctx index is same as stream index */
> +			proposed_table.stream_allocations[i].hpo_dp_stream_enc = state->res_ctx.pipe_ctx[i].stream_res.hpo_dp_stream_enc;
> +		}
> +	} else {
> +		// SST case
> +		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, stream->link);
> +		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
> +		proposed_table.stream_count = 1; /// Always 1 stream for SST
> +		proposed_table.stream_allocations[0].slot_count = req_slot_count;
> +		proposed_table.stream_allocations[0].vcp_id = vc_id;
> +		proposed_table.stream_allocations[0].hpo_dp_stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
> +	}
> +
> +	stream->link->hpo_dp_link_enc->funcs->update_stream_allocation_table(
> +			stream->link->hpo_dp_link_enc,
> +			&proposed_table);
> +
> +	stream->link->hpo_dp_link_enc->funcs->set_throttled_vcp_size(
> +			stream->link->hpo_dp_link_enc,
> +			pipe_ctx->stream_res.hpo_dp_stream_enc->inst,
> +			avg_time_slots_per_mtp);
> +
> +
> +
> +	dc->hwss.unblank_stream(pipe_ctx, &stream->link->cur_link_settings);
> +}
> +#endif
> +
>   void core_link_enable_stream(
>   		struct dc_state *state,
>   		struct pipe_ctx *pipe_ctx)
> @@ -3230,7 +3634,12 @@ void core_link_enable_stream(
>   			dc_is_virtual_signal(pipe_ctx->stream->signal))
>   		return;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
> +			&& !is_dp_128b_132b_signal(pipe_ctx)) {
> +#else
>   	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)) {
> +#endif
>   		stream->link->link_enc->funcs->setup(
>   			stream->link->link_enc,
>   			pipe_ctx->stream->signal);
> @@ -3240,13 +3649,32 @@ void core_link_enable_stream(
>   			stream->timing.timing_3d_format != TIMING_3D_FORMAT_NONE);
>   	}
>   
> -	if (dc_is_dp_signal(pipe_ctx->stream->signal))
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->set_stream_attribute(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc,
> +				&stream->timing,
> +				stream->output_color_space,
> +				stream->use_vsc_sdp_for_colorimetry,
> +				stream->timing.flags.DSC,
> +				false);
> +		otg_out_dest = OUT_MUX_HPO_DP;
> +	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
>   		pipe_ctx->stream_res.stream_enc->funcs->dp_set_stream_attribute(
> +				pipe_ctx->stream_res.stream_enc,
> +				&stream->timing,
> +				stream->output_color_space,
> +				stream->use_vsc_sdp_for_colorimetry,
> +				stream->link->dpcd_caps.dprx_feature.bits.SST_SPLIT_SDP_CAP);
> +	}
> +#else
> +	pipe_ctx->stream_res.stream_enc->funcs->dp_set_stream_attribute(
>   			pipe_ctx->stream_res.stream_enc,
>   			&stream->timing,
>   			stream->output_color_space,
>   			stream->use_vsc_sdp_for_colorimetry,
>   			stream->link->dpcd_caps.dprx_feature.bits.SST_SPLIT_SDP_CAP);
> +#endif
>   
>   	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
>   		pipe_ctx->stream_res.stream_enc->funcs->hdmi_set_stream_attribute(
> @@ -3357,7 +3785,12 @@ void core_link_enable_stream(
>   		 * as a workaround for the incorrect value being applied
>   		 * from transmitter control.
>   		 */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (!(dc_is_virtual_signal(pipe_ctx->stream->signal) ||
> +				is_dp_128b_132b_signal(pipe_ctx)))
> +#else
>   		if (!dc_is_virtual_signal(pipe_ctx->stream->signal))
> +#endif
>   			stream->link->link_enc->funcs->setup(
>   				stream->link->link_enc,
>   				pipe_ctx->stream->signal);
> @@ -3375,6 +3808,11 @@ void core_link_enable_stream(
>   
>   		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
>   			dc_link_allocate_mst_payload(pipe_ctx);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
> +				is_dp_128b_132b_signal(pipe_ctx))
> +			dc_link_update_sst_payload(pipe_ctx, true);
> +#endif
>   
>   		dc->hwss.unblank_stream(pipe_ctx,
>   			&pipe_ctx->stream->link->cur_link_settings);
> @@ -3391,6 +3829,11 @@ void core_link_enable_stream(
>   		dc->hwss.enable_audio_stream(pipe_ctx);
>   
>   	} else { // if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (is_dp_128b_132b_signal(pipe_ctx)) {
> +			fpga_dp_hpo_enable_link_and_stream(state, pipe_ctx);
> +		}
> +#endif
>   		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
>   				dc_is_virtual_signal(pipe_ctx->stream->signal))
>   			dp_set_dsc_enable(pipe_ctx, true);
> @@ -3426,6 +3869,11 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
>   
>   	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
>   		deallocate_mst_payload(pipe_ctx);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
> +			is_dp_128b_132b_signal(pipe_ctx))
> +		dc_link_update_sst_payload(pipe_ctx, false);
> +#endif
>   
>   	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
>   		struct ext_hdmi_settings settings = {0};
> @@ -3452,14 +3900,39 @@ void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
>   		}
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
> +			!is_dp_128b_132b_signal(pipe_ctx)) {
> +
> +		/* In DP1.x SST mode, our encoder will go to TPS1
> +		 * when link is on but stream is off.
> +		 * Disabling link before stream will avoid exposing TPS1 pattern
> +		 * during the disable sequence as it will confuse some receivers
> +		 * state machine.
> +		 * In DP2 or MST mode, our encoder will stay video active
> +		 */
> +		disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
> +		dc->hwss.disable_stream(pipe_ctx);
> +	} else {
> +		dc->hwss.disable_stream(pipe_ctx);
> +		disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
> +	}
> +#else
>   	disable_link(pipe_ctx->stream->link, pipe_ctx->stream->signal);
>   
>   	dc->hwss.disable_stream(pipe_ctx);
> +#endif
>   
>   	if (pipe_ctx->stream->timing.flags.DSC) {
>   		if (dc_is_dp_signal(pipe_ctx->stream->signal))
>   			dp_set_dsc_enable(pipe_ctx, false);
>   	}
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
> +			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
> +	}
> +#endif
>   }
>   
>   void core_link_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
> @@ -3592,6 +4065,13 @@ void dc_link_set_preferred_training_settings(struct dc *dc,
>   
>   	if (link_setting != NULL) {
>   		link->preferred_link_setting = *link_setting;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(link_setting) ==
> +				DP_128b_132b_ENCODING && !link->hpo_dp_link_enc) {
> +			if (!add_dp_hpo_link_encoder_to_link(link))
> +				memset(&link->preferred_link_setting, 0, sizeof(link->preferred_link_setting));
> +		}
> +#endif
>   	} else {
>   		link->preferred_link_setting.lane_count = LANE_COUNT_UNKNOWN;
>   		link->preferred_link_setting.link_rate = LINK_RATE_UNKNOWN;
> @@ -3633,6 +4113,38 @@ uint32_t dc_link_bandwidth_kbps(
>   	const struct dc_link *link,
>   	const struct dc_link_settings *link_setting)
>   {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	uint32_t total_data_bw_efficiency_x10000 = 0;
> +	uint32_t link_rate_per_lane_kbps = 0;
> +
> +	switch (dp_get_link_encoding_format(link_setting)) {
> +	case DP_8b_10b_ENCODING:
> +		/* For 8b/10b encoding:
> +		 * link rate is defined in the unit of LINK_RATE_REF_FREQ_IN_KHZ per DP byte per lane.
> +		 * data bandwidth efficiency is 80% with additional 3% overhead if FEC is supported.
> +		 */
> +		link_rate_per_lane_kbps = link_setting->link_rate * LINK_RATE_REF_FREQ_IN_KHZ * BITS_PER_DP_BYTE;
> +		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_8b_10b_x10000;
> +		if (dc_link_should_enable_fec(link)) {
> +			total_data_bw_efficiency_x10000 /= 100;
> +			total_data_bw_efficiency_x10000 *= DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100;
> +		}
> +		break;
> +	case DP_128b_132b_ENCODING:
> +		/* For 128b/132b encoding:
> +		 * link rate is defined in the unit of 10mbps per lane.
> +		 * total data bandwidth efficiency is always 96.71%.
> +		 */
> +		link_rate_per_lane_kbps = link_setting->link_rate * 10000;
> +		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_128b_132b_x10000;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* overall effective link bandwidth = link rate per lane * lane count * total data bandwidth efficiency */
> +	return link_rate_per_lane_kbps * link_setting->lane_count / 10000 * total_data_bw_efficiency_x10000;
> +#else
>   	uint32_t link_bw_kbps =
>   		link_setting->link_rate * LINK_RATE_REF_FREQ_IN_KHZ; /* bytes per sec */
>   
> @@ -3663,9 +4175,9 @@ uint32_t dc_link_bandwidth_kbps(
>   		long long fec_link_bw_kbps = link_bw_kbps * 970LL;
>   		link_bw_kbps = (uint32_t)(div64_s64(fec_link_bw_kbps, 1000LL));
>   	}
> -
>   	return link_bw_kbps;
>   
> +#endif
>   }
>   
>   const struct dc_link_settings *dc_link_get_link_cap(
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index cd025c12f17b..fc122c8c2318 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -39,6 +39,43 @@ enum {
>   	POST_LT_ADJ_REQ_TIMEOUT = 200
>   };
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +struct dp_lt_fallback_entry {
> +	enum dc_lane_count lane_count;
> +	enum dc_link_rate link_rate;
> +};
> +
> +static const struct dp_lt_fallback_entry dp_lt_fallbacks[] = {
> +		/* This link training fallback array is ordered by
> +		 * link bandwidth from highest to lowest.
> +		 * DP specs makes it a normative policy to always
> +		 * choose the next highest link bandwidth during
> +		 * link training fallback.
> +		 */
> +		{LANE_COUNT_FOUR, LINK_RATE_UHBR20},
> +		{LANE_COUNT_FOUR, LINK_RATE_UHBR13_5},
> +		{LANE_COUNT_TWO, LINK_RATE_UHBR20},
> +		{LANE_COUNT_FOUR, LINK_RATE_UHBR10},
> +		{LANE_COUNT_TWO, LINK_RATE_UHBR13_5},
> +		{LANE_COUNT_FOUR, LINK_RATE_HIGH3},
> +		{LANE_COUNT_ONE, LINK_RATE_UHBR20},
> +		{LANE_COUNT_TWO, LINK_RATE_UHBR10},
> +		{LANE_COUNT_FOUR, LINK_RATE_HIGH2},
> +		{LANE_COUNT_ONE, LINK_RATE_UHBR13_5},
> +		{LANE_COUNT_TWO, LINK_RATE_HIGH3},
> +		{LANE_COUNT_ONE, LINK_RATE_UHBR10},
> +		{LANE_COUNT_TWO, LINK_RATE_HIGH2},
> +		{LANE_COUNT_FOUR, LINK_RATE_HIGH},
> +		{LANE_COUNT_ONE, LINK_RATE_HIGH3},
> +		{LANE_COUNT_FOUR, LINK_RATE_LOW},
> +		{LANE_COUNT_ONE, LINK_RATE_HIGH2},
> +		{LANE_COUNT_TWO, LINK_RATE_HIGH},
> +		{LANE_COUNT_TWO, LINK_RATE_LOW},
> +		{LANE_COUNT_ONE, LINK_RATE_HIGH},
> +		{LANE_COUNT_ONE, LINK_RATE_LOW},
> +};
> +#endif
> +
>   static bool decide_fallback_link_setting(
>   		struct dc_link_settings initial_link_settings,
>   		struct dc_link_settings *current_link_setting,
> @@ -52,15 +89,27 @@ static uint32_t get_cr_training_aux_rd_interval(struct dc_link *link,
>   {
>   	union training_aux_rd_interval training_rd_interval;
>   	uint32_t wait_in_micro_secs = 100;
> -
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
> +	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
> +			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
> +		core_link_read_dpcd(
> +				link,
> +				DP_TRAINING_AUX_RD_INTERVAL,
> +				(uint8_t *)&training_rd_interval,
> +				sizeof(training_rd_interval));
> +		if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
> +			wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;
> +	}
> +#else
>   	core_link_read_dpcd(
>   			link,
>   			DP_TRAINING_AUX_RD_INTERVAL,
>   			(uint8_t *)&training_rd_interval,
>   			sizeof(training_rd_interval));
>   	if (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL)
> -		wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;
> +		wait_in_micro_secs = training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL * 4000;	
> +#endif
>   	return wait_in_micro_secs;
>   }
>   
> @@ -68,6 +117,36 @@ static uint32_t get_eq_training_aux_rd_interval(
>   	struct dc_link *link,
>   	const struct dc_link_settings *link_settings)
>   {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	union training_aux_rd_interval training_rd_interval;
> +
> +	memset(&training_rd_interval, 0, sizeof(training_rd_interval));
> +	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
> +		core_link_read_dpcd(
> +				link,
> +				DP_128b_132b_TRAINING_AUX_RD_INTERVAL,
> +				(uint8_t *)&training_rd_interval,
> +				sizeof(training_rd_interval));
> +	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING &&
> +			link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_12) {
> +		core_link_read_dpcd(
> +				link,
> +				DP_TRAINING_AUX_RD_INTERVAL,
> +				(uint8_t *)&training_rd_interval,
> +				sizeof(training_rd_interval));
> +	}
> +
> +	switch (training_rd_interval.bits.TRAINIG_AUX_RD_INTERVAL) {
> +	case 0: return 400;
> +	case 1: return 4000;
> +	case 2: return 8000;
> +	case 3: return 12000;
> +	case 4: return 16000;
> +	case 5: return 32000;
> +	case 6: return 64000;
> +	default: return 400;
> +	}
> +#else
>   	union training_aux_rd_interval training_rd_interval;
>   	uint32_t wait_in_micro_secs = 400;
>   
> @@ -87,13 +166,21 @@ static uint32_t get_eq_training_aux_rd_interval(
>   	}
>   
>   	return wait_in_micro_secs;
> +#endif
>   }
>   
>   void dp_wait_for_training_aux_rd_interval(
>   	struct dc_link *link,
>   	uint32_t wait_in_micro_secs)
>   {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (wait_in_micro_secs > 16000)
> +		msleep(wait_in_micro_secs/1000);
> +	else
> +		udelay(wait_in_micro_secs);
> +#else
>   	udelay(wait_in_micro_secs);
> +#endif
>   
>   	DC_LOG_HW_LINK_TRAINING("%s:\n wait = %d\n",
>   		__func__,
> @@ -121,6 +208,17 @@ enum dpcd_training_patterns
>   	case DP_TRAINING_PATTERN_SEQUENCE_4:
>   		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_4;
>   		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case DP_128b_132b_TPS1:
> +		dpcd_tr_pattern = DPCD_128b_132b_TPS1;
> +		break;
> +	case DP_128b_132b_TPS2:
> +		dpcd_tr_pattern = DPCD_128b_132b_TPS2;
> +		break;
> +	case DP_128b_132b_TPS2_CDS:
> +		dpcd_tr_pattern = DPCD_128b_132b_TPS2_CDS;
> +		break;
> +#endif
>   	case DP_TRAINING_PATTERN_VIDEOIDLE:
>   		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_VIDEOIDLE;
>   		break;
> @@ -159,13 +257,62 @@ static void dpcd_set_training_pattern(
>   static enum dc_dp_training_pattern decide_cr_training_pattern(
>   		const struct dc_link_settings *link_settings)
>   {
> -	return DP_TRAINING_PATTERN_SEQUENCE_1;
> +	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_1;
> +
> +	switch (dp_get_link_encoding_format(link_settings)) {
> +	case DP_8b_10b_ENCODING:
> +		pattern = DP_TRAINING_PATTERN_SEQUENCE_1;
> +		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case DP_128b_132b_ENCODING:
> +		pattern = DP_128b_132b_TPS1;
> +		break;
> +#endif
> +	}
> +
> +	return pattern;
>   }
>   
>   static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
>   		const struct dc_link_settings *link_settings)
>   {
>   	struct link_encoder *link_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	struct encoder_feature_support *enc_caps;
> +	struct dpcd_caps *rx_caps = &link->dpcd_caps;
> +	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
> +
> +	/* Access link encoder capability based on whether it is statically
> +	 * or dynamically assigned to a link.
> +	 */
> +	if (link->is_dig_mapping_flexible &&
> +			link->dc->res_pool->funcs->link_encs_assign)
> +		link_enc = link_enc_cfg_get_link_enc_used_by_link(link->dc->current_state, link);
> +	else
> +		link_enc = link->link_enc;
> +	ASSERT(link_enc);
> +	enc_caps = &link_enc->features;
> +
> +	switch (dp_get_link_encoding_format(link_settings)) {
> +	case DP_8b_10b_ENCODING:
> +		if (enc_caps->flags.bits.IS_TPS4_CAPABLE &&
> +				rx_caps->max_down_spread.bits.TPS4_SUPPORTED)
> +			pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
> +		else if (enc_caps->flags.bits.IS_TPS3_CAPABLE &&
> +				rx_caps->max_ln_count.bits.TPS3_SUPPORTED)
> +			pattern = DP_TRAINING_PATTERN_SEQUENCE_3;
> +		else
> +			pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
> +		break;
> +	case DP_128b_132b_ENCODING:
> +		pattern = DP_128b_132b_TPS2;
> +		break;
> +	default:
> +		pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
> +		break;
> +	}
> +	return pattern;
> +#else
>   	enum dc_dp_training_pattern highest_tp = DP_TRAINING_PATTERN_SEQUENCE_2;
>   	struct encoder_feature_support *features;
>   	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
> @@ -196,7 +343,38 @@ static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *li
>   		return DP_TRAINING_PATTERN_SEQUENCE_3;
>   
>   	return DP_TRAINING_PATTERN_SEQUENCE_2;
> +#endif
> +}
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static uint8_t get_dpcd_link_rate(const struct dc_link_settings *link_settings)
> +{
> +	uint8_t link_rate = 0;
> +	enum dp_link_encoding encoding = dp_get_link_encoding_format(link_settings);
> +
> +	if (encoding == DP_128b_132b_ENCODING)
> +		switch (link_settings->link_rate) {
> +		case LINK_RATE_UHBR10:
> +			link_rate = 0x1;
> +			break;
> +		case LINK_RATE_UHBR20:
> +			link_rate = 0x2;
> +			break;
> +		case LINK_RATE_UHBR13_5:
> +			link_rate = 0x4;
> +			break;
> +		default:
> +			link_rate = 0;
> +			break;
> +		}
> +	else if (encoding == DP_8b_10b_ENCODING)
> +		link_rate = (uint8_t) link_settings->link_rate;
> +	else
> +		link_rate = 0;
> +
> +	return link_rate;
>   }
> +#endif
>   
>   enum dc_status dpcd_set_link_settings(
>   	struct dc_link *link,
> @@ -247,7 +425,11 @@ enum dc_status dpcd_set_link_settings(
>   		status = core_link_write_dpcd(link, DP_LINK_RATE_SET,
>   				&lt_settings->link_settings.link_rate_set, 1);
>   	} else {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		rate = get_dpcd_link_rate(&lt_settings->link_settings);
> +#else
>   		rate = (uint8_t) (lt_settings->link_settings.link_rate);
> +#endif
>   		status = core_link_write_dpcd(link, DP_LINK_BW_SET, &rate, 1);
>   	}
>   
> @@ -289,6 +471,10 @@ uint8_t dc_dp_initialize_scrambling_data_symbols(
>   		disable_scrabled_data_symbols = 1;
>   		break;
>   	case DP_TRAINING_PATTERN_SEQUENCE_4:
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case DP_128b_132b_TPS1:
> +	case DP_128b_132b_TPS2:
> +#endif
>   		disable_scrabled_data_symbols = 0;
>   		break;
>   	default:
> @@ -356,6 +542,26 @@ static void dpcd_set_lt_pattern_and_lane_settings(
>   	for (lane = 0; lane <
>   		(uint32_t)(lt_settings->link_settings.lane_count); lane++) {
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_128b_132b_ENCODING) {
> +			dpcd_lane[lane].tx_ffe.PRESET_VALUE =
> +					lt_settings->lane_settings[lane].FFE_PRESET.settings.level;
> +		} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_8b_10b_ENCODING) {
> +			dpcd_lane[lane].bits.VOLTAGE_SWING_SET =
> +					(uint8_t)(lt_settings->lane_settings[lane].VOLTAGE_SWING);
> +			dpcd_lane[lane].bits.PRE_EMPHASIS_SET =
> +					(uint8_t)(lt_settings->lane_settings[lane].PRE_EMPHASIS);
> +
> +			dpcd_lane[lane].bits.MAX_SWING_REACHED =
> +					(lt_settings->lane_settings[lane].VOLTAGE_SWING ==
> +							VOLTAGE_SWING_MAX_LEVEL ? 1 : 0);
> +			dpcd_lane[lane].bits.MAX_PRE_EMPHASIS_REACHED =
> +					(lt_settings->lane_settings[lane].PRE_EMPHASIS ==
> +							PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
> +		}
> +#else
>   		dpcd_lane[lane].bits.VOLTAGE_SWING_SET =
>   		(uint8_t)(lt_settings->lane_settings[lane].VOLTAGE_SWING);
>   		dpcd_lane[lane].bits.PRE_EMPHASIS_SET =
> @@ -367,6 +573,7 @@ static void dpcd_set_lt_pattern_and_lane_settings(
>   		dpcd_lane[lane].bits.MAX_PRE_EMPHASIS_REACHED =
>   		(lt_settings->lane_settings[lane].PRE_EMPHASIS ==
>   		PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
> +#endif
>   	}
>   
>   	/* concatenate everything into one buffer*/
> @@ -380,6 +587,18 @@ static void dpcd_set_lt_pattern_and_lane_settings(
>   		size_in_bytes);
>   
>   	if (is_repeater(link, offset)) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_128b_132b_ENCODING)
> +			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
> +					" 0x%X TX_FFE_PRESET_VALUE = %x\n",
> +					__func__,
> +					offset,
> +					dpcd_base_lt_offset,
> +					dpcd_lane[0].tx_ffe.PRESET_VALUE);
> +		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_8b_10b_ENCODING)
> +#endif
>   		DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
>   				" 0x%X VS set = %x PE set = %x max VS Reached = %x  max PE Reached = %x\n",
>   			__func__,
> @@ -390,6 +609,16 @@ static void dpcd_set_lt_pattern_and_lane_settings(
>   			dpcd_lane[0].bits.MAX_SWING_REACHED,
>   			dpcd_lane[0].bits.MAX_PRE_EMPHASIS_REACHED);
>   	} else {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_128b_132b_ENCODING)
> +			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
> +					__func__,
> +					dpcd_base_lt_offset,
> +					dpcd_lane[0].tx_ffe.PRESET_VALUE);
> +		else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_8b_10b_ENCODING)
> +#endif
>   		DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
>   			__func__,
>   			dpcd_base_lt_offset,
> @@ -414,6 +643,15 @@ static void dpcd_set_lt_pattern_and_lane_settings(
>   			(uint8_t *)(dpcd_lane),
>   			size_in_bytes);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	} else if (dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +			DP_128b_132b_ENCODING) {
> +		core_link_write_dpcd(
> +				link,
> +				dpcd_base_lt_offset,
> +				dpcd_lt_buffer,
> +				sizeof(dpcd_lt_buffer));
> +#endif
>   		} else
>   		/* write it all in (1 + number-of-lanes)-byte burst*/
>   			core_link_write_dpcd(
> @@ -484,6 +722,13 @@ void dp_update_drive_settings(
>   			dest->lane_settings[lane].POST_CURSOR2 = src.lane_settings[lane].POST_CURSOR2;
>   		else
>   			dest->lane_settings[lane].POST_CURSOR2 = *dest->post_cursor2;
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dest->ffe_preset == NULL)
> +			dest->lane_settings[lane].FFE_PRESET = src.lane_settings[lane].FFE_PRESET;
> +		else
> +			dest->lane_settings[lane].FFE_PRESET = *dest->ffe_preset;
> +#endif
>   	}
>   }
>   
> @@ -529,6 +774,10 @@ static void find_max_drive_settings(
>   		lane_settings[0].PRE_EMPHASIS;
>   	/*max_requested.postCursor2 =
>   	 * link_training_setting->laneSettings[0].postCursor2;*/
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	max_requested.FFE_PRESET =
> +		link_training_setting->lane_settings[0].FFE_PRESET;
> +#endif
>   
>   	/* Determine what the maximum of the requested settings are*/
>   	for (lane = 1; lane < link_training_setting->link_settings.lane_count;
> @@ -554,6 +803,13 @@ static void find_max_drive_settings(
>   		link_training_setting->laneSettings[lane].postCursor2;
>   		}
>   		*/
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (link_training_setting->lane_settings[lane].FFE_PRESET.settings.level >
> +				max_requested.FFE_PRESET.settings.level)
> +			max_requested.FFE_PRESET.settings.level =
> +					link_training_setting->
> +					lane_settings[lane].FFE_PRESET.settings.level;
> +#endif
>   	}
>   
>   	/* make sure the requested settings are
> @@ -567,6 +823,10 @@ static void find_max_drive_settings(
>   	if (max_requested.postCursor2 > PostCursor2_MaxLevel)
>   	max_requested.postCursor2 = PostCursor2_MaxLevel;
>   	*/
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (max_requested.FFE_PRESET.settings.level > DP_FFE_PRESET_MAX_LEVEL)
> +		max_requested.FFE_PRESET.settings.level = DP_FFE_PRESET_MAX_LEVEL;
> +#endif
>   
>   	/* make sure the pre-emphasis matches the voltage swing*/
>   	if (max_requested.PRE_EMPHASIS >
> @@ -604,6 +864,10 @@ static void find_max_drive_settings(
>   		/*max_lt_setting->laneSettings[lane].postCursor2 =
>   		 * max_requested.postCursor2;
>   		 */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		max_lt_setting->lane_settings[lane].FFE_PRESET =
> +			max_requested.FFE_PRESET;
> +#endif
>   	}
>   
>   }
> @@ -701,12 +965,28 @@ enum dc_status dp_get_lane_status_and_drive_settings(
>   		(uint32_t)(link_training_setting->link_settings.lane_count);
>   		lane++) {
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_128b_132b_ENCODING) {
> +			request_settings.lane_settings[lane].FFE_PRESET.raw =
> +					dpcd_lane_adjust[lane].tx_ffe.PRESET_VALUE;
> +		} else if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_8b_10b_ENCODING) {
> +			request_settings.lane_settings[lane].VOLTAGE_SWING =
> +					(enum dc_voltage_swing)(dpcd_lane_adjust[lane].bits.
> +							VOLTAGE_SWING_LANE);
> +			request_settings.lane_settings[lane].PRE_EMPHASIS =
> +					(enum dc_pre_emphasis)(dpcd_lane_adjust[lane].bits.
> +							PRE_EMPHASIS_LANE);
> +		}
> +#else
>   		request_settings.lane_settings[lane].VOLTAGE_SWING =
>   			(enum dc_voltage_swing)(dpcd_lane_adjust[lane].bits.
>   				VOLTAGE_SWING_LANE);
>   		request_settings.lane_settings[lane].PRE_EMPHASIS =
>   			(enum dc_pre_emphasis)(dpcd_lane_adjust[lane].bits.
>   				PRE_EMPHASIS_LANE);
> +#endif
>   	}
>   
>   	/*Note: for postcursor2, read adjusted
> @@ -745,6 +1025,26 @@ enum dc_status dpcd_set_lane_settings(
>   		(uint32_t)(link_training_setting->
>   		link_settings.lane_count);
>   		lane++) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_128b_132b_ENCODING) {
> +			dpcd_lane[lane].tx_ffe.PRESET_VALUE =
> +					link_training_setting->lane_settings[lane].FFE_PRESET.settings.level;
> +		} else if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_8b_10b_ENCODING) {
> +			dpcd_lane[lane].bits.VOLTAGE_SWING_SET =
> +					(uint8_t)(link_training_setting->lane_settings[lane].VOLTAGE_SWING);
> +			dpcd_lane[lane].bits.PRE_EMPHASIS_SET =
> +					(uint8_t)(link_training_setting->lane_settings[lane].PRE_EMPHASIS);
> +
> +			dpcd_lane[lane].bits.MAX_SWING_REACHED =
> +					(link_training_setting->lane_settings[lane].VOLTAGE_SWING ==
> +							VOLTAGE_SWING_MAX_LEVEL ? 1 : 0);
> +			dpcd_lane[lane].bits.MAX_PRE_EMPHASIS_REACHED =
> +					(link_training_setting->lane_settings[lane].PRE_EMPHASIS ==
> +							PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
> +		}
> +#else
>   		dpcd_lane[lane].bits.VOLTAGE_SWING_SET =
>   			(uint8_t)(link_training_setting->
>   			lane_settings[lane].VOLTAGE_SWING);
> @@ -759,6 +1059,7 @@ enum dc_status dpcd_set_lane_settings(
>   			(link_training_setting->
>   			lane_settings[lane].PRE_EMPHASIS ==
>   			PRE_EMPHASIS_MAX_LEVEL ? 1 : 0);
> +#endif
>   	}
>   
>   	status = core_link_write_dpcd(link,
> @@ -786,6 +1087,18 @@ enum dc_status dpcd_set_lane_settings(
>   	*/
>   
>   	if (is_repeater(link, offset)) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_128b_132b_ENCODING)
> +			DC_LOG_HW_LINK_TRAINING("%s:\n LTTPR Repeater ID: %d\n"
> +					" 0x%X TX_FFE_PRESET_VALUE = %x\n",
> +					__func__,
> +					offset,
> +					lane0_set_address,
> +					dpcd_lane[0].tx_ffe.PRESET_VALUE);
> +		else if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_8b_10b_ENCODING)
> +#endif
>   		DC_LOG_HW_LINK_TRAINING("%s\n LTTPR Repeater ID: %d\n"
>   				" 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
>   			__func__,
> @@ -797,6 +1110,16 @@ enum dc_status dpcd_set_lane_settings(
>   			dpcd_lane[0].bits.MAX_PRE_EMPHASIS_REACHED);
>   
>   	} else {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_128b_132b_ENCODING)
> +			DC_LOG_HW_LINK_TRAINING("%s:\n 0x%X TX_FFE_PRESET_VALUE = %x\n",
> +					__func__,
> +					lane0_set_address,
> +					dpcd_lane[0].tx_ffe.PRESET_VALUE);
> +		else if (dp_get_link_encoding_format(&link_training_setting->link_settings) ==
> +				DP_8b_10b_ENCODING)
> +#endif
>   		DC_LOG_HW_LINK_TRAINING("%s\n 0x%X VS set = %x  PE set = %x max VS Reached = %x  max PE Reached = %x\n",
>   			__func__,
>   			lane0_set_address,
> @@ -932,6 +1255,14 @@ uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval
>   	case 0x04:
>   		aux_rd_interval_us = 16000;
>   		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case 0x05:
> +		aux_rd_interval_us = 32000;
> +		break;
> +	case 0x06:
> +		aux_rd_interval_us = 64000;
> +		break;
> +#endif
>   	default:
>   		break;
>   	}
> @@ -972,8 +1303,13 @@ static enum link_training_result perform_channel_equalization_sequence(
>   
>   	tr_pattern = lt_settings->pattern_for_eq;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_repeater(link, offset) && dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING)
> +		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
> +#else
>   	if (is_repeater(link, offset))
>   		tr_pattern = DP_TRAINING_PATTERN_SEQUENCE_4;
> +#endif
>   
>   	dp_set_hw_training_pattern(link, tr_pattern, offset);
>   
> @@ -1125,9 +1461,28 @@ static enum link_training_result perform_clock_recovery_sequence(
>   			return LINK_TRAINING_SUCCESS;
>   
>   		/* 6. max VS reached*/
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if ((dp_get_link_encoding_format(&lt_settings->link_settings) ==
> +				DP_8b_10b_ENCODING) &&
> +				dp_is_max_vs_reached(lt_settings))
> +			break;
> +#else
>   		if (dp_is_max_vs_reached(lt_settings))
>   			break;
> +#endif
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_128b_132b_ENCODING) &&
> +				lt_settings->lane_settings[0].FFE_PRESET.settings.level ==
> +						req_settings.lane_settings[0].FFE_PRESET.settings.level)
> +			retries_cr++;
> +		else if ((dp_get_link_encoding_format(&lt_settings->link_settings) == DP_8b_10b_ENCODING) &&
> +				lt_settings->lane_settings[0].VOLTAGE_SWING ==
> +						req_settings.lane_settings[0].VOLTAGE_SWING)
> +			retries_cr++;
> +		else
> +			retries_cr = 0;
> +#else
>   		/* 7. same lane settings*/
>   		/* Note: settings are the same for all lanes,
>   		 * so comparing first lane is sufficient*/
> @@ -1138,6 +1493,7 @@ static enum link_training_result perform_clock_recovery_sequence(
>   			retries_cr++;
>   		else
>   			retries_cr = 0;
> +#endif
>   
>   		/* 8. update VS/PE/PC2 in lt_settings*/
>   		dp_update_drive_settings(lt_settings, req_settings);
> @@ -1172,7 +1528,11 @@ static inline enum link_training_result dp_transition_to_video_idle(
>   	 * TPS4 must be used instead of POST_LT_ADJ_REQ.
>   	 */
>   	if (link->dpcd_caps.max_ln_count.bits.POST_LT_ADJ_REQ_SUPPORTED != 1 ||
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			lt_settings->pattern_for_eq >= DP_TRAINING_PATTERN_SEQUENCE_4) {
> +#else
>   			lt_settings->pattern_for_eq == DP_TRAINING_PATTERN_SEQUENCE_4) {
> +#endif
>   		/* delay 5ms after Main Link output idle pattern and then check
>   		 * DPCD 0202h.
>   		 */
> @@ -1268,6 +1628,32 @@ static inline void decide_8b_10b_training_settings(
>   	lt_settings->should_set_fec_ready = true;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static inline void decide_128b_132b_training_settings(struct dc_link *link,
> +		const struct dc_link_settings *link_settings,
> +		struct link_training_settings *lt_settings)
> +{
> +	memset(lt_settings, 0, sizeof(*lt_settings));
> +
> +	lt_settings->link_settings = *link_settings;
> +	/* TODO: should decide link spread when populating link_settings */
> +	lt_settings->link_settings.link_spread = link->dp_ss_off ? LINK_SPREAD_DISABLED :
> +			LINK_SPREAD_05_DOWNSPREAD_30KHZ;
> +
> +	lt_settings->pattern_for_cr = decide_cr_training_pattern(link_settings);
> +	lt_settings->pattern_for_eq = decide_eq_training_pattern(link, link_settings);
> +	lt_settings->eq_pattern_time = 2500;
> +	lt_settings->eq_wait_time_limit = 400000;
> +	lt_settings->eq_loop_count_limit = 20;
> +	lt_settings->pattern_for_cds = DP_128b_132b_TPS2_CDS;
> +	lt_settings->cds_pattern_time = 2500;
> +	lt_settings->cds_wait_time_limit = (dp_convert_to_count(
> +			link->dpcd_caps.lttpr_caps.phy_repeater_cnt) + 1) * 20000;
> +	lt_settings->lttpr_mode = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) ?
> +			LTTPR_MODE_NON_TRANSPARENT : LTTPR_MODE_TRANSPARENT;
> +}
> +#endif
> +
>   void dp_decide_training_settings(
>   		struct dc_link *link,
>   		const struct dc_link_settings *link_settings,
> @@ -1275,6 +1661,10 @@ void dp_decide_training_settings(
>   {
>   	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING)
>   		decide_8b_10b_training_settings(link, link_settings, lt_settings);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	else if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING)
> +		decide_128b_132b_training_settings(link, link_settings, lt_settings);
> +#endif
>   }
>   
>   static void override_training_settings(
> @@ -1303,6 +1693,11 @@ static void override_training_settings(
>   		lt_settings->pre_emphasis = overrides->pre_emphasis;
>   	if (overrides->post_cursor2 != NULL)
>   		lt_settings->post_cursor2 = overrides->post_cursor2;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (overrides->ffe_preset != NULL)
> +		lt_settings->ffe_preset = overrides->ffe_preset;
> +#endif
> +
>   	for (lane = 0; lane < LANE_COUNT_DP_MAX; lane++) {
>   		lt_settings->lane_settings[lane].VOLTAGE_SWING =
>   			lt_settings->voltage_swing != NULL ?
> @@ -1489,6 +1884,17 @@ static void print_status_message(
>   	case LINK_RATE_HIGH3:
>   		link_rate = "HBR3";
>   		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case LINK_RATE_UHBR10:
> +		link_rate = "UHBR10";
> +		break;
> +	case LINK_RATE_UHBR13_5:
> +		link_rate = "UHBR13.5";
> +		break;
> +	case LINK_RATE_UHBR20:
> +		link_rate = "UHBR20";
> +		break;
> +#endif
>   	default:
>   		break;
>   	}
> @@ -1518,6 +1924,20 @@ static void print_status_message(
>   	case LINK_TRAINING_LINK_LOSS:
>   		lt_result = "Link loss";
>   		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case DP_128b_132b_LT_FAILED:
> +		lt_result = "LT_FAILED received";
> +		break;
> +	case DP_128b_132b_MAX_LOOP_COUNT_REACHED:
> +		lt_result = "max loop count reached";
> +		break;
> +	case DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT:
> +		lt_result = "channel EQ timeout";
> +		break;
> +	case DP_128b_132b_CDS_DONE_TIMEOUT:
> +		lt_result = "CDS timeout";
> +		break;
> +#endif
>   	default:
>   		break;
>   	}
> @@ -1537,6 +1957,9 @@ static void print_status_message(
>   	}
>   
>   	/* Connectivity log: link training */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* TODO - DP2.0 Log: add connectivity log for FFE PRESET */
> +#endif
>   	CONN_MSG_LT(link, "%sx%d %s VS=%d, PE=%d, DS=%s",
>   				link_rate,
>   				lt_settings->link_settings.lane_count,
> @@ -1619,9 +2042,23 @@ enum dc_status dpcd_configure_lttpr_mode(struct dc_link *link, struct link_train
>   
>   static void dpcd_exit_training_mode(struct dc_link *link)
>   {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	uint8_t sink_status = 0;
> +	uint8_t i;
> +#endif
>   
>   	/* clear training pattern set */
>   	dpcd_set_training_pattern(link, DP_TRAINING_PATTERN_VIDEOIDLE);
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* poll for intra-hop disable */
> +	for (i = 0; i < 10; i++) {
> +		if ((core_link_read_dpcd(link, DP_SINK_STATUS, &sink_status, 1) == DC_OK) &&
> +				(sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION) == 0)
> +			break;
> +		udelay(1000);
> +	}
> +#endif
>   }
>   
>   enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
> @@ -1645,6 +2082,131 @@ enum dc_status dpcd_configure_channel_coding(struct dc_link *link,
>   	return status;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static void dpcd_128b_132b_get_aux_rd_interval(struct dc_link *link,
> +		uint32_t *interval_in_us)
> +{
> +	union dp_128b_132b_training_aux_rd_interval dpcd_interval;
> +	uint32_t interval_unit = 0;
> +
> +	dpcd_interval.raw = 0;
> +	core_link_read_dpcd(link, DP_128b_132b_TRAINING_AUX_RD_INTERVAL,
> +			&dpcd_interval.raw, sizeof(dpcd_interval.raw));
> +	interval_unit = dpcd_interval.bits.UNIT ? 1 : 2; /* 0b = 2 ms, 1b = 1 ms */
> +	/* (128b/132b_TRAINING_AUX_RD_INTERVAL value + 1) *
> +	 * INTERVAL_UNIT. The maximum is 256 ms
> +	 */
> +	*interval_in_us = (dpcd_interval.bits.VALUE + 1) * interval_unit * 1000;
> +}
> +
> +static enum link_training_result dp_perform_128b_132b_channel_eq_done_sequence(
> +		struct dc_link *link,
> +		struct link_training_settings *lt_settings)
> +{
> +	uint8_t loop_count = 0;
> +	uint32_t aux_rd_interval = 0;
> +	uint32_t wait_time = 0;
> +	struct link_training_settings req_settings;
> +	union lane_align_status_updated dpcd_lane_status_updated = { {0} };
> +	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = { { {0} } };
> +	enum link_training_result status = LINK_TRAINING_SUCCESS;
> +
> +	/* Transmit 128b/132b_TPS1 over Main-Link and Set TRAINING_PATTERN_SET to 01h */
> +	dp_set_hw_training_pattern(link, lt_settings->pattern_for_cr, DPRX);
> +	dpcd_set_training_pattern(link, lt_settings->pattern_for_cr);
> +
> +	/* Adjust TX_FFE_PRESET_VALUE as requested */
> +	dp_get_lane_status_and_drive_settings(link, lt_settings, dpcd_lane_status,
> +			&dpcd_lane_status_updated, &req_settings, DPRX);
> +	dp_update_drive_settings(lt_settings, req_settings);
> +	dpcd_128b_132b_get_aux_rd_interval(link, &aux_rd_interval);
> +	dp_set_hw_lane_settings(link, lt_settings, DPRX);
> +	dpcd_set_lane_settings(link, lt_settings, DPRX);
> +
> +	/* Transmit 128b/132b_TPS2 over Main-Link and Set TRAINING_PATTERN_SET to 02h */
> +	dp_set_hw_training_pattern(link, lt_settings->pattern_for_eq, DPRX);
> +	dpcd_set_training_pattern(link, lt_settings->pattern_for_eq);
> +
> +	/* poll for channel EQ done */
> +	while (status == LINK_TRAINING_SUCCESS) {
> +		loop_count++;
> +		dp_wait_for_training_aux_rd_interval(link, aux_rd_interval);
> +		wait_time += aux_rd_interval;
> +		dp_get_lane_status_and_drive_settings(link, lt_settings, dpcd_lane_status,
> +				&dpcd_lane_status_updated, &req_settings, DPRX);
> +		dp_update_drive_settings(lt_settings, req_settings);
> +		dpcd_128b_132b_get_aux_rd_interval(link, &aux_rd_interval);
> +		if (dp_is_ch_eq_done(lt_settings->link_settings.lane_count,
> +				dpcd_lane_status)) {
> +			/* pass */
> +			break;
> +		} else if (loop_count >= lt_settings->eq_loop_count_limit) {
> +			status = DP_128b_132b_MAX_LOOP_COUNT_REACHED;
> +		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
> +			status = DP_128b_132b_LT_FAILED;
> +		} else {
> +			dp_set_hw_lane_settings(link, lt_settings, DPRX);
> +			dpcd_set_lane_settings(link, lt_settings, DPRX);
> +		}
> +	}
> +
> +	/* poll for EQ interlane align done */
> +	while (status == LINK_TRAINING_SUCCESS) {
> +		if (dpcd_lane_status_updated.bits.EQ_INTERLANE_ALIGN_DONE_128b_132b) {
> +			/* pass */
> +			break;
> +		} else if (wait_time >= lt_settings->eq_wait_time_limit) {
> +			status = DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT;
> +		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
> +			status = DP_128b_132b_LT_FAILED;
> +		} else {
> +			dp_wait_for_training_aux_rd_interval(link,
> +					lt_settings->eq_pattern_time);
> +			wait_time += lt_settings->eq_pattern_time;
> +			dp_get_lane_status_and_drive_settings(link, lt_settings, dpcd_lane_status,
> +					&dpcd_lane_status_updated, &req_settings, DPRX);
> +		}
> +	}
> +
> +	return status;
> +}
> +
> +static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
> +		struct dc_link *link,
> +		struct link_training_settings *lt_settings)
> +{
> +	/* Assumption: assume hardware has transmitted eq pattern */
> +	enum link_training_result status = LINK_TRAINING_SUCCESS;
> +	struct link_training_settings req_settings;
> +	union lane_align_status_updated dpcd_lane_status_updated = { {0} };
> +	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = { { {0} } };
> +	uint32_t wait_time = 0;
> +
> +	/* initiate CDS done sequence */
> +	dpcd_set_training_pattern(link, lt_settings->pattern_for_cds);
> +
> +	/* poll for CDS interlane align done and symbol lock */
> +	while (status == LINK_TRAINING_SUCCESS) {
> +		dp_wait_for_training_aux_rd_interval(link,
> +				lt_settings->cds_pattern_time);
> +		wait_time += lt_settings->cds_pattern_time;
> +		dp_get_lane_status_and_drive_settings(link, lt_settings, dpcd_lane_status,
> +						&dpcd_lane_status_updated, &req_settings, DPRX);
> +		if (dp_is_symbol_locked(lt_settings->link_settings.lane_count, dpcd_lane_status) &&
> +				dpcd_lane_status_updated.bits.CDS_INTERLANE_ALIGN_DONE_128b_132b) {
> +			/* pass */
> +			break;
> +		} else if (dpcd_lane_status_updated.bits.LT_FAILED_128b_132b) {
> +			status = DP_128b_132b_LT_FAILED;
> +		} else if (wait_time >= lt_settings->cds_wait_time_limit) {
> +			status = DP_128b_132b_CDS_DONE_TIMEOUT;
> +		}
> +	}
> +
> +	return status;
> +}
> +#endif
> +
>   static enum link_training_result dp_perform_8b_10b_link_training(
>   		struct dc_link *link,
>   		struct link_training_settings *lt_settings)
> @@ -1701,6 +2263,35 @@ static enum link_training_result dp_perform_8b_10b_link_training(
>   	return status;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static enum link_training_result dp_perform_128b_132b_link_training(
> +		struct dc_link *link,
> +		struct link_training_settings *lt_settings)
> +{
> +	enum link_training_result result = LINK_TRAINING_SUCCESS;
> +
> +	/* TODO - DP2.0 Link: remove legacy_dp2_lt logic */
> +	if (link->dc->debug.legacy_dp2_lt) {
> +		struct link_training_settings legacy_settings;
> +
> +		decide_8b_10b_training_settings(link,
> +				&lt_settings->link_settings,
> +				&legacy_settings);
> +		return dp_perform_8b_10b_link_training(link, &legacy_settings);
> +	}
> +
> +	dpcd_set_link_settings(link, lt_settings);
> +
> +	if (result == LINK_TRAINING_SUCCESS)
> +		result = dp_perform_128b_132b_channel_eq_done_sequence(link, lt_settings);
> +
> +	if (result == LINK_TRAINING_SUCCESS)
> +		result = dp_perform_128b_132b_cds_done_sequence(link, lt_settings);
> +
> +	return result;
> +}
> +#endif
> +
>   enum link_training_result dc_link_dp_perform_link_training(
>   	struct dc_link *link,
>   	const struct dc_link_settings *link_settings,
> @@ -1735,6 +2326,10 @@ enum link_training_result dc_link_dp_perform_link_training(
>   	 */
>   	if (encoding == DP_8b_10b_ENCODING)
>   		status = dp_perform_8b_10b_link_training(link, &lt_settings);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	else if (encoding == DP_128b_132b_ENCODING)
> +		status = dp_perform_128b_132b_link_training(link, &lt_settings);
> +#endif
>   	else
>   		ASSERT(0);
>   
> @@ -1780,7 +2375,10 @@ bool perform_link_training_with_retries(
>   	/* We need to do this before the link training to ensure the idle pattern in SST
>   	 * mode will be sent right after the link training
>   	 */
> -	link_enc->funcs->connect_dig_be_to_fe(link_enc,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&current_setting) == DP_8b_10b_ENCODING)
> +#endif
> +		link_enc->funcs->connect_dig_be_to_fe(link_enc,
>   							pipe_ctx->stream_res.stream_enc->id, true);
>   
>   	for (j = 0; j < attempts; ++j) {
> @@ -1950,8 +2548,14 @@ enum link_training_result dc_link_dp_sync_lt_attempt(
>   		dp_cs_id, link_settings);
>   
>   	/* Set FEC enable */
> -	fec_enable = lt_overrides->fec_enable && *lt_overrides->fec_enable;
> -	dp_set_fec_ready(link, fec_enable);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
> +#endif
> +		fec_enable = lt_overrides->fec_enable && *lt_overrides->fec_enable;
> +		dp_set_fec_ready(link, fec_enable);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	}
> +#endif
>   
>   	if (lt_overrides->alternate_scrambler_reset) {
>   		if (*lt_overrides->alternate_scrambler_reset)
> @@ -1993,14 +2597,36 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
>   	 * Still shouldn't turn off dp_receiver (DPCD:600h)
>   	 */
>   	if (link_down == true) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		struct dc_link_settings link_settings = link->cur_link_settings;
> +#endif
>   		dp_disable_link_phy(link, link->connector_signal);
> -		dp_set_fec_ready(link, false);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link_settings) == DP_8b_10b_ENCODING)
> +#endif
> +			dp_set_fec_ready(link, false);
>   	}
>   
>   	link->sync_lt_in_progress = false;
>   	return true;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static enum dc_link_rate get_lttpr_max_link_rate(struct dc_link *link)
> +{
> +	enum dc_link_rate lttpr_max_link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
> +
> +	if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR20)
> +		lttpr_max_link_rate = LINK_RATE_UHBR20;
> +	else if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR13_5)
> +		lttpr_max_link_rate = LINK_RATE_UHBR13_5;
> +	else if (link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.bits.UHBR10)
> +		lttpr_max_link_rate = LINK_RATE_UHBR10;
> +
> +	return lttpr_max_link_rate;
> +}
> +#endif
> +
>   bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
>   {
>   	if (!max_link_enc_cap) {
> @@ -2025,6 +2651,11 @@ static struct dc_link_settings get_max_link_cap(struct dc_link *link)
>   
>   	/* get max link encoder capability */
>   	link->link_enc->funcs->get_max_link_cap(link->link_enc, &max_link_cap);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (max_link_cap.link_rate >= LINK_RATE_UHBR10 &&
> +			!link->hpo_dp_link_enc)
> +		max_link_cap.link_rate = LINK_RATE_HIGH3;
> +#endif
>   
>   	/* Lower link settings based on sink's link cap */
>   	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
> @@ -2045,8 +2676,15 @@ static struct dc_link_settings get_max_link_cap(struct dc_link *link)
>   		if (link->dpcd_caps.lttpr_caps.max_lane_count < max_link_cap.lane_count)
>   			max_link_cap.lane_count = link->dpcd_caps.lttpr_caps.max_lane_count;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		enum dc_link_rate lttpr_max_link_rate = get_lttpr_max_link_rate(link);
> +
> +		if (lttpr_max_link_rate < max_link_cap.link_rate)
> +			max_link_cap.link_rate = lttpr_max_link_rate;
> +#else
>   		if (link->dpcd_caps.lttpr_caps.max_link_rate < max_link_cap.link_rate)
>   			max_link_cap.link_rate = link->dpcd_caps.lttpr_caps.max_link_rate;
> +#endif
>   
>   		DC_LOG_HW_LINK_TRAINING("%s\n Training with LTTPR,  max_lane count %d max_link rate %d \n",
>   						__func__,
> @@ -2205,6 +2843,10 @@ bool dp_verify_link_cap(
>   		core_link_write_dpcd(link, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &grant, sizeof(grant));
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
> +		reset_dp_hpo_stream_encoders_for_link(link);
> +#endif
>   	/* TODO implement override and monitor patch later */
>   
>   	/* try to train the link from high to low to
> @@ -2360,7 +3002,17 @@ static struct dc_link_settings get_common_supported_link_settings(
>   	 * We map it to the maximum supported link rate that
>   	 * is smaller than MAX_LINK_BW in this case.
>   	 */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (link_settings.link_rate > LINK_RATE_UHBR20) {
> +		link_settings.link_rate = LINK_RATE_UHBR20;
> +	} else if (link_settings.link_rate < LINK_RATE_UHBR20 &&
> +			link_settings.link_rate > LINK_RATE_UHBR13_5) {
> +		link_settings.link_rate = LINK_RATE_UHBR13_5;
> +	} else if (link_settings.link_rate < LINK_RATE_UHBR10 &&
> +			link_settings.link_rate > LINK_RATE_HIGH3) {
> +#else
>   	if (link_settings.link_rate > LINK_RATE_HIGH3) {
> +#endif
>   		link_settings.link_rate = LINK_RATE_HIGH3;
>   	} else if (link_settings.link_rate < LINK_RATE_HIGH3
>   			&& link_settings.link_rate > LINK_RATE_HIGH2) {
> @@ -2405,6 +3057,14 @@ static enum dc_lane_count reduce_lane_count(enum dc_lane_count lane_count)
>   static enum dc_link_rate reduce_link_rate(enum dc_link_rate link_rate)
>   {
>   	switch (link_rate) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case LINK_RATE_UHBR20:
> +		return LINK_RATE_UHBR13_5;
> +	case LINK_RATE_UHBR13_5:
> +		return LINK_RATE_UHBR10;
> +	case LINK_RATE_UHBR10:
> +		return LINK_RATE_HIGH3;
> +#endif
>   	case LINK_RATE_HIGH3:
>   		return LINK_RATE_HIGH2;
>   	case LINK_RATE_HIGH2:
> @@ -2439,11 +3099,55 @@ static enum dc_link_rate increase_link_rate(enum dc_link_rate link_rate)
>   		return LINK_RATE_HIGH2;
>   	case LINK_RATE_HIGH2:
>   		return LINK_RATE_HIGH3;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case LINK_RATE_HIGH3:
> +		return LINK_RATE_UHBR10;
> +	case LINK_RATE_UHBR10:
> +		return LINK_RATE_UHBR13_5;
> +	case LINK_RATE_UHBR13_5:
> +		return LINK_RATE_UHBR20;
> +#endif
>   	default:
>   		return LINK_RATE_UNKNOWN;
>   	}
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static bool decide_fallback_link_setting_max_bw_policy(
> +		const struct dc_link_settings *max,
> +		struct dc_link_settings *cur)
> +{
> +	uint8_t cur_idx = 0, next_idx;
> +	bool found = false;
> +
> +	while (cur_idx < ARRAY_SIZE(dp_lt_fallbacks))
> +		/* find current index */
> +		if (dp_lt_fallbacks[cur_idx].lane_count == cur->lane_count &&
> +				dp_lt_fallbacks[cur_idx].link_rate == cur->link_rate)
> +			break;
> +		else
> +			cur_idx++;
> +
> +	next_idx = cur_idx + 1;
> +
> +	while (next_idx < ARRAY_SIZE(dp_lt_fallbacks))
> +		/* find next index */
> +		if (dp_lt_fallbacks[next_idx].lane_count <= max->lane_count &&
> +				dp_lt_fallbacks[next_idx].link_rate <= max->link_rate)
> +			break;
> +		else
> +			next_idx++;
> +
> +	if (next_idx < ARRAY_SIZE(dp_lt_fallbacks)) {
> +		cur->lane_count = dp_lt_fallbacks[next_idx].lane_count;
> +		cur->link_rate = dp_lt_fallbacks[next_idx].link_rate;
> +		found = true;
> +	}
> +
> +	return found;
> +}
> +#endif
> +
>   /*
>    * function: set link rate and lane count fallback based
>    * on current link setting and last link training result
> @@ -2459,6 +3163,11 @@ static bool decide_fallback_link_setting(
>   {
>   	if (!current_link_setting)
>   		return false;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&initial_link_settings) == DP_128b_132b_ENCODING)
> +		return decide_fallback_link_setting_max_bw_policy(&initial_link_settings,
> +				current_link_setting);
> +#endif
>   
>   	switch (training_result) {
>   	case LINK_TRAINING_CR_FAIL_LANE0:
> @@ -2831,9 +3540,15 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>   	union phy_test_pattern dpcd_test_pattern;
>   	union lane_adjust dpcd_lane_adjustment[2];
>   	unsigned char dpcd_post_cursor_2_adjustment = 0;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	unsigned char test_pattern_buffer[
> +			(DP_TEST_264BIT_CUSTOM_PATTERN_263_256 -
> +			DP_TEST_264BIT_CUSTOM_PATTERN_7_0)+1] = {0};
> +#else
>   	unsigned char test_pattern_buffer[
>   			(DP_TEST_80BIT_CUSTOM_PATTERN_79_72 -
>   			DP_TEST_80BIT_CUSTOM_PATTERN_7_0)+1] = {0};
> +#endif
>   	unsigned int test_pattern_size = 0;
>   	enum dp_test_pattern test_pattern;
>   	struct dc_link_training_settings link_settings;
> @@ -2899,6 +3614,35 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>   	case PHY_TEST_PATTERN_CP2520_3:
>   		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN4;
>   		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case PHY_TEST_PATTERN_128b_132b_TPS1:
> +		test_pattern = DP_TEST_PATTERN_128b_132b_TPS1;
> +		break;
> +	case PHY_TEST_PATTERN_128b_132b_TPS2:
> +		test_pattern = DP_TEST_PATTERN_128b_132b_TPS2;
> +		break;
> +	case PHY_TEST_PATTERN_PRBS9:
> +		test_pattern = DP_TEST_PATTERN_PRBS9;
> +		break;
> +	case PHY_TEST_PATTERN_PRBS11:
> +		test_pattern = DP_TEST_PATTERN_PRBS11;
> +		break;
> +	case PHY_TEST_PATTERN_PRBS15:
> +		test_pattern = DP_TEST_PATTERN_PRBS15;
> +		break;
> +	case PHY_TEST_PATTERN_PRBS23:
> +		test_pattern = DP_TEST_PATTERN_PRBS23;
> +		break;
> +	case PHY_TEST_PATTERN_PRBS31:
> +		test_pattern = DP_TEST_PATTERN_PRBS31;
> +		break;
> +	case PHY_TEST_PATTERN_264BIT_CUSTOM:
> +		test_pattern = DP_TEST_PATTERN_264BIT_CUSTOM;
> +		break;
> +	case PHY_TEST_PATTERN_SQUARE_PULSE:
> +		test_pattern = DP_TEST_PATTERN_SQUARE_PULSE;
> +		break;
> +#endif
>   	default:
>   		test_pattern = DP_TEST_PATTERN_VIDEO_MODE;
>   	break;
> @@ -2914,6 +3658,27 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>   				test_pattern_size);
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (test_pattern == DP_TEST_PATTERN_SQUARE_PULSE) {
> +		test_pattern_size = 1; // Square pattern data is 1 byte (DP spec)
> +		core_link_read_dpcd(
> +				link,
> +				DP_PHY_SQUARE_PATTERN,
> +				test_pattern_buffer,
> +				test_pattern_size);
> +	}
> +
> +	if (test_pattern == DP_TEST_PATTERN_264BIT_CUSTOM) {
> +		test_pattern_size = (DP_TEST_264BIT_CUSTOM_PATTERN_263_256-
> +				DP_TEST_264BIT_CUSTOM_PATTERN_7_0) + 1;
> +		core_link_read_dpcd(
> +				link,
> +				DP_TEST_264BIT_CUSTOM_PATTERN_7_0,
> +				test_pattern_buffer,
> +				test_pattern_size);
> +	}
> +#endif
> +
>   	/* prepare link training settings */
>   	link_settings.link = link->cur_link_settings;
>   
> @@ -2922,6 +3687,24 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>   		lane++) {
>   		dpcd_lane_adjust.raw =
>   			get_nibble_at_index(&dpcd_lane_adjustment[0].raw, lane);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link->cur_link_settings) ==
> +				DP_128b_132b_ENCODING) {
> +			link_settings.lane_settings[lane].FFE_PRESET.raw =
> +					dpcd_lane_adjust.tx_ffe.PRESET_VALUE;
> +		} else if (dp_get_link_encoding_format(&link->cur_link_settings) ==
> +				DP_8b_10b_ENCODING) {
> +			link_settings.lane_settings[lane].VOLTAGE_SWING =
> +				(enum dc_voltage_swing)
> +				(dpcd_lane_adjust.bits.VOLTAGE_SWING_LANE);
> +			link_settings.lane_settings[lane].PRE_EMPHASIS =
> +				(enum dc_pre_emphasis)
> +				(dpcd_lane_adjust.bits.PRE_EMPHASIS_LANE);
> +			link_settings.lane_settings[lane].POST_CURSOR2 =
> +				(enum dc_post_cursor2)
> +				((dpcd_post_cursor_2_adjustment >> (lane * 2)) & 0x03);
> +		}
> +#else
>   		link_settings.lane_settings[lane].VOLTAGE_SWING =
>   			(enum dc_voltage_swing)
>   			(dpcd_lane_adjust.bits.VOLTAGE_SWING_LANE);
> @@ -2931,6 +3714,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>   		link_settings.lane_settings[lane].POST_CURSOR2 =
>   			(enum dc_post_cursor2)
>   			((dpcd_post_cursor_2_adjustment >> (lane * 2)) & 0x03);
> +#endif
>   	}
>   
>   	for (i = 0; i < 4; i++)
> @@ -3535,6 +4319,43 @@ static void get_active_converter_info(
>   			dp_hw_fw_revision.ieee_fw_rev,
>   			sizeof(dp_hw_fw_revision.ieee_fw_rev));
>   	}
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (link->dpcd_caps.dpcd_rev.raw >= DPCD_REV_14 &&
> +			link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
> +		union dp_dfp_cap_ext dfp_cap_ext;
> +		memset(&dfp_cap_ext, '\0', sizeof (dfp_cap_ext));
> +		core_link_read_dpcd(
> +				link,
> +				DP_DFP_CAPABILITY_EXTENSION_SUPPORT,
> +				dfp_cap_ext.raw,
> +				sizeof(dfp_cap_ext.raw));
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.supported = dfp_cap_ext.fields.supported;
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_pixel_rate_in_mps =
> +				dfp_cap_ext.fields.max_pixel_rate_in_mps[0] +
> +				(dfp_cap_ext.fields.max_pixel_rate_in_mps[1] << 8);
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width =
> +				dfp_cap_ext.fields.max_video_h_active_width[0] +
> +				(dfp_cap_ext.fields.max_video_h_active_width[1] << 8);
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height =
> +				dfp_cap_ext.fields.max_video_v_active_height[0] +
> +				(dfp_cap_ext.fields.max_video_v_active_height[1] << 8);
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.encoding_format_caps =
> +				dfp_cap_ext.fields.encoding_format_caps;
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.rgb_color_depth_caps =
> +				dfp_cap_ext.fields.rgb_color_depth_caps;
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr444_color_depth_caps =
> +				dfp_cap_ext.fields.ycbcr444_color_depth_caps;
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr422_color_depth_caps =
> +				dfp_cap_ext.fields.ycbcr422_color_depth_caps;
> +		link->dpcd_caps.dongle_caps.dfp_cap_ext.ycbcr420_color_depth_caps =
> +				dfp_cap_ext.fields.ycbcr420_color_depth_caps;
> +		DC_LOG_DP2("DFP capability extension is read at link %d", link->link_index);
> +		DC_LOG_DP2("\tdfp_cap_ext.supported = %s", link->dpcd_caps.dongle_caps.dfp_cap_ext.supported ? "true" : "false");
> +		DC_LOG_DP2("\tdfp_cap_ext.max_pixel_rate_in_mps = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_pixel_rate_in_mps);
> +		DC_LOG_DP2("\tdfp_cap_ext.max_video_h_active_width = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_h_active_width);
> +		DC_LOG_DP2("\tdfp_cap_ext.max_video_v_active_height = %d", link->dpcd_caps.dongle_caps.dfp_cap_ext.max_video_v_active_height);
> +	}
> +#endif
>   }
>   
>   static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
> @@ -3594,7 +4415,11 @@ static bool dpcd_read_sink_ext_caps(struct dc_link *link)
>   
>   bool dp_retrieve_lttpr_cap(struct dc_link *link)
>   {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	uint8_t lttpr_dpcd_data[8];
> +#else
>   	uint8_t lttpr_dpcd_data[6];
> +#endif
>   	bool vbios_lttpr_enable = link->dc->caps.vbios_lttpr_enable;
>   	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
>   	enum dc_status status = DC_ERROR_UNEXPECTED;
> @@ -3602,6 +4427,18 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
>   
>   	memset(lttpr_dpcd_data, '\0', sizeof(lttpr_dpcd_data));
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	bool allow_lttpr_non_transparent_mode = 0;
> +
> +	if ((link->dc->config.allow_lttpr_non_transparent_mode.bits.DP2_0 &&
> +			link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)) {
> +		allow_lttpr_non_transparent_mode = 1;
> +	} else if (link->dc->config.allow_lttpr_non_transparent_mode.bits.DP1_4A &&
> +			!link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
> +		allow_lttpr_non_transparent_mode = 1;
> +	}
> +#endif
> +
>   	/*
>   	 * Logic to determine LTTPR mode
>   	 */
> @@ -3609,13 +4446,21 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
>   	if (vbios_lttpr_enable && vbios_lttpr_interop)
>   		link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
>   	else if (!vbios_lttpr_enable && vbios_lttpr_interop) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (allow_lttpr_non_transparent_mode)
> +#else
>   		if (link->dc->config.allow_lttpr_non_transparent_mode)
> +#endif
>   			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
>   		else
>   			link->lttpr_mode = LTTPR_MODE_TRANSPARENT;
>   	} else if (!vbios_lttpr_enable && !vbios_lttpr_interop) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (!allow_lttpr_non_transparent_mode || !link->dc->caps.extended_aux_timeout_support)
> +#else
>   		if (!link->dc->config.allow_lttpr_non_transparent_mode
>   			|| !link->dc->caps.extended_aux_timeout_support)
> +#endif
>   			link->lttpr_mode = LTTPR_MODE_NON_LTTPR;
>   		else
>   			link->lttpr_mode = LTTPR_MODE_NON_TRANSPARENT;
> @@ -3659,6 +4504,16 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
>   				lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
>   								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		link->dpcd_caps.lttpr_caps.main_link_channel_coding.raw =
> +				lttpr_dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
> +								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
> +
> +		link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
> +				lttpr_dpcd_data[DP_PHY_REPEATER_128b_132b_RATES -
> +								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
> +#endif
> +
>   		/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
>   		is_lttpr_present = (dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) != 0 &&
>   				link->dpcd_caps.lttpr_caps.max_lane_count > 0 &&
> @@ -3909,16 +4764,82 @@ static bool retrieve_link_cap(struct dc_link *link)
>   				DP_DSC_SUPPORT,
>   				link->dpcd_caps.dsc_caps.dsc_basic_caps.raw,
>   				sizeof(link->dpcd_caps.dsc_caps.dsc_basic_caps.raw));
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_NONE) {
> +			status = core_link_read_dpcd(
> +					link,
> +					DP_DSC_BRANCH_OVERALL_THROUGHPUT_0,
> +					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw,
> +					sizeof(link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw));
> +			DC_LOG_DSC("DSC branch decoder capability is read at link %d", link->link_index);
> +			DC_LOG_DSC("\tBRANCH_OVERALL_THROUGHPUT_0 = 0x%02x",
> +					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_OVERALL_THROUGHPUT_0);
> +			DC_LOG_DSC("\tBRANCH_OVERALL_THROUGHPUT_1 = 0x%02x",
> +					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_OVERALL_THROUGHPUT_1);
> +			DC_LOG_DSC("\tBRANCH_MAX_LINE_WIDTH 0x%02x",
> +					link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.fields.BRANCH_MAX_LINE_WIDTH);
> +		}
> +#else
>   		status = core_link_read_dpcd(
>   				link,
>   				DP_DSC_BRANCH_OVERALL_THROUGHPUT_0,
>   				link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw,
>   				sizeof(link->dpcd_caps.dsc_caps.dsc_branch_decoder_caps.raw));
> +#endif
>   	}
>   
>   	if (!dpcd_read_sink_ext_caps(link))
>   		link->dpcd_sink_ext_caps.raw = 0;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	link->dpcd_caps.channel_coding_cap.raw = dpcd_data[DP_MAIN_LINK_CHANNEL_CODING_CAP - DP_DPCD_REV];
> +
> +	if (link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED) {
> +		DC_LOG_DP2("128b/132b encoding is supported at link %d", link->link_index);
> +
> +		core_link_read_dpcd(link,
> +				DP_128b_132b_SUPPORTED_LINK_RATES,
> +				&link->dpcd_caps.dp_128b_132b_supported_link_rates.raw,
> +				sizeof(link->dpcd_caps.dp_128b_132b_supported_link_rates.raw));
> +		if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR20)
> +			link->reported_link_cap.link_rate = LINK_RATE_UHBR20;
> +		else if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR13_5)
> +			link->reported_link_cap.link_rate = LINK_RATE_UHBR13_5;
> +		else if (link->dpcd_caps.dp_128b_132b_supported_link_rates.bits.UHBR10)
> +			link->reported_link_cap.link_rate = LINK_RATE_UHBR10;
> +		else
> +			dm_error("%s: Invalid RX 128b_132b_supported_link_rates\n", __func__);
> +		DC_LOG_DP2("128b/132b supported link rates is read at link %d", link->link_index);
> +		DC_LOG_DP2("\tmax 128b/132b link rate support is %d.%d GHz",
> +				link->reported_link_cap.link_rate / 100,
> +				link->reported_link_cap.link_rate % 100);
> +
> +		core_link_read_dpcd(link,
> +				DP_SINK_VIDEO_FALLBACK_FORMATS,
> +				&link->dpcd_caps.fallback_formats.raw,
> +				sizeof(link->dpcd_caps.fallback_formats.raw));
> +		DC_LOG_DP2("sink video fallback format is read at link %d", link->link_index);
> +		if (link->dpcd_caps.fallback_formats.bits.dp_1920x1080_60Hz_24bpp_support)
> +			DC_LOG_DP2("\t1920x1080@60Hz 24bpp fallback format supported");
> +		if (link->dpcd_caps.fallback_formats.bits.dp_1280x720_60Hz_24bpp_support)
> +			DC_LOG_DP2("\t1280x720@60Hz 24bpp fallback format supported");
> +		if (link->dpcd_caps.fallback_formats.bits.dp_1024x768_60Hz_24bpp_support)
> +			DC_LOG_DP2("\t1024x768@60Hz 24bpp fallback format supported");
> +		if (link->dpcd_caps.fallback_formats.raw == 0) {
> +			DC_LOG_DP2("\tno supported fallback formats, assume 1920x1080@60Hz 24bpp is supported");
> +			link->dpcd_caps.fallback_formats.bits.dp_1920x1080_60Hz_24bpp_support = 1;
> +		}
> +
> +		core_link_read_dpcd(link,
> +				DP_FEC_CAPABILITY_1,
> +				&link->dpcd_caps.fec_cap1.raw,
> +				sizeof(link->dpcd_caps.fec_cap1.raw));
> +		DC_LOG_DP2("FEC CAPABILITY 1 is read at link %d", link->link_index);
> +		if (link->dpcd_caps.fec_cap1.bits.AGGREGATED_ERROR_COUNTERS_CAPABLE)
> +			DC_LOG_DP2("\tFEC aggregated error counters are supported");
> +	}
> +#endif
> +
>   	/* Connectivity log: detection */
>   	CONN_DATA_DETECT(link, dpcd_data, sizeof(dpcd_data), "Rx Caps: ");
>   
> @@ -4389,6 +5310,35 @@ bool dc_link_dp_set_test_pattern(
>   		case DP_TEST_PATTERN_CP2520_3:
>   			pattern = PHY_TEST_PATTERN_CP2520_3;
>   			break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		case DP_TEST_PATTERN_128b_132b_TPS1:
> +			pattern = PHY_TEST_PATTERN_128b_132b_TPS1;
> +			break;
> +		case DP_TEST_PATTERN_128b_132b_TPS2:
> +			pattern = PHY_TEST_PATTERN_128b_132b_TPS2;
> +			break;
> +		case DP_TEST_PATTERN_PRBS9:
> +			pattern = PHY_TEST_PATTERN_PRBS9;
> +			break;
> +		case DP_TEST_PATTERN_PRBS11:
> +			pattern = PHY_TEST_PATTERN_PRBS11;
> +			break;
> +		case DP_TEST_PATTERN_PRBS15:
> +			pattern = PHY_TEST_PATTERN_PRBS15;
> +			break;
> +		case DP_TEST_PATTERN_PRBS23:
> +			pattern = PHY_TEST_PATTERN_PRBS23;
> +			break;
> +		case DP_TEST_PATTERN_PRBS31:
> +			pattern = PHY_TEST_PATTERN_PRBS31;
> +			break;
> +		case DP_TEST_PATTERN_264BIT_CUSTOM:
> +			pattern = PHY_TEST_PATTERN_264BIT_CUSTOM;
> +			break;
> +		case DP_TEST_PATTERN_SQUARE_PULSE:
> +			pattern = PHY_TEST_PATTERN_SQUARE_PULSE;
> +			break;
> +#endif
>   		default:
>   			return false;
>   		}
> @@ -4964,6 +5914,210 @@ enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings
>   	if ((link_settings->link_rate >= LINK_RATE_LOW) &&
>   			(link_settings->link_rate <= LINK_RATE_HIGH3))
>   		return DP_8b_10b_ENCODING;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	else if ((link_settings->link_rate >= LINK_RATE_UHBR10) &&
> +			(link_settings->link_rate <= LINK_RATE_UHBR20))
> +		return DP_128b_132b_ENCODING;
> +#endif
>   	return DP_UNKNOWN_ENCODING;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +// TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
> +static void get_lane_status(
> +	struct dc_link *link,
> +	uint32_t lane_count,
> +	union lane_status *status,
> +	union lane_align_status_updated *status_updated)
> +{
> +	unsigned int lane;
> +
> +	if (status == NULL || status_updated == NULL) {
> +		return;
> +	}
> +
> +	uint8_t dpcd_buf[3] = {0};
> +
> +	core_link_read_dpcd(
> +			link,
> +			DP_LANE0_1_STATUS,
> +			dpcd_buf,
> +			sizeof(dpcd_buf));
> +
> +	for (lane = 0; lane < lane_count; lane++) {
> +		status[lane].raw = get_nibble_at_index(&dpcd_buf[0], lane);
> +	}
> +
> +	status_updated->raw = dpcd_buf[2];
> +}
> +
> +bool dpcd_write_128b_132b_sst_payload_allocation_table(
> +		const struct dc_stream_state *stream,
> +		struct dc_link *link,
> +		struct link_mst_stream_allocation_table *proposed_table,
> +		bool allocate)
> +{
> +	const uint8_t vc_id = 1; /// VC ID always 1 for SST
> +	const uint8_t start_time_slot = 0; /// Always start at time slot 0 for SST
> +	bool result = false;
> +	uint8_t req_slot_count = 0;
> +	struct fixed31_32 avg_time_slots_per_mtp = { 0 };
> +
> +	if (allocate)	{
> +		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, link);
> +		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
> +	} else {
> +		/// Leave req_slot_count = 0 if allocate is false.
> +	}
> +
> +	union payload_table_update_status update_status = { 0 };
> +
> +	/// Write DPCD 2C0 = 1 to start updating
> +	update_status.bits.VC_PAYLOAD_TABLE_UPDATED = 1;
> +	core_link_write_dpcd(
> +			link,
> +			DP_PAYLOAD_TABLE_UPDATE_STATUS,
> +			&update_status.raw,
> +			1);
> +
> +	/// Program the changes in DPCD 1C0 - 1C2
> +	ASSERT(vc_id == 1);
> +	core_link_write_dpcd(
> +			link,
> +			DP_PAYLOAD_ALLOCATE_SET,
> +			&vc_id,
> +			1);
> +
> +	ASSERT(start_time_slot == 0);
> +	core_link_write_dpcd(
> +			link,
> +			DP_PAYLOAD_ALLOCATE_START_TIME_SLOT,
> +			&start_time_slot,
> +			1);
> +
> +	ASSERT(req_slot_count <= MAX_MTP_SLOT_COUNT); /// Validation should filter out modes that exceed link BW
> +	core_link_write_dpcd(
> +			link,
> +			DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT,
> +			&req_slot_count,
> +			1);
> +
> +	/// Poll till DPCD 2C0 read 1
> +	/// Try for at least 150ms (30 retries, with 5ms delay after each attempt)
> +	const uint32_t max_retries = 30;
> +	uint32_t retries = 0;
> +
> +	while (retries < max_retries) {
> +		if (core_link_read_dpcd(
> +				link,
> +				DP_PAYLOAD_TABLE_UPDATE_STATUS,
> +				&update_status.raw,
> +				1) == DC_OK) {
> +			if (update_status.bits.VC_PAYLOAD_TABLE_UPDATED == 1) {
> +				DC_LOG_DP2("SST Update Payload: downstream payload table updated.");
> +				result = true;
> +				break;
> +			}
> +		} else {
> +			union dpcd_rev dpcdRev;
> +
> +			if (core_link_read_dpcd(
> +					link,
> +					DP_DPCD_REV,
> +					&dpcdRev.raw,
> +					1) != DC_OK) {
> +				DC_LOG_ERROR("SST Update Payload: Unable to read DPCD revision "
> +						"of sink while polling payload table "
> +						"updated status bit.");
> +				break;
> +			}
> +		}
> +		retries++;
> +		udelay(5000);
> +	}
> +
> +	if (!result && retries == max_retries) {
> +		DC_LOG_ERROR("SST Update Payload: Payload table not updated after retries, "
> +				"continue on. Something is wrong with the branch.");
> +		// TODO - DP2.0 Payload: Read and log the payload table from downstream branch
> +	}
> +
> +	proposed_table->stream_count = 1; /// Always 1 stream for SST
> +	proposed_table->stream_allocations[0].slot_count = req_slot_count;
> +	proposed_table->stream_allocations[0].vcp_id = vc_id;
> +
> +	return result;
> +}
> +
> +bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link)
> +{
> +	/*
> +	 * wait for ACT handled
> +	 */
> +	int i;
> +	const int act_retries = 30;
> +	enum act_return_status result = ACT_FAILED;
> +	union payload_table_update_status update_status = {0};
> +	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
> +	union lane_align_status_updated lane_status_updated;
> +
> +	for (i = 0; i < act_retries; i++) {
> +		get_lane_status(link, link->cur_link_settings.lane_count, dpcd_lane_status, &lane_status_updated);
> +
> +		if (!dp_is_cr_done(link->cur_link_settings.lane_count, dpcd_lane_status) ||
> +				!dp_is_ch_eq_done(link->cur_link_settings.lane_count, dpcd_lane_status) ||
> +				!dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status) ||
> +				!dp_is_interlane_aligned(lane_status_updated)) {
> +			DC_LOG_ERROR("SST Update Payload: Link loss occurred while "
> +					"polling for ACT handled.");
> +			result = ACT_LINK_LOST;
> +			break;
> +		}
> +		core_link_read_dpcd(
> +				link,
> +				DP_PAYLOAD_TABLE_UPDATE_STATUS,
> +				&update_status.raw,
> +				1);
> +
> +		if (update_status.bits.ACT_HANDLED == 1) {
> +			DC_LOG_DP2("SST Update Payload: ACT handled by downstream.");
> +			result = ACT_SUCCESS;
> +			break;
> +		}
> +
> +		udelay(5000);
> +	}
> +
> +	if (result == ACT_FAILED) {
> +		DC_LOG_ERROR("SST Update Payload: ACT still not handled after retries, "
> +				"continue on. Something is wrong with the branch.");
> +	}
> +
> +	return (result == ACT_SUCCESS);
> +}
> +
> +struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
> +		const struct dc_stream_state *stream,
> +		const struct dc_link *link)
> +{
> +	struct fixed31_32 link_bw_effective =
> +			dc_fixpt_from_int(
> +					dc_link_bandwidth_kbps(link, &link->cur_link_settings));
> +	struct fixed31_32 timeslot_bw_effective =
> +			dc_fixpt_div_int(link_bw_effective, MAX_MTP_SLOT_COUNT);
> +	struct fixed31_32 timing_bw =
> +			dc_fixpt_from_int(
> +					dc_bandwidth_in_kbps_from_timing(&stream->timing));
> +	struct fixed31_32 avg_time_slots_per_mtp =
> +			dc_fixpt_div(timing_bw, timeslot_bw_effective);
> +
> +	return avg_time_slots_per_mtp;
> +}
> +
> +bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx)
> +{
> +	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
> +			pipe_ctx->stream->link->hpo_dp_link_enc &&
> +			dc_is_dp_signal(pipe_ctx->stream->signal));
> +}
> +#endif
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
> index 9c51cd09dcf1..0d3800896333 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
> @@ -17,6 +17,7 @@
>   #include "link_enc_cfg.h"
>   #include "clk_mgr.h"
>   #include "inc/link_dpcd.h"
> +#include "dccg.h"
>   
>   static uint8_t convert_to_count(uint8_t lttpr_repeater_count)
>   {
> @@ -111,12 +112,37 @@ void dp_enable_link_phy(
>   
>   	link->cur_link_settings = *link_settings;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
> +		/* TODO - DP2.0 HW: notify link rate change here */
> +	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
> +		if (dc->clk_mgr->funcs->notify_link_rate_change)
> +			dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
> +	}
> +#else
>   	if (dc->clk_mgr->funcs->notify_link_rate_change)
>   		dc->clk_mgr->funcs->notify_link_rate_change(dc->clk_mgr, link);
> -
> +#endif
>   	if (dmcu != NULL && dmcu->funcs->lock_phy)
>   		dmcu->funcs->lock_phy(dmcu);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
> +		enable_dp_hpo_output(link, link_settings);
> +	} else if (dp_get_link_encoding_format(link_settings) == DP_8b_10b_ENCODING) {
> +		if (dc_is_dp_sst_signal(signal)) {
> +			link_enc->funcs->enable_dp_output(
> +							link_enc,
> +							link_settings,
> +							clock_source);
> +		} else {
> +			link_enc->funcs->enable_dp_mst_output(
> +							link_enc,
> +							link_settings,
> +							clock_source);
> +		}
> +	}
> +#else
>   	if (dc_is_dp_sst_signal(signal)) {
>   		link_enc->funcs->enable_dp_output(
>   						link_enc,
> @@ -128,7 +154,7 @@ void dp_enable_link_phy(
>   						link_settings,
>   						clock_source);
>   	}
> -
> +#endif
>   	if (dmcu != NULL && dmcu->funcs->unlock_phy)
>   		dmcu->funcs->unlock_phy(dmcu);
>   
> @@ -206,6 +232,9 @@ void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
>   {
>   	struct dc  *dc = link->ctx->dc;
>   	struct dmcu *dmcu = dc->res_pool->dmcu;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	struct hpo_dp_link_encoder *hpo_link_enc = link->hpo_dp_link_enc;
> +#endif
>   	struct link_encoder *link_enc;
>   
>   	/* Link should always be assigned encoder when en-/disabling. */
> @@ -221,14 +250,28 @@ void dp_disable_link_phy(struct dc_link *link, enum signal_type signal)
>   	if (signal == SIGNAL_TYPE_EDP) {
>   		if (link->dc->hwss.edp_backlight_control)
>   			link->dc->hwss.edp_backlight_control(link, false);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING)
> +			disable_dp_hpo_output(link, signal);
> +		else
> +			link_enc->funcs->disable_output(link_enc, signal);
> +#else
>   		link_enc->funcs->disable_output(link_enc, signal);
> +#endif
>   		link->dc->hwss.edp_power_control(link, false);
>   	} else {
>   		if (dmcu != NULL && dmcu->funcs->lock_phy)
>   			dmcu->funcs->lock_phy(dmcu);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dp_get_link_encoding_format(&link->cur_link_settings) == DP_128b_132b_ENCODING &&
> +				hpo_link_enc)
> +			disable_dp_hpo_output(link, signal);
> +		else
> +			link_enc->funcs->disable_output(link_enc, signal);
> +#else
>   		link_enc->funcs->disable_output(link_enc, signal);
> -
> +#endif
>   		if (dmcu != NULL && dmcu->funcs->unlock_phy)
>   			dmcu->funcs->unlock_phy(dmcu);
>   	}
> @@ -273,6 +316,14 @@ bool dp_set_hw_training_pattern(
>   	case DP_TRAINING_PATTERN_SEQUENCE_4:
>   		test_pattern = DP_TEST_PATTERN_TRAINING_PATTERN4;
>   		break;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	case DP_128b_132b_TPS1:
> +		test_pattern = DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE;
> +		break;
> +	case DP_128b_132b_TPS2:
> +		test_pattern = DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE;
> +		break;
> +#endif
>   	default:
>   		break;
>   	}
> @@ -282,6 +333,10 @@ bool dp_set_hw_training_pattern(
>   	return true;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +#define DC_LOGGER \
> +	link->ctx->logger
> +#endif
>   void dp_set_hw_lane_settings(
>   	struct dc_link *link,
>   	const struct link_training_settings *link_settings,
> @@ -293,7 +348,20 @@ void dp_set_hw_lane_settings(
>   		return;
>   
>   	/* call Encoder to set lane settings */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (dp_get_link_encoding_format(&link_settings->link_settings) ==
> +			DP_128b_132b_ENCODING) {
> +		link->hpo_dp_link_enc->funcs->set_ffe(
> +				link->hpo_dp_link_enc,
> +				&link_settings->link_settings,
> +				link_settings->lane_settings[0].FFE_PRESET.raw);
> +	} else if (dp_get_link_encoding_format(&link_settings->link_settings)
> +			== DP_8b_10b_ENCODING) {
> +		encoder->funcs->dp_set_lane_settings(encoder, link_settings);
> +	}
> +#else
>   	encoder->funcs->dp_set_lane_settings(encoder, link_settings);
> +#endif
>   }
>   
>   void dp_set_hw_test_pattern(
> @@ -319,8 +387,28 @@ void dp_set_hw_test_pattern(
>   	pattern_param.custom_pattern_size = custom_pattern_size;
>   	pattern_param.dp_panel_mode = dp_get_panel_mode(link);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	enum dp_link_encoding link_encoding_format = dp_get_link_encoding_format(&link->cur_link_settings);
> +	switch (link_encoding_format) {
> +	case DP_128b_132b_ENCODING:
> +		link->hpo_dp_link_enc->funcs->set_link_test_pattern(
> +				link->hpo_dp_link_enc, &pattern_param);
> +		break;
> +	case DP_8b_10b_ENCODING:
> +		ASSERT(encoder);
> +		encoder->funcs->dp_set_phy_pattern(encoder, &pattern_param);
> +		break;
> +	default:
> +		DC_LOG_ERROR("%s: Unknown link encoding format.", __func__);
> +		break;
> +	}
> +#else
>   	encoder->funcs->dp_set_phy_pattern(encoder, &pattern_param);
> +#endif
>   }
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +#undef DC_LOGGER
> +#endif
>   
>   void dp_retrain_link_dp_test(struct dc_link *link,
>   			struct dc_link_settings *link_setting,
> @@ -468,7 +556,12 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
>   		optc_dsc_mode = dsc_optc_cfg.is_pixel_format_444 ? OPTC_DSC_ENABLED_444 : OPTC_DSC_ENABLED_NATIVE_SUBSAMPLED;
>   
>   		/* Enable DSC in encoder */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)
> +				&& !is_dp_128b_132b_signal(pipe_ctx)) {
> +#else
>   		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
> +#endif
>   			DC_LOG_DSC("Setting stream encoder DSC config for engine %d:", (int)pipe_ctx->stream_res.stream_enc->id);
>   			dsc_optc_config_log(dsc, &dsc_optc_cfg);
>   			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(pipe_ctx->stream_res.stream_enc,
> @@ -495,13 +588,21 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
>   		/* disable DSC in stream encoder */
>   		if (dc_is_dp_signal(stream->signal)) {
>   
> -			if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
> -				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(
> -						pipe_ctx->stream_res.stream_enc,
> -						OPTC_DSC_DISABLED, 0, 0);
> -				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
> -							pipe_ctx->stream_res.stream_enc, false, NULL);
> -			}
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (is_dp_128b_132b_signal(pipe_ctx))
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
> +										pipe_ctx->stream_res.hpo_dp_stream_enc,
> +										false,
> +										NULL);
> +			else
> +#endif
> +				if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
> +					pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(
> +							pipe_ctx->stream_res.stream_enc,
> +							OPTC_DSC_DISABLED, 0, 0);
> +					pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
> +								pipe_ctx->stream_res.stream_enc, false, NULL);
> +				}
>   		}
>   
>   		/* disable DSC block */
> @@ -562,16 +663,32 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable)
>   		dsc->funcs->dsc_get_packed_pps(dsc, &dsc_cfg, &dsc_packed_pps[0]);
>   		if (dc_is_dp_signal(stream->signal)) {
>   			DC_LOG_DSC("Setting stream encoder DSC PPS SDP for engine %d\n", (int)pipe_ctx->stream_res.stream_enc->id);
> -			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
> -									pipe_ctx->stream_res.stream_enc,
> -									true,
> -									&dsc_packed_pps[0]);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (is_dp_128b_132b_signal(pipe_ctx))
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
> +										pipe_ctx->stream_res.hpo_dp_stream_enc,
> +										true,
> +										&dsc_packed_pps[0]);
> +			else
> +#endif
> +				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
> +										pipe_ctx->stream_res.stream_enc,
> +										true,
> +										&dsc_packed_pps[0]);
>   		}
>   	} else {
>   		/* disable DSC PPS in stream encoder */
>   		if (dc_is_dp_signal(stream->signal)) {
> -			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
> -						pipe_ctx->stream_res.stream_enc, false, NULL);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (is_dp_128b_132b_signal(pipe_ctx))
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
> +										pipe_ctx->stream_res.hpo_dp_stream_enc,
> +										false,
> +										NULL);
> +			else
> +#endif
> +				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
> +							pipe_ctx->stream_res.stream_enc, false, NULL);
>   		}
>   	}
>   
> @@ -593,3 +710,168 @@ bool dp_update_dsc_config(struct pipe_ctx *pipe_ctx)
>   	return true;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +#undef DC_LOGGER
> +#define DC_LOGGER \
> +	link->ctx->logger
> +
> +static enum phyd32clk_clock_source get_phyd32clk_src(struct dc_link *link)
> +{
> +	switch (link->link_enc->transmitter) {
> +	case TRANSMITTER_UNIPHY_A:
> +		return PHYD32CLKA;
> +	case TRANSMITTER_UNIPHY_B:
> +		return PHYD32CLKB;
> +	case TRANSMITTER_UNIPHY_C:
> +		return PHYD32CLKC;
> +	case TRANSMITTER_UNIPHY_D:
> +		return PHYD32CLKD;
> +	case TRANSMITTER_UNIPHY_E:
> +		return PHYD32CLKE;
> +	}
> +
> +	//BREAK_TO_DEBUGGER();
> +	return TRANSMITTER_UNIPHY_A;
> +}
> +
> +void enable_dp_hpo_output(struct dc_link *link, const struct dc_link_settings *link_settings)
> +{
> +	const struct dc *dc = link->dc;
> +	enum phyd32clk_clock_source phyd32clk;
> +
> +	/* Enable PHY PLL at target bit rate
> +	 *   UHBR10 = 10Gbps (SYMCLK32 = 312.5MHz)
> +	 *   UBR13.5 = 13.5Gbps (SYMCLK32 = 421.875MHz)
> +	 *   UHBR20 = 20Gbps (SYMCLK32 = 625MHz)
> +	 */
> +	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
> +		switch (link_settings->link_rate) {
> +		case LINK_RATE_UHBR10:
> +			dm_set_phyd32clk(dc->ctx, 312500);
> +			break;
> +		case LINK_RATE_UHBR13_5:
> +			dm_set_phyd32clk(dc->ctx, 412875);
> +			break;
> +		case LINK_RATE_UHBR20:
> +			dm_set_phyd32clk(dc->ctx, 625000);
> +			break;
> +		default:
> +			return;
> +		}
> +	} else {
> +		/* DP2.0 HW: call transmitter control to enable PHY */
> +		link->hpo_dp_link_enc->funcs->enable_link_phy(
> +				link->hpo_dp_link_enc,
> +				link_settings,
> +				link->link_enc->transmitter);
> +	}
> +
> +	/* DCCG muxing and DTBCLK DTO */
> +	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
> +		dc->res_pool->dccg->funcs->set_physymclk(
> +				dc->res_pool->dccg,
> +				link->link_enc_hw_inst,
> +				PHYSYMCLK_FORCE_SRC_PHYD32CLK,
> +				true);
> +
> +		phyd32clk = get_phyd32clk_src(link);
> +		dc->res_pool->dccg->funcs->enable_symclk32_le(
> +				dc->res_pool->dccg,
> +				link->hpo_dp_link_enc->inst,
> +				phyd32clk);
> +		link->hpo_dp_link_enc->funcs->link_enable(
> +					link->hpo_dp_link_enc,
> +					link_settings->lane_count);
> +	}
> +}
> +
> +void disable_dp_hpo_output(struct dc_link *link, enum signal_type signal)
> +{
> +	const struct dc *dc = link->dc;
> +
> +	link->hpo_dp_link_enc->funcs->link_disable(link->hpo_dp_link_enc);
> +
> +	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
> +		dc->res_pool->dccg->funcs->disable_symclk32_le(
> +					dc->res_pool->dccg,
> +					link->hpo_dp_link_enc->inst);
> +
> +		dc->res_pool->dccg->funcs->set_physymclk(
> +					dc->res_pool->dccg,
> +					link->link_enc_hw_inst,
> +					PHYSYMCLK_FORCE_SRC_SYMCLK,
> +					false);
> +
> +		dm_set_phyd32clk(dc->ctx, 0);
> +	} else {
> +		/* DP2.0 HW: call transmitter control to disable PHY */
> +		link->hpo_dp_link_enc->funcs->disable_link_phy(
> +				link->hpo_dp_link_enc,
> +				signal);
> +	}
> +}
> +
> +void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable)
> +{
> +	struct dc_stream_state *stream = pipe_ctx->stream;
> +	struct dc *dc = pipe_ctx->stream->ctx->dc;
> +	struct pipe_ctx *odm_pipe;
> +	int odm_combine_num_segments = 1;
> +	enum phyd32clk_clock_source phyd32clk;
> +
> +	if (enable) {
> +		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
> +				odm_combine_num_segments++;
> +
> +		dc->res_pool->dccg->funcs->set_dpstreamclk(
> +				dc->res_pool->dccg,
> +				DTBCLK0,
> +				pipe_ctx->stream_res.tg->inst);
> +
> +		phyd32clk = get_phyd32clk_src(stream->link);
> +		dc->res_pool->dccg->funcs->enable_symclk32_se(
> +				dc->res_pool->dccg,
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->inst,
> +				phyd32clk);
> +
> +		dc->res_pool->dccg->funcs->set_dtbclk_dto(
> +				dc->res_pool->dccg,
> +				pipe_ctx->stream_res.tg->inst,
> +				stream->phy_pix_clk,
> +				odm_combine_num_segments,
> +				&stream->timing);
> +	} else {
> +		dc->res_pool->dccg->funcs->set_dtbclk_dto(
> +				dc->res_pool->dccg,
> +				pipe_ctx->stream_res.tg->inst,
> +				0,
> +				0,
> +				&stream->timing);
> +		dc->res_pool->dccg->funcs->disable_symclk32_se(
> +				dc->res_pool->dccg,
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->inst);
> +		dc->res_pool->dccg->funcs->set_dpstreamclk(
> +				dc->res_pool->dccg,
> +				REFCLK,
> +				pipe_ctx->stream_res.tg->inst);
> +	}
> +}
> +
> +void reset_dp_hpo_stream_encoders_for_link(struct dc_link *link)
> +{
> +	const struct dc *dc = link->dc;
> +	struct dc_state *state = dc->current_state;
> +	uint8_t i;
> +
> +	for (i = 0; i < MAX_PIPES; i++) {
> +		if (state->res_ctx.pipe_ctx[i].stream_res.hpo_dp_stream_enc &&
> +				state->res_ctx.pipe_ctx[i].stream &&
> +				state->res_ctx.pipe_ctx[i].stream->link == link &&
> +				!state->res_ctx.pipe_ctx[i].stream->dpms_off) {
> +			setup_dp_hpo_stream(&state->res_ctx.pipe_ctx[i], false);
> +		}
> +	}
> +}
> +
> +#undef DC_LOGGER
> +#endif
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index a60396d5be44..57420bf10786 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -41,6 +41,7 @@
>   #include "set_mode_types.h"
>   #include "virtual/virtual_stream_encoder.h"
>   #include "dpcd_defs.h"
> +#include "dc_link_dp.h"
>   
>   #if defined(CONFIG_DRM_AMD_DC_SI)
>   #include "dce60/dce60_resource.h"
> @@ -346,6 +347,29 @@ bool resource_construct(
>   		}
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	pool->hpo_dp_stream_enc_count = 0;
> +	if (create_funcs->create_hpo_dp_stream_encoder) {
> +		for (i = 0; i < caps->num_hpo_dp_stream_encoder; i++) {
> +			pool->hpo_dp_stream_enc[i] = create_funcs->create_hpo_dp_stream_encoder(i+ENGINE_ID_HPO_DP_0, ctx);
> +			if (pool->hpo_dp_stream_enc[i] == NULL)
> +				DC_ERR("DC: failed to create HPO DP stream encoder!\n");
> +			pool->hpo_dp_stream_enc_count++;
> +
> +		}
> +	}
> +
> +	pool->hpo_dp_link_enc_count = 0;
> +	if (create_funcs->create_hpo_dp_link_encoder) {
> +		for (i = 0; i < caps->num_hpo_dp_link_encoder; i++) {
> +			pool->hpo_dp_link_enc[i] = create_funcs->create_hpo_dp_link_encoder(i, ctx);
> +			if (pool->hpo_dp_link_enc[i] == NULL)
> +				DC_ERR("DC: failed to create HPO DP link encoder!\n");
> +			pool->hpo_dp_link_enc_count++;
> +		}
> +	}
> +#endif
> +
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>   	for (i = 0; i < caps->num_mpc_3dlut; i++) {
>   		pool->mpc_lut[i] = dc_create_3dlut_func();
> @@ -1665,6 +1689,22 @@ static void update_stream_engine_usage(
>   	}
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static void update_hpo_dp_stream_engine_usage(
> +		struct resource_context *res_ctx,
> +		const struct resource_pool *pool,
> +		struct hpo_dp_stream_encoder *hpo_dp_stream_enc,
> +		bool acquired)
> +{
> +	int i;
> +
> +	for (i = 0; i < pool->hpo_dp_stream_enc_count; i++) {
> +		if (pool->hpo_dp_stream_enc[i] == hpo_dp_stream_enc)
> +			res_ctx->is_hpo_dp_stream_enc_acquired[i] = acquired;
> +	}
> +}
> +#endif
> +
>   /* TODO: release audio object */
>   void update_audio_usage(
>   		struct resource_context *res_ctx,
> @@ -1709,6 +1749,26 @@ static int acquire_first_free_pipe(
>   	return -1;
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +static struct hpo_dp_stream_encoder *find_first_free_match_hpo_dp_stream_enc_for_link(
> +		struct resource_context *res_ctx,
> +		const struct resource_pool *pool,
> +		struct dc_stream_state *stream)
> +{
> +	int i;
> +
> +	for (i = 0; i < pool->hpo_dp_stream_enc_count; i++) {
> +		if (!res_ctx->is_hpo_dp_stream_enc_acquired[i] &&
> +				pool->hpo_dp_stream_enc[i]) {
> +
> +			return pool->hpo_dp_stream_enc[i];
> +		}
> +	}
> +
> +	return NULL;
> +}
> +#endif
> +
>   static struct audio *find_first_free_audio(
>   		struct resource_context *res_ctx,
>   		const struct resource_pool *pool,
> @@ -1799,6 +1859,15 @@ enum dc_status dc_remove_stream_from_ctx(
>   	if (dc->res_pool->funcs->link_enc_unassign)
>   		dc->res_pool->funcs->link_enc_unassign(new_ctx, del_pipe->stream);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(del_pipe)) {
> +		update_hpo_dp_stream_engine_usage(
> +			&new_ctx->res_ctx, dc->res_pool,
> +			del_pipe->stream_res.hpo_dp_stream_enc,
> +			false);
> +	}
> +#endif
> +
>   	if (del_pipe->stream_res.audio)
>   		update_audio_usage(
>   			&new_ctx->res_ctx,
> @@ -2051,6 +2120,31 @@ enum dc_status resource_map_pool_resources(
>   		pipe_ctx->stream_res.stream_enc,
>   		true);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* Allocate DP HPO Stream Encoder based on signal, hw capabilities
> +	 * and link settings
> +	 */
> +	if (dc_is_dp_signal(stream->signal) &&
> +			dc->caps.dp_hpo) {
> +		struct dc_link_settings link_settings = {0};
> +
> +		decide_link_settings(stream, &link_settings);
> +		if (dp_get_link_encoding_format(&link_settings) == DP_128b_132b_ENCODING) {
> +			pipe_ctx->stream_res.hpo_dp_stream_enc =
> +					find_first_free_match_hpo_dp_stream_enc_for_link(
> +							&context->res_ctx, pool, stream);
> +
> +			if (!pipe_ctx->stream_res.hpo_dp_stream_enc)
> +				return DC_NO_STREAM_ENC_RESOURCE;
> +
> +			update_hpo_dp_stream_engine_usage(
> +					&context->res_ctx, pool,
> +					pipe_ctx->stream_res.hpo_dp_stream_enc,
> +					true);
> +		}
> +	}
> +#endif
> +
>   	/* TODO: Add check if ASIC support and EDID audio */
>   	if (!stream->converter_disable_audio &&
>   	    dc_is_audio_capable_signal(pipe_ctx->stream->signal) &&
> @@ -2726,6 +2820,11 @@ bool pipe_need_reprogram(
>   	if (pipe_ctx_old->stream_res.dsc != pipe_ctx->stream_res.dsc)
>   		return true;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (pipe_ctx_old->stream_res.hpo_dp_stream_enc != pipe_ctx->stream_res.hpo_dp_stream_enc)
> +		return true;
> +#endif
> +
>   	/* DIG link encoder resource assignment for stream changed. */
>   	if (pipe_ctx_old->stream->link_enc != pipe_ctx->stream->link_enc)
>   		return true;
> @@ -2975,3 +3074,22 @@ void get_audio_check(struct audio_info *aud_modes,
>   	}
>   }
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +struct hpo_dp_link_encoder *resource_get_unused_hpo_dp_link_encoder(
> +		const struct resource_pool *pool)
> +{
> +	uint8_t i;
> +	struct hpo_dp_link_encoder *enc = NULL;
> +
> +	ASSERT(pool->hpo_dp_link_enc_count <= MAX_HPO_DP2_LINK_ENCODERS);
> +
> +	for (i = 0; i < pool->hpo_dp_link_enc_count; i++) {
> +		if (pool->hpo_dp_link_enc[i]->transmitter == TRANSMITTER_UNKNOWN) {
> +			enc = pool->hpo_dp_link_enc[i];
> +			break;
> +		}
> +	}
> +
> +	return enc;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 03b81e5c5d67..19114cd3abf6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -183,6 +183,9 @@ struct dc_caps {
>   	unsigned int cursor_cache_size;
>   	struct dc_plane_cap planes[MAX_PLANES];
>   	struct dc_color_caps color;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	bool dp_hpo;
> +#endif
>   	bool vbios_lttpr_aware;
>   	bool vbios_lttpr_enable;
>   };
> @@ -289,7 +292,15 @@ struct dc_cap_funcs {
>   
>   struct link_training_settings;
>   
> -
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +union allow_lttpr_non_transparent_mode {
> +	struct {
> +		bool DP1_4A : 1;
> +		bool DP2_0 : 1;
> +	} bits;
> +	unsigned char raw;
> +};
> +#endif
>   /* Structure to hold configuration flags set by dm at dc creation. */
>   struct dc_config {
>   	bool gpu_vm_support;
> @@ -302,7 +313,11 @@ struct dc_config {
>   	bool edp_no_power_sequencing;
>   	bool force_enum_edp;
>   	bool forced_clocks;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	union allow_lttpr_non_transparent_mode allow_lttpr_non_transparent_mode;
> +#else
>   	bool allow_lttpr_non_transparent_mode;
> +#endif
>   	bool multi_mon_pp_mclk_switch;
>   	bool disable_dmcu;
>   	bool enable_4to1MPC;
> @@ -614,6 +629,10 @@ struct dc_debug_options {
>   	bool enable_dmcub_surface_flip;
>   	bool usbc_combo_phy_reset_wa;
>   	bool enable_dram_clock_change_one_display_vactive;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* TODO - remove once tested */
> +	bool legacy_dp2_lt;
> +#endif
>   	union mem_low_power_enable_options enable_mem_low_power;
>   	bool force_vblank_alignment;
>   
> @@ -1146,6 +1165,12 @@ struct dpcd_caps {
>   	struct dc_lttpr_caps lttpr_caps;
>   	struct psr_caps psr_caps;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	union dp_128b_132b_supported_link_rates dp_128b_132b_supported_link_rates;
> +	union dp_main_line_channel_coding_cap channel_coding_cap;
> +	union dp_sink_video_fallback_formats fallback_formats;
> +	union dp_fec_capability1 fec_cap1;
> +#endif
>   };
>   
>   union dpcd_sink_ext_caps {
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> index 4f54bde1bb1c..a5e798b5da79 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> @@ -53,7 +53,17 @@ enum dc_link_rate {
>   	LINK_RATE_RBR2 = 0x0C,		// Rate_5 (RBR2)- 3.24 Gbps/Lane
>   	LINK_RATE_RATE_6 = 0x10,	// Rate_6		- 4.32 Gbps/Lane
>   	LINK_RATE_HIGH2 = 0x14,		// Rate_7 (HBR2)- 5.40 Gbps/Lane
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	LINK_RATE_HIGH3 = 0x1E,		// Rate_8 (HBR3)- 8.10 Gbps/Lane
> +	/* Starting from DP2.0 link rate enum directly represents actual
> +	 * link rate value in unit of 10 mbps
> +	 */
> +	LINK_RATE_UHBR10 = 1000,	// UHBR10 - 10.0 Gbps/Lane
> +	LINK_RATE_UHBR13_5 = 1350,	// UHBR13.5 - 13.5 Gbps/Lane
> +	LINK_RATE_UHBR20 = 2000,	// UHBR10 - 20.0 Gbps/Lane
> +#else
>   	LINK_RATE_HIGH3 = 0x1E		// Rate_8 (HBR3)- 8.10 Gbps/Lane
> +#endif
>   };

A simplification you can do here is to move out the following line out 
of the guard:

LINK_RATE_HIGH3 = 0x1E,		// Rate_8 (HBR3)- 8.10 Gbps/Lane

It's okay to end an enum list with a comma.

>   
>   enum dc_link_spread {
> @@ -90,17 +100,47 @@ enum dc_post_cursor2 {
>   	POST_CURSOR2_MAX_LEVEL = POST_CURSOR2_LEVEL3,
>   };
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dc_dp_ffe_preset_level {
> +	DP_FFE_PRESET_LEVEL0 = 0,
> +	DP_FFE_PRESET_LEVEL1,
> +	DP_FFE_PRESET_LEVEL2,
> +	DP_FFE_PRESET_LEVEL3,
> +	DP_FFE_PRESET_LEVEL4,
> +	DP_FFE_PRESET_LEVEL5,
> +	DP_FFE_PRESET_LEVEL6,
> +	DP_FFE_PRESET_LEVEL7,
> +	DP_FFE_PRESET_LEVEL8,
> +	DP_FFE_PRESET_LEVEL9,
> +	DP_FFE_PRESET_LEVEL10,
> +	DP_FFE_PRESET_LEVEL11,
> +	DP_FFE_PRESET_LEVEL12,
> +	DP_FFE_PRESET_LEVEL13,
> +	DP_FFE_PRESET_LEVEL14,
> +	DP_FFE_PRESET_LEVEL15,
> +	DP_FFE_PRESET_MAX_LEVEL = DP_FFE_PRESET_LEVEL15,
> +};
> +#endif
> +
>   enum dc_dp_training_pattern {
>   	DP_TRAINING_PATTERN_SEQUENCE_1 = 0,
>   	DP_TRAINING_PATTERN_SEQUENCE_2,
>   	DP_TRAINING_PATTERN_SEQUENCE_3,
>   	DP_TRAINING_PATTERN_SEQUENCE_4,
>   	DP_TRAINING_PATTERN_VIDEOIDLE,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	DP_128b_132b_TPS1,
> +	DP_128b_132b_TPS2,
> +	DP_128b_132b_TPS2_CDS,
> +#endif
>   };
>   
>   enum dp_link_encoding {
>   	DP_UNKNOWN_ENCODING = 0,
>   	DP_8b_10b_ENCODING = 1,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	DP_128b_132b_ENCODING = 2,
> +#endif
>   };
>   
>   struct dc_link_settings {
> @@ -112,10 +152,26 @@ struct dc_link_settings {
>   	bool dpcd_source_device_specific_field_support;
>   };
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +union dc_dp_ffe_preset {
> +	struct {
> +		uint8_t level		: 4;
> +		uint8_t reserved	: 1;
> +		uint8_t no_preshoot	: 1;
> +		uint8_t no_deemphasis	: 1;
> +		uint8_t method2		: 1;
> +	} settings;
> +	uint8_t raw;
> +};
> +#endif
> +
>   struct dc_lane_settings {
>   	enum dc_voltage_swing VOLTAGE_SWING;
>   	enum dc_pre_emphasis PRE_EMPHASIS;
>   	enum dc_post_cursor2 POST_CURSOR2;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	union dc_dp_ffe_preset FFE_PRESET;
> +#endif
>   };
>   
>   struct dc_link_training_settings {
> @@ -127,6 +183,9 @@ struct dc_link_training_overrides {
>   	enum dc_voltage_swing *voltage_swing;
>   	enum dc_pre_emphasis *pre_emphasis;
>   	enum dc_post_cursor2 *post_cursor2;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	union dc_dp_ffe_preset *ffe_preset;
> +#endif
>   
>   	uint16_t *cr_pattern_time;
>   	uint16_t *eq_pattern_time;
> @@ -140,6 +199,16 @@ struct dc_link_training_overrides {
>   	bool *fec_enable;
>   };
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +union payload_table_update_status {
> +	struct {
> +		uint8_t  VC_PAYLOAD_TABLE_UPDATED:1;
> +		uint8_t  ACT_HANDLED:1;
> +	} bits;
> +	uint8_t  raw;
> +};
> +#endif
> +
>   union dpcd_rev {
>   	struct {
>   		uint8_t MINOR:4;
> @@ -227,7 +296,14 @@ union lane_align_status_updated {
>   	struct {
>   		uint8_t INTERLANE_ALIGN_DONE:1;
>   		uint8_t POST_LT_ADJ_REQ_IN_PROGRESS:1;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		uint8_t EQ_INTERLANE_ALIGN_DONE_128b_132b:1;
> +		uint8_t CDS_INTERLANE_ALIGN_DONE_128b_132b:1;
> +		uint8_t LT_FAILED_128b_132b:1;
> +		uint8_t RESERVED:1;
> +#else
>   		uint8_t RESERVED:4;
> +#endif
>   		uint8_t DOWNSTREAM_PORT_STATUS_CHANGED:1;
>   		uint8_t LINK_STATUS_UPDATED:1;
>   	} bits;
> @@ -240,6 +316,12 @@ union lane_adjust {
>   		uint8_t PRE_EMPHASIS_LANE:2;
>   		uint8_t RESERVED:4;
>   	} bits;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	struct {
> +		uint8_t PRESET_VALUE	:4;
> +		uint8_t RESERVED	:4;
> +	} tx_ffe;
> +#endif
>   	uint8_t raw;
>   };
>   
> @@ -269,6 +351,12 @@ union dpcd_training_lane {
>   		uint8_t MAX_PRE_EMPHASIS_REACHED:1;
>   		uint8_t RESERVED:2;
>   	} bits;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	struct {
> +		uint8_t PRESET_VALUE	:4;
> +		uint8_t RESERVED	:4;
> +	} tx_ffe;
> +#endif
>   	uint8_t raw;
>   };
>   
> @@ -551,12 +639,18 @@ union test_response {
>   
>   union phy_test_pattern {
>   	struct {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		/* This field is 7 bits for DP2.0 */
> +		uint8_t PATTERN     :7;
> +		uint8_t RESERVED    :1;
> +#else
>   		/* DpcdPhyTestPatterns. This field is 2 bits for DP1.1
>   		 * and 3 bits for DP1.2.
>   		 */
>   		uint8_t PATTERN     :3;
>   		/* BY speci, bit7:2 is 0 for DP1.1. */
>   		uint8_t RESERVED    :5;
> +#endif
>   	} bits;
>   	uint8_t raw;
>   };
> @@ -634,7 +728,14 @@ union dpcd_fec_capability {
>   		uint8_t UNCORRECTED_BLOCK_ERROR_COUNT_CAPABLE:1;
>   		uint8_t CORRECTED_BLOCK_ERROR_COUNT_CAPABLE:1;
>   		uint8_t BIT_ERROR_COUNT_CAPABLE:1;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		uint8_t PARITY_BLOCK_ERROR_COUNT_CAPABLE:1;
> +		uint8_t ARITY_BIT_ERROR_COUNT_CAPABLE:1;
> +		uint8_t FEC_RUNNING_INDICATOR_SUPPORTED:1;
> +		uint8_t FEC_ERROR_REPORTING_POLICY_SUPPORTED:1;
> +#else
>   		uint8_t RESERVED:4;
> +#endif
>   	} bits;
>   	uint8_t raw;
>   };
> @@ -758,4 +859,125 @@ struct psr_caps {
>   	bool psr_exit_link_training_required;
>   };
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +#define DP_MAIN_LINK_CHANNEL_CODING_CAP			0x006
> +#define DP_SINK_VIDEO_FALLBACK_FORMATS			0x020
> +#define DP_FEC_CAPABILITY_1				0x091
> +#define DP_DFP_CAPABILITY_EXTENSION_SUPPORT		0x0A3
> +#define DP_DSC_CONFIGURATION				0x161
> +#define DP_PHY_SQUARE_PATTERN				0x249
> +#define DP_128b_132b_SUPPORTED_LINK_RATES		0x2215
> +#define DP_128b_132b_TRAINING_AUX_RD_INTERVAL		0x2216
> +#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0X2230
> +#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256		0X2250
> +#define DP_DSC_SUPPORT_AND_DECODER_COUNT		0x2260
> +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270
> +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
> +# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
> +# define DP_DSC_DECODER_COUNT_SHIFT			5
> +#define DP_MAIN_LINK_CHANNEL_CODING_SET			0x108
> +#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	0xF0006
> +#define DP_PHY_REPEATER_128b_132b_RATES			0xF0007
> +#define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	0xF0022
> +#define DP_INTRA_HOP_AUX_REPLY_INDICATION		(1 << 3)
> +/* TODO - Use DRM header to replace above once available */
> +
> +union dp_main_line_channel_coding_cap {
> +	struct {
> +		uint8_t DP_8b_10b_SUPPORTED	:1;
> +		uint8_t DP_128b_132b_SUPPORTED	:1;
> +		uint8_t RESERVED		:6;
> +	} bits;
> +	uint8_t raw;
> +};
> +
> +union dp_main_link_channel_coding_lttpr_cap {
> +	struct {
> +		uint8_t DP_128b_132b_SUPPORTED	:1;
> +		uint8_t RESERVED		:7;
> +	} bits;
> +	uint8_t raw;
> +};
> +
> +union dp_128b_132b_supported_link_rates {
> +	struct {
> +		uint8_t UHBR10	:1;
> +		uint8_t UHBR20	:1;
> +		uint8_t UHBR13_5:1;
> +		uint8_t RESERVED:5;
> +	} bits;
> +	uint8_t raw;
> +};
> +
> +union dp_128b_132b_supported_lttpr_link_rates {
> +	struct {
> +		uint8_t UHBR10	:1;
> +		uint8_t UHBR13_5:1;
> +		uint8_t UHBR20	:1;
> +		uint8_t RESERVED:5;
> +	} bits;
> +	uint8_t raw;
> +};
> +
> +union dp_sink_video_fallback_formats {
> +	struct {
> +		uint8_t dp_1024x768_60Hz_24bpp_support	:1;
> +		uint8_t dp_1280x720_60Hz_24bpp_support	:1;
> +		uint8_t dp_1920x1080_60Hz_24bpp_support	:1;
> +		uint8_t RESERVED			:5;
> +	} bits;
> +	uint8_t raw;
> +};
> +
> +union dp_fec_capability1 {
> +	struct {
> +		uint8_t AGGREGATED_ERROR_COUNTERS_CAPABLE	:1;
> +		uint8_t RESERVED				:7;
> +	} bits;
> +	uint8_t raw;
> +};
> +
> +struct dp_color_depth_caps {
> +	uint8_t support_6bpc	:1;
> +	uint8_t support_8bpc	:1;
> +	uint8_t support_10bpc	:1;
> +	uint8_t support_12bpc	:1;
> +	uint8_t support_16bpc	:1;
> +	uint8_t RESERVED	:3;
> +};
> +
> +struct dp_encoding_format_caps {
> +	uint8_t support_rgb	:1;
> +	uint8_t support_ycbcr444:1;
> +	uint8_t support_ycbcr422:1;
> +	uint8_t support_ycbcr420:1;
> +	uint8_t RESERVED	:4;
> +};
> +
> +union dp_dfp_cap_ext {
> +	struct {
> +		uint8_t supported;
> +		uint8_t max_pixel_rate_in_mps[2];
> +		uint8_t max_video_h_active_width[2];
> +		uint8_t max_video_v_active_height[2];
> +		struct dp_encoding_format_caps encoding_format_caps;
> +		struct dp_color_depth_caps rgb_color_depth_caps;
> +		struct dp_color_depth_caps ycbcr444_color_depth_caps;
> +		struct dp_color_depth_caps ycbcr422_color_depth_caps;
> +		struct dp_color_depth_caps ycbcr420_color_depth_caps;
> +	} fields;
> +	uint8_t raw[12];
> +};
> +
> +union dp_128b_132b_training_aux_rd_interval {
> +	struct {
> +		uint8_t VALUE	:7;
> +		uint8_t UNIT	:1;
> +	} bits;
> +	uint8_t raw;
> +};
> +#endif
> +
>   #endif /* DC_DP_TYPES_H */
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
> index 4450078213a2..4fdb24ba24af 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> @@ -154,6 +154,9 @@ struct dc_link {
>   
>   	struct panel_cntl *panel_cntl;
>   	struct link_encoder *link_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	struct hpo_dp_link_encoder *hpo_dp_link_enc;
> +#endif
>   	struct graphics_object_id link_id;
>   	/* Endpoint type distinguishes display endpoints which do not have entries
>   	 * in the BIOS connector table from those that do. Helps when tracking link
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
> index c1532930169b..3c109c805447 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
> @@ -395,9 +395,27 @@ struct dc_lttpr_caps {
>   	uint8_t max_link_rate;
>   	uint8_t phy_repeater_cnt;
>   	uint8_t max_ext_timeout;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	union dp_main_link_channel_coding_lttpr_cap main_link_channel_coding;
> +	union dp_128b_132b_supported_lttpr_link_rates supported_128b_132b_rates;
> +#endif
>   	uint8_t aux_rd_interval[MAX_REPEATER_CNT - 1];
>   };
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +struct dc_dongle_dfp_cap_ext {
> +	bool supported;
> +	uint16_t max_pixel_rate_in_mps;
> +	uint16_t max_video_h_active_width;
> +	uint16_t max_video_v_active_height;
> +	struct dp_encoding_format_caps encoding_format_caps;
> +	struct dp_color_depth_caps rgb_color_depth_caps;
> +	struct dp_color_depth_caps ycbcr444_color_depth_caps;
> +	struct dp_color_depth_caps ycbcr422_color_depth_caps;
> +	struct dp_color_depth_caps ycbcr420_color_depth_caps;
> +};
> +#endif
> +
>   struct dc_dongle_caps {
>   	/* dongle type (DP converter, CV smart dongle) */
>   	enum display_dongle_type dongle_type;
> @@ -411,6 +429,9 @@ struct dc_dongle_caps {
>   	bool is_dp_hdmi_ycbcr420_converter;
>   	uint32_t dp_hdmi_max_bpc;
>   	uint32_t dp_hdmi_max_pixel_clk_in_khz;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	struct dc_dongle_dfp_cap_ext dfp_cap_ext;
> +#endif
>   };
>   /* Scaling format */
>   enum scaling_transformation {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index 62d595ded866..33743dc2631c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -1108,8 +1108,17 @@ void dce110_enable_audio_stream(struct pipe_ctx *pipe_ctx)
>   			clk_mgr->funcs->enable_pme_wa(clk_mgr);
>   		/* un-mute audio */
>   		/* TODO: audio should be per stream rather than per link */
> -		pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +		if (is_dp_128b_132b_signal(pipe_ctx))
> +			pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->audio_mute_control(
> +					pipe_ctx->stream_res.hpo_dp_stream_enc, false);
> +		else
> +			pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
>   					pipe_ctx->stream_res.stream_enc, false);
> +#else
> +		pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
> +				pipe_ctx->stream_res.stream_enc, false);
> +#endif
>   		if (pipe_ctx->stream_res.audio)
>   			pipe_ctx->stream_res.audio->enabled = true;
>   	}
> @@ -1129,14 +1138,32 @@ void dce110_disable_audio_stream(struct pipe_ctx *pipe_ctx)
>   	if (pipe_ctx->stream_res.audio && pipe_ctx->stream_res.audio->enabled == false)
>   		return;
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(pipe_ctx))
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->audio_mute_control(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc, true);
> +	else
> +		pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
> +				pipe_ctx->stream_res.stream_enc, true);
> +#else
>   	pipe_ctx->stream_res.stream_enc->funcs->audio_mute_control(
>   			pipe_ctx->stream_res.stream_enc, true);
> +#endif
>   	if (pipe_ctx->stream_res.audio) {
>   		pipe_ctx->stream_res.audio->enabled = false;
>   
>   		if (dc_is_dp_signal(pipe_ctx->stream->signal))
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (is_dp_128b_132b_signal(pipe_ctx))
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_disable(
> +						pipe_ctx->stream_res.hpo_dp_stream_enc);
> +			else
> +				pipe_ctx->stream_res.stream_enc->funcs->dp_audio_disable(
> +						pipe_ctx->stream_res.stream_enc);
> +#else
>   			pipe_ctx->stream_res.stream_enc->funcs->dp_audio_disable(
>   					pipe_ctx->stream_res.stream_enc);
> +#endif
>   		else
>   			pipe_ctx->stream_res.stream_enc->funcs->hdmi_audio_disable(
>   					pipe_ctx->stream_res.stream_enc);
> @@ -1166,16 +1193,37 @@ void dce110_disable_stream(struct pipe_ctx *pipe_ctx)
>   			pipe_ctx->stream_res.stream_enc);
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->stop_dp_info_packets(
> +					pipe_ctx->stream_res.hpo_dp_stream_enc);
> +	} else if (dc_is_dp_signal(pipe_ctx->stream->signal))
> +#else
>   	if (dc_is_dp_signal(pipe_ctx->stream->signal))
> +#endif
>   		pipe_ctx->stream_res.stream_enc->funcs->stop_dp_info_packets(
>   			pipe_ctx->stream_res.stream_enc);
>   
>   	dc->hwss.disable_audio_stream(pipe_ctx);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->disable(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc);
> +		setup_dp_hpo_stream(pipe_ctx, false);
> +	/* TODO - DP2.0 HW: unmap stream from link encoder here */
> +	} else {
> +		link->link_enc->funcs->connect_dig_be_to_fe(
> +				link->link_enc,
> +				pipe_ctx->stream_res.stream_enc->id,
> +				false);
> +	}
> +#else
>   	link->link_enc->funcs->connect_dig_be_to_fe(
>   			link->link_enc,
>   			pipe_ctx->stream_res.stream_enc->id,
>   			false);
> +#endif
>   
>   }
>   
> @@ -1210,7 +1258,15 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
>   		link->dc->hwss.set_abm_immediate_disable(pipe_ctx);
>   	}
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_blank(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc);
> +	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
> +#else
>   	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
> +#endif
>   		pipe_ctx->stream_res.stream_enc->funcs->dp_blank(pipe_ctx->stream_res.stream_enc);
>   
>   		if (!dc_is_embedded_signal(pipe_ctx->stream->signal)) {
> @@ -1451,10 +1507,23 @@ static enum dc_status apply_single_controller_ctx_to_hw(
>   		build_audio_output(context, pipe_ctx, &audio_output);
>   
>   		if (dc_is_dp_signal(pipe_ctx->stream->signal))
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +			if (is_dp_128b_132b_signal(pipe_ctx))
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_setup(
> +						pipe_ctx->stream_res.hpo_dp_stream_enc,
> +						pipe_ctx->stream_res.audio->inst,
> +						&pipe_ctx->stream->audio_info);
> +			else
> +				pipe_ctx->stream_res.stream_enc->funcs->dp_audio_setup(
> +						pipe_ctx->stream_res.stream_enc,
> +						pipe_ctx->stream_res.audio->inst,
> +						&pipe_ctx->stream->audio_info);
> +#else
>   			pipe_ctx->stream_res.stream_enc->funcs->dp_audio_setup(
>   					pipe_ctx->stream_res.stream_enc,
>   					pipe_ctx->stream_res.audio->inst,
>   					&pipe_ctx->stream->audio_info);
> +#endif
>   		else
>   			pipe_ctx->stream_res.stream_enc->funcs->hdmi_audio_setup(
>   					pipe_ctx->stream_res.stream_enc,
> @@ -1469,10 +1538,17 @@ static enum dc_status apply_single_controller_ctx_to_hw(
>   				&pipe_ctx->stream->audio_info);
>   	}
>   
> -	/*  */
> -	/* Do not touch stream timing on seamless boot optimization. */
> -	if (!pipe_ctx->stream->apply_seamless_boot_optimization)
> -		hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* DCN3.1 FPGA Workaround
> +	 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
> +	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
> +	 * function core_link_enable_stream
> +	 */
> +	if (!(hws->wa.dp_hpo_and_otg_sequence && is_dp_128b_132b_signal(pipe_ctx)))
> +		/*  */
> +		/* Do not touch stream timing on seamless boot optimization. */
> +		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
> +			hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
>   
>   	if (hws->funcs.setup_vupdate_interrupt)
>   		hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
> @@ -1482,6 +1558,12 @@ static enum dc_status apply_single_controller_ctx_to_hw(
>   	if (pipe_ctx->stream_res.tg->funcs->set_drr)
>   		pipe_ctx->stream_res.tg->funcs->set_drr(
>   			pipe_ctx->stream_res.tg, &params);
> +#else
> +	/*  */
> +	/* Do not touch stream timing on seamless boot optimization. */
> +	if (!pipe_ctx->stream->apply_seamless_boot_optimization)
> +		hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
> +#endif
>   
>   	// DRR should set trigger event to monitor surface update event
>   	if (stream->adjust.v_total_min != 0 && stream->adjust.v_total_max != 0)
> @@ -1526,6 +1608,18 @@ static enum dc_status apply_single_controller_ctx_to_hw(
>   	if (!stream->dpms_off)
>   		core_link_enable_stream(context, pipe_ctx);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* DCN3.1 FPGA Workaround
> +	 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
> +	 * To do so, move calling function enable_stream_timing to only be done AFTER calling
> +	 * function core_link_enable_stream
> +	 */
> +	if (hws->wa.dp_hpo_and_otg_sequence && is_dp_128b_132b_signal(pipe_ctx)) {
> +		if (!pipe_ctx->stream->apply_seamless_boot_optimization)
> +			hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
> +	}
> +#endif
> +
>   	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->bottom_pipe != 0;
>   
>   	pipe_ctx->stream->link->psr_settings.psr_feature_enabled = false;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> index e4701825b5a0..2dc4b4e4ba02 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> @@ -1460,5 +1460,14 @@ void dcn10_link_encoder_get_max_link_cap(struct link_encoder *enc,
>   	if (enc->features.flags.bits.IS_HBR3_CAPABLE)
>   		max_link_cap.link_rate = LINK_RATE_HIGH3;
>   
> +	if (enc->features.flags.bits.IS_UHBR10_CAPABLE)
> +		max_link_cap.link_rate = LINK_RATE_UHBR10;
> +
> +	if (enc->features.flags.bits.IS_UHBR13_5_CAPABLE)
> +		max_link_cap.link_rate = LINK_RATE_UHBR13_5;
> +
> +	if (enc->features.flags.bits.IS_UHBR20_CAPABLE)
> +		max_link_cap.link_rate = LINK_RATE_UHBR20;
> +
>   	*link_settings = max_link_cap;
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> index a47ba1d45be9..b9276da87872 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> @@ -2135,7 +2135,12 @@ void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
>   
>   	params.link_settings.link_rate = link_settings->link_rate;
>   
> -	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		/* TODO - DP2.0 HW: Set ODM mode in dp hpo encoder here */
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_unblank(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc,
> +				pipe_ctx->stream_res.tg->inst);
> +	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
>   		if (optc2_is_two_pixels_per_containter(&stream->timing) || params.opp_cnt > 1)
>   			params.timing.pix_clk_100hz /= 2;
>   		pipe_ctx->stream_res.stream_enc->funcs->dp_set_odm_combine(
> @@ -2380,8 +2385,19 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
>   	 * disconnect them during disable_stream
>   	 * BY this, it is logic clean to separate stream and link
>   	 */
> -	link->link_enc->funcs->connect_dig_be_to_fe(link->link_enc,
> -						    pipe_ctx->stream_res.stream_enc->id, true);
> +	if (is_dp_128b_132b_signal(pipe_ctx)) {
> +		setup_dp_hpo_stream(pipe_ctx, true);
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->enable_stream(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc);
> +		pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->map_stream_to_link(
> +				pipe_ctx->stream_res.hpo_dp_stream_enc,
> +				pipe_ctx->stream_res.hpo_dp_stream_enc->inst,
> +				link->hpo_dp_link_enc->inst);
> +	}
> +
> +	if (!is_dp_128b_132b_signal(pipe_ctx))
> +		link->link_enc->funcs->connect_dig_be_to_fe(
> +			link->link_enc, pipe_ctx->stream_res.stream_enc->id, true);
>   
>   	if (pipe_ctx->plane_state && pipe_ctx->plane_state->flip_immediate != 1) {
>   		if (link->dc->hwss.program_dmdata_engine)
> @@ -2406,7 +2422,9 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
>   
>   	/* enable audio only within mode set */
>   	if (pipe_ctx->stream_res.audio != NULL) {
> -		if (dc_is_dp_signal(pipe_ctx->stream->signal))
> +		if (is_dp_128b_132b_signal(pipe_ctx))
> +			pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_audio_enable(pipe_ctx->stream_res.hpo_dp_stream_enc);
> +		else if (dc_is_dp_signal(pipe_ctx->stream->signal))
>   			pipe_ctx->stream_res.stream_enc->funcs->dp_audio_enable(pipe_ctx->stream_res.stream_enc);
>   	}
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index e3e01b17c164..0159700c148a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -63,6 +63,7 @@
>   #include "dcn20_dccg.h"
>   #include "dcn20_vmid.h"
>   #include "dc_link_ddc.h"
> +#include "dc_link_dp.h"
>   #include "dce/dce_panel_cntl.h"
>   
>   #include "navi10_ip_offset.h"
> @@ -1604,6 +1605,7 @@ static void get_pixel_clock_parameters(
>   	pixel_clk_params->signal_type = pipe_ctx->stream->signal;
>   	pixel_clk_params->controller_id = pipe_ctx->stream_res.tg->inst + 1;
>   	/* TODO: un-hardcode*/
> +	/* TODO - DP2.0 HW: calculate requested_sym_clk for UHBR rates */
>   	pixel_clk_params->requested_sym_clk = LINK_RATE_LOW *
>   		LINK_RATE_REF_FREQ_IN_KHZ;
>   	pixel_clk_params->flags.ENABLE_SS = 0;
> @@ -3044,6 +3046,8 @@ static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
>   	for (i = 0; i < dc->res_pool->pipe_count; i++) {
>   		if (!context->res_ctx.pipe_ctx[i].stream)
>   			continue;
> +		if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
> +			return true;
>   	}
>   	return false;
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index f264a32ebade..463e96f8f14c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -561,11 +561,6 @@ static const struct dcn10_link_enc_mask le_mask = {
>   	DPCS_DCN31_MASK_SH_LIST(_MASK)
>   };
>   
> -#define dpp_regs(id)\
> -[id] = {\
> -	DPP_REG_LIST_DCN30(id),\
> -}
> -
>   #define hpo_dp_stream_encoder_reg_list(id)\
>   [id] = {\
>   	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST(id)\
> @@ -609,6 +604,11 @@ static const struct dcn31_hpo_dp_link_encoder_mask hpo_dp_le_mask = {
>   	DCN3_1_HPO_DP_LINK_ENC_MASK_SH_LIST(_MASK)
>   };
>   
> +#define dpp_regs(id)\
> +[id] = {\
> +	DPP_REG_LIST_DCN30(id),\
> +}
> +
>   static const struct dcn3_dpp_registers dpp_regs[] = {
>   	dpp_regs(0),
>   	dpp_regs(1),
> @@ -1449,6 +1449,13 @@ static struct dce_hwseq *dcn31_hwseq_create(
>   		hws->regs = &hwseq_reg;
>   		hws->shifts = &hwseq_shift;
>   		hws->masks = &hwseq_mask;
> +		/* DCN3.1 FPGA Workaround
> +		 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
> +		 * To do so, move calling function enable_stream_timing to only be done AFTER calling
> +		 * function core_link_enable_stream
> +		 */
> +		if (IS_FPGA_MAXIMUS_DC(ctx->dce_environment))
> +			hws->wa.dp_hpo_and_otg_sequence = true;
>   	}
>   	return hws;
>   }
> @@ -2102,6 +2109,7 @@ static bool dcn31_resource_construct(
>   	dc->caps.max_slave_rgb_planes = 1;
>   	dc->caps.post_blend_color_processing = true;
>   	dc->caps.force_dp_tps4_for_cp2520 = true;
> +	dc->caps.dp_hpo = true;
>   	dc->caps.extended_aux_timeout_support = true;
>   	dc->caps.dmcub_support = true;
>   	dc->caps.is_apu = true;
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h b/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h
> index a9170b9f84d3..43f33e186088 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_cp_psp.h
> @@ -37,6 +37,7 @@ struct cp_psp_stream_config {
>   	uint8_t phy_idx;
>   	uint8_t assr_enabled;
>   	uint8_t mst_enabled;
> +	uint8_t dp2_enabled;
>   	void *dm_stream_ctx;
>   	bool dpms_off;
>   };
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 9ab854293ace..8de554fb98b9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -160,6 +160,8 @@ void dm_set_dcn_clocks(
>   		struct dc_context *ctx,
>   		struct dc_clocks *clks);
>   
> +void dm_set_phyd32clk(struct dc_context *ctx, int freq_khz);
> +
>   bool dm_helpers_dmub_outbox_interrupt_control(struct dc_context *ctx, bool enable);
>   
>   void dm_helpers_smu_timeout(struct dc_context *ctx, unsigned int msg_id, unsigned int param, unsigned int timeout_us);
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
> index 01c3a31be191..3cc110e13213 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
> @@ -30,6 +30,7 @@
>   #define LINK_TRAINING_RETRY_DELAY 50 /* ms */
>   #define LINK_AUX_DEFAULT_LTTPR_TIMEOUT_PERIOD 3200 /*us*/
>   #define LINK_AUX_DEFAULT_TIMEOUT_PERIOD 552 /*us*/
> +#define MAX_MTP_SLOT_COUNT 64
>   #define DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE 0x50
>   #define TRAINING_AUX_RD_INTERVAL 100 //us
>   
> @@ -189,5 +190,26 @@ enum dc_status dpcd_configure_lttpr_mode(
>   		struct link_training_settings *lt_settings);
>   
>   enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings *link_settings);
> +bool dpcd_write_128b_132b_sst_payload_allocation_table(
> +		const struct dc_stream_state *stream,
> +		struct dc_link *link,
> +		struct link_mst_stream_allocation_table *proposed_table,
> +		bool allocate);
> +
> +enum dc_status dpcd_configure_channel_coding(
> +		struct dc_link *link,
> +		struct link_training_settings *lt_settings);
> +
> +bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link);
> +
> +struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
> +		const struct dc_stream_state *stream,
> +		const struct dc_link *link);
> +void enable_dp_hpo_output(struct dc_link *link, const struct dc_link_settings *link_settings);
> +void disable_dp_hpo_output(struct dc_link *link, enum signal_type signal);
> +void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable);
> +bool is_dp_128b_132b_signal(struct pipe_ctx *pipe_ctx);
> +void reset_dp_hpo_stream_encoders_for_link(struct dc_link *link);
> +
>   bool dp_retrieve_lttpr_cap(struct dc_link *link);
>   #endif /* __DC_LINK_DP_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
> index f7f7e4fff0c2..d09eed7bcc4a 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
> @@ -41,6 +41,9 @@ struct dce_hwseq_wa {
>   	bool DEGVIDCN10_254;
>   	bool DEGVIDCN21;
>   	bool disallow_self_refresh_during_multi_plane_transition;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	bool dp_hpo_and_otg_sequence;
> +#endif
>   };
>   
>   struct hwseq_wa_state {
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
> index 713f6d5cf3e0..3fbda9d7e257 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
> @@ -200,4 +200,9 @@ int get_num_mpc_splits(struct pipe_ctx *pipe);
>   
>   int get_num_odm_splits(struct pipe_ctx *pipe);
>   
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +struct hpo_dp_link_encoder *resource_get_unused_hpo_dp_link_encoder(
> +		const struct resource_pool *pool);
> +#endif
> +
>   #endif /* DRIVERS_GPU_DRM_AMD_DC_DEV_DC_INC_RESOURCE_H_ */
> diff --git a/drivers/gpu/drm/amd/display/include/dpcd_defs.h b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
> index aec7389aff37..6fb7c0145cb6 100644
> --- a/drivers/gpu/drm/amd/display/include/dpcd_defs.h
> +++ b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
> @@ -80,6 +80,15 @@ enum dpcd_phy_test_patterns {
>   	PHY_TEST_PATTERN_CP2520_1,
>   	PHY_TEST_PATTERN_CP2520_2,
>   	PHY_TEST_PATTERN_CP2520_3, /* same as TPS4 */
> +	PHY_TEST_PATTERN_128b_132b_TPS1 = 0x8,
> +	PHY_TEST_PATTERN_128b_132b_TPS2 = 0x10,
> +	PHY_TEST_PATTERN_PRBS9 = 0x18,
> +	PHY_TEST_PATTERN_PRBS11 = 0x20,
> +	PHY_TEST_PATTERN_PRBS15 = 0x28,
> +	PHY_TEST_PATTERN_PRBS23 = 0x30,
> +	PHY_TEST_PATTERN_PRBS31 = 0x38,
> +	PHY_TEST_PATTERN_264BIT_CUSTOM = 0x40,
> +	PHY_TEST_PATTERN_SQUARE_PULSE = 0x48,
>   };
>   
>   enum dpcd_test_dyn_range {
> @@ -135,7 +144,14 @@ enum dpcd_training_patterns {
>   	DPCD_TRAINING_PATTERN_1,
>   	DPCD_TRAINING_PATTERN_2,
>   	DPCD_TRAINING_PATTERN_3,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	DPCD_TRAINING_PATTERN_4 = 7,
> +	DPCD_128b_132b_TPS1 = 1,
> +	DPCD_128b_132b_TPS2 = 2,
> +	DPCD_128b_132b_TPS2_CDS = 3,
> +#else
>   	DPCD_TRAINING_PATTERN_4 = 7
> +#endif
>   };
>   
>   /* This enum is for use with PsrSinkPsrStatus.bits.sinkSelfRefreshStatus
> diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
> index efd9812c13ec..c729b50c4f20 100644
> --- a/drivers/gpu/drm/amd/display/include/link_service_types.h
> +++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
> @@ -53,7 +53,11 @@ enum edp_revision {
>   };
>   
>   enum {
> -	LINK_RATE_REF_FREQ_IN_KHZ = 27000 /*27MHz*/
> +	LINK_RATE_REF_FREQ_IN_KHZ = 27000, /*27MHz*/
> +	BITS_PER_DP_BYTE = 10,
> +	DATA_EFFICIENCY_8b_10b_x10000 = 8000, /* 80% data efficiency */
> +	DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100 = 97, /* 97% data efficiency when FEC is enabled */
> +	DATA_EFFICIENCY_128b_132b_x10000 = 9646, /* 96.71% data efficiency x 99.75% downspread factor */
>   };
>   
>   enum link_training_result {
> @@ -70,6 +74,12 @@ enum link_training_result {
>   	LINK_TRAINING_LINK_LOSS,
>   	/* Abort link training (because sink unplugged) */
>   	LINK_TRAINING_ABORT,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	DP_128b_132b_LT_FAILED,
> +	DP_128b_132b_MAX_LOOP_COUNT_REACHED,
> +	DP_128b_132b_CHANNEL_EQ_DONE_TIMEOUT,
> +	DP_128b_132b_CDS_DONE_TIMEOUT,
> +#endif
>   };
>   
>   enum lttpr_mode {
> @@ -86,11 +96,23 @@ struct link_training_settings {
>   	enum dc_pre_emphasis *pre_emphasis;
>   	enum dc_post_cursor2 *post_cursor2;
>   	bool should_set_fec_ready;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	/* TODO - factor lane_settings out because it changes during LT */
> +	union dc_dp_ffe_preset *ffe_preset;
> +#endif
>   
>   	uint16_t cr_pattern_time;
>   	uint16_t eq_pattern_time;
> +	uint16_t cds_pattern_time;
>   	enum dc_dp_training_pattern pattern_for_cr;
>   	enum dc_dp_training_pattern pattern_for_eq;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	enum dc_dp_training_pattern pattern_for_cds;
> +
> +	uint32_t eq_wait_time_limit;
> +	uint8_t eq_loop_count_limit;
> +	uint32_t cds_wait_time_limit;
> +#endif
>   
>   	bool enhanced_framing;
>   	bool allow_invalid_msa_timing_param;
> diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h b/drivers/gpu/drm/amd/display/include/logger_types.h
> index 571fcf23cea9..370fad883e33 100644
> --- a/drivers/gpu/drm/amd/display/include/logger_types.h
> +++ b/drivers/gpu/drm/amd/display/include/logger_types.h
> @@ -72,6 +72,9 @@
>   #define DC_LOG_DSC(...) DRM_DEBUG_KMS(__VA_ARGS__)
>   #define DC_LOG_SMU(...) pr_debug("[SMU_MSG]:"__VA_ARGS__)
>   #define DC_LOG_DWB(...) DRM_DEBUG_KMS(__VA_ARGS__)
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +#define DC_LOG_DP2(...) DRM_DEBUG_KMS(__VA_ARGS__)
> +#endif
>   
>   struct dal_logger;
>   
> @@ -123,6 +126,9 @@ enum dc_log_type {
>   	LOG_MAX_HW_POINTS,
>   	LOG_ALL_TF_CHANNELS,
>   	LOG_SAMPLE_1DLUT,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	LOG_DP2,
> +#endif
>   	LOG_SECTION_TOTAL_COUNT
>   };
>   
> 

