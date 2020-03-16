Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F462186BC6
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 14:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5C6E440;
	Mon, 16 Mar 2020 13:06:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE89D6E42B;
 Mon, 16 Mar 2020 12:49:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F22CC68CEC; Mon, 16 Mar 2020 13:49:53 +0100 (CET)
Date: Mon, 16 Mar 2020 13:49:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH  hmm 8/8] mm/hmm: add missing call to
 hmm_pte_need_fault in HMM_PFN_SPECIAL handling
Message-ID: <20200316124953.GC17386@lst.de>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca> <20200316091347.GH12439@lst.de>
 <20200316121053.GP13183@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316121053.GP13183@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Mar 2020 13:06:57 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 09:10:53AM -0300, Jason Gunthorpe wrote:
> On Mon, Mar 16, 2020 at 10:13:47AM +0100, Christoph Hellwig wrote:
> > On Wed, Mar 11, 2020 at 03:35:06PM -0300, Jason Gunthorpe wrote:
> > > From: Jason Gunthorpe <jgg@mellanox.com>
> > > 
> > > Currently if a special PTE is encountered hmm_range_fault() immediately
> > > returns EFAULT and sets the HMM_PFN_SPECIAL error output (which nothing
> > > uses).
> > > 
> > > EFAULT should only be returned after testing with hmm_pte_need_fault().
> > > 
> > > Also pte_devmap() and pte_special() are exclusive, and there is no need to
> > > check IS_ENABLED, pte_special() is stubbed out to return false on
> > > unsupported architectures.
> > 
> > I think the right fix is to just kill HMM_PFN_SPECIAL and treat any
> > fault on special ptes that aren't the zero page as an error.
>  
> I have another series that is doing that - this change is to make the
> next series make sense and not introduce new control logic too.

Ok.  I had some cleanups like this based of older trees, but if you are
active in this area I think I'll let you handle it.

> Even when this is switched to ERROR it still needs to have the
> hmm_range_fault() logic this patch introduces.

True.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
