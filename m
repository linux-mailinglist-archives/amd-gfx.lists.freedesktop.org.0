Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B766A25C
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jan 2023 19:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A5310EA98;
	Fri, 13 Jan 2023 18:48:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213AC10EA93
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Jan 2023 18:48:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qk9so54353063ejc.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Jan 2023 10:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EG7jr/g9OljSlpvTsWEcmSixEQmShFVdzLVLaGMM5uM=;
 b=FHNytH06W0UmXriNfArsKvuBHWyeeP40z9gCwoD//tkNxKoF3yEHvkTmM2lpJYyPvh
 aUyQRjEdDyKDeYHV4ZnvgLw5xckxaKf3W0c5KQwF8eb11onD2e1VJmqQ2Atq0Kyojgno
 GKVKsYXK5U/vmuLBdCYPIZKreg21A3xg5cKdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EG7jr/g9OljSlpvTsWEcmSixEQmShFVdzLVLaGMM5uM=;
 b=wCu0WD92vB1Hh6JlDu/GQBSNk7X5n+Vp6AYQaL/ZtoIUcCm+c+ZoO/5g7Od+a2iZJ7
 IxQeXQ00b6xy8avJm5u5sAp5VE7zGz1J8UwzWIMB2r/kx2JuBf7NiwMY2mg/rqllP3mp
 4ACH2w3ou2jzaa0frAka9mgkGEVBYrJeHVKjWiDFyf9G69Dy7fKcc7q7VVAVfv9UEbwq
 CZ1XTl2fnscCVmwtXUxdc0GoDjEZ6GghWvajwTOShU0dHxBey/tIgQjK5SKvv7b1CTt7
 2So5vacXNMgMD1UlXfDTRQaAZyjUhCmVp7PYXr+FDkoUZA8uqq4ePrAri5m872oDNOjy
 Sg9g==
X-Gm-Message-State: AFqh2kqVKTzveXBi5yldZ540w3sekU2fJEk7cxg+IjMkbrhY2rp9YFgM
 aZoBv/gGhnZZ9notoZAmQA+bTQ==
X-Google-Smtp-Source: AMrXdXsDpOBPrtmtkIdWBJZbgTmyQYDq0rUmqeQfEqwOFTt1cJYFl4hQ+nnqLt3BH5+kuiBBd52u2A==
X-Received: by 2002:a17:906:cec4:b0:84d:269c:760a with SMTP id
 si4-20020a170906cec400b0084d269c760amr23264615ejb.51.1673635687677; 
 Fri, 13 Jan 2023 10:48:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a170906970200b0073dbaeb50f6sm8691799ejx.169.2023.01.13.10.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 10:48:05 -0800 (PST)
Date: Fri, 13 Jan 2023 19:48:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: jim.cromie@gmail.com
Subject: Re: [RFC PATCH 00/17] DRM_USE_DYNAMIC_DEBUG regression
Message-ID: <Y8GnY7k22KkG/AmN@phenom.ffwll.local>
Mail-Followup-To: jim.cromie@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org,
 robdclark@gmail.com, jbaron@akamai.com, gregkh@linuxfoundation.org
References: <20221206003424.592078-1-jim.cromie@gmail.com>
 <Y79Btep8JnPKvuAp@phenom.ffwll.local>
 <CAJfuBxxZ0Kjc0G5Ngv7bmokkC4AJKZ07OMCKyLmHBGSsjG7qfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfuBxxZ0Kjc0G5Ngv7bmokkC4AJKZ07OMCKyLmHBGSsjG7qfA@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 intel-gvt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 11:29:57AM -0700, jim.cromie@gmail.com wrote:
> On Wed, Jan 11, 2023 at 4:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Dec 05, 2022 at 05:34:07PM -0700, Jim Cromie wrote:
> > > Hi everyone,
> > >
> > > DRM_USE_DYNAMIC_DEBUG=y has a regression on rc-*
> > >
> > > Regression is due to a chicken-egg problem loading modules; on
> > > `modprobe i915`, drm is loaded 1st, and drm.debug is set.  When
> > > drm_debug_enabled() tested __drm_debug at runtime, that just worked.
> > >
> > > But with DRM_USE_DYNAMIC_DEBUG=y, the runtime test is replaced with a
> > > post-load enablement of drm_dbg/dyndbg callsites (static-keys), via
> > > dyndbg's callback on __drm_debug.  Since all drm-drivers need drm.ko,
> > > it is loaded 1st, then drm.debug=X is applied, then drivers load, but
> > > too late for drm_dbgs to be enabled.
> > >
> > > STATUS
> > >
> > > For all-loadable drm,i915,amdgpu configs, it almost works, but
> > > propagating drm.debug to dependent modules doesnt actually apply,
> > > though the motions are there.  This is not the problem I want to chase
> > > here.
> > >
> > > The more basic trouble is:
> > >
> > > For builtin drm + helpers, things are broken pretty early; at the
> > > beginning of dynamic_debug_init().  As the ddebug_sanity() commit-msg
> > > describes in some detail, the records added by _USE fail to reference
> > > the struct ddebug_class_map created and exported by _DEFINE, but get
> > > separate addresses to "other" data that segv's when used as the
> > > expected pointer. FWIW, the pointer val starts with "revi".
> >
> > So I honestly have no idea here, linker stuff is way beyond where I have
> > clue. So what's the way forward here?
> >
> 
> Ive fixed this aspect.
> Unsurprisingly, it wasnt the linker :-}

Awesome!

> > The DEFINE/USE split does like the right thing to do at least from the
> > "how it's used in drivers" pov. But if we're just running circles not
> > quite getting there I dunno :-/
> > -Daniel
> >
> 
> Sending new rev next.
> I think its getting close.

Thanks a lot for keeping on pushing this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
