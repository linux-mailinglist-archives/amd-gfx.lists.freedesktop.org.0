Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B6A40FD61
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Sep 2021 17:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E116EE48;
	Fri, 17 Sep 2021 15:56:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F116EDDB
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 15:56:54 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id u21so9142777qtw.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0sCoJcMzph8m7gHdWZKN3dp454V4z1+jmuXCQGYY1eU=;
 b=UX6GzuE3DTpJzHN/aIeG3aCWzhBV+fCkDtBgEsxVhOm3+8K8AyENBXdIjuOYPRQKxs
 CTuel8m/m8KvyUEtzzp6eSepsKHiz/6oQvR50EcDMCZsQ3D7ykraTZ1895PCkIJHaqP5
 sfVz/lJFm7SXIqu1gLW50masMo1/nUD/Q4NJaqleeYLk/IDnaaWJNf0YBugq8do4COrv
 tgciBCa4sJznbQ680HUkBOi8azZ7pZjDQk932tTjNeS8fwuKs1XZMUEsUQPyod+7kBIn
 PX4L5mBmBUGYZaIWPqPbQt+e/XskkfcMsuLlF5APW7WdqHZcqEAGziGAp2Q4K1+CChVa
 kfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0sCoJcMzph8m7gHdWZKN3dp454V4z1+jmuXCQGYY1eU=;
 b=DVpW1Dj5u/Z8vu7YFQtSd3Zfo2oF72CJHU1aFa4jv/B0JLrrtxzXdwZTeCMtZDUle4
 pxhMtEmiN1igmI8QoXvG6ID83FvexHAuffsZufUQRZDv9D+AdQLTUic+sQjzMvaO5hzE
 0c/r9YjT2pHT4OKV2EH24EuTo5QUPi3KpucJmat6QFizHW8wz2utpQisv+BILt4G+Q3e
 SfzstVw3J3dnt0wXaaSxkH9D2DpOqk84p3rXDJ+N2nGUGd4sxOeeTyfIiArPEnqIqkFC
 0dyP8ooQBk4FTGFvmdyX431dbGs/pLbunVHwtVfwtNLcG+5DV4R3S5zx2HGK1iyo2UoA
 xX0w==
X-Gm-Message-State: AOAM530eLRojt/f4v/Z06oVcV/ZhEiRYvlnEpUfHekk+9a6vRdyoh0JM
 WR8VplffrMnXTjQ+j6yOfg8+jQ==
X-Google-Smtp-Source: ABdhPJy2rUDs6BeN9kdSRBI5w9E4e4qiGJ6kgMTqOz5qaJIsLmkzMmZBlXt+Y/EFA7itiDo5nxOSnA==
X-Received: by 2002:ac8:4a90:: with SMTP id l16mr5492592qtq.154.1631894213604; 
 Fri, 17 Sep 2021 08:56:53 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id a8sm4075889qtx.39.2021.09.17.08.56.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:56:53 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:56:52 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/15] doc: drm: remove TODO entry regarding
 DRM_MODSET_LOCK_ALL cleanup
Message-ID: <20210917155652.GP2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-16-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-16-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:52PM +0200, Fernando Ramos wrote:
> The previous commits do exactly what this entry in the TODO file asks
> for, thus we can remove it now as it is no longer applicable.

Thanks for doing this work!

Can we remove drm_modeset_lock_all[_ctx] now? If so, let's queue that up as part
of the set.


Reviewed-by: Sean Paul <sean@poorly.run>


> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  Documentation/gpu/todo.rst                | 17 -----------------
>  Documentation/locking/ww-mutex-design.rst |  2 +-
>  2 files changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 12e61869939e..6613543955e9 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -353,23 +353,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
>  
>  Level: Intermediate
>  
> -Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
> ----------------------------------------------------------
> -
> -For cases where drivers are attempting to grab the modeset locks with a local
> -acquire context. Replace the boilerplate code surrounding
> -drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
> -DRM_MODESET_LOCK_ALL_END() instead.
> -
> -This should also be done for all places where drm_modeset_lock_all() is still
> -used.
> -
> -As a reference, take a look at the conversions already completed in drm core.
> -
> -Contact: Sean Paul, respective driver maintainers
> -
> -Level: Starter
> -
>  Rename CMA helpers to DMA helpers
>  ---------------------------------
>  
> diff --git a/Documentation/locking/ww-mutex-design.rst b/Documentation/locking/ww-mutex-design.rst
> index 6a4d7319f8f0..6a8f8beb9ec4 100644
> --- a/Documentation/locking/ww-mutex-design.rst
> +++ b/Documentation/locking/ww-mutex-design.rst
> @@ -60,7 +60,7 @@ Concepts
>  Compared to normal mutexes two additional concepts/objects show up in the lock
>  interface for w/w mutexes:
>  
> -Acquire context: To ensure eventual forward progress it is important the a task
> +Acquire context: To ensure eventual forward progress it is important that a task
>  trying to acquire locks doesn't grab a new reservation id, but keeps the one it
>  acquired when starting the lock acquisition. This ticket is stored in the
>  acquire context. Furthermore the acquire context keeps track of debugging state
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
