Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TVBNEMAbD2rYFwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 21 May 2026 16:50:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885D5A7A77
	for <lists+amd-gfx@lfdr.de>; Thu, 21 May 2026 16:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07AF10E2D4;
	Thu, 21 May 2026 14:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Jd6sp4g2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751010E2D4;
 Thu, 21 May 2026 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ei3iaiBD0gShD6zCN7rUvlGEoXAk7WO0S1J7L4M5TuU=; b=Jd6sp4g2qsVgYVwtooCOjr0i6z
 YBpHtVJOIAniRTqf+MHeCZbvUQJJfTMOjF9ypTZr4myQPUdzbHGL/Z5l5rS6ILNzUoF024LGep+Ev
 srollJ40y/ERT4UAJx56xEmH5wNHKp/KhZ8JYqB2m3tnh53H7WZWx+JP9orvamQrmtH3vdLOCxR6N
 XbfGIgWZCdXoBfwotbSnbI+otPN5TkWCssEIvbd/N737bSy1tf1lE36EkvUaZfxVrrYlRqgi5UvdA
 OBuryVdwfgH1JJDwrvgAQx0HpzWtXDIaVQHsCyfEg0XtNCVXvhYGKrKwfA/FEQeoqe0GkT0BR6yPM
 Zop964GQ==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wQ4jA-004OXC-LB; Thu, 21 May 2026 16:50:24 +0200
Message-ID: <2a48f435-10d9-4e6e-8979-bfd61451a93e@igalia.com>
Date: Thu, 21 May 2026 16:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] better LUT segmentation for EOTFs
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Alex Hung
 <alex.hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>, pekka.paalanen@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260506191606.15022-1-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20260506191606.15022-1-mwen@igalia.com>
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,ffwll.ch,igalia.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid]
X-Rspamd-Queue-Id: 5885D5A7A77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 06/05/2026 21:11, Melissa Wen wrote:
> Hi,
>
> With an external HDR monitor, we can see gradient banding around the sun
> in the intro of Ori and the Will of the Wisps game on steamOS/Gamescope.
> Gamescope uses AMD predefined transfer functions for degamma,
> shaper/pre-3D-LUT and blend/post-3D-LUT plus CRTC regamma, however, only
> degamma block has hardware curves. Shaper, blend, regamma predefined TFs
> are software-computed by AMD color module into PWL LUTs. In addition, we
> cannot use hardware curves on PRE_DEGAM with subsampled format, so that,
> predefined TFs are also translated to LUTs in this situation, using
> GAMCOR block instead. For this translation, the driver originally used
> the same helper for EOTFs and inverse EOTFs, even though they differ in
> input domain, number of regions and number of TF points per region.

Hello,

Can someone review this series - and merge it, if everything is okay?

Thanks,

Melissa

>
> Baring this in mind, patch 1 maps degamma predefined curves as LUT using
> GAMCOR block for AMD driver-specific property that are still in use by
> current gamescope. This was inspired by a similar patch from Harry for
> colorop [1]. Patch 2 reverts commit 8b89acc0b2ba ("drm/amd/display:
> Remove unused cm3_helper_translate_curve_to_degamma_hw_format") to
> reintroduce cm3_helper_translate_curve_to_degamma_hw_format() and patch
> 3 wire it up for encoded -> linear-light LUTs (degamma/blend). With 16
> samples per region across 12 regions for blend LUT (where hardware
> fixed-function curves are not available and predefined TFs are
> software-computed into LUTs), banding becomes almost imperceptible.
>
> Patch 4 and 5 increase precision in the brightest half, where PQ/SRGB
> EOTFs are steeper, by enabling up to 256 samples per region and halving
> the per-region point count across 9 regions (128 in [0.5, 1], 64 in
> [0.25, 0.5], …). This better matches the shape of PQ/SRGB EOTFs.
> Although patches 4 and 5 seem conceptually correct to me, I couldn't see
> clear improvement in the bright end with or without them.
>
> This series targets DCN3+ hw families. With this series:
> - degamma and blend LUTs use
>    cm3_helper_translate_curve_to_degamma_hw_format(): encoded input,
>    non-zero end slope, up to 256 points linearly interpolated between
>    adjacent TF pts, fitting [0,1] encoded input range.
> - shaper and regamma LUTs continue using
>    cm3_helper_translate_curve_to_hw_format(): linear-light input, zero
>    end slope, 16 points per region across 32 regions.
>
> [1] https://lore.kernel.org/dri-devel/20260330153451.99472-8-harry.wentland@amd.com/
>
> [v1] https://lore.kernel.org/dri-devel/20260414220237.184289-1-mwen@igalia.com/
> Changes:
> - new patch for GAMCOR usage in case of degamma predefined TF with subsampled formats
> - fix misleading information regarding degamma hw curves (Kruno)
> - clarify LUT segmentation choice using 8-bit sRGB as a reference (Kruno)
>
> Best Regards,
>
> Melissa
>
> Melissa Wen (5):
>    drm/amd/display: use GAMCOR for degamma private props in subsampled
>      format
>    Revert "drm/amd/display: Remove unused
>      cm3_helper_translate_curve_to_degamma_hw_format"
>    drm/amd/display: use a separate helper to translate degamma curves
>    drm/amd/display: support up to 256 samples per region in degamma/blend
>      LUT
>    drm/amd/display: use halving distribution for PQ/sRGB linearizing LUT
>
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  16 +-
>   .../amd/display/dc/dcn30/dcn30_cm_common.c    | 184 ++++++++++++++++++
>   .../display/dc/dwb/dcn30/dcn30_cm_common.h    |   4 +
>   .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   |  10 +-
>   4 files changed, 204 insertions(+), 10 deletions(-)
>

