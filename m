Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F31A7B53
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Apr 2020 14:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9E36E199;
	Tue, 14 Apr 2020 12:52:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977C86E13B
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Apr 2020 12:52:24 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id i27so9705019ota.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Apr 2020 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idICXkJz74c7neHkFNePvVgcEywM92lHIYRxNNra+ik=;
 b=AysPXwu5jTUfa1VDz4/pasjtYQL4Ei1kOikX9A30tHaFk0XOjuonU//xrGlAiIcEPD
 CNktfG9lG9AnPftdTGEvxz5fY7N6jEWlt2I3stICIfIhscN2XWUwmiE5JBDtgAE+9nlG
 CEZFC/EdJVU2uAGihdcQvkCAuc3FFtMCuQUqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idICXkJz74c7neHkFNePvVgcEywM92lHIYRxNNra+ik=;
 b=n9zYJqUVM+S/jrWmjyqBg3PhApO8m3ZXbDxA5798CfrL5fsgYeZmjm6lRZ6yys8GBY
 oFyYbVE+SHOW6+V/BzCeTM/qw2ffhSmpJjAOVecxznHHndJM7cCSZSRa27RRfPR4wZ2h
 EtKrULwoE6ybWvsXWaeMq6nodLHy7dQdhoXpPy6MaLnN7gNkAqkbELxPeFesmFxryAd5
 v+3t+f3qDJ8ISZ//IzqoVceb0EcjzGCQaCBqwDXoNbSEdXKjrR1xZhFBhb1ZDun/E3ym
 gOehTsZyqzUbVUF/qqZeFHVpQs1EUJgnHMrkhTQqRqZjCStJoyWtSdAOZTANK92Q2U7n
 lg7w==
X-Gm-Message-State: AGi0PuapVSZaZ4Zp4iCGyDvNLuuvlBIkW1hzgqOrGoZQVZlHiHeJ9oyA
 FFB9LVHd1EqDYbi3IzBM3BfmLnqgqReaCgGzbsw7dw==
X-Google-Smtp-Source: APiQypIRhavDU8SB9YPvvZ0Vo+SQlCg+mOyD0qnxtqXhdtlpLUrrl6Hgm8wTyMthv444nZmNp8f+5IWiEIqgv4zy4Qc=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr19284790ota.281.1586868743794; 
 Tue, 14 Apr 2020 05:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
 <20200413191136.GI60335@mtj.duckdns.org>
 <20200414122015.GR3456981@phenom.ffwll.local>
 <CAOWid-f-XWyg0o3znH28xYndZ0OMzWfv3OOuWw08iJDKjrqFGA@mail.gmail.com>
In-Reply-To: <CAOWid-f-XWyg0o3znH28xYndZ0OMzWfv3OOuWw08iJDKjrqFGA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 14 Apr 2020 14:52:12 +0200
Message-ID: <CAKMK7uEs5QvUrxKcTFksO30D+x=XJnV+_TA-ebawcihtLqDG0Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
To: Kenny Ho <y2kenny@gmail.com>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, dri-devel <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 2:47 PM Kenny Ho <y2kenny@gmail.com> wrote:
> On Tue, Apr 14, 2020 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > My understanding from talking with a few other folks is that
> > the cpumask-style CU-weight thing is not something any other gpu can
> > reasonably support (and we have about 6+ of those in-tree)
>
> How does Intel plan to support the SubDevice API as described in your
> own spec here:
> https://spec.oneapi.com/versions/0.7/oneL0/core/INTRO.html#subdevice-support

I can't talk about whether future products might or might not support
stuff and in what form exactly they might support stuff or not support
stuff. Or why exactly that's even in the spec there or not.

Geez
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
