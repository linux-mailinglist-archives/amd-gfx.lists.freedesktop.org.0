Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ADC45F0DA
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Nov 2021 16:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC126F63E;
	Fri, 26 Nov 2021 15:40:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297256F63D
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Nov 2021 15:40:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a9so19495542wrr.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Nov 2021 07:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gk6ngc1YSakHN/S+Y1kpLPOKsTaZw6Pt23dIyMoroN8=;
 b=Xh+p2xR0fDlc2JddvMzdhaIiesVnTxJ9N3t1t8hKG8rzWhOwc70VeiqlE06C/SaU9t
 evMNj9w0mPhMHUK/vhQUSXKHE/W2OZKBV3sUs81JEkZs8kmXq0g77u4ZiVhtzq2L7cyh
 cm00zoL8aZY6UKXnYYvQlDOFzDpSMHI/OljIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gk6ngc1YSakHN/S+Y1kpLPOKsTaZw6Pt23dIyMoroN8=;
 b=u954Y58GhwT0DqMsW6PUyLSpMNfdf3TH1tHypRjsUhlMgomMgqEbTLpTJvabDMjAhN
 aDNOimOl2GY9U/hOQbsz9YWz9Q3YzlWMpMzcu0gNrkknv3CtXyPN6a4guBHE5Y6CMzuU
 7zJXxJyfV4jU2eGzmngHaV1iOpgaDf5Wo2OivPTD6GxE0gKuePt/9kytcbPiYSz8a0ZO
 rKQcXWQoYSTqNghwxjb2rfjx5m+y+cQV7G4nZpccUF4R0xD80qzx4Rlu+n19odLSS0Tm
 GrYbjUiCrhsTmFIZ0Grg52TiPaa8oJyh2gMh6Q23n31Fk95zuQtz4k1qbKdHwSLEBp2N
 F1WQ==
X-Gm-Message-State: AOAM533z8NTE0lBYl1S/14dXlfkdRQB5pW5jlk1E4PfxGZb6f2PflGr3
 K8yub2GZWjElr0pMhlkYfNrePw==
X-Google-Smtp-Source: ABdhPJxbHn743HpAai3gIe+eQ+BSOuNwnJnmv+uu5WioVEpwlxBV04HpXAGj7vqTjHFCbkd54ZsKfQ==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr14217900wro.175.1637941204596; 
 Fri, 26 Nov 2021 07:40:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a9sm5913472wrt.66.2021.11.26.07.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 07:40:04 -0800 (PST)
Date: Fri, 26 Nov 2021 16:40:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
Message-ID: <YaD/0kLNe6WhuoVF@phenom.ffwll.local>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <aa16c8ca-1126-0f6f-c201-362a2abc2341@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa16c8ca-1126-0f6f-c201-362a2abc2341@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Mark Yacoub <markyacoub@chromium.org>, bhawanpreet.lakha@amd.com,
 nicholas.choi@amd.com, linux-doc@vger.kernel.org,
 Simon Ser <contact@emersion.fr>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, aurabindo.pillai@amd.com,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Alex Deucher <alexander.deucher@amd.com>, qingqing.zhuo@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>, Roman Gilg <subdiff@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 26, 2021 at 11:35:03AM +0100, Christian K�nig wrote:
> Just a general comment. Could you name the new subdirectory "amdgpu"
> instead?
> 
> DC is just a component of the amdgpu driver and I think it would sooner or
> later make sense to group together the amdgpu documentation in one folder.

Seconded, I think when driver docs get too big for the single file
approach a directory matching the driver name sounds best. Also at that
point maybe just drop the amdgpu prefix in the .rst files, it's kinda
redundant?
-Daniel

