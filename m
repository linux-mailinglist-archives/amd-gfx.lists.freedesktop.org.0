Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA159051A
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Aug 2022 18:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B04F14BB4E;
	Thu, 11 Aug 2022 16:52:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3AD14BB4F
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Aug 2022 16:52:44 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id o22so23679726edc.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Aug 2022 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=GOXk4YL6BAiJ7lbWCTvYa+Dod5IDRA8x+/9uc395zm4=;
 b=iTP6+UDuAgsE3qIvdxZ6t8SaJ0CjrchiGXPU4zOJmFMJVx4zbp6E+t13fJAteyBkf2
 xn3G3V+C1pdZTdq53sHFX3Ty5Kcegq+LWvHUGxc1JdeGp6O52hFVI8ZTR8hURRnVIERZ
 sgdoP0mXVT74pThLqR+zVCfGeDOqA1qCpYZrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=GOXk4YL6BAiJ7lbWCTvYa+Dod5IDRA8x+/9uc395zm4=;
 b=xakb71hwmKvjhYGnqtwtvv7Oq947vwPjAVRMcien0y9VCc7hX1KIjd5udt3O2mfg1I
 8Ts/BOLTRh8DjQcltN8345ITDoALhH8AT1gJGvfELwbEGvYyj7GpK9ZX4aj2YUHCIpGy
 pnAkJAz1ki/riBTxOZ2UANrTIGwP7bmGEbp24h2m3X6rLymj8zkxFgmiglpULHckQqN+
 togxWGtcldfDT7MHv9gKuBdkCZKY9fZtcY1YpmsoMR8TFkXMSKnEHRZmOpRNdhNqPUAs
 ksDGCRkLhrehPiKpxgwC6NnJMGDaTWV3rmzrsviG3kWEEzH+yl4Bt2gTJhqSg9ME+1GW
 9qtQ==
X-Gm-Message-State: ACgBeo0Zf9yBubT0hoJAnrdmnFA7/Gax5t9XFA0m9D0wcAJ4yen8IUUd
 0LocIoyQkYvFjcXI26cEq+l710GjV7xk6fd6
X-Google-Smtp-Source: AA6agR5aTDumHPvZmpMRZMbqqO2+OgxYvY1IqkFNHCS/bk5pkvOryb8QGehlRO3dZ2/BDcYAHhFcvQ==
X-Received: by 2002:a05:6402:3201:b0:43d:47ee:4ae2 with SMTP id
 g1-20020a056402320100b0043d47ee4ae2mr24955543eda.235.1660236762704; 
 Thu, 11 Aug 2022 09:52:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709060c0c00b0072f5c1f05a4sm3701395ejf.44.2022.08.11.09.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:52:42 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:52:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <YvUz2Nk6YHl+jVwR@phenom.ffwll.local>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
 <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
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
Cc: jim.cromie@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, robdclark@gmail.com,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Aug 03, 2022 at 04:13:05PM -0400, Jason Baron wrote:
> 
> 
> On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> > On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> >>
> > 
> >> Hi Jason, Greg, DRM-folk,
> >>
> >> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> >> means either DISJOINT (like drm debug categories), or VERBOSE (like
> >> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> >> drivers i915, amdgpu, nouveau.
> >>
> > 
> > This revision fell over, on a conflict with something in drm-MUMBLE
> > 
> > Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> > not applied
> > Applying: dyndbg: fix static_branch manipulation
> > Applying: dyndbg: fix module.dyndbg handling
> > Applying: dyndbg: show both old and new in change-info
> > Applying: dyndbg: reverse module walk in cat control
> > Applying: dyndbg: reverse module.callsite walk in cat control
> > Applying: dyndbg: use ESCAPE_SPACE for cat control
> > Applying: dyndbg: let query-modname override actual module name
> > Applying: dyndbg: add test_dynamic_debug module
> > Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> > 
> > Jason,
> > those above are decent maintenance patches, particularly the drop export.
> > It would be nice to trim this unused api this cycle.
> 
> Hi Jim,
> 
> Agreed - I was thinking the same thing. Feel free to add
> Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.

Does Greg KH usually pick up dyndbg patches or someone else or do I need
to do something? Would be great to get some movement here since -rc1 goes
out and merging will restart next week.
-Daniel

> 
> 
> 
> > 
> > Applying: dyndbg: add class_id to pr_debug callsites
> > Applying: dyndbg: add __pr_debug_cls for testing
> > Applying: dyndbg: add DECLARE_DYNDBG_CLASSMAP
> > Applying: kernel/module: add __dyndbg_classes section
> > Applying: dyndbg: add ddebug_attach_module_classes
> > Applying: dyndbg: validate class FOO by checking with module
> > Applying: dyndbg: add drm.debug style bitmap support
> > Applying: dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
> > Applying: doc-dyndbg: describe "class CLASS_NAME" query support
> > Applying: doc-dyndbg: edit dynamic-debug-howto for brevity, audience
> > Applying: drm_print: condense enum drm_debug_category
> > Applying: drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
> > Applying: drm_print: interpose drm_*dbg with forwarding macros
> > Applying: drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
> > Using index info to reconstruct a base tree...
> > M drivers/gpu/drm/Kconfig
> > M drivers/gpu/drm/Makefile
> > Falling back to patching base and 3-way merge...
> > Auto-merging drivers/gpu/drm/Makefile
> > Auto-merging drivers/gpu/drm/Kconfig
> > CONFLICT (content): Merge conflict in drivers/gpu/drm/Kconfig
> > error: Failed to merge in the changes.
> > 
> > 
> > Before I resend, I should sort out that possible conflict
> > which tree is patchwork applied upon ?
> > 
> > or was it just transient ? after 5.19 I rebased a copy onto drm-next/drm-next,
> > and there was nothing to fix - I will revisit presently..
> 
> 
> Not sure, if it's a minor conflict maybe Greg KH can sort it when
> he pulls it in? If not yeah might be important to rebase first...Greg?
> 
> Thanks,
> 
> -Jason

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
