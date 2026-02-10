Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGmMJYs+i2mfRwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 15:19:55 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2979511BCF2
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 15:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7B10E5A4;
	Tue, 10 Feb 2026 14:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+rrf9ds";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3110E5A0
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 14:19:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 076526013D;
 Tue, 10 Feb 2026 14:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A938C16AAE;
 Tue, 10 Feb 2026 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770733190;
 bh=D6IBRmwkpXqq652WeoGBuAPJWRUH/B5JK4uk444pcSw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E+rrf9dsR6suqkzKzYbBNQoeDkXqcL9yahmz6F6YH9DHubLKI2f77BqslTDBynPTb
 W2iG5xjXI9wRylIlncjD6wcKMkbnyC0JcAcXWVY4dRM3neNwiNh6PdvHd6pFhNgGP0
 OBhoobFCXa37Bjz8dfZF1tEIxFGLKbQGBa7EyoXo//DIiCRW/J3fzuY86HFjxFmLTq
 6FJ13f0F4LYp4UQTo4tnTb8lXTP6E62OPJ48Sy2atJ7c5HpldsTrQSExGqs5AQ+KR1
 PMSYvymecfTLPeMkTDbEK/JXDyWrTXc069q7Bx8GshIwCmOLg+iBe9bAbhzUGSLdxq
 r1KbYUVk6kByg==
Message-ID: <b2a166bf-7e18-486b-894c-0735ad727d0a@kernel.org>
Date: Tue, 10 Feb 2026 08:19:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/18] drm/amd/display: Correct logic check error for
 fastboot
To: Ray Wu <ray.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Ovidiu Bunea <ovidiu.bunea@amd.com>
References: <20260210135353.848421-1-ray.wu@amd.com>
 <20260210135353.848421-16-ray.wu@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260210135353.848421-16-ray.wu@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ray.wu@amd.com,m:timur.kristof@gmail.com,m:matthew.schwartz@linux.dev,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:aurabindo.pillai@amd.com,m:roman.li@amd.com,m:wayne.lin@amd.com,m:chiahsuan.chung@amd.com,m:jerry.zuo@amd.com,m:daniel.wheeler@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:Charlene.Liu@amd.com,m:ovidiu.bunea@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[amd.com,lists.freedesktop.org,gmail.com,linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2979511BCF2
X-Rspamd-Action: no action

++

On 2/10/26 7:50 AM, Ray Wu wrote:
> From: Charlene Liu <Charlene.Liu@amd.com>
> 
> [Why]
> Fix fastboot broken in driver.
> This is caused by an open source backport change 7495962c.
> 
> from the comment, the intended check is to disable fastboot
> for pre-DCN10. but the logic check is reversed, and causes
> fastboot to be disabled on all DCN10 and after.
> 
> fastboot is for driver trying to pick up bios used hw setting
> and bypass reprogramming the hw if dc_validate_boot_timing()
> condition meets.
> 
> Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
> Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
> Signed-off-by: Ray Wu <ray.wu@amd.com>

7495962c was already applied to 6.19.  This should go to stable to avoid 
fastboot being broken in 6.19.y.

Fixes: 7495962cbceb9 ("drm/amd/display: Disable fastboot on DCE 6 too")
Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> index 4659e1b489ba..4277b6761522 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> @@ -1964,8 +1964,8 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
>   
>   	get_edp_streams(context, edp_streams, &edp_stream_num);
>   
> -	/* Check fastboot support, disable on DCE 6-8 because of blank screens */
> -	if (edp_num && edp_stream_num && dc->ctx->dce_version < DCE_VERSION_10_0) {
> +	/* Check fastboot support, disable on DCE 6-8-10 because of blank screens */
> +	if (edp_num && edp_stream_num && dc->ctx->dce_version > DCE_VERSION_10_0) {
>   		for (i = 0; i < edp_num; i++) {
>   			edp_link = edp_links[i];
>   			if (edp_link != edp_streams[0]->link)

