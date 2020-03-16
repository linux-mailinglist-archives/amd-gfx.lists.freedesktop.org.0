Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECA186BBE
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 14:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4EE89F1B;
	Mon, 16 Mar 2020 13:06:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124AE6E398
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Mar 2020 09:08:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3CA4768CEC; Mon, 16 Mar 2020 09:58:03 +0100 (CET)
Date: Mon, 16 Mar 2020 09:58:03 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH  hmm 1/8] mm/hmm: add missing unmaps of the ptep during
 hmm_vma_handle_pte()
Message-ID: <20200316085803.GA12439@lst.de>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-2-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311183506.3997-2-jgg@ziepe.ca>
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
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 03:34:59PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> Many of the direct returns of error skipped doing the pte_unmap(). All non
> zero exit paths must unmap the pte.
> 
> The pte_unmap() is split unnaturally like this because some of the error
> exit paths trigger a sleep and must release the lock before sleeping.
> 
> Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
> Fixes: 53f5c3f489ec ("mm/hmm: factor out pte and pmd handling to simplify hmm_vma_walk_pmd()")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Probably papered over by the fact that hmm doesn't work on architectures
where pte_unmap isn't a noop right now..
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
