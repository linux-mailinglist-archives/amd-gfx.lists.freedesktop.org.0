Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F891188646
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2020 14:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C436E13F;
	Tue, 17 Mar 2020 13:50:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116BA89291;
 Tue, 17 Mar 2020 13:06:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3203068BFE; Tue, 17 Mar 2020 14:06:09 +0100 (CET)
Date: Tue, 17 Mar 2020 14:06:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH  hmm 8/8] mm/hmm: add missing call to
 hmm_pte_need_fault in HMM_PFN_SPECIAL handling
Message-ID: <20200317130608.GA13030@lst.de>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca> <20200316091347.GH12439@lst.de>
 <20200316121053.GP13183@mellanox.com> <20200316124953.GC17386@lst.de>
 <20200316130458.GQ13183@mellanox.com> <20200316131201.GA17955@lst.de>
 <20200317123210.GA12058@lst.de> <20200317125317.GT13183@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317125317.GT13183@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 17 Mar 2020 13:50:08 +0000
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

On Tue, Mar 17, 2020 at 09:53:17AM -0300, Jason Gunthorpe wrote:
> > Thinking out loud a bit more:
> > 
> >  - do we really need HMM_PFN_ERROR, or is just a return value from
> >    hmm_range_fault enough?
> 
> I'm not totally clear on this. The only use for ERROR is to signal to a
> non-faulting hmm_range_fault (ie shapshot) that the page should generate a 
> device fault (ie device SIGSEGV).
> 
> We can also handle ERROR by having the device take the fault to CPU,
> then fail during a faulting hmm_range_fault and then dropping the
> ERROR indication toward the device.
> 
> If we already know the page cannot be faulted when we read it it feels
> natural to return that too.

True.  Of course we could just stick an ERR_PTR into the page array
in this case.

> >  - because if it is we don't need output flags at all, and the output
> >    array could be struct pages, which would make for a much easier
> >    to use API
> 
> valid and write is required for the non-faulting case, I don't
> think flags can go away.

Do we have any cases where these aren't simply kept from the input array?
I couldn't find any, but I've not understood some of the subtle details
before.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