> 
> Regards,
> Christian.
> 
> Am 25.11.21 um 16:38 schrieb Rodrigo Siqueira:
> > Display core documentation is not well organized, and it is hard to find
> > information due to the lack of sections. This commit reorganizes the
> > documentation layout, and it is preparation work for future changes.
> > 
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > ---
> >   Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
> >   .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
> >   Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
> >   Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
> >   Documentation/gpu/drivers.rst                 |  2 +-
> >   5 files changed, 76 insertions(+), 75 deletions(-)
> >   delete mode 100644 Documentation/gpu/amdgpu-dc.rst
> >   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> >   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> >   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> > 
> > diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
> > deleted file mode 100644
> > index f7ff7e1309de..000000000000
> > --- a/Documentation/gpu/amdgpu-dc.rst
> > +++ /dev/null
> > @@ -1,74 +0,0 @@
> > -===================================
> > -drm/amd/display - Display Core (DC)
> > -===================================
> > -
> > -*placeholder - general description of supported platforms, what dc is, etc.*
> > -
> > -Because it is partially shared with other operating systems, the Display Core
> > -Driver is divided in two pieces.
> > -
> > -1. **Display Core (DC)** contains the OS-agnostic components. Things like
> > -   hardware programming and resource management are handled here.
> > -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> > -   amdgpu base driver and DRM are implemented here.
> > -
> > -It doesn't help that the entire package is frequently referred to as DC. But
> > -with the context in mind, it should be clear.
> > -
> > -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
> > -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
> > -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> > -
> > -To determine if DC is loaded, search dmesg for the following entry:
> > -
> > -``Display Core initialized with <version number here>``
> > -
> > -AMDgpu Display Manager
> > -======================
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :doc: overview
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > -   :internal:
> > -
> > -Lifecycle
> > ----------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :doc: DM Lifecycle
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :functions: dm_hw_init dm_hw_fini
> > -
> > -Interrupts
> > -----------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > -   :doc: overview
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > -   :internal:
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
> > -
> > -Atomic Implementation
> > ----------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :doc: atomic
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> > -
> > -Display Core
> > -============
> > -
> > -**WIP**
> > -
> > -FreeSync Video
> > ---------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :doc: FreeSync Video
> > diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> > new file mode 100644
> > index 000000000000..bbb8c3fc8eee
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> > @@ -0,0 +1,4 @@
> > +Display Core Debug tools
> > +========================
> > +
> > +TODO
> > diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > new file mode 100644
> > index 000000000000..3685b3b1ad64
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > @@ -0,0 +1,29 @@
> > +===================================
> > +drm/amd/display - Display Core (DC)
> > +===================================
> > +
> > +*placeholder - general description of supported platforms, what dc is, etc.*
> > +
> > +Because it is partially shared with other operating systems, the Display Core
> > +Driver is divided in two pieces.
> > +
> > +1. **Display Core (DC)** contains the OS-agnostic components. Things like
> > +   hardware programming and resource management are handled here.
> > +2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> > +   amdgpu base driver and DRM are implemented here.
> > +
> > +It doesn't help that the entire package is frequently referred to as DC. But
> > +with the context in mind, it should be clear.
> > +
> > +When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
> > +supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
> > +Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> > +
> > +To determine if DC is loaded, search dmesg for the following entry:
> > +
> > +.. toctree::
> > +
> > +   amdgpu-dm.rst
> > +   amdgpu-dc-debug.rst
> > +
> > +``Display Core initialized with <version number here>``
> > diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> > new file mode 100644
> > index 000000000000..7ce31f89d9a0
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> > @@ -0,0 +1,42 @@
> > +======================
> > +AMDgpu Display Manager
> > +======================
> > +
> > +.. contents:: Table of Contents
> > +    :depth: 3
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +   :doc: overview
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +   :internal:
> > +
> > +Lifecycle
> > +=========
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +   :doc: DM Lifecycle
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +   :functions: dm_hw_init dm_hw_fini
> > +
> > +Interrupts
> > +==========
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > +   :doc: overview
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > +   :internal:
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
> > +
> > +Atomic Implementation
> > +=====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +   :doc: atomic
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> > diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> > index b4a0ed3ca961..dffe52d837cd 100644
> > --- a/Documentation/gpu/drivers.rst
> > +++ b/Documentation/gpu/drivers.rst
> > @@ -5,7 +5,7 @@ GPU Driver Documentation
> >   .. toctree::
> >      amdgpu
> > -   amdgpu-dc
> > +   amdgpu-dc/amdgpu-dc
> >      i915
> >      mcde
> >      meson
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
