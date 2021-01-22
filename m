Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E762FFF68
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Jan 2021 10:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51FA6E9D2;
	Fri, 22 Jan 2021 09:44:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDD46E9CB
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 09:44:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a9so4429670wrt.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VQ+aJWE+kih/P1Crt7BrsZ+5tAJWlnpU9eq5uMiGLMQ=;
 b=FLnzp2HEQFRGu61rDKanyDSNLnPdDQUzcE78NfbUqu8N6LkQHMeIyPkLL4YHMjFvfW
 f3+hPzvZVuMnliLe5EgJLy+3rOYC4o6XaTjyOWB0CV6GBavkkMXkSbTqRrUCkt5KLT5v
 l4Af4oJMw9SE7hmeOOFRE0OSSVH/UI8ltmryM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VQ+aJWE+kih/P1Crt7BrsZ+5tAJWlnpU9eq5uMiGLMQ=;
 b=XUfDAQkLcjcWoTA22nPQUEwoX7sJKawaQ3ICFCtlePeICjcDH4IsXTUGwUtOQFrDL1
 iYGyhK58LdG0sdl/VtcJH3pV41OWc0aSNHZnVt0+S342CCi0QGj9k/XhY0mDb7tMizgg
 sYI0mIJes89wsS+uJXgjOjHzsOxdoax2ZFqwnITbsknwWUuqbxbAF4SGtF20G3hCg4RP
 qL1sOJuE7/HuW+gXR0spOPzBMSZiF/2LELLjitl8SomjkR+vXzUnAXu5/ZgEIuy8jyGX
 drV+pzx6f5c78hBgoi2F+eyVuM3cF+bHm0BoAqgMcN+oJxQqAWdwdnRxe1eBJlfX4MCL
 qt9w==
X-Gm-Message-State: AOAM533RPdkPvWg/MVq6TEeqqMZDxFjwz9N82aZLCUj24NI4ylQcAWmo
 DYw9Cg+00ge89nTnDdRk6S4qNA==
X-Google-Smtp-Source: ABdhPJw3Lo94m4WFc/9PY8B6GE6YnReIsCkY9g0pal/Gec1YI36rMpcqFd3Fn701B+pF1208hjezUQ==
X-Received: by 2002:adf:8145:: with SMTP id 63mr3527171wrm.8.1611308661691;
 Fri, 22 Jan 2021 01:44:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm233384wro.27.2021.01.22.01.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:44:21 -0800 (PST)
Date: Fri, 22 Jan 2021 10:44:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/3] Experimental freesync video mode optimization
Message-ID: <YAqec2/YTOTicjZC@phenom.ffwll.local>
References: <20210119155029.18943-1-aurabindo.pillai@amd.com>
 <20210122103248.779e70bf@eldfell>
 <YAqeHZlDBrgALLo9@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAqeHZlDBrgALLo9@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, wayne.lin@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 10:42:53AM +0100, Daniel Vetter wrote:
> On Fri, Jan 22, 2021 at 10:32:48AM +0200, Pekka Paalanen wrote:
> > On Tue, 19 Jan 2021 10:50:26 -0500
> > Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
> > 
> > > Changes in V5
> > > =============
> > > 
> > > * More info in commit messages on the rationale of changes being added
> > > to the kernel.
> > > * Minor fixes
> > 
> > Hi,
> > 
> > thank you for adding the explanations in the commit messages I asked
> > for. It is now up to DRM maintainers to determine if this is
> > conceptually fine.
> > 
> > I do see that apparently setting the opt-in option does not yet taint
> > the kernel although Daniel Vetter suggested it might be a good idea. I
> > guess tainting the kernel would make it easier to remove this feature
> > in the future because it would be easier to dismiss people that claim a
> > kernel regression due to the removal.
> 
> Reading the descriptions I'm honestly not sure why this isn't enabled by
> default?
> 
> Maybe the explanations should also capture why this is maybe not a good
> idea ...

And also, if this is a bad idea uapi-vise, then it definitely needs to be
behind the tainting module option until we've sorted it out (and then just
enable it by default once that's done).
-Daniel

> -Daniel
> 
> > 
> > 
> > Thanks,
> > pq
> > 
> > 
> > > --
> > > 
> > > This patchset enables freesync video mode usecase where the userspace
> > > can request a freesync compatible video mode such that switching to this
> > > mode does not trigger blanking.
> > > 
> > > This feature is guarded by a module parameter which is disabled by
> > > default. Enabling this paramters adds additional modes to the driver
> > > modelist, and also enables the optimization to skip modeset when using
> > > one of these modes.
> > > 
> > > --
> > > 
> > > Aurabindo Pillai (3):
> > >   drm/amd/display: Add module parameter for freesync video mode
> > >   drm/amd/display: Add freesync video modes based on preferred modes
> > >   drm/amd/display: Skip modeset for front porch change
> > > 
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 401 ++++++++++++++++--
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> > >  4 files changed, 382 insertions(+), 35 deletions(-)
> > > 
> > 
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
