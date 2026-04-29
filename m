Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLhDDRJp8mkBqwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2026 22:24:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482649A1FD
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2026 22:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9400A10E3ED;
	Wed, 29 Apr 2026 20:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jWVAZTg6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE3E10E041
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Apr 2026 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+61WbX+dXYO+fZU/aTenwCR9Kcjb6DadzmVFCx/mTo=; b=jWVAZTg6lz6H20VMgyS6qrrcK0
 jOGZGUmyR1YWMDoWBNNwb/EbpS9BXN7C2jyqA1FO3r05WmgCj2UdzUgbc79Ly2BcvTqw+Dusn0myR
 VfcvnAjSYiTaQuaq10xkppswC1qMBQAh/w4gq6qDEgomi3GlWdiyTgcQG96PxWJEMHGVDQOgdwJN/
 c6TO1HC8cRwkvlZc+MOfyk4n1DapMC+sxZ1v1VylvY3IOINNvu2Wabzi12utLEbC6CqJeaHJMeijE
 KtizVg0FeYEwCSArMP7yxUwjEBCBi0SJSVoY9YUIOIsMZuMAxF1nO14OIPtSBNSnzd+WugeKfJrmB
 S8V0y1/Q==;
Received: from [186.208.73.228] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wIBSe-00476d-57; Wed, 29 Apr 2026 22:24:43 +0200
Message-ID: <a16bce0b-6d7c-49a8-85c0-77458dd4bacb@igalia.com>
Date: Wed, 29 Apr 2026 17:24:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] drm/amd/display: Set max supported display clock
 without max_clks_by_state
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <Harry.Wentland@amd.com>,
 Roman Li <Roman.Li@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
References: <20260423191519.73127-1-timur.kristof@gmail.com>
 <20260423191519.73127-6-timur.kristof@gmail.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260423191519.73127-6-timur.kristof@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 9482649A1FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:Harry.Wentland@amd.com,m:Roman.Li@amd.com,m:sunpeng.li@amd.com,m:airlied@gmail.com,m:mario.limonciello@amd.com,m:ivan.lipski@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com];
	FORGED_SENDER(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_SPAM(0.00)[0.660];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]



On 23/04/2026 16:15, Timur Kristóf wrote:
> The max_clks_by_state was based on hardcoded values, which are
> not really used anywhere, only to know the maximum clock.
> Just hardcode the same maximum clock for each DCE version.
>
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c  | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> index 2ba341df7fffd..bef9a72f3382f 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> @@ -391,9 +391,7 @@ static void dce_update_clocks(struct clk_mgr *clk_mgr_base,
>   			struct dc_state *context,
>   			bool safe_to_lower)
>   {
> -	struct clk_mgr_internal *clk_mgr_dce = TO_CLK_MGR_INTERNAL(clk_mgr_base);
> -	const int max_disp_clk =
> -		clk_mgr_dce->max_clks_by_state[DM_PP_CLOCKS_STATE_PERFORMANCE].display_clk_khz;
> +	const int max_disp_clk = clk_mgr_base->clks.max_supported_dispclk_khz;
>   	int patched_disp_clk = MIN(max_disp_clk, context->bw_ctx.bw.dce.dispclk_khz);
>   
>   	if (should_set_clock(safe_to_lower, patched_disp_clk, clk_mgr_base->clks.dispclk_khz)) {
> @@ -445,8 +443,16 @@ void dce_clk_mgr_construct(
>   	clk_mgr->dprefclk_ss_divider = 1000;
>   	clk_mgr->ss_on_dprefclk = false;
>   
> -	base->clks.max_supported_dispclk_khz =
> -		clk_mgr->max_clks_by_state[DM_PP_CLOCKS_STATE_PERFORMANCE].display_clk_khz;
> +	if (ctx->dce_version >= DCE_VERSION_12_0)
> +		base->clks.max_supported_dispclk_khz = 1133000;
> +	else if (ctx->dce_version >= DCE_VERSION_11_2)
> +		base->clks.max_supported_dispclk_khz = 1108000;
For DCE 11.2, I see ClocksStatePerformance is 1132000 instead of 
1108000, right?

With the value fixed, this is:

Reviewed-by: Melissa Wen <mwen@igalia.com>
> +	else if (ctx->dce_version >= DCE_VERSION_11_0)
> +		base->clks.max_supported_dispclk_khz = 643000;
> +	else if (ctx->dce_version >= DCE_VERSION_8_0)
> +		base->clks.max_supported_dispclk_khz = 625000;
> +	else
> +		base->clks.max_supported_dispclk_khz = 600000;
>   
>   	dce_clock_read_integrated_info(clk_mgr);
>   	dce_clock_read_ss_info(clk_mgr);

