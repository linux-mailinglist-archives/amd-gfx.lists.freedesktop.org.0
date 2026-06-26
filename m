Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WSABOMHMPmqeLwkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 21:02:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05046CFD66
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 21:02:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FstiwF0N;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B5C10F705;
	Fri, 26 Jun 2026 19:02:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687DF10F704;
 Fri, 26 Jun 2026 19:02:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 91BB5600C8;
 Fri, 26 Jun 2026 19:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02B91F000E9;
 Fri, 26 Jun 2026 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782500539;
 bh=UUIgku0dEeTkAIbEWbmP2c4kgTyRAbCcRnpJ75y3OUk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FstiwF0N2TKXY0zUW6qxHZC2DhJ7UIsuxklD9FRC7G5Ub6nedrarR5rIBl62qwf81
 DAzynZykkyWrvW5K7JOzHlBQLiTqUUaBhY17H9d5DsRO1PjBifTpMzGM0OxuLlJ/FG
 3m7PYebotrPF7kBpbtauyfrSxcbJ3FLCxiB1bQQPoe14IHV5tbizpn8RPexr6OImz8
 CN4L3Ve3hxRFNYHDsWNoi9XykmXOopwmIhQU/q6KoqMQUrVX9f6gYm4CAE2dzcM/7g
 bzb00ieDYhxGq1puMyvJkrkAwRWfMqRR2GTqqKQUJwv/IOMJ0MGU9ZTxFoS4+sQtHg
 mOku3Cru3MR1w==
Message-ID: <9b3b135c-0e9d-4439-bbe7-877ac9824249@kernel.org>
Date: Fri, 26 Jun 2026 14:02:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix: drm/amd/display: detect_link_and_local_sink: DP alt
 mode timeout path leaks prev_sink reference
Content-Language: en-US
To: WenTao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: siqueira@igalia.com, alex.hung@amd.com, timur.kristof@gmail.com,
 wenjing.liu@amd.com, Relja.Vojvodic@amd.com, Derek.Lai@amd.com,
 srinivasan.shanmugam@amd.com, clayking@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260626124555.36910-1-vulab@iscas.ac.cn>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260626124555.36910-1-vulab@iscas.ac.cn>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[iscas.ac.cn,amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B05046CFD66

On 6/26/26 07:45, WenTao Liang wrote:
> prev_sink is unconditionally retained via dc_sink_retain at function
>    entry, but the DP alt mode timeout path inside SIGNAL_TYPE_DISPLAY_PORT
>    returns false without releasing prev_sink. All other return paths in the
>    function correctly call dc_sink_release(prev_sink), making this the only
>    missing cleanup.
> 
> Cc: stable@vger.kernel.org
> Fixes: 54618888d1ea ("drm/amd/display: break down dc_link.c")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Applied, thanks.

> ---
>   drivers/gpu/drm/amd/display/dc/link/link_detection.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 794dd6a95918..03bb210ebab8 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1069,8 +1069,11 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>   			    link->link_enc->features.flags.bits.DP_IS_USB_C == 1) {
>   
>   				/* if alt mode times out, return false */
> -				if (!wait_for_entering_dp_alt_mode(link))
> +				if (!wait_for_entering_dp_alt_mode(link)) {
> +					if (prev_sink)
> +						dc_sink_release(prev_sink);
>   					return false;
> +				}
>   			}
>   
>   			if (!detect_dp(link, &sink_caps, reason)) {

