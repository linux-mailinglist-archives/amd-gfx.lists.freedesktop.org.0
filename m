Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D412B8CD92B
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2024 19:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACFE10F155;
	Thu, 23 May 2024 17:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7cERT8h";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730F10F15D;
 Thu, 23 May 2024 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485539; x=1748021539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uNcIGozZvpEAmR27nhSWVo+xVUOftbExVLTNqebYqjs=;
 b=Y7cERT8hlFtX2hSiosTNRpFm2AGf9kLU3RoYCmQeACxUKgCxEBpycFTO
 pSxAS9jJY5V3cjovLTbthsgRxfTKZqJLD72shKQjDnrt1zL/7Drwgl4Da
 uv9bO2N6OIy7b+4Mytv0C8Nix3e+ezZPnSm/XJRXZ65c4LEOnY/8oDqYW
 C/sIgx9qzPBomwHdky3HWHombE9GiHMUMumd1BWcvE35UVWev1uhJN7PN
 dYjeJFvR/1l/J/6j9vYj/iuklg4nRnPfm7jPxt9nWzzTeMDGCcsU+gHNY
 6mDZc9UwjQddiBFqJYrWOFfraJ7dEfTyePtn7AoHD9nrg0dTpa9l4amKG Q==;
X-CSE-ConnectionGUID: WQyqDWnzScSx6wP6AMB74Q==
X-CSE-MsgGUID: 1zXkpeYoSli9nya6K/W65A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12673172"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12673172"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:32:15 -0700
X-CSE-ConnectionGUID: xt+TKiz4TyavmPMvRJ7mUQ==
X-CSE-MsgGUID: 9Eeg2aYeSdigM9bHUEo3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33712668"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 May 2024 10:32:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 May 2024 20:32:11 +0300
Date: Thu, 23 May 2024 20:32:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] drm/imx: fix -Wformat-truncation warning in
 imx_ldb_probe()
Message-ID: <Zk99m4i82XnQPeKQ@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
 <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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

On Thu, May 23, 2024 at 06:51:08PM +0300, Jani Nikula wrote:
> Enabling -Wformat-truncation yields the following warning:
> 
> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function ‘imx_ldb_probe’:
> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: ‘_sel’ directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Werror=format-truncation=]
>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>       |                                                         ^~~~
> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: ‘snprintf’ output between 8 and 18 bytes into a destination of size 16
>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If only the compiler could count to three...

> 
> Silence the warning by checking the snprintf() return value.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> index 71d70194fcbd..46f779fe60ee 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> @@ -654,8 +654,12 @@ static int imx_ldb_probe(struct platform_device *pdev)
>  	 */
>  	for (i = 0; i < 4; i++) {
>  		char clkname[16];
> +		int len;
> +
> +		len = snprintf(clkname, sizeof(clkname), "di%d_sel", i);
> +		if (len >= sizeof(clkname))
> +			dev_err(dev, "clkname truncated\n");
>  
> -		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>  		imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
>  		if (IS_ERR(imx_ldb->clk_sel[i])) {
>  			ret = PTR_ERR(imx_ldb->clk_sel[i]);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
