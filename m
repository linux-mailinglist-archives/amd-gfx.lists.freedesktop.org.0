Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2C312DC4
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Feb 2021 10:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788876E849;
	Mon,  8 Feb 2021 09:48:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C9C6E84B
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 09:48:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v15so16281413wrx.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Feb 2021 01:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BXDY2BPH9rDqDKuqWleKO56sThXOETuLCRblF1dToKA=;
 b=EKfwttYWJ0LSu1UFUbBORWjkxoyasw8dtu8fQZ5/0K8Lh1snb3piD4/eqn0le6nq2G
 XjScaDDEN/aMVpHE6olcUmeGB7/S0ykb2oeh6wPXvZnDjNm4JERJBGn4ed6SHE5zesdF
 NkcXdJgTI1snYwrSbheSlpQYustpk/+QdX77o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BXDY2BPH9rDqDKuqWleKO56sThXOETuLCRblF1dToKA=;
 b=O2oumCH8WfEyLvb69cMLExbWeuvhFOm4M96Fde8gS4ZbU18YVl2yx6clAGzRTBv036
 ski1Ix5XFYR7MBW5BK4J8KM8fikbgdZ/sG0gu5awpkJFCK6yf7gZX2Mp8tO0v89lRJip
 Cmn5El50+iojvv/uiKK/tSCXO/0FpBD5ElCuO3ygVJjUplpFK3uV0Eck4Jf8ncjojxJ1
 VPUW7fBEp1vCaKDwcd0fSLh+aidSICp1aOkQD1zSN82ErebVxCcAShMnbvx362eckTTp
 xxuSL+kxoq/Kgzd2nxoi1J8KsvLULXZm2Zr9LLDNhj51lCvyQgwnVURvCyEnTlDJWIxE
 1RoA==
X-Gm-Message-State: AOAM531ZgZE9b56rwxRy4dEHEzt8KWp/hAot7SLHPtI5gEq8uI+647Ln
 Sma0RPsNPmjAv3gyG6UXe2+m3w==
X-Google-Smtp-Source: ABdhPJymZ83c+O1UmIGH8ISDn2PZ5YiIy8tVPZg4O6fSyPXZJPtPRImK3jGVqRifvk7FrEIjroCDXA==
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr18447030wrt.85.1612777736177; 
 Mon, 08 Feb 2021 01:48:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y5sm8413138wmi.10.2021.02.08.01.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:48:55 -0800 (PST)
Date: Mon, 8 Feb 2021 10:48:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
Message-ID: <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
References: <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Anholt, Eric" <eric@anholt.net>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 10:37:19AM +0100, Christian K=F6nig wrote:
> Am 07.02.21 um 22:50 schrieb Daniel Vetter:
> > [SNIP]
> > > Clarification - as far as I know there are no page fault handlers for=
 kernel
> > > mappings. And we are talking about kernel mappings here, right ?  If =
there were
> > > I could solve all those issues the same as I do for user mappings, by
> > > invalidating all existing mappings in the kernel (both kmaps and iore=
amps)and
> > > insert dummy zero or ~0 filled page instead.
> > > Also, I assume forcefully remapping the IO BAR to ~0 filled page woul=
d involve
> > > ioremap API and it's not something that I think can be easily done ac=
cording to
> > > am answer i got to a related topic a few weeks ago
> > > https://www.spinics.net/lists/linux-pci/msg103396.html (that was the =
only reply
> > > i got)
> > mmiotrace can, but only for debug, and only on x86 platforms:
> > =

> > https://www.kernel.org/doc/html/latest/trace/mmiotrace.html
> > =

> > Should be feasible (but maybe not worth the effort) to extend this to
> > support fake unplug.
> =

> Mhm, interesting idea you guys brought up here.
> =

> We don't need a page fault for this to work, all we need to do is to inse=
rt
> dummy PTEs into the kernels page table at the place where previously the
> MMIO mapping has been.

Simply pte trick isn't enough, because we need:
- drop all writes silently
- all reads return 0xff

ptes can't do that themselves, we minimally need write protection and then
silently proceed on each write fault without restarting the instruction.
Better would be to only catch reads, but x86 doesn't do write-only pte
permissions afaik.

> > > > But ugh ...
> > > > =

> > > > Otoh validating an entire driver like amdgpu without such a trick
> > > > against 0xff reads is practically impossible. So maybe you need to =
add
> > > > this as one of the tasks here?
> > > Or I could just for validation purposes return ~0 from all reg reads =
in the code
> > > and ignore writes if drm_dev_unplugged, this could already easily val=
idate a big
> > > portion of the code flow under such scenario.
> > Hm yeah if your really wrap them all, that should work too. Since
> > iommappings have __iomem pointer type, as long as amdgpu is sparse
> > warning free, should be doable to guarantee this.
> =

> Problem is that ~0 is not always a valid register value.
> =

> You would need to audit every register read that it doesn't use the retur=
ned
> value blindly as index or similar. That is quite a bit of work.

Yeah that's the entire crux here :-/
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
