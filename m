Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCA3481C9
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Mar 2021 20:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2686EA71;
	Wed, 24 Mar 2021 19:21:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F96C6EA71
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 19:21:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v11so25572372wro.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 12:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=tyRazDGir5x3TAuTtidSefO0V++5Y3T6e12HWHHxi8o=;
 b=ixY6eN/EJw9qDTzwkGIO/z4YdG6nIFOcJDyZPNJhy7h2OqrGebjpnGa71AjAUaw9Ti
 xQcFJfz2I5MkpZNdVDBc8/U/vkkvbwlvdoVz5I8Dkg1NsiDHG3Ba0efClwh8fjerERNL
 7Lg5lNbYmje5jKDhRmubW6Z/iISr8C+a6nZ6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=tyRazDGir5x3TAuTtidSefO0V++5Y3T6e12HWHHxi8o=;
 b=XL0kr4yMSjYFpSOeo+Ol1tw7aE4N1b3yB7QXBP5Pi3L4eFrTn7NOrLb1vd2hSWAi+h
 486FLjEAZPh2YdNHEWPCld8r08+uld4vt845CjKy5DZfYijWXqcfzHkMVrCdh0T7FYoZ
 XziL8pwRQreSEvFQQ65lP277jCXzfzpOr4yu7oN4r+Jeushu1a0LYrjqD5ASHloVrYBw
 Ii52YTVurytKIUIP3GB1HGE1AdVpBl0MZfRQMCfy0lpDyY3Qw49NR3uTZPQZJWdRHEH6
 iQkczNVc6ygb0DEvTeEpUoQRbhb8ECykzTEkZq9IesyS2O9QcM8kYdTscrr7ylOh2Ca/
 Z3CQ==
X-Gm-Message-State: AOAM532qKYnofDD6OZ/OtFNsi3w7B/hWcXVHznSrT/sTno3B2aLAHzYv
 irVe1I7tiJ+xYCkRJZInNgFKlw==
X-Google-Smtp-Source: ABdhPJxjXE/HNfEm4Qs9it8hgxmYAi7iB2AHMj8ATHq4jb2vtkgCIH7680kqcrvTjxyhE1o0GL1+IQ==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr5080022wrc.271.1616613659702; 
 Wed, 24 Mar 2021 12:20:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y205sm4094896wmc.18.2021.03.24.12.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 12:20:58 -0700 (PDT)
Date: Wed, 24 Mar 2021 20:20:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFuRGdLPF8FX0Be1@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Michal Hocko <mhocko@suse.com>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
References: <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
 <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
 <e5659cd0-61b2-82bd-64c3-76bd631b4522@amd.com>
 <YFoFdOtYDAezpSLv@dhcp22.suse.cz>
 <03889c00-bb5d-ef20-12c6-7e77df073dd9@amd.com>
 <762c4597-e9bd-6d8d-51b5-16b04f913eb8@shipmail.org>
 <YFsotY3HXmLNGF7p@phenom.ffwll.local>
 <488c8996-1dd2-4928-a98a-4e72f3e0af64@amd.com>
 <YFsqN7068vUL8rAM@phenom.ffwll.local>
 <31a52f86-e4af-f1d3-90b2-6eff8ec5f300@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31a52f86-e4af-f1d3-90b2-6eff8ec5f300@amd.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 01:07:44PM +0100, Christian K=F6nig wrote:
> =

> =

> Am 24.03.21 um 13:01 schrieb Daniel Vetter:
> > On Wed, Mar 24, 2021 at 01:00:28PM +0100, Christian K=F6nig wrote:
> > > Am 24.03.21 um 12:55 schrieb Daniel Vetter:
> > > > On Wed, Mar 24, 2021 at 11:19:13AM +0100, Thomas Hellstr=F6m (Intel=
) wrote:
> > > > > On 3/23/21 4:45 PM, Christian K=F6nig wrote:
> > > > > > Am 23.03.21 um 16:13 schrieb Michal Hocko:
> > > > > > > On Tue 23-03-21 14:56:54, Christian K=F6nig wrote:
> > > > > > > > Am 23.03.21 um 14:41 schrieb Michal Hocko:
> > > > > > > [...]
> > > > > > > > > Anyway, I am wondering whether the overall approach is
> > > > > > > > > sound. Why don't
> > > > > > > > > you simply use shmem as your backing storage from the
> > > > > > > > > beginning and pin
> > > > > > > > > those pages if they are used by the device?
> > > > > > > > Yeah, that is exactly what the Intel guys are doing for the=
ir
> > > > > > > > integrated
> > > > > > > > GPUs :)
> > > > > > > > =

