Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CDE7DF335
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Nov 2023 14:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405DD10E883;
	Thu,  2 Nov 2023 13:05:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A210E864
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Nov 2023 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698926122; x=1730462122;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=LN2zsFLqmMKh/7dbnLz+vFNRTOnaAK8H94eqPAfKQj4=;
 b=F8E3VKITOsdg61omRXWQ/NIqn93FhfKdal8/ypjm6RviE3ROXFgX4zck
 9iv6Sf5gcq2jT+nYsr7/L95FclqdSf2D+83aJSZAwzqnlZchBSHW7rvR7
 2gfg8uLlKsvQ0ZwqOGLQ/WSDff/p/u0QVZR9CCDkVHIRR/P2lVQhpggSr
 tjV74QpJDzJbIAgpBRunhwSgDGfDZoIYV1wtNQPcPKMF2qVIrQm1rbGPQ
 1igAQkcm5HeFotWu8+hu30Pd7dDZv9NA818YI8eIaseU8X0buy8VAoJlR
 vHglcWYSOmUD/r/MfLv4XeEYmb/Iq1MUvE6dosCDiFyUhdyi69WApY6qm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="455176344"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="455176344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 04:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="904988180"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="904988180"
Received: from sdsadara-mobl.ger.corp.intel.com ([10.251.215.6])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 04:55:17 -0700
Date: Thu, 2 Nov 2023 13:55:11 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Ma Jun <Jun.Ma2@amd.com>
Subject: Re: [Patch v13 4/9] wifi: mac80211: Add support for WBRF features
In-Reply-To: <20231030071832.2217118-5-Jun.Ma2@amd.com>
Message-ID: <5b8ea81c-dd4c-7f2a-c862-b9a0aab16044@linux.intel.com>
References: <20231030071832.2217118-1-Jun.Ma2@amd.com>
 <20231030071832.2217118-5-Jun.Ma2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Thu, 02 Nov 2023 13:05:30 +0000
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
Cc: Evan Quan <quanliangl@hotmail.com>, linux-doc@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, Lijo.Lazar@amd.com,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 edumazet@google.com, mario.limonciello@amd.com, alexander.deucher@amd.com,
 kuba@kernel.org, johannes@sipsolutions.net, pabeni@redhat.com,
 davem@davemloft.net, lenb@kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023, Ma Jun wrote:

