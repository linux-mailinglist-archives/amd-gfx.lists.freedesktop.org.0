Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2743AF50D
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 20:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8E66E364;
	Mon, 21 Jun 2021 18:27:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974356E364
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 18:27:45 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s23so20902661oiw.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9i28EclvSZx+uiFhNgb+3CTRZV2qMxp0Q3wXipsI8Q=;
 b=K0UUo78vVrHTzSDrMgj0jT+MLT+AozMScbVhmJ6rhysrPfzfwQKb0T9CTxpGrXfVIc
 t5jj9sX3IfqrbDRI8CthGXRxYKpUQX+02UsBeDhQ6gGIxzzzrj03gPnZr1/CyOuvjIls
 QcmPSnajwhf1oF905MYpKHACKSXHp6adH5P4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9i28EclvSZx+uiFhNgb+3CTRZV2qMxp0Q3wXipsI8Q=;
 b=AUa8H43QK0AQY4auAoCVHUZhQ4y4gvDBY/hkb8kyY6UnfffOB0yvb0kMCn/KZYHIxe
 9h9TD9gRqVWHhuir77Wy/CzKBy9H2IKC2Kh0jtXebz8kQnJP2iYZq7Dkw5/oxyRotV2R
 QHiu2JgPJkOVmoSqybt2ShoTP3ZcesRBgxeosJSeh4aZ9ayyL/ZdVKenDcw66tqc26AO
 sLjCI9VqPm8AGCccs3DE/irU7nwZ3BacoLuifq6VtOrVawwdtrjt08/FjEhYBEgG74ix
 jPdUPi8d1Av3o7dd29s1y0+YeVtE4U9wm+F2Epm3H52bKNYpExKM0FWpJ7ZUIot+0pTZ
 I91Q==
X-Gm-Message-State: AOAM5305WDBdBVmEKDxU5loi3Qy8b8vQCANBDullRqWiWdirHRJnj+/M
 1GdJV520g8Tvbbi3Tm3XiDRRaQWrJFIva18gyVqt3g==
X-Google-Smtp-Source: ABdhPJwgGuTgLpKPpXIxr+AX3ujExHAGAGTWRhPWtYA2l25rchz9pzcPelTwjoCbaEdcWSxXHh9lYgsv8xRxuaFrFw8=
X-Received: by 2002:a54:4889:: with SMTP id r9mr11213515oic.101.1624300063935; 
 Mon, 21 Jun 2021 11:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
In-Reply-To: <20210621175511.GI1096940@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 21 Jun 2021 20:27:32 +0200
Message-ID: <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Oded Gabbay <oded.gabbay@gmail.com>, Gal Pressman <galpress@amazon.com>,
 sleybo@amazon.com, linux-rdma <linux-rdma@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Oded Gabbay <ogabbay@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 7:55 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Mon, Jun 21, 2021 at 07:26:14PM +0300, Oded Gabbay wrote:
> > On Mon, Jun 21, 2021 at 5:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> > > > On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:
> > >
> > > > > Also I'm wondering which is the other driver that we share buffers
> > > > > with. The gaudi stuff doesn't have real struct pages as backing
> > > > > storage, it only fills out the dma_addr_t. That tends to blow up with
> > > > > other drivers, and the only place where this is guaranteed to work is
> > > > > if you have a dynamic importer which sets the allow_peer2peer flag.
> > > > > Adding maintainers from other subsystems who might want to chime in
> > > > > here. So even aside of the big question as-is this is broken.
> > > >
> > > > From what I can tell this driver is sending the buffers to other
> > > > instances of the same hardware,
> > >
> > > A dmabuf is consumed by something else in the kernel calling
> > > dma_buf_map_attachment() on the FD.
> > >
> > > What is the other side of this? I don't see any
> > > dma_buf_map_attachment() calls in drivers/misc, or added in this patch
> > > set.
> >
> > This patch-set is only to enable the support for the exporter side.
> > The "other side" is any generic RDMA networking device that will want
> > to perform p2p communication over PCIe with our GAUDI accelerator.
> > An example is indeed the mlnx5 card which has already integrated
> > support for being an "importer".
>
> It raises the question of how you are testing this if you aren't using
> it with the only intree driver: mlx5.

For p2p dma-buf there's also amdgpu as a possible in-tree candiate
driver, that's why I added amdgpu folks. Otoh I'm not aware of AI+GPU
combos being much in use, at least with upstream gpu drivers (nvidia
blob is a different story ofc, but I don't care what they do in their
own world).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
