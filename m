Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UI4ZMkSMR2q+awAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 12:17:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33564701197
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 12:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b="j4gP/9Yx";
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEC010F77E;
	Fri,  3 Jul 2026 10:17:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727A10F78E;
 Fri,  3 Jul 2026 10:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783073850; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xm9w2Kh6bNIzL996IbTqZYMMKZl6DAxExgOlzdKqiSkiWVuAYfi5QNkesycb9fTdgLPjVJE6GHOttQhy37i+5xF3ZhO0JGkJ4ABdm49ju2aubzBwyrvnGcmhQSnl6PDbqRlM0ZeVdb8Md8Y5P6Y7dB5jK5SwJIclMxw5bt7Wzi4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783073850;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vOP83hj+XyTJD/ibxgosem1ob6ETRVtC9E5dEpkKjeA=; 
 b=fKCAGeHZsJ/OVk1GOsDTI7bzzczokaMGGc+829YZui1uqhLlVCVSBdE+N6qyTJWwB3ZxoWnYuzDMwGUudr/m1yDcaMAzIBdPhGKFr5GiFIi234O3M4LTguBQjoWhrKX0jjetc+8kiRgIWcGMY0h6sx9foqqRhrup1kAa+M3/Jwc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783073850; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vOP83hj+XyTJD/ibxgosem1ob6ETRVtC9E5dEpkKjeA=;
 b=j4gP/9Yx/y3S9QQSRRyU/KbFOBnGgX31nZ+9mGOQfbTHZWnciubbKBfxvRmKrdZ6
 iGzXqO/td8x73fKOxB+rh6kKwbU9ibehSN86wpbPGnk5GD/jf3bddQXYeAOOqvsE8WP
 69RaMdScUbuS4VCXjpXIeWBn4Tx7JTu/Ez1wqyd8=
Received: by mx.zohomail.com with SMTPS id 1783073847910837.4231758783818;
 Fri, 3 Jul 2026 03:17:27 -0700 (PDT)
Message-ID: <b12e7e6d-e01d-46ff-9977-79ab7509415a@collabora.com>
Date: Fri, 3 Jul 2026 12:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] drm/colorop: Add limited-range YUV-to-RGB fixed
 matrix enum values
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>
References: <20260623164812.81110-1-harry.wentland@amd.com>
 <20260623164812.81110-3-harry.wentland@amd.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20260623164812.81110-3-harry.wentland@amd.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[robert.mader@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:email];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33564701197

Hi,

On 23.06.26 18:48, Harry Wentland wrote:
> Add three new limited-range YUV-to-RGB conversion presets to the
> Fixed Matrix colorop enum:
>
>    - DRM_COLOROP_FM_YCBCR601_LIMITED_RGB
>    - DRM_COLOROP_FM_YCBCR709_LIMITED_RGB
>    - DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB
>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> ---
>   drivers/gpu/drm/drm_colorop.c |  3 +++
>   include/drm/drm_colorop.h     | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index c11c3012fcc5..9cf89153b365 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -93,8 +93,11 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
>   
>   static const char * const colorop_fixed_matrix_type_names[] = {
>   	[DRM_COLOROP_FM_YCBCR601_FULL_RGB] = "YCbCr 601 Full to RGB",
> +	[DRM_COLOROP_FM_YCBCR601_LIMITED_RGB] = "YCbCr 601 Limited to RGB",
>   	[DRM_COLOROP_FM_YCBCR709_FULL_RGB] = "YCbCr 709 Full to RGB",
> +	[DRM_COLOROP_FM_YCBCR709_LIMITED_RGB] = "YCbCr 709 Limited to RGB",
>   	[DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB] = "YCbCr 2020 NC Full to RGB",
> +	[DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB] = "YCbCr 2020 NC Limited to RGB",
>   	[DRM_COLOROP_FM_YCBCR_LIMITED_FULL] = "YCbCr limited to full",
>   	[DRM_COLOROP_FM_RGB709_RGB2020] = "RGB709 to RGB2020",
>   };
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 88933d5b4d8b..5c542c264a36 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -150,6 +150,16 @@ enum drm_colorop_fixed_matrix_type {
>   	 */
>   	DRM_COLOROP_FM_YCBCR601_FULL_RGB,
>   
> +	/**
> +	 * @DRM_COLOROP_FM_YCBCR601_LIMITED_RGB:
> +	 *
> +	 * enum string "YCbCr 601 Limited to RGB"
> +	 *
> +	 * This selects the matrix that converts limited range YCbCr into RGB
> +	 * according to the BT.601 coefficients.
> +	 */
> +	DRM_COLOROP_FM_YCBCR601_LIMITED_RGB,
> +
>   	/**
>   	 * @DRM_COLOROP_FM_YCBCR709_FULL_RGB:
>   	 *
> @@ -160,6 +170,16 @@ enum drm_colorop_fixed_matrix_type {
>   	 */
>   	DRM_COLOROP_FM_YCBCR709_FULL_RGB,
>   
> +	/**
> +	 * @DRM_COLOROP_FM_YCBCR709_LIMITED_RGB:
> +	 *
> +	 * enum string "YCbCr 709 Limited to RGB"
> +	 *
> +	 * This selects the matrix that converts limited range YCbCr into RGB
> +	 * according to the BT.709 coefficients.
> +	 */
> +	DRM_COLOROP_FM_YCBCR709_LIMITED_RGB,
> +
>   	/**
>   	 * @DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB:
>   	 *
> @@ -170,6 +190,16 @@ enum drm_colorop_fixed_matrix_type {
>   	 */
>   	DRM_COLOROP_FM_YCBCR2020_NC_FULL_RGB,
>   
> +	/**
> +	 * @DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB:
> +	 *
> +	 * enum string "YCbCr 2020 NC Limited to RGB"
> +	 *
> +	 * This selects the matrix that converts limited range YCbCr into RGB
> +	 * according to the BT.2020 non-constant luminance coefficients.
> +	 */
> +	DRM_COLOROP_FM_YCBCR2020_NC_LIMITED_RGB,
> +
>   	/**
>   	 * @DRM_COLOROP_FM_YCBCR_LIMITED_FULL:
>   	 *

I'd prefer the commit to get squashed into the previous one - but either 
way:

Reviewed-by: Robert Mader <robert.mader@collabora.com>

-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

