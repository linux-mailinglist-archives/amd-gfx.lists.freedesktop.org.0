Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D929C1BC3C0
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Apr 2020 17:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FEF6E838;
	Tue, 28 Apr 2020 15:32:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5DA6E839
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Apr 2020 15:32:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z6so3365389wml.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Apr 2020 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=fyTgxWA2/HoMwR8ETQ07Hg4eZzNMuWdW9xEgr0yJj2c=;
 b=JnahAMhEEz80r2yHKCjybbTF6t6+SIYUFMUPAtQp+GL3mUUzkfUaqp5KTHLcTJv+bq
 P81fy3Eh2D06/VO0ChUgMzUqlCQznBNcz0ezSC/Grx8Mg9Ct3d9vHUd1Fi4rVLtYvIEe
 M0+tdFHnDzbT2poSNgYQX/Eonc2j0jEST5fYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=fyTgxWA2/HoMwR8ETQ07Hg4eZzNMuWdW9xEgr0yJj2c=;
 b=kRrGAOxEoBfDO3/gu6gBFQ+HTKKeuh2mw7Y4jUggrCZhOnmsGEVrhPBSAihsVFXfdn
 E4mu4Bd8ZwxCEbmAZtOtK3okPx+Vz650q/D015raTtsrJt6AwVWyxituExwGLeslCF9X
 /V1w1H1Yvz24wlXA5OUsAKbHrRS3hd8lK0rNSezo4mrV6GW4mZXFEoUCCfwIpaWs8HZB
 8OUoZDZI5opJxq7vT6HnrXL98MRIjy3rJ4cmX/u0tSoBFd1C0K3YOUH+YjRsZ/KTfJSO
 iAb5WAIlWrGyOYPbUqpHl6jAVVquxB57BJvurqa+KwSAkitNGaKyR5C4TruC/s2dHjCB
 PTLg==
X-Gm-Message-State: AGi0PuZQ+MAqS0rIyH/NrDYHgkOVYE7PralhOezkrzK8EwdfZDBoIIXd
 bTFzA8rR/rm4gW5UidOwIrBqVg==
X-Google-Smtp-Source: APiQypK6liIbViG0xJy6SG6E2JLUCRqc/Rd4DEdt0buwtJigcJZRTqgPIaD55s8f3mCsTYZkcr3q5w==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr5073523wma.24.1588087925505; 
 Tue, 28 Apr 2020 08:32:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm27283944wrf.31.2020.04.28.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:32:04 -0700 (PDT)
Date: Tue, 28 Apr 2020 17:32:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC 00/17] DRM: fix struct sg_table nents vs. orig_nents misuse
Message-ID: <20200428153202.GY3456981@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 intel-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>
References: <CGME20200428132022eucas1p2aa4716cbaca61c432ee8028be15fef7a@eucas1p2.samsung.com>
 <20200428132005.21424-1-m.szyprowski@samsung.com>
 <20200428140257.GA3433@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428140257.GA3433@lst.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 04:02:57PM +0200, Christoph Hellwig wrote:
> On Tue, Apr 28, 2020 at 03:19:48PM +0200, Marek Szyprowski wrote:
> > 1. introduce a dma_{map,sync,unmap}_sgtable() wrappers, which will use
> >    a proper sg_table entries and call respective DMA-mapping functions
> >    and adapt current code to it
> 
> That sounds reasonable to me.  Those could be pretty trivial wrappers.
> 
> >
> > 
> > 2. rename nents and orig_nents to nr_pages, nr_dmas to clearly state
> >    which one refers to which part of the scatterlist; I'm open for
> >    other names for those entries
> 
> nr_cpu_ents and nr_dma_ents might be better names, but it still would be
> a whole lot of churn for little gain.  I think just good wrappers like
> suggested above might be more helpful.

I guess long-term we could aim for both? I.e. roll out better wrappers
first, once that's soaked through the tree, rename the last offenders.

Personally I like nr_cpu_ents and nr_dma_ents, that's about as clear as it
gets.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
