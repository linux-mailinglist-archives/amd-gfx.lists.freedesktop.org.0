Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC16E5FA3F6
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Oct 2022 21:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879B310E708;
	Mon, 10 Oct 2022 19:08:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E60F10E6B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Oct 2022 18:56:40 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id x13so4675446qkg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Oct 2022 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mfdinePb/h+FQryCI1VnJk1iVMwwW9XbS8GRZ1SXnEM=;
 b=Y1FJnNxKCCmUeBjERypSSpOT5hLZIa3B6ZfL7TmeBlDcYn7G53u+wzaqGztD4xstS6
 H56NjZrTnnAs/mwbv/53uHY1GhzxoFxOLWj+6+255TR+XIgzukZ2wrhnTPfXH4rpl0ll
 x20RYa7gkPKPOAB+2GjUbYRf86UKilK/+RP5mPzo1iTwxgbIcI/NL1hAwcQva+CI+c58
 wXQg1m452/c0qjzqE/xGhDgd9xycIGhUX5tiX7SJhqTWnYftDSAsnXqQ0qceqqSNwxFf
 a0gsQbHVGj7OQXKVN8LpCmOTHmcWT/lMPoHErC7k7GBXJjyyytJ8h/nDzI7STIfMcpme
 CGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfdinePb/h+FQryCI1VnJk1iVMwwW9XbS8GRZ1SXnEM=;
 b=TrX2uxaaj0jX0qxEQ0z9Y2A95i5gDe6lrVy3qQjEYt9dPE7o0J5xaASQXKn9umb6j4
 RrjxaOhGf+nhW8y5daC86jboqDjmY61cM7M/Ve3NTBbZrLLyT5p0L7aKwsV78P54sjRy
 Itbwly5jeQLlADQQZKM0eE+XNQ01gEGHoGZWaYXOYGdkvQ6gsfj+WNiG5k7jpkjJdkK6
 xZJW4ZKfxEQkL78V8MaY+pY6hcGDGomPM3B5xwJldAYJDcXpZmFa95o14HtUwxyDpSjC
 yyKpA/z2DwC8QxLf6rutvDXCFe1tephDXFGXGFqXKxjLWYfERpGcKlJd96/5Td8reMKB
 z2IQ==
X-Gm-Message-State: ACrzQf0A3KGdDx3bACBneuq0szVmS9rDiL9ALjg4dfNDXFTFvEMiZp2r
 P1A9aFZRYSEI1n9EHOjFn2JmZg==
X-Google-Smtp-Source: AMsMyM4cq1ZiSompu2ffs6ddf24dPwkk/2Lnq1GVt1O6/KQn3scUPTnTqdwZ/uWcjL7riJrPyy9iDQ==
X-Received: by 2002:a05:620a:4397:b0:6e1:345a:e080 with SMTP id
 a23-20020a05620a439700b006e1345ae080mr13783062qkp.677.1665428198984; 
 Mon, 10 Oct 2022 11:56:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05620a288800b006bb2cd2f6d1sm10684472qkp.127.2022.10.10.11.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:56:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ohxx7-0012V5-CO;
 Mon, 10 Oct 2022 15:56:37 -0300
Date: Mon, 10 Oct 2022 15:56:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v6 10/21] RDMA/umem: Prepare to dynamic dma-buf locking
 specification
Message-ID: <Y0Rq5Zb9+63++2z/@ziepe.ca>
References: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
 <20220928191600.5874-11-dmitry.osipenko@collabora.com>
 <e3ba146d-8153-add5-2cf4-02fe6519abee@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3ba146d-8153-add5-2cf4-02fe6519abee@collabora.com>
X-Mailman-Approved-At: Mon, 10 Oct 2022 19:08:47 +0000
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ruhl Michael J <michael.j.ruhl@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Russell King <linux@armlinux.org.uk>, Daniel Stone <daniel@fooishbar.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>, Chia-I Wu <olvaffe@gmail.com>,
 linux-media@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, Oct 09, 2022 at 03:08:56AM +0300, Dmitry Osipenko wrote:
> On 9/28/22 22:15, Dmitry Osipenko wrote:
> > Prepare InfiniBand drivers to the common dynamic dma-buf locking
> > convention by starting to use the unlocked versions of dma-buf API
> > functions.
> > 
> > Acked-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  drivers/infiniband/core/umem_dmabuf.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> > index 04c04e6d24c3..43b26bc12288 100644
> > --- a/drivers/infiniband/core/umem_dmabuf.c
> > +++ b/drivers/infiniband/core/umem_dmabuf.c
> > @@ -26,7 +26,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
> >  	if (umem_dmabuf->sgt)
> >  		goto wait_fence;
> >  
> > -	sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
> > +	sgt = dma_buf_map_attachment_unlocked(umem_dmabuf->attach,
> > +					      DMA_BIDIRECTIONAL);
> >  	if (IS_ERR(sgt))
> >  		return PTR_ERR(sgt);
> >  
> > @@ -102,8 +103,8 @@ void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
> >  		umem_dmabuf->last_sg_trim = 0;
> >  	}
> >  
> > -	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> > -				 DMA_BIDIRECTIONAL);
> > +	dma_buf_unmap_attachment_unlocked(umem_dmabuf->attach, umem_dmabuf->sgt,
> > +					  DMA_BIDIRECTIONAL);
> >  
> >  	umem_dmabuf->sgt = NULL;
> >  }
> 
> Jason / Leon,
> 
> Could you please ack this patch?

You probably don't need it, for something so simple, but sure

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
