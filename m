Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF421A010
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jul 2020 14:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4346E42F;
	Thu,  9 Jul 2020 12:31:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9786EA5C
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2020 12:31:51 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id r8so1727837oij.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Jul 2020 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KiDJy6GOzF4hs3a4674ttNieH4VUalBdDZ/NwtwQZfA=;
 b=hvfEgjektFUBLSyqNgVq58lvaqS8oXwNqH7adCVDeFOG1FihOfDKIk82d6Al7lPH+z
 FU6TNlodJuCQP8ZaqS8KwOZ/4iZAYz0ym2tgiLvm14hq3iDakbejFKFdAsWHxPEM+3mz
 ReXmbWjUtPlLLIQhYjyUgm8Ql7hNnMAWBp+Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KiDJy6GOzF4hs3a4674ttNieH4VUalBdDZ/NwtwQZfA=;
 b=o7KDia+MzXX6DabkZ31w5ZU9Q717lLUINHnS25feFS8WhQbhGDt11LNVYzpsxr3Wm0
 RBZghJv9PHflxyMrMfgmCg4lVdJ1Rl7zqrh/qia4mjPEFM7ECKHGk52Zwmeb6tbDH2UE
 i0z8UOl2VrM4J95UtV9qhCMIicKztCzt+qKVqbt2T1e2H+18IHvPvOnvV5Q+ccfYFfnG
 z0Rz6D46aefaHC34kgsc//ZjEtG+y8E5MLpsJwxz8zMXkT1alTGt3uYLfKhTkh0UjSLw
 WexzRBGdPehjS4GCaxB3CPLyE6Ai6KqjKK/jJFI5F7r1pKMdALwp1T2t0gHWTtv/Uixp
 nWvg==
X-Gm-Message-State: AOAM532SDcKGjn6OuV/OARqaBW4l91c8gOyUgefvpLpDnPi7bxH+CGLL
 sBsFmynkpr8pLSvrNkuVNFDC9ujAr/29O3REAX2ZHA==
X-Google-Smtp-Source: ABdhPJyI8E36+f5KGCTBz5yAx5csIil50BdgW5wTbo9ROaoMlgEYYqX4Zh0y84Cd5mvEYHzda2RKPPkUVIvSpgCpuaU=
X-Received: by 2002:aca:da03:: with SMTP id r3mr11062166oig.14.1594297910510; 
 Thu, 09 Jul 2020 05:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <CAPj87rO4mm-+sQbP07cgM8-=b6Q8Jbh5G0FsV8rwYx2hnEzPkA@mail.gmail.com>
 <20200709080458.GO3278063@phenom.ffwll.local>
 <CAPj87rPtD04099=sBzL2jKN6NNFNnM-hH3qfOLL10nPoF==VbA@mail.gmail.com>
In-Reply-To: <CAPj87rPtD04099=sBzL2jKN6NNFNnM-hH3qfOLL10nPoF==VbA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 9 Jul 2020 14:31:39 +0200
Message-ID: <CAKMK7uG6T+86+11CKpRpEY8v6_Xrm=hWv01tzPPLHq_H7p-AuA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/25] dma-buf.rst: Document why idenfinite
 fences are a bad idea
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 2:11 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Thu, 9 Jul 2020 at 09:05, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Jul 09, 2020 at 08:36:43AM +0100, Daniel Stone wrote:
> > > On Tue, 7 Jul 2020 at 21:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > Comes up every few years, gets somewhat tedious to discuss, let's
> > > > write this down once and for all.
> > >
> > > Thanks for writing this up! I wonder if any of the notes from my reply
> > > to the previous-version thread would be helpful to more explicitly
> > > encode the carrot of dma-fence's positive guarantees, rather than just
> > > the stick of 'don't do this'. ;) Either way, this is:
> >
> > I think the carrot should go into the intro section for dma-fence, this
> > section here is very much just the "don't do this" part. The previous
> > patches have an attempt at encoding this a bit, maybe see whether there's
> > a place for your reply (or parts of it) to fit?
>
> Sounds good to me.
>
> > > Acked-by: Daniel Stone <daniels@collabora.com>
> > >
> > > > What I'm not sure about is whether the text should be more explicit in
> > > > flat out mandating the amdkfd eviction fences for long running compute
> > > > workloads or workloads where userspace fencing is allowed.
> > >
> > > ... or whether we just say that you can never use dma-fence in
> > > conjunction with userptr.
> >
> > Uh userptr is entirely different thing. That one is ok. It's userpsace
> > fences or gpu futexes or future fences or whatever we want to call them.
> > Or is there some other confusion here?.
>
> I mean generating a dma_fence from a batch which will try to page in
> userptr. Given that userptr could be backed by absolutely anything at
> all, it doesn't seem smart to allow fences to rely on a pointer to an
> mmap'ed NFS file. So it seems like batches should be mutually
> exclusive between arbitrary SVM userptr and generating a dma-fence?

Locking is Tricky (tm) but essentially what at least amdgpu does is
pull in the backing storage before we publish any dma-fence. And then
some serious locking magic to make sure that doesn't race with a core
mm invalidation event. So for your case here the cs ioctl just blocks
until the nfs pages are pulled in.

Once we've committed for the dma-fence it's only the other way round,
i.e. core mm will stall on the dma-fence if it wants to throw out
these pages again. More or less at least. That way we never have a
dma-fence depending upon any core mm operations. The only pain here is
that this severely limits what you can do in the critical path towards
signalling a dma-fence, because the tldr is "no interacting with core
mm at all allowed".

> Speaking of entirely different things ... the virtio-gpu bit really
> doesn't belong in this patch.

Oops, dunno where I lost that as a sparate patch. Will split out again :-(
-Daniel

>
> Cheers,
> Daniel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
