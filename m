Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA49218DF9D
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2020 11:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AD66E323;
	Sat, 21 Mar 2020 10:45:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714EF6E2DC;
 Sat, 21 Mar 2020 08:40:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 88FF168AFE; Sat, 21 Mar 2020 09:40:12 +0100 (CET)
Date: Sat, 21 Mar 2020 09:40:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 4/6] mm/hmm: remove HMM_FAULT_SNAPSHOT
Message-ID: <20200321084012.GD28695@lst.de>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-5-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320164905.21722-5-jgg@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:45 +0000
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

On Fri, Mar 20, 2020 at 01:49:03PM -0300, Jason Gunthorpe wrote:
> +	struct hmm_range *range = hmm_vma_walk->range;
>  	unsigned int required_fault = 0;
>  	unsigned long i;
>  
> -	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
> +	/*
> +	 * If there is no way for valid to be set in hmm_pte_need_fault() then
> +	 * don't bother to call it.
> +	 */
> +	if (!(((range->flags[HMM_PFN_VALID] & range->pfn_flags_mask) |
> +	       range->default_flags) &
> +	      range->flags[HMM_PFN_VALID]))

I think this needs to be split out into a well documented helper
function, as it is pretty much unreadable all cramed into a complex
conditional.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
