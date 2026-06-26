Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WN7xD4G2PmqFKgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 19:27:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B376CF6A1
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 19:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=eMQ7hbLR;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DCF10F6CF;
	Fri, 26 Jun 2026 17:27:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21610F66C;
 Fri, 26 Jun 2026 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782488698; x=1814024698;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xMf7ZXe6/RJ1KcAmvvmn4XDJn/rMypmeK3NrV2r53xY=;
 b=eMQ7hbLR6aJZF7akKt7lvo4NxI7aodGsjiwICKVaKgV9SO+ivypXoDbx
 /U3xbmeUYcIps1b0zxw1OWKEiszfiWRKNRyANvjvaJrtq9E0cvs/Sasmw
 y0bM7M5XQ84C0CHUXR3TiBq74tA2AP39iEuD6PMhDr+KZvG8Uj3GTMIuF
 uR/YKF5DZRE2aS605X0qhMrZuZTf6S0Yr+wOJo+51wgNW+jTBZ1JQuvvY
 WPvxZmZLboj3zGkzBeXHsYlytamB2R7gLPs8RRHRR2kq5ZCsfryJGKx3X
 opYDnnWFIMv41/myiL22k0UMmM/C61Zfu1ThKedzxCTdyHZqffw06a1jE Q==;
X-CSE-ConnectionGUID: NfO66PMFTKWP4OZB8cuCzw==
X-CSE-MsgGUID: c9pRPfJIQhml/Bpk24LIiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="82393832"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="82393832"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 08:44:58 -0700
X-CSE-ConnectionGUID: /+ZULXUWTbu+jD04U9RpNg==
X-CSE-MsgGUID: jDgl0zNmT/2sEVrVXZgVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253264255"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 08:44:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Chenyu Chen <chen-yu.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Ray
 Wu <Ray.Wu@amd.com>, Limonciello Mario <Mario.Limonciello@amd.com>, Chenyu
 Chen <chen-yu.chen@amd.com>
Subject: Re: [PATCH v3 1/3] drm/edid: extract base section header processing
 into helper
In-Reply-To: <20260526030254.1460480-2-chen-yu.chen@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260526030254.1460480-1-chen-yu.chen@amd.com>
 <20260526030254.1460480-2-chen-yu.chen@amd.com>
Date: Fri, 26 Jun 2026 18:44:46 +0300
Message-ID: <e559162c1eecf91493623fdc546262e9391c0821@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 26 Jun 2026 17:27:19 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55B376CF6A1

On Tue, 26 May 2026, Chenyu Chen <chen-yu.chen@amd.com> wrote:
> Extract the DisplayID base section header logging and non_desktop
> detection from update_displayid_info() into a dedicated helper,
> drm_displayid_process_base_section_header(). Remove the break so the
> iterator walks through all data blocks, preparing for future patches
> that will parse additional block types within the loop.
>
> The helper is called only once for the base section via a
> base_section_header_processed flag. Since version and primary_use are
> only captured from the base section, and extension sections carry a
> primary use of zero per spec, the non_desktop logic is unaffected.
>
> No functional change.
>
> Assisted-by: Copilot:Claude-Opus-4.6
> Signed-off-by: Chenyu Chen <chen-yu.chen@amd.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 8031f021d4d0..7ad3f939dbe6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6715,30 +6715,35 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	memset(&info->amd_vsdb, 0, sizeof(info->amd_vsdb));
>  }
>  
> +static void drm_displayid_process_base_section_header(struct drm_connector *connector,
> +						      const struct displayid_iter *iter)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +
> +	drm_dbg_kms(connector->dev,
> +		    "[CONNECTOR:%d:%s] DisplayID extension version 0x%02x, primary use 0x%02x\n",
> +		    connector->base.id, connector->name,
> +		    displayid_version(iter),
> +		    displayid_primary_use(iter));
> +	if (displayid_version(iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
> +	    (displayid_primary_use(iter) == PRIMARY_USE_HEAD_MOUNTED_VR ||
> +	     displayid_primary_use(iter) == PRIMARY_USE_HEAD_MOUNTED_AR))
> +		info->non_desktop = true;
> +}
> +
>  static void update_displayid_info(struct drm_connector *connector,
>  				  const struct drm_edid *drm_edid)
>  {
> -	struct drm_display_info *info = &connector->display_info;
>  	const struct displayid_block *block;
>  	struct displayid_iter iter;
> +	bool base_section_header_processed = false;
>  
>  	displayid_iter_edid_begin(drm_edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
> -		drm_dbg_kms(connector->dev,
> -			    "[CONNECTOR:%d:%s] DisplayID extension version 0x%02x, primary use 0x%02x\n",
> -			    connector->base.id, connector->name,
> -			    displayid_version(&iter),
> -			    displayid_primary_use(&iter));
> -		if (displayid_version(&iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
> -		    (displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_VR ||
> -		     displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_AR))
> -			info->non_desktop = true;
> -
> -		/*
> -		 * We're only interested in the base section here, no need to
> -		 * iterate further.
> -		 */
> -		break;
> +		if (!base_section_header_processed) {
> +			drm_displayid_process_base_section_header(connector, &iter);
> +			base_section_header_processed = true;
> +		}
>  	}
>  	displayid_iter_end(&iter);
>  }

-- 
Jani Nikula, Intel
