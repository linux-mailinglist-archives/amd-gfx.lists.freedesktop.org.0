Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C648B41D60D
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Sep 2021 11:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0426EB54;
	Thu, 30 Sep 2021 09:13:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BC66EB6E
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 09:13:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so3783974wme.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=elEeaMy1+9KonQWqwwLNAlzYtOXt+PkIIF5xVf4W7iU=;
 b=RpyQc43teUEBvT9JUv6TY3eG4vK6FM3J7wuhrlTcN1QmT/aghUj5qJw2VxHXWUpxUq
 5wn/RraApaXmMbXeJs2W2H9heKSDMU7LZzEFnGHTgUN4vfbVY2zJ5esTgCApFAozZS8n
 qJwesz68hZ/+B0MKBuxlZmVAy7SjJpAnamEKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=elEeaMy1+9KonQWqwwLNAlzYtOXt+PkIIF5xVf4W7iU=;
 b=utazgfMwcuEbAqjwFwtFDvQ+FDqtfyn49QFACnJ5Ov9Hx4Vwsfy4AiSD2l926YQSQp
 2tYuxiMBTCf3RQj7X40pM73yMrGx3UkxM4vHxJOzfjlajpgXkxtQhC15Z9RjW6JIj598
 J6GI27h2vE3ITZ2O2ChHS1uLmG5td7zQDpCTSLQLK/oMHEo6N9ZeAdR9W5r9XdjecgqB
 Mdjx7c6EI/yxgkweb8TCC0JIrgBdKgu1iGMcGdfolB8XeelZBySGxIlWEoaDZIH5PfcG
 LVd50SmJ4wRpB1v67rtdryKlQqad42Y2hWZemTdgQ+YpxE1GExIir6TP9NxySz/Ls2g2
 HTEQ==
X-Gm-Message-State: AOAM5316mNNO7h6GzeYcn/U9qXCrQY2YQOxRMyHNRlw8uYGyk5HiKWZD
 i21c6ajY1dVegPrsJNpUsIIilg==
X-Google-Smtp-Source: ABdhPJyjl3VeEvqgrpXI1HnSJv/tX2ccaXjRCxWiO5hP7LA/fyTgLST6AdkigSP21R27lbj4q5oOGg==
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr14468560wme.32.1632993183602; 
 Thu, 30 Sep 2021 02:13:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r27sm2358165wrr.70.2021.09.30.02.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:13:03 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:13:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>, Yossi Leybovich <sleybo@amazon.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <YVV/nc4iQlQMtkS8@phenom.ffwll.local>
Mail-Followup-To: Oded Gabbay <ogabbay@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>,
 Yossi Leybovich <sleybo@amazon.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
 <20210914161218.GF3544071@ziepe.ca>
 <CAFCwf13322953Txr3Afa_MomuD148vnfpEog0xzW7FPWH9=6fg@mail.gmail.com>
 <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
 <20210916131014.GK3544071@ziepe.ca>
 <YUSKSHBC9uI49wZZ@phenom.ffwll.local>
 <CAFCwf12o-+wtbk8J8k8hP4_k0a8Lco4m9f4s1vBobkQwNtn39w@mail.gmail.com>
 <CAFCwf11UFVh-88Z=d=EH07_nx=3tf9kQkHhJ4pF6hfgO=80u0g@mail.gmail.com>
 <CAFCwf121CuNOesSRECUY9y7KWSGOZ2dHPCVvBqu8C4PCYj5PTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf121CuNOesSRECUY9y7KWSGOZ2dHPCVvBqu8C4PCYj5PTw@mail.gmail.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 28, 2021 at 10:04:29AM +0300, Oded Gabbay wrote:
