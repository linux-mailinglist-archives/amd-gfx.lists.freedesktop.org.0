Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D83B2835
	for <lists+amd-gfx@lfdr.de>; Thu, 24 Jun 2021 09:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256BF6EA1C;
	Thu, 24 Jun 2021 07:06:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31B6E99E
 for <amd-gfx@lists.freedesktop.org>; Thu, 24 Jun 2021 00:45:13 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id o6so10113018qkh.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Jun 2021 17:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EFcFEiW34m53hHVRH/hYAOinlbr3mbVvwuYYaYtTuh8=;
 b=G1KDqzwpGU22cmRZBgDHPWa87kbMIhmgX8Prq4EL0fmRPLBrFBeajfqHskFpu8RKTX
 yPnWNNhZxtgtf1LNFARLTco5JxjiV2oulGE5y/6osdL4RwXiUVMTAG5ut6nrvgtCxcyW
 WNdQQ1Be+uGC+xnXPFnIEB+CnxBIJjQavpHiEs+mnCS/UyCcFsHD23X3fg/71TBLMoTI
 hf7TgXvMgDwaZel4MR99dGUXP8aAPP1F5KANaExTx3B1Gzybwmv9QfKVsJCcbxExhAHC
 HBloe8ZRqPH9mLrrauCiklIS4IB5euV3NwN6tbG+Ga5k1mdv/+36MmqpccO7p5tm0V0m
 ZRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EFcFEiW34m53hHVRH/hYAOinlbr3mbVvwuYYaYtTuh8=;
 b=fNwnGQBDcn6SzIIFS9jemmmHdXX+CrGt9jHskcdnff+WgbIrVU1FRvXlhg3nbwEYVU
 aoB0Jhsx6d8MOp/WUQJ4QAk3cFTgx1YESEb3TXDv4a0/pixXEHvThD78qiZ6ExzC4pW0
 24QeQDS1tSP0uXUs3oeZGjt51+ucN7M3LqbpzCuvT1bE9jwglH+FTnIVpLIaaMPv3Pqm
 CTIE0XjDmIxuvB76EadSly3qyzJ14Bn6puOQoJ7Rd2F5r0nIx8qTYXJYt1EwyVhc+DlS
 Hm++44meFvUjk0CQtwpQL7dNntARsidhdCFPnFsErW2M9o7x+0mYN29FtrMJBKrjFxtL
 Ps1w==
X-Gm-Message-State: AOAM530dpeFbrNvCq7wRHuxOepNSN0FZDu6r3gSa6Axib2qqGzpDGjzA
 gUPyihxQuBWusVpMJBhMO0kWSA==
X-Google-Smtp-Source: ABdhPJyllJgYeDzAla5FLLIkN9PiWxiijQsV7UXnwLjZeIyw9AzKaK9eZnxQ5B0p88Zubn0YY0PqUA==
X-Received: by 2002:a37:b205:: with SMTP id b5mr3007100qkf.208.1624495512436; 
 Wed, 23 Jun 2021 17:45:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id n207sm1169771qka.101.2021.06.23.17.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 17:45:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lwDUV-00Bris-8h; Wed, 23 Jun 2021 21:45:11 -0300
Date: Wed, 23 Jun 2021 21:45:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210624004511.GA1096940@ziepe.ca>
References: <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
 <20210623185045.GY1096940@ziepe.ca>
 <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
 <20210623193456.GZ1096940@ziepe.ca>
 <CAFCwf13vM2T-eJUu42ht5jdXpRCF3UZh0Ow=vwN9QqZ=KNUBsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFCwf13vM2T-eJUu42ht5jdXpRCF3UZh0Ow=vwN9QqZ=KNUBsQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 24 Jun 2021 07:06:12 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Leon Romanovsky <leonro@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 10:39:48PM +0300, Oded Gabbay wrote:
> On Wed, Jun 23, 2021 at 10:34 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Jun 23, 2021 at 10:00:29PM +0300, Oded Gabbay wrote:
> > > On Wed, Jun 23, 2021 at 9:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Wed, Jun 23, 2021 at 09:43:04PM +0300, Oded Gabbay wrote:
> > > >
> > > > > Can you please explain why it is so important to (allow) access them
> > > > > through the CPU ?
> > > >
> > > > It is not so much important, as it reflects significant design choices
> > > > that are already tightly baked into alot of our stacks.
> > > >
> > > > A SGL is CPU accessible by design - that is baked into this thing and
> > > > places all over the place assume it. Even in RDMA we have
> > > > RXE/SWI/HFI1/qib that might want to use the CPU side (grep for sg_page
> > > > to see)
> > > >
> > > > So, the thing at the top of the stack - in this case the gaudi driver
> > > > - simply can't assume what the rest of the stack is going to do and
> > > > omit the CPU side. It breaks everything.
> > > >
> > > > Logan's patch series is the most fully developed way out of this
> > > > predicament so far.
> > >
> > > I understand the argument and I agree that for the generic case, the
> > > top of the stack can't assume anything.
> > > Having said that, in this case the SGL is encapsulated inside a dma-buf object.
> > >
> > > Maybe its a stupid/over-simplified suggestion, but can't we add a
> > > property to the dma-buf object,
> > > that will be set by the exporter, which will "tell" the importer it
> > > can't use any CPU fallback ? Only "real" p2p ?
> >
> > The block stack has been trying to do something like this.
> >
> > The flag doesn't solve the DMA API/IOMMU problems though.
> hmm, I thought using dma_map_resource will solve the IOMMU issues,
> no ?

dma_map_resource() will configure the IOMMU but it is not the correct
API to use when building a SG list for DMA, that would be dma_map_sg
or sgtable.

So it works, but it is an API abuse to build things this way.

> If I use dma_map_resource to set the addresses inside the SGL before I
> export the dma-buf, and guarantee no one will use the SGL in the
> dma-buf for any other purpose than device p2p, what else is needed ?

You still have to check the p2p stuff to ensure that p2p is even
possible

And this approach is misusing all the APIs and has been NAK'd by
Christoph, so up to Greg if he wants to take it or insist you work
with Logan to get the proper generlized solution finished.

Jason
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