> From: Evan Quan <quanliangl@hotmail.com>
> 
> To support the WBRF mechanism, Wifi adapters utilized in the system must
> register the frequencies in use (or unregister those frequencies no longer
> used) via the dedicated calls. So that, other drivers responding to the
> frequencies can take proper actions to mitigate possible interference.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <quanliangl@hotmail.com>
> Signed-off-by: Evan Quan <quanliangl@hotmail.com>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> --
> v1->v2:
>   - place the new added member(`wbrf_supported`) in
>     ieee80211_local(Johannes)
>   - handle chandefs change scenario properly(Johannes)
>   - some minor fixes around code sharing and possible invalid input
>     checks(Johannes)
> v2->v3:
>   - drop unnecessary input checks and intermediate APIs(Mario)
>   - Separate some mac80211 common code(Mario, Johannes)
> v3->v4:
>   - some minor fixes around return values(Johannes)
> v9->v10:
>   - get ranges_in->num_of_ranges set and passed in(Johannes)
> v12:
>   - use acpi_amd_wbrf_add_remove to replace the acpi_amd_wbrf_add_exclusion
>     acpi_amd_wbrf_remove_exclusion
> v13:
>   - Fix the format issue (IIpo Jarvinen)
>   - Remove KHZ_TO_HZ and use HZ_PER_KHZ in linux/units.h (IIpo Jarvinen)
> ---
>  net/mac80211/Makefile      |  2 +
>  net/mac80211/chan.c        |  9 ++++
>  net/mac80211/ieee80211_i.h |  7 +++
>  net/mac80211/main.c        |  2 +
>  net/mac80211/wbrf.c        | 95 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 115 insertions(+)
>  create mode 100644 net/mac80211/wbrf.c
> 
> diff --git a/net/mac80211/Makefile b/net/mac80211/Makefile
> index b8de44da1fb8..d46c36f55fd3 100644
> --- a/net/mac80211/Makefile
> +++ b/net/mac80211/Makefile
> @@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
>  
>  mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
>  
> +mac80211-y += wbrf.o
> +
>  ccflags-y += -DDEBUG
> diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
> index 68952752b599..458469c224ae 100644
> --- a/net/mac80211/chan.c
> +++ b/net/mac80211/chan.c
> @@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct ieee80211_local *local,
>  
>  	WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
>  
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
> +
>  	ctx->conf.def = *chandef;
>  
>  	/* check if min chanctx also changed */
>  	changed = IEEE80211_CHANCTX_CHANGE_WIDTH |
>  		  _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
> +
> +	ieee80211_add_wbrf(local, &ctx->conf.def);
> +
>  	drv_change_chanctx(local, ctx, changed);
>  
>  	if (!local->use_chanctx) {
> @@ -668,6 +673,8 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
>  	lockdep_assert_held(&local->mtx);
>  	lockdep_assert_held(&local->chanctx_mtx);
>  
> +	ieee80211_add_wbrf(local, &ctx->conf.def);
> +
>  	if (!local->use_chanctx)
>  		local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
>  
> @@ -748,6 +755,8 @@ static void ieee80211_del_chanctx(struct ieee80211_local *local,
>  	}
>  
>  	ieee80211_recalc_idle(local);
> +
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
>  }
>  
>  static void ieee80211_free_chanctx(struct ieee80211_local *local,
> diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
> index 98ef1fe1226e..1172554bd831 100644
> --- a/net/mac80211/ieee80211_i.h
> +++ b/net/mac80211/ieee80211_i.h
> @@ -1600,6 +1600,8 @@ struct ieee80211_local {
>  
>  	/* extended capabilities provided by mac80211 */
>  	u8 ext_capa[8];
> +
> +	bool wbrf_supported;
>  };
>  
>  static inline struct ieee80211_sub_if_data *
> @@ -2637,4 +2639,9 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
>  				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
>  				    u8 eht_cap_len,
>  				    struct link_sta_info *link_sta);
> +
> +void ieee80211_check_wbrf_support(struct ieee80211_local *local);
> +void ieee80211_add_wbrf(struct ieee80211_local *local, struct cfg80211_chan_def *chandef);
> +void ieee80211_remove_wbrf(struct ieee80211_local *local, struct cfg80211_chan_def *chandef);
> +
>  #endif /* IEEE80211_I_H */
> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
> index 24315d7b3126..b20bdaac84db 100644
> --- a/net/mac80211/main.c
> +++ b/net/mac80211/main.c
> @@ -1396,6 +1396,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>  	debugfs_hw_add(local);
>  	rate_control_add_debugfs(local);
>  
> +	ieee80211_check_wbrf_support(local);
> +
>  	rtnl_lock();
>  	wiphy_lock(hw->wiphy);
>  
> diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
> new file mode 100644
> index 000000000000..ca3f30b58476
> --- /dev/null
> +++ b/net/mac80211/wbrf.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Wifi Band Exclusion Interface for WLAN
> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + */
> +
> +#include <linux/acpi_amd_wbrf.h>
> +#include <linux/units.h>
> +#include <net/cfg80211.h>
> +#include "ieee80211_i.h"
> +
> +void ieee80211_check_wbrf_support(struct ieee80211_local *local)
> +{
> +	struct wiphy *wiphy = local->hw.wiphy;
> +	struct device *dev;
> +
> +	if (!wiphy)
> +		return;
> +
> +	dev = wiphy->dev.parent;
> +	if (!dev)
> +		return;
> +
> +	local->wbrf_supported = acpi_amd_wbrf_supported_producer(dev);
> +	dev_dbg(dev, "WBRF is %s supported\n",
> +		local->wbrf_supported ? "" : "not");
> +}
> +
> +static void get_chan_freq_boundary(u32 center_freq, u32 bandwidth, u64 *start, u64 *end)
> +{
> +	bandwidth = MHZ_TO_KHZ(bandwidth);
> +	center_freq = MHZ_TO_KHZ(center_freq);

Please use include/linux/units.h ones for these too.

-- 
 i.