> On Thu, Sep 23, 2021 at 12:22 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > On Sat, Sep 18, 2021 at 11:38 AM Oded Gabbay <ogabbay@kernel.org> wrote:
> > >
> > > On Fri, Sep 17, 2021 at 3:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, Sep 16, 2021 at 10:10:14AM -0300, Jason Gunthorpe wrote:
> > > > > On Thu, Sep 16, 2021 at 02:31:34PM +0200, Daniel Vetter wrote:
> > > > > > On Wed, Sep 15, 2021 at 10:45:36AM +0300, Oded Gabbay wrote:
> > > > > > > On Tue, Sep 14, 2021 at 7:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > > > > >
> > > > > > > > On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> > > > > > > > > On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > > > > > > > > > Hi,
> > > > > > > > > > Re-sending this patch-set following the release of our user-space TPC
> > > > > > > > > > compiler and runtime library.
> > > > > > > > > >
> > > > > > > > > > I would appreciate a review on this.
> > > > > > > > >
> > > > > > > > > I think the big open we have is the entire revoke discussions. Having the
> > > > > > > > > option to let dma-buf hang around which map to random local memory ranges,
> > > > > > > > > without clear ownership link and a way to kill it sounds bad to me.
> > > > > > > > >
> > > > > > > > > I think there's a few options:
> > > > > > > > > - We require revoke support. But I've heard rdma really doesn't like that,
> > > > > > > > >   I guess because taking out an MR while holding the dma_resv_lock would
> > > > > > > > >   be an inversion, so can't be done. Jason, can you recap what exactly the
> > > > > > > > >   hold-up was again that makes this a no-go?
> > > > > > > >
> > > > > > > > RDMA HW can't do revoke.
> > > > > >
> > > > > > Like why? I'm assuming when the final open handle or whatever for that MR
> > > > > > is closed, you do clean up everything? Or does that MR still stick around
> > > > > > forever too?
> > > > >
> > > > > It is a combination of uAPI and HW specification.
> > > > >
> > > > > revoke here means you take a MR object and tell it to stop doing DMA
> > > > > without causing the MR object to be destructed.
> > > > >
> > > > > All the drivers can of course destruct the MR, but doing such a
> > > > > destruction without explicit synchronization with user space opens
> > > > > things up to a serious use-after potential that could be a security
> > > > > issue.
> > > > >
> > > > > When the open handle closes the userspace is synchronized with the
> > > > > kernel and we can destruct the HW objects safely.
> > > > >
> > > > > So, the special HW feature required is 'stop doing DMA but keep the
> > > > > object in an error state' which isn't really implemented, and doesn't
> > > > > extend very well to other object types beyond simple MRs.
> > > >
> > > > Yeah revoke without destroying the MR doesn't work, and it sounds like
> > > > revoke by destroying the MR just moves the can of worms around to another
> > > > place.
> > > >
> > > > > > 1. User A opens gaudi device, sets up dma-buf export
> > > > > >
> > > > > > 2. User A registers that with RDMA, or anything else that doesn't support
> > > > > > revoke.
> > > > > >
> > > > > > 3. User A closes gaudi device
> > > > > >
> > > > > > 4. User B opens gaudi device, assumes that it has full control over the
> > > > > > device and uploads some secrets, which happen to end up in the dma-buf
> > > > > > region user A set up
> > > > >
> > > > > I would expect this is blocked so long as the DMABUF exists - eg the
> > > > > DMABUF will hold a fget on the FD of #1 until the DMABUF is closed, so
> > > > > that #3 can't actually happen.
> > > > >
> > > > > > It's not mlocked memory, it's mlocked memory and I can exfiltrate
> > > > > > it.
> > > > >
> > > > > That's just bug, don't make buggy drivers :)
> > > >
> > > > Well yeah, but given that habanalabs hand rolled this I can't just check
> > > > for the usual things we have to enforce this in drm. And generally you can
> > > > just open chardevs arbitrarily, and multiple users fighting over each
> > > > another. The troubles only start when you have private state or memory
> > > > allocations of some kind attached to the struct file (instead of the
> > > > underlying device), or something else that requires device exclusivity.
> > > > There's no standard way to do that.
> > > >
> > > > Plus in many cases you really want revoke on top (can't get that here
> > > > unfortunately it seems), and the attempts to get towards a generic
> > > > revoke() just never went anywhere. So again it's all hand-rolled
> > > > per-subsystem. *insert lament about us not having done this through a
> > > > proper subsystem*
> > > >
> > > > Anyway it sounds like the code takes care of that.
> > > > -Daniel
> > >
> > > Daniel, Jason,
> > > Thanks for reviewing this code.
> > >
> > > Can I get an R-B / A-B from you for this patch-set ?
> > >
> > > Thanks,
> > > Oded
> >
> > A kind reminder.
> >
> > Thanks,
> > Oded
> 
> Hi,
> I know last week was LPC and maybe this got lost in the inbox, so I'm
> sending it again to make sure you got my request for R-B / A-B.

I was waiting for some clarity from the maintainers summit, but that's
still about as unclear as it gets. Either way technically it sounds ok,
but I'm a bit burried so didn't look at the code.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But looking beyond the strict lens of dma-buf I'm still impressed by the
mess this created, to get to the same endpoint of "we open our stack" in
the same time it takes others to sort this out. I'm still looking for some
kind of plan to fix this.

Also you probably want to get Dave to ack this too, I pinged him on irc
last week about this after maintainer summit.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
