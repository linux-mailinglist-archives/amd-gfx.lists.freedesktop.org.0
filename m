Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V/O5BJyFAWpOcQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 11 May 2026 09:30:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3D50936D
	for <lists+amd-gfx@lfdr.de>; Mon, 11 May 2026 09:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93B910E4D1;
	Mon, 11 May 2026 07:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="S9bLNOBj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Fri, 08 May 2026 17:50:50 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0C810F571
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 May 2026 17:50:50 +0000 (UTC)
Message-ID: <0aa24b65-bf32-4955-95ff-e83b5cf4a95e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1778262318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYSZnDmTsuozUYUmJINbc98ChIljg9omdqVjq5iRYaw=;
 b=S9bLNOBjMg09zTj2wf5tnT6yK4ofbB5j3KPH8NKiOuSpxgLgJai6TmNQHjw9pkrJmJHMw5
 0Pk7O188L/xNfASlN2d9JlTGQ7kNpzkJv4RTpdMoW0C2sr705NnRoBgdFVRrIdESgQlbqq
 qoh/Xo3sPJIFy91HStTEBYgjg7oJ//4=
Date: Fri, 8 May 2026 10:45:10 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] better LUT segmentation for EOTFs
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Alex Hung
 <alex.hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 pekka.paalanen@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20260506191606.15022-1-mwen@igalia.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <20260506191606.15022-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 11 May 2026 07:30:27 +0000
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
X-Rspamd-Queue-Id: 09E3D50936D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[61];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:airlied@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:Krunoslav.Kovac@amd.com,m:linux@treblig.org,m:Bhawanpreet.Lakha@amd.com,m:alex.hung@amd.com,m:Aurabindo.Pillai@amd.com,m:pekka.paalanen@collabora.com,m:dri-devel@lists.freedesktop.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matthew.schwartz@linux.dev,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.schwartz@linux.dev,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

On 5/6/26 12:11 PM, Melissa Wen wrote:
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
>   cm3_helper_translate_curve_to_degamma_hw_format(): encoded input,
>   non-zero end slope, up to 256 points linearly interpolated between
>   adjacent TF pts, fitting [0,1] encoded input range.
> - shaper and regamma LUTs continue using
>   cm3_helper_translate_curve_to_hw_format(): linear-light input, zero
>   end slope, 16 points per region across 32 regions.
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

I tested this on a DCN35 device with an internal HDR panel that was affected by the gradient issue. I cannot see any banding present with this series applied on top of amd-staging-drm-next with AMD private color properties enabled.

Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
for the series.

Thanks,
Matt

> 
> Melissa Wen (5):
>   drm/amd/display: use GAMCOR for degamma private props in subsampled
>     format
>   Revert "drm/amd/display: Remove unused
>     cm3_helper_translate_curve_to_degamma_hw_format"
>   drm/amd/display: use a separate helper to translate degamma curves
>   drm/amd/display: support up to 256 samples per region in degamma/blend
>     LUT
>   drm/amd/display: use halving distribution for PQ/sRGB linearizing LUT
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  16 +-
>  .../amd/display/dc/dcn30/dcn30_cm_common.c    | 184 ++++++++++++++++++
>  .../display/dc/dwb/dcn30/dcn30_cm_common.h    |   4 +
>  .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   |  10 +-
>  4 files changed, 204 insertions(+), 10 deletions(-)
> 

