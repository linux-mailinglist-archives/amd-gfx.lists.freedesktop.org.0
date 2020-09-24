Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3897D276C92
	for <lists+amd-gfx@lfdr.de>; Thu, 24 Sep 2020 11:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2386E1B7;
	Thu, 24 Sep 2020 09:01:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3F6E1B7
 for <amd-gfx@lists.freedesktop.org>; Thu, 24 Sep 2020 09:01:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v12so2757814wmh.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 24 Sep 2020 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qCkDGWZX97ynHjFjHujFdo86OA+40MBxMrOQVS3IaAM=;
 b=cdCbheIqDUrioR30U47CVZw9JlOK2RPWQTZac1BPS+YgMoDhzxWikJBl2shJ/hgzs/
 amQx5nr8ytP39HZ4aAXf8BcUb93DuCHAHfbpxhZnjLnWobdDQgbC9zDm2Nja9gQwXfW6
 50xC7yGpQg8fOMyDOM5oODamWlgtzFKUXDgB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qCkDGWZX97ynHjFjHujFdo86OA+40MBxMrOQVS3IaAM=;
 b=TnbE6zl9gKA2gcEUiERSVz710t7WFLQTg9UFVQnX6VF06nuda+PENKIc5JskSmwFTf
 oh2Khs6yZn2za61Dxb27B/B/HHfe8SgcS+Fdc2IPazCGcbGQhpSE5expXIdty4egSLIm
 0NL7S3H8ecKJj2SoUvyHs1ccSxdasZ5h79geg6UTwsak0EGGHj6yfwjSpgwGYeS+mmU4
 ipLywHGn+sryPYM8s2Mzo5akxsTz6lBdksVDXThqui1y85YOGFC9ETJIDp6ieacu0iu1
 hO2bRG8ocaV1RSqqh7clZ/srRhMdNCN0As3ARxGjtdg8+heGyuMZdq6+D/2PP49kJ61k
 i9fQ==
X-Gm-Message-State: AOAM530S6KOxrPZRJHbRRdXLFdqVBqtVb/LF0OH10Oe3remxXxeqK38Q
 PHPul0y1W+L39CIZ0UnzySBa5Q==
X-Google-Smtp-Source: ABdhPJzB0Ca6IeAFm7nX17AldeXw82XTj2lvvGYh5jO1nS4wPy/iE0qMIHIZUoLfVNkqnHAY4Hqxpw==
X-Received: by 2002:a1c:a593:: with SMTP id o141mr3718420wme.88.1600938062413; 
 Thu, 24 Sep 2020 02:01:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w21sm2516264wmk.34.2020.09.24.02.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 02:01:01 -0700 (PDT)
Date: Thu, 24 Sep 2020 11:00:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 01/11] drm/ttm: add ttm_bo_pin()/ttm_bo_unpin() v2
Message-ID: <20200924090059.GZ438822@phenom.ffwll.local>
References: <20200922133208.1273-1-christian.koenig@amd.com>
 <CAPM=9tzhALOXZeuzGaaNS=ThrZNXLSZuaKYnp7XK7SyzX+8-yw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tzhALOXZeuzGaaNS=ThrZNXLSZuaKYnp7XK7SyzX+8-yw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Roland Scheidegger <sroland@vmware.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 01:01:14PM +1000, Dave Airlie wrote:
> On Tue, 22 Sep 2020 at 23:32, Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > As an alternative to the placement flag add a
> > pin count to the ttm buffer object.
> =

> These all look good to me, nice cleanup.
> =

> For the series:
> Reviewed-by: Dave Airlie <airlied@redhat.com>

Yeah I like, but plenty of review already so I wont bother.

I do wonder whether we should/could lift this one more level to
drm_gem_object, since cma/shmem gem helpers have this too.

But they have hand-rolled locking for it of dubious quality, and don't use
dma_resv_lock for any of this unfortunately. And I guess that would need
to be fixed first.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
