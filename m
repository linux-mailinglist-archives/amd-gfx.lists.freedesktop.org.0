Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAEA36E9A0
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Apr 2021 13:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAD96EE36;
	Thu, 29 Apr 2021 11:32:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8746EE3A
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 11:32:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a22-20020a05600c2256b029014294520f18so6255027wmm.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MHVvBdX5yruZNuaE6au3mmpWmkpoYnyq1LRiMVUzyEs=;
 b=i6TqpaqwZIaTAklta46eRDAvyvsRvTWw7hhqFDWaP2OQ4TmLVFWxv3ZtA2QYnC5AP5
 1t1ohca7oAD7FIgbIn4ZE0Lj9ChX5ctebQ0hrydD21BhpPvDXo8DI59OtgD8imrwHgw7
 ABYSeruiRE+HCbHgwoGJ/kt/q4ouXEr4vfEr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHVvBdX5yruZNuaE6au3mmpWmkpoYnyq1LRiMVUzyEs=;
 b=ffCE3YvV8aqRxZAkHvMJ+Ro0g7TBYlNETHaHTyb3vqJC7hjykrSXMC7lj+S0DJXv54
 pZjrgxQgSDnYtTtNBq80saOsPw1gXG5WMtpEVM7CNInGR/WyOgfIW7zJcNlGoVx6Ytlr
 +TleG7UeTxhy+rD6HSlI//iDQuG+96YIjkxoAaVpWmCWYhtE5hbP5GJX6FILNQ4JjcAS
 akCfReyI+XSA4Gr5pEm98BW90Uyidb2z/m/WxC4nnl4DVzYZNsdHo1tR/C2BSJVe0fBp
 /cA9dlhZm/wOo7+wJKikHE/VumwHiVuhY9OgG4/xzmGXJZ7FzK5WyzODGsg1kYHCRz01
 b54w==
X-Gm-Message-State: AOAM531wSnyKtWzHb7rSdk6UuXRxsyJd1NmxvzAKMn59m15d8WcVB4m5
 fKpGMlq+9VUHct8dsLuNTJb80Q==
X-Google-Smtp-Source: ABdhPJwmPDSU2R2T2gFQK0GFek3qSa8MyzcXyXewBZob9l1eoq+OGIfRwULnAPSgltMO1QmTvugW0w==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr2176067wml.93.1619695975670; 
 Thu, 29 Apr 2021 04:32:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm10503457wmc.6.2021.04.29.04.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 04:32:55 -0700 (PDT)
Date: Thu, 29 Apr 2021 13:32:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs  with
 drm_dev_enter/exit
Message-ID: <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 ppaalanen@gmail.com, helgaas@kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alexander.Deucher@amd.com, Harry.Wentland@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
> > With this calling drm_dev_unplug will flush and block
> > all in flight IOCTLs
> > 
> > Also, add feature such that if device supports graceful unplug
> > we enclose entire IOCTL in SRCU critical section.
> > 
> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> 
> Nope.
> 
> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
> 
> Especially not with an opt-in flag so that it could be shrugged of as a
> driver hack. Most of these ioctls should have absolutely no problem
> working after hotunplug.
> 
> Also, doing this defeats the point since it pretty much guarantees
> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
> is that only execbuf (and even that only when userspace has indicated
> support for non-recoverable hw ctx) is allowed to fail. Anything else
> might crash userspace.
> 
> You probably need similar (and very precisely defined) rules for amdgpu.
> And those must definitely exclude any shard ioctls from randomly failing
> with EIO, because that just kills the box and defeats the point of trying
> to gracefully handling hotunplug and making sure userspace has a chance of
> survival. E.g. for atomic everything should continue, including flip
> completion, but we set all outputs to "disconnected" and send out the
> uevent. Maybe crtc enabling can fail too, but that can also be handled
> through the async status we're using to signal DP link failures to
> userspace.
> 
> I guess we should clarify this in the hotunplug doc?

To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
really make no sense, and where we're rather confident that all properly
implemented userspace will gracefully handle failures. Like a modeset, or
opening a device, or trying to import a dma-buf or stuff like that which
can already fail in normal operation for any kind of reason.

But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
after hotunplug.

And then there's the middle ground, like doing a pageflip or buffer flush,
which I guess some userspace might handle, but risky to inflict those
consequences on them. atomic modeset is especially fun since depending
what you're doing it can be both "failures expected" and "failures not
really expected in normal operation".

Also, this really should be consistent across drivers, not solved with a
driver flag for every possible combination.

If you look at the current hotunplug kms drivers, they have
drm_dev_enter/exit sprinkled in specific hw callback functions because of
the above problems. But maybe it makes sense to change things in a few
cases. But then we should do it across the board.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
