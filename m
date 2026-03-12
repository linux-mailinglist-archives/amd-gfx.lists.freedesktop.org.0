Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGfaGtM/s2l6TgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 23:36:03 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E027AF3B
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 23:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BF810E11B;
	Thu, 12 Mar 2026 22:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YbkgH+4l";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9F10E013;
 Thu, 12 Mar 2026 22:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p7wRoEZgewxf59OVHhQU39V13wfm466Zo/bHBcba/YQ=; b=YbkgH+4lfp3NBSh5sYSzoeTSB2
 2ZQmUol9OgtP3t3DVLwonOTh1D3qzzH7XlQK9W+JoOZUxky8bVr5xANqFiAWl3uSuYIsAj11udE/r
 aVUVwy0+Z0k1YB6K9eQXS2ihWY/Q59LA93xSkZX+UimNPU2urbVYotFX9CCvtP5wrM3mn+c5WVIYQ
 FMv3ErNb2s7FZCsayVy27Bl31Hh/Zssu9uhP+l4a4eGttfLfTRVnOPHrrdnp+srh4w3Ve81y5YtOY
 +Xa5EwopQPnFWelzlGCmfKBOMVkbZqBlWFppa+iBgk6Mh98vP8tY0ML0pGGbBv5SEtz75Uf0+e7oQ
 emV7gPRw==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w0od6-00Enwn-CQ; Thu, 12 Mar 2026 23:35:44 +0100
Message-ID: <6db1bdd6-5f8f-4b8a-a457-c4e0a6a0f9d6@igalia.com>
Date: Thu, 12 Mar 2026 19:35:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix gamma 2.2 colorop TFs
To: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, contact@emersion.fr,
 daniels@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>
References: <20260311211837.2482799-1-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260311211837.2482799-1-alex.hung@amd.com>
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,emersion.fr,collabora.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.912];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 931E027AF3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 11/03/2026 18:18, Alex Hung wrote:
> Use GAMMA22 for degamma/blend and GAMMA22_INV for shaper so
> curves match the color pipeline.
Oh, thanks for this fix!

I had a hard time figuring out that the problem I was facing in the
userspace was that I was trying setting an incorrect value, because
I hadn't paid attention to how it was exposed in the kernel. Unf!

Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5016
> Tested-by: Xaver Hugl <xaver.hugl@kde.org>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index d59ba82d3d7c..aa4658867e55 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -37,19 +37,19 @@ const u64 amdgpu_dm_supported_degam_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
> -	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
> +	BIT(DRM_COLOROP_1D_CURVE_GAMMA22);
>   
>   const u64 amdgpu_dm_supported_shaper_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF) |
> -	BIT(DRM_COLOROP_1D_CURVE_GAMMA22);
> +	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
>   
>   const u64 amdgpu_dm_supported_blnd_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
> -	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
> +	BIT(DRM_COLOROP_1D_CURVE_GAMMA22);
>   
>   #define MAX_COLOR_PIPELINE_OPS 10
>   

