Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD4818DF93
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2020 11:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4746E311;
	Sat, 21 Mar 2020 10:44:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D1B6E2DD;
 Sat, 21 Mar 2020 08:37:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CBF5668AFE; Sat, 21 Mar 2020 09:37:26 +0100 (CET)
Date: Sat, 21 Mar 2020 09:37:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 2/6] mm/hmm: return the fault type from
 hmm_pte_need_fault()
Message-ID: <20200321083726.GB28695@lst.de>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-3-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320164905.21722-3-jgg@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:44 +0000
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

On Fri, Mar 20, 2020 at 01:49:01PM -0300, Jason Gunthorpe wrote:
> +enum {
> +	NEED_FAULT = 1 << 0,
> +	NEED_WRITE_FAULT = 1 << 1,
> +};

Maybe add a HMM_ prefix?

>  	for (i = 0; i < npages; ++i) {
> +		required_fault |=
> +			hmm_pte_need_fault(hmm_vma_walk, pfns[i], cpu_flags);
> +		if (required_fault == (NEED_FAULT | NEED_WRITE_FAULT))
> +			return required_fault;

No need for the inner braces.

> @@ -532,17 +515,15 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
>  	 */
>  	if ((vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP)) ||
>  	    !(vma->vm_flags & VM_READ)) {
> -		bool fault, write_fault;
> -

No that there is no need for local variables I'd invert the test and
return early:

	if ((vma->vm_flags & VM_READ) &&
	    !(vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP))
		return 0;

>  		/*
>  		 * Check to see if a fault is requested for any page in the
>  		 * range.
>  		 */
> -		hmm_range_need_fault(hmm_vma_walk, range->pfns +
> -					((start - range->start) >> PAGE_SHIFT),
> -					(end - start) >> PAGE_SHIFT,
> -					0, &fault, &write_fault);
> -		if (fault || write_fault)
> +		if (hmm_range_need_fault(hmm_vma_walk,
> +					 range->pfns +
> +						 ((start - range->start) >>
> +						  PAGE_SHIFT),
> +					 (end - start) >> PAGE_SHIFT, 0))

Which should help to make this a little more readable..
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
