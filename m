Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45E5F0CF1
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Sep 2022 16:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527DE10ED10;
	Fri, 30 Sep 2022 14:02:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB6110ED10;
 Fri, 30 Sep 2022 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664546548; x=1696082548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xGTENvR8GFQ6zQHRhUAkxjkq2w/Q1P5UKCXGw9IWUsQ=;
 b=VO61qm0CYGAEFXU8BUV+CCirNkVMfnzGOtEpfkhBRByistgbYDlTdHvo
 ht7Z2EZDMrItgop72Cn9xcjepwiWpjfK2+9S1eIC8WYne/x4fzSUxsH8i
 yLmG0rmExKWmyu4Dp2Hr66/rXBbp3XrfkbBszSy6i6eSq35oZ1+QR6Hdm
 7KaIhkrKqGAZJBcIAbQ8R4pbLZRgGitSsQupGyZDYYHiRRYxu+HSqyU70
 Zu52a9bAdf86wqMrj2dCBN77zYqRCzUCiASxA68zHZuRRH2N0/ZgPXBjT
 0Myq9uf7rmHhs11I7b/5cbnAb6gaUyfurh+ZH4hx2uV7S/ULmWSGVKih5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="299797570"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="299797570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 07:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="573870726"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="573870726"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga003.jf.intel.com with SMTP; 30 Sep 2022 07:02:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 17:02:09 +0300
Date: Fri, 30 Sep 2022 17:02:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 3/6] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Message-ID: <Yzb24RJOn/OkTsKx@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <20220929184307.258331-4-contact@emersion.fr>
 <Yzb0xhcvwnWg4iY6@intel.com>
 <TIyTbXwbugAMrWLflS6c6MSMb8Nfv0n3kzxZS8XYDPW2KhtzVxazMJUQPRdq0c7BUNLAaT125oFiZYCTIT-tF5QVCnKxffLfGYOMBCBpQWQ=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TIyTbXwbugAMrWLflS6c6MSMb8Nfv0n3kzxZS8XYDPW2KhtzVxazMJUQPRdq0c7BUNLAaT125oFiZYCTIT-tF5QVCnKxffLfGYOMBCBpQWQ=@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 01:56:25PM +0000, Simon Ser wrote:
> On Friday, September 30th, 2022 at 15:53, Ville Syrj�l� <ville.syrjala@linux.intel.com> wrote:
> 
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index 44235345fd57..7500e82cf06a 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -3808,6 +3808,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
> > >  		adev_to_drm(adev)->mode_config.prefer_shadow = 1;
> > >  	/* indicates support for immediate flip */
> > >  	adev_to_drm(adev)->mode_config.async_page_flip = true;
> > > +	adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported = true;
> > 
> > The flag polarity seems weird. Why opt out and not opt in?
> 
> Explained in the commit message.

Seems a bit ambitious, but sure.

-- 
Ville Syrj�l�
Intel
