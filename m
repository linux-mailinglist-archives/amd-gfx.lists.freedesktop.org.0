Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNtlH+gxr2kYPgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 21:47:36 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D12241113
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 21:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E04110E1B2;
	Mon,  9 Mar 2026 20:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VaQmclpm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CB310E1B2
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2026 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l3hZ5ksGFVbnAk7kx9lByhFccZWjvDvKnQdnWXGagTQ=; b=VaQmclpmUvbXXl+UPGRa+/YagX
 jktpecbBLsaJwwAhf1AS8Zj8Tb37E0K2s9YB6ggTdCjMcz4tAObisxk18AuJ57R2JamKdpQEO2TuF
 j1kIMSeFAhsv06z/Dwrs2rq0v7nX3Xyinv+HUH4NxzkFn9HqOSwSk8mkYpPO4RJsh5BLwtFbuyRui
 4/ykhlZv+ie7qisxZ05poLUGbN3tJrcpAQTKsBrISuAsQDshz+XaLm6avfPICZA9wetuE71Xm8rTl
 uLbD1x7jhawXjOoPP+/EAmVVgFREdX+6uFCK3FgueP2nma4EpUljLZf+cxnqW3RMzQu9tgYgkuSBT
 L4d2v6tQ==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vzhVg-00CEOQ-7R; Mon, 09 Mar 2026 21:47:28 +0100
Message-ID: <e36f509b-6d45-4517-b53b-45bc8ccaa263@igalia.com>
Date: Mon, 9 Mar 2026 17:47:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] drm/amd/display: Set chroma taps to 1 if luma taps
 are 1
To: Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Ray Wu <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>
References: <20260306031932.136179-1-alex.hung@amd.com>
 <20260306031932.136179-5-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260306031932.136179-5-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: D0D12241113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:aurabindo.pillai@amd.com,m:roman.li@amd.com,m:wayne.lin@amd.com,m:chiahsuan.chung@amd.com,m:jerry.zuo@amd.com,m:daniel.wheeler@amd.com,m:Ray.Wu@amd.com,m:ivan.lipski@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.701];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action



On 06/03/2026 00:13, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>
> When luma is unscaled we also want chroma to be pixel-perfect.
> When luma taps are > 1 the result will be a blurred luma plane,
> even when the image isn't scaled.
>
> This makes WIP IGT tests for CSC colorop pass.
>
> Co-developed by Claude Sonnet 4.5.
Nitpick: I understand this should be an `Assisted-by:` tag [1]

Same for other patches in this series with similar sentence.

[1] https://docs.kernel.org/process/coding-assistants.html
>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c | 8 ++++++--
>   drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c | 8 ++++++--
>   2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c
> index ce91e5d28956..0e70ffc784b1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c
> @@ -172,10 +172,14 @@ bool dpp1_get_optimal_number_of_taps(
>   		scl_data->taps.h_taps_c = in_taps->h_taps_c;
>   
>   	if (!dpp->ctx->dc->debug.always_scale) {
> -		if (IDENTITY_RATIO(scl_data->ratios.horz))
> +		if (IDENTITY_RATIO(scl_data->ratios.horz)) {
>   			scl_data->taps.h_taps = 1;
> -		if (IDENTITY_RATIO(scl_data->ratios.vert))
> +			scl_data->taps.h_taps_c = 1;
> +		}
> +		if (IDENTITY_RATIO(scl_data->ratios.vert)) {
>   			scl_data->taps.v_taps = 1;
> +			scl_data->taps.v_taps_c = 1;
> +		}
>   		if (IDENTITY_RATIO(scl_data->ratios.horz_c))
>   			scl_data->taps.h_taps_c = 1;
>   		if (IDENTITY_RATIO(scl_data->ratios.vert_c))
> diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
> index c7923531da83..8a146968ee15 100644
> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
> @@ -524,10 +524,14 @@ bool dpp3_get_optimal_number_of_taps(
>   		scl_data->taps.v_taps_c = max_taps_c;
>   
>   	if (!dpp->ctx->dc->debug.always_scale) {
> -		if (IDENTITY_RATIO(scl_data->ratios.horz))
> +		if (IDENTITY_RATIO(scl_data->ratios.horz)) {
>   			scl_data->taps.h_taps = 1;
> -		if (IDENTITY_RATIO(scl_data->ratios.vert))
> +			scl_data->taps.h_taps_c = 1;
> +		}
> +		if (IDENTITY_RATIO(scl_data->ratios.vert)) {
>   			scl_data->taps.v_taps = 1;
> +			scl_data->taps.v_taps_c = 1;
> +		}
>   		if (IDENTITY_RATIO(scl_data->ratios.horz_c))
>   			scl_data->taps.h_taps_c = 1;
>   		if (IDENTITY_RATIO(scl_data->ratios.vert_c))

