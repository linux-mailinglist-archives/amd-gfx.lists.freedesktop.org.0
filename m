Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F793B0B3B
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Jun 2021 19:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F426E817;
	Tue, 22 Jun 2021 17:14:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECAE6E5AE
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Jun 2021 15:34:24 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id c138so40570442qkg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Jun 2021 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XCGRlJxrxMvSvElmb3McFTndCdFsvf+0ulpFzwibisU=;
 b=RZ37oQ4xjDFsBnFcY5FzSe7ryg7I2xkkjLJIDG9pWBVE471HjG5oj7ZH9zwFfLGJjb
 isU5xI2gWvwgcxsSpN4N9oPCNXRQB2asF0okQeuH8sD+dvROpQfY4AHwM98x79x0O5xl
 ZpXizLnL5TT0sIZB14l2AEL6+cxTu/0iS8e2gKRKGAIznR6ADAbYKgLWRotpG3swQzzG
 sPAUUbB3nr22lLL4hUjaGnONeGbpSNdzAvtGoWJPME5FmLK3lnJIOmJMwP/op2rBS2Lj
 4wFM18A4nUtQ3yo7pekqZd2V3XFmCRuhVmjSEIT1tizi0WIzn3FvnpWdH0taoX8FMvhl
 NVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XCGRlJxrxMvSvElmb3McFTndCdFsvf+0ulpFzwibisU=;
 b=MO6f7dPAZP1ZDGTwEXZ6c+Im+mdLAD79YYZGfmp2pC1lHZt9AvX/s/0QoFnHsdhlGu
 KiUltKk8RiLFzH01Jo41HhDhKkGa3nk+XOPUtSshSZvY1rVGqINtEBZQmqTQW3Gdv34N
 nYjtRaQZUayfps1g1xX/BYjlCSfJIdMLpX/KrjU1kVN1fNrsY1oqeUZJp4psrZjUN1u0
 rzsVa9DEEY0nRZwejU6rOlFvCZtBf//Di+5sUPyK4iQ9E50BDHwl1Hshn6Bo3y9tVYvD
 R8lnDjAu6zo1UB7yY45rXg84+WbuKL6j98CnqdHGgk77rLt+FLEFIAuQqOUUGZFypKA7
 x+7g==
X-Gm-Message-State: AOAM5308WL9MQ4ADfSAEKyJ/5g799T9ItxlETV+2bYRs2lhHep31WS0U
 a++4qRpJ9sDbpCjcp7ioy8xDfw==
X-Google-Smtp-Source: ABdhPJwJRNWHrciXJvuIph1nNbis29uOgjU1s215LhOPous5t6/XyNtN7A0DRMo5coyKAYPFIA6QuA==
X-Received: by 2002:a37:a8c1:: with SMTP id r184mr4898379qke.129.1624376063270; 
 Tue, 22 Jun 2021 08:34:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id bk38sm7882443qkb.28.2021.06.22.08.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:34:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lviPu-00ADQh-9q; Tue, 22 Jun 2021 12:34:22 -0300
Date: Tue, 22 Jun 2021 12:34:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622153422.GR1096940@ziepe.ca>
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
 <20210622151142.GA2431880@ziepe.ca>
 <CAFCwf1361iVGeGtcc8WsQeFmHMWY+J6UNkzJnrodFrsOh9zgqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFCwf1361iVGeGtcc8WsQeFmHMWY+J6UNkzJnrodFrsOh9zgqQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 22 Jun 2021 17:13:59 +0000
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
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 06:24:28PM +0300, Oded Gabbay wrote:
> On Tue, Jun 22, 2021 at 6:11 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Jun 22, 2021 at 04:12:26PM +0300, Oded Gabbay wrote:
> >
> > > > 1) Setting sg_page to NULL
> > > > 2) 'mapping' pages for P2P DMA without going through the iommu
> > > > 3) Allowing P2P DMA without using the p2p dma API to validate that it
> > > >    can work at all in the first place.
> > > >
> > > > All of these result in functional bugs in certain system
> > > > configurations.
> > > >
> > > > Jason
> > >
> > > Hi Jason,
> > > Thanks for the feedback.
> > > Regarding point 1, why is that a problem if we disable the option to
> > > mmap the dma-buf from user-space ?
> >
> > Userspace has nothing to do with needing struct pages or not
> >
> > Point 1 and 2 mostly go together, you supporting the iommu is not nice
> > if you dont have struct pages.
> >
> > You should study Logan's patches I pointed you at as they are solving
> > exactly this problem.

> Yes, I do need to study them. I agree with you here. It appears I
> have a hole in my understanding.  I'm missing the connection between
> iommu support (which I must have of course) and struct pages.

Chistian explained what the AMD driver is doing by calling
dma_map_resource().

Which is a hacky and slow way of achieving what Logan's series is
doing.

> > No, the design of the dmabuf requires the exporter to do the dma maps
> > and so it is only the exporter that is wrong to omit all the iommu and
> > p2p logic.
> >
> > RDMA is OK today only because nobody has implemented dma buf support
> > in rxe/si - mainly because the only implementations of exporters don't
>
> Can you please educate me, what is rxe/si ?

Sorry, rxe/siw - these are the all-software implementations of RDMA
and they require the struct page to do a SW memory copy. They can't
implement dmabuf without it.

> ok...
> so how come that patch-set was merged into 5.12 if it's buggy ?

We only implemented true dma devices for RDMA DMABUF support, so it is
isn't buggy right now.

> Yes, that's what I expect to see. But I want to see it with my own
> eyes and then figure out how to solve this.

It might be tricky to test because you have to ensure the iommu is
turned on and has a non-idenity page table. Basically if it doesn't
trigger a IOMMU failure then the IOMMU isn't setup properly.

Jason
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
