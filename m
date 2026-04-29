Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFKPHR1s8mkMrAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2026 22:37:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951549A321
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2026 22:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BFD10E0E7;
	Wed, 29 Apr 2026 20:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QF2t5hwN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1881D10E0E7
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Apr 2026 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9Ew1y7b+0WtYeT6egQWgy2HkJwye9X4QtF/an2ihs4=; b=QF2t5hwNCi1jIoLGwIKv7ChEHT
 VsimvnkIqrkTSgv8fqCTxIuasIPkykXqmIU3wKl1btwRpWIz5uLCP//vedIqQEAToQoemsVl+J8sP
 Y4EKbkgDQ+k2NlSaF8nQgPh6+Pa+PB5jnAhv4hPju/oMGr28hmYRKsBAvBf00G/H4b1VLEcTAf1qy
 yaUNOgdidprELf/ESmK7WcuaEgGJsLSfS9YHyJUKrLU5lgVqs21VT0DFZqiDr9N7FdI2CPR87+sHu
 oRWmNEc7iCCX7vrLjXrMG/LVEjrGY8BQUVw8wnjpxDNcOuDyM0MUdpdBUIvJI3MeGT878+WZ1hqYN
 VbLks4cw==;
Received: from [186.208.73.228] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wIBfD-0047NO-H7; Wed, 29 Apr 2026 22:37:42 +0200
Message-ID: <d271711c-0d8e-416d-9fa1-75e161ba82aa@igalia.com>
Date: Wed, 29 Apr 2026 17:37:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] drm/amd/display: Delete dm_pp_clocks_state
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <Harry.Wentland@amd.com>,
 Roman Li <Roman.Li@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
References: <20260423191519.73127-1-timur.kristof@gmail.com>
 <20260423191519.73127-9-timur.kristof@gmail.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260423191519.73127-9-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: 1951549A321
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
	NEURAL_SPAM(0.00)[0.639];
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
> It isn't used by anything anymore.
>
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   .../drm/amd/display/dc/dm_services_types.h    | 27 -------------------
>   1 file changed, 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_services_types.h b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
> index 44aa8d213d386..b3505d93503fd 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_services_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
> @@ -36,30 +36,7 @@ struct dm_pp_clock_range {
>   	int max_khz;
>   };
>   
> -enum dm_pp_clocks_state {
> -	DM_PP_CLOCKS_STATE_INVALID,
> -	DM_PP_CLOCKS_STATE_ULTRA_LOW,
> -	DM_PP_CLOCKS_STATE_LOW,
> -	DM_PP_CLOCKS_STATE_NOMINAL,
> -	DM_PP_CLOCKS_STATE_PERFORMANCE,
> -
> -	/* Starting from DCE11, Max 8 levels of DPM state supported. */
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_INVALID = DM_PP_CLOCKS_STATE_INVALID,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_0,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_1,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_2,
> -	/* to be backward compatible */
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_3,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_4,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_5,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_6,
> -	DM_PP_CLOCKS_DPM_STATE_LEVEL_7,
> -
> -	DM_PP_CLOCKS_MAX_STATES
> -};
> -
>   struct dm_pp_gpu_clock_range {
> -	enum dm_pp_clocks_state clock_state;
>   	struct dm_pp_clock_range sclk;
>   	struct dm_pp_clock_range mclk;
>   	struct dm_pp_clock_range eclk;
> @@ -246,10 +223,6 @@ enum dm_acpi_display_type {
>   	AcpiDisplayType_DFP6 = 12
>   };
>   
> -struct dm_pp_power_level_change_request {
> -	enum dm_pp_clocks_state power_level;
> -};
Ah, okay, here is the dm_pp_power_level_change_request removal.
I think it should be removed earlier.

Apart from that,

Reviewed-by: Melissa Wen <mwen@igalia.com>
> -
>   struct dm_pp_clock_for_voltage_req {
>   	enum dm_pp_clock_type clk_type;
>   	uint32_t clocks_in_khz;