> > > > > > > > Problem is for TTM I need to be able to handle dGPUs and th=
ose have all
> > > > > > > > kinds of funny allocation restrictions. In other words I ne=
ed to
> > > > > > > > guarantee
> > > > > > > > that the allocated memory is coherent accessible to the GPU
> > > > > > > > without using
> > > > > > > > SWIOTLB.
> > > > > > > > =

> > > > > > > > The simple case is that the device can only do DMA32, but y=
ou also got
> > > > > > > > device which can only do 40bits or 48bits.
> > > > > > > > =

> > > > > > > > On top of that you also got AGP, CMA and stuff like CPU cac=
he behavior
> > > > > > > > changes (write back vs. write through, vs. uncached).
> > > > > > > OK, so the underlying problem seems to be that gfp mask (thus
> > > > > > > mapping_gfp_mask) cannot really reflect your requirements, ri=
ght?=A0 Would
> > > > > > > it help if shmem would allow to provide an allocation callbac=
k to
> > > > > > > override alloc_page_vma which is used currently? I am pretty =
sure there
> > > > > > > will be more to handle but going through shmem for the whole =
life time
> > > > > > > is just so much easier to reason about than some tricks to ab=
use shmem
> > > > > > > just for the swapout path.
> > > > > > Well it's a start, but the pages can have special CPU cache set=
tings. So
> > > > > > direct IO from/to them usually doesn't work as expected.
> > > > > > =

> > > > > > Additional to that for AGP and CMA I need to make sure that I g=
ive those
> > > > > > pages back to the relevant subsystems instead of just dropping =
the page
> > > > > > reference.
> > > > > > =

> > > > > > So I would need to block for the swapio to be completed.
> > > > > > =

> > > > > > Anyway I probably need to revert those patches for now since th=
is isn't
> > > > > > working as we hoped it would.
> > > > > > =

> > > > > > Thanks for the explanation how stuff works here.
> > > > > Another alternative here that I've tried before without being suc=
cessful
> > > > > would perhaps be to drop shmem completely and, if it's a normal p=
age (no dma
> > > > > or funny caching attributes) just use add_to_swap_cache()? If it'=
s something
> > > > > else, try alloc a page with relevant gfp attributes, copy and
> > > > > add_to_swap_cache()? Or perhaps that doesn't work well from a shr=
inker
> > > > > either?
> > > > So before we toss everything and go an a great rewrite-the-world to=
ur,
> > > > what if we just try to split up big objects. So for objects which a=
re
> > > > bigger than e.g. 10mb
> > > > =

> > > > - move them to a special "under eviction" list
> > > > - keep a note how far we evicted thus far
> > > > - interleave allocating shmem pages, copying data and releasing the=
 ttm
> > > >     backing store on a chunk basis (maybe 10mb or whatever, tuning =
tbh)
> > > > =

> > > > If that's not enough, occasionally break out of the shrinker entire=
ly so
> > > > other parts of reclaim can reclaim the shmem stuff. But just releas=
ing our
> > > > own pages as we go should help a lot I think.
> > > Yeah, the later is exactly what I was currently prototyping.
> > > =

> > > I just didn't used a limit but rather a only partially evicted BOs li=
st
> > > which is used when we fail to allocate a page.
> > > =

> > > For the 5.12 cycle I think we should just go back to a hard 50% limit=
 for
> > > now and then resurrect this when we have solved the issues.
> > Can we do the 50% limit without tossing out all the code we've done thus
> > far? Just so this doesn't get too disruptive.
> =

> Yeah, I just need to get back to v1 of this patch. Before you convinced me
> that the shrinker is the better approach .)

I don't think there's anything else than the shrinker if you want
dynamically sized memory usage. Or pinning it all. Implementing our own
kswapd and not tying into direct reclaim does not sound like a good idea
to me.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
