Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AC431164
	for <lists+amd-gfx@lfdr.de>; Mon, 18 Oct 2021 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C3F6E975;
	Mon, 18 Oct 2021 07:26:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7BF6E111
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 Oct 2021 18:21:01 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso5407905pjw.2
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 Oct 2021 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXbtM9w7wtLoZs3T6qJjqX2Ty4EbqqViT4Y7xCCz9a0=;
 b=2Tgma9fVZq0U5pzB5d+36fugnRWpKAv/vv+rd8TY+x55UKPcedrr3mcNfc9HXBvbun
 uQlo9RXfQ+zSC64+hvaj39yB4RzfudhW8ebr5TZUjs8P6f8o/iY3/E3pBSw+FmZg9r5H
 yrKODUnTdxhNkmkAk/E1YHkypi6Sv3jbpIibkuVlTjnnQeieoFMENC1NLaSK2u4SlvST
 ec4bQfrye0G7/+vvWyyX4A1WiflmgrwjfFh+W2cGmx0+/DneG46gr0nh4gtOHwTEyWHX
 64cN+swwvB62EGxeYvejuxtdCUCu6ZdwbaLZUn9QkYSKwCOSEQt5XvyOcToZImgWm8HS
 LudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXbtM9w7wtLoZs3T6qJjqX2Ty4EbqqViT4Y7xCCz9a0=;
 b=BMLggL1I1UOACyfzHFLlNgJiMVHKWY05YK7TfMT595doMAzEP6n/6wFCSB6p0RH0Lz
 byBrH534IG/bF19/mcVluIzde/Ng5GEMBXJqqFgjUTlpkn4t/X5ayBL6zTLAxgEklga9
 5SWT4dtMT9H+FB8o7/KhueBg+G1sUAN6Mz6bfM/21zz6BH25FzKzePMKgEJ82c+GTJrp
 315NRvcwOEQGK0V8tKH1HJIJAFfQkxztzrkgGvxhCK8xru21LkbhqFQHIuhaIreFPTe3
 Cdqqnwy4pJLReu1j4Ryo0rQMn8Clb8LQLXRPnMt0D0d3/3VXhy8brL4ujk8/cRbvxH4x
 PcvQ==
X-Gm-Message-State: AOAM532CTTRWCS+DMNxf24lCp9fSZBgY1ZM8nKQRWSzT/Q9SF32WUol7
 DTIQ6GyFJfKXkb2pMJa1imBGR9IZD3ZBmpvTM477tA==
X-Google-Smtp-Source: ABdhPJzU8zZ6l/YLNPvyqrKueTnR9hmDhm8Moze9Nm8sl5P7aCcyYqLsiPIbKOBjjU/+LKabzjZnafwYKZQAKYl1LZI=
X-Received: by 2002:a17:902:8a97:b0:13e:6e77:af59 with SMTP id
 p23-20020a1709028a9700b0013e6e77af59mr22550921plo.4.1634494860987; Sun, 17
 Oct 2021 11:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com> <YWh6PL7nvh4DqXCI@casper.infradead.org>
 <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
 <20211014230606.GZ2744544@nvidia.com>
 <CAPcyv4hC4qxbO46hp=XBpDaVbeh=qdY6TgvacXRprQ55Qwe-Dg@mail.gmail.com>
 <20211016154450.GJ2744544@nvidia.com> <YWsAM3isdPSv2S3E@casper.infradead.org>
In-Reply-To: <YWsAM3isdPSv2S3E@casper.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 17 Oct 2021 11:20:53 -0700
Message-ID: <CAPcyv4h-KxpwJtrM4VV64J7EPk9JCPeW27jtPXyArarfeo9noA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
To: Matthew Wilcox <willy@infradead.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alex Sierra <alex.sierra@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, 
 Linux MM <linux-mm@kvack.org>, Ralph Campbell <rcampbell@nvidia.com>, 
 linux-ext4 <linux-ext4@vger.kernel.org>, linux-xfs <linux-xfs@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, 
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
 Alistair Popple <apopple@nvidia.com>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Linux NVDIMM <nvdimm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Oct 2021 07:26:38 +0000
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

On Sat, Oct 16, 2021 at 9:39 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, Oct 16, 2021 at 12:44:50PM -0300, Jason Gunthorpe wrote:
> > Assuming changing FSDAX is hard.. How would DAX people feel about just
> > deleting the PUD/PMD support until it can be done with compound pages?
>
> I think there are customers who would find that an unacceptable answer :-)

No, not given the number of end users that ask for help debugging PMD support.
