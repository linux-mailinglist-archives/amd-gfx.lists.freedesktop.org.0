Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D8186BC1
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 14:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405FD6E438;
	Mon, 16 Mar 2020 13:06:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Mon, 16 Mar 2020 09:05:06 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C676E394;
 Mon, 16 Mar 2020 09:05:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C95BF68CFC; Mon, 16 Mar 2020 10:05:03 +0100 (CET)
Date: Mon, 16 Mar 2020 10:05:03 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH  hmm 3/8] mm/hmm: do not call hmm_vma_walk_hole() while
 holding a spinlock
Message-ID: <20200316090503.GC12439@lst.de>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-4-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311183506.3997-4-jgg@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Mar 2020 13:06:56 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 03:35:01PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This eventually calls into handle_mm_fault() which is a sleeping function.
> Release the lock first.
> 
> hmm_vma_walk_hole() does not touch the contents of the PUD, so it does not
> need the lock.

So how did this manage to not be noticed before?

The fix looks fine assuming we want something backportable before
starting the cleanups:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
