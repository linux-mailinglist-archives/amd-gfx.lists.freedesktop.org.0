Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40B1AB927
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2020 09:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507BD6EB1D;
	Thu, 16 Apr 2020 07:01:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518B76EACE;
 Thu, 16 Apr 2020 06:43:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4DA8206D6;
 Thu, 16 Apr 2020 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587019423;
 bh=BKmhwxbmr2z9YCdItTQJHwRjKGeTBBS+eQgot1INXhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mWchGAC+vAFFSp6qh9NsLKsGlU90wq24zkjqWRuJQDRzI7cr9AxDmicO2eD+IzJ3c
 sGCzNz3JCiuBvIVBeRdXO2UQKyfJ3SXnfZbVTf7z3X6+UWo1V7dQ9GHa/KBptAxeB3
 icdyyi0gEO6PLAhNJ9+K2CaqqrQu1Y95AIUwfP44=
Date: Thu, 16 Apr 2020 08:43:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/3] kernel: better document the use_mm/unuse_mm API
 contract
Message-ID: <20200416064341.GB300290@kroah.com>
References: <20200416053158.586887-1-hch@lst.de>
 <20200416053158.586887-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416053158.586887-3-hch@lst.de>
X-Mailman-Approved-At: Thu, 16 Apr 2020 07:01:35 +0000
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Wang <jasowang@redhat.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 07:31:57AM +0200, Christoph Hellwig wrote:
> Switch the function documentation to kerneldoc comments, and add
> WARN_ON_ONCE asserts that the calling thread is a kernel thread and
> does not have ->mm set (or has ->mm set in the case of unuse_mm).
> 
> Also give the functions a kthread_ prefix to better document the
> use case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org> [usb]
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
