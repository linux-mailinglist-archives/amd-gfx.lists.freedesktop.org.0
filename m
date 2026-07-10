Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iFflJ2X1UGpG9AIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:36:37 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E891573B4EF
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:36:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zktu+aP7;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5AE10F8E4;
	Fri, 10 Jul 2026 13:36:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86210F8E4
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 13:36:34 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8ee43b3e5abso6120436d6.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783690593; x=1784295393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KYJ2tLOC5oFWD8I3q/vCEnQGiCmzJnxrnM3h313/auo=;
 b=Zktu+aP7IEq3AYiN0GcNbtUbqtYvAXO04U0M3F9dx7oppKCcFNoOIZjYKv5YLW/Ihi
 p4sh3bBje7/xI74VpVfhZrb2KO+7SDiMJIAMu2dfrkGnUM5YF3wI7Nwp/vbFz1ud1ROI
 9h2qPWvo7W2dXwJotlvcjJ5IY9VF9KmIpL8Q/hZqpGy1cTSjEei9RL1IzrhiqL7FZsHD
 OKyRMfv4yZmWomBKpfQaLCEluvBL4FE3bgfR+KOee/xFmSPcFgAP9ddFCvVwscholWB+
 oQoG4+GMQ5Xn6y4fLFjbP2MCGV4s6km3/XBCod/q0sqX0oxb7hyszNGMDxYe6xTc2zxe
 RUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783690593; x=1784295393;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KYJ2tLOC5oFWD8I3q/vCEnQGiCmzJnxrnM3h313/auo=;
 b=bKS0G7iiUbpU51byQk8RGdweMsTI893bjlMGeFHrV/tXznTDYAfpTc5bItb//9AGGy
 zj06CnGCjkodifUSB4R9uLnNTi9DJrA1o+uv4T/t/WT30ZJ37uP1V+V/KENaLWkW/z7F
 W1p5uai74PVkb7YIKlNfvk3jnh6nQpDPfB4uakkNgl1I59roqWlnhYMz2GbP36jS+yar
 OXrMq9NHrq/x6189hy73ObBjB+KcbXmtS75WBoSxQYzQEGSj3/8kVCLFPgDuOXAGj+tG
 sHY77tXmNNgz/VO6TZY9+KYmeLpkjXH64JV7Lts8sf77zn58o03vNOB2LlNitL++HqXw
 qYCw==
X-Forwarded-Encrypted: i=1;
 AHgh+RreVT33BJWCoLID2SknktgVKdj0PA/3Wb3uG4h7CLjvqfeTh+ZS9TsqbyA1uP0bgaxIV7EoIf6K@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHfRk3HPLOQwj88IYIHazVmChaA7zgNhBFiijUSpRbQTF/Houa
 tfEVt6lTRdUEk/I6vDQfudrAnic/N1FzmAYxiFm+V3zw6Vj0zuFh3BZZ
X-Gm-Gg: AfdE7cnIhZvb5iAXrZ6TwwNVtpRatKblHOJU4s55wDK++sGvQKvJZVHeOegdOmhFtQ2
 YOQ2MRBC/l1jxhTB6sBLRKhnqaQLzuHZfPbHA16XD9/IgO4V7He/3Ze/4zuFiWPwKcvgtm1JBjb
 sOb/9fyZ/L2gdGAaD+7PFqZhTVXW+Xzfg7DnosUfH/d1DhiyML8F78TCu7hmpiiUPhTLCJ+GisG
 kXY5pSoZ85rasMuYl89d0DqC9P49rWRNC2pznNm7YG5Qme1lrScba0j1kxOdC44yJOco2wZNi7F
 dUqw02/k+Acx+hwMR/dfkzVF2YYNCGpz4XugB9zRdcAItYnTRcSi7VA1sAc6p/enkiZMb07L70I
 oaTkiTe8/NR/+DQKF6RGq3sPMW5ZmEbCpNJ8CmxJTHgEQrIk9CyHf17RBJiZVPqmdYx7nxGUZPz
 TTM6/CH3kczLPJaUGa9nZX
X-Received: by 2002:a05:6214:2604:b0:8ef:25f0:e01f with SMTP id
 6a1803df08f44-8fec304fd92mr132198306d6.54.1783690593101; 
 Fri, 10 Jul 2026 06:36:33 -0700 (PDT)
Received: from [192.168.1.100] ([32.219.225.223])
 by smtp.googlemail.com with ESMTPSA id
 6a1803df08f44-8ffd50df5e2sm41371536d6.4.2026.07.10.06.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 06:36:31 -0700 (PDT)
Message-ID: <eb3ae0f8-8695-4fcf-9851-2a42480558a4@gmail.com>
Date: Fri, 10 Jul 2026 09:36:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Fix preferred link rate for NUTMEG
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Ivan Lipski <ivan.lipski@amd.com>, harry.wentland@amd.com,
 Alex Hung <alex.hung@amd.com>, Ray Wu <Ray.Wu@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, Roman Li <roman.li@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>
References: <20260529090909.13206-1-timur.kristof@gmail.com>
Content-Language: en-US
From: John Olender <john.olender@gmail.com>
In-Reply-To: <20260529090909.13206-1-timur.kristof@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:Alexander.Deucher@amd.com,m:ivan.lipski@amd.com,m:harry.wentland@amd.com,m:alex.hung@amd.com,m:Ray.Wu@amd.com,m:wenjing.liu@amd.com,m:aurabindo.pillai@amd.com,m:Chuanyu.Tseng@amd.com,m:roman.li@amd.com,m:daniel.wheeler@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com];
	FORGED_SENDER(0.00)[johnolender@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[johnolender@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E891573B4EF

Ping.

On 5/29/26 5:09 AM, Timur Kristóf wrote:
> When there is a preferred link rate setting, it needs to be
> applied to both the current and initial link rate.
> This was regressed by a "coding style" fix, which caused
> the current link rate to not respect the preferred value.
> 
> This commit restores the functionality of NUTMEG,
> the DP bridge encoder found on old APUs such as Kaveri.
> 
> Fixes: b74322eea36b ("drm/amd/display: Fix coding style issue")
> Cc: Chuanyu Tseng <Chuanyu.Tseng@amd.com>
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>

A user recently reported this issue to the tracker and confirmed
this patch is an effective fix.

Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5465

Thanks,
John

> ---
>  .../drm/amd/display/dc/link/protocols/link_dp_capability.c    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index 817b4010edcbe..f44c13300a59c 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -750,8 +750,10 @@ static bool decide_dp_link_settings(struct dc_link *link, struct dc_link_setting
>  	if (req_bw > dp_link_bandwidth_kbps(link, &link->verified_link_cap))
>  		return false;
>  
> -	if (link->preferred_link_setting.link_rate != LINK_RATE_UNKNOWN)
> +	if (link->preferred_link_setting.link_rate != LINK_RATE_UNKNOWN) {
>  		initial_link_setting.link_rate = link->preferred_link_setting.link_rate;
> +		current_link_setting.link_rate = link->preferred_link_setting.link_rate;
> +	}
>  
>  	/* search for the minimum link setting that:
>  	 * 1. is supported according to the link training result

