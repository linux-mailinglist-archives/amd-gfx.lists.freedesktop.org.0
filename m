Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CB19754D
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2020 09:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F5E89F8B;
	Mon, 30 Mar 2020 07:12:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4566EAB5;
 Sat, 28 Mar 2020 08:11:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id ABAD168C4E; Sat, 28 Mar 2020 09:11:47 +0100 (CET)
Date: Sat, 28 Mar 2020 09:11:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 hmm 4/9] mm/hmm: remove HMM_FAULT_SNAPSHOT
Message-ID: <20200328081147.GB26015@lst.de>
References: <20200327200021.29372-1-jgg@ziepe.ca>
 <20200327200021.29372-5-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327200021.29372-5-jgg@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:12:05 +0000
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

On Fri, Mar 27, 2020 at 05:00:16PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> Now that flags are handled on a fine-grained per-page basis this global
> flag is redundant and has a confusing overlap with the pfn_flags_mask and
> default_flags.
> 
> Normalize the HMM_FAULT_SNAPSHOT behavior into one place. Callers needing
> the SNAPSHOT behavior should set a pfn_flags_mask and default_flags that
> always results in a cleared HMM_PFN_VALID. Then no pages will be faulted,
> and HMM_FAULT_SNAPSHOT is not a special flow that overrides the masking
> mechanism.
> 
> As this is the last flag, also remove the flags argument. If future flags
> are needed they can be part of the struct hmm_range function arguments.
> 
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>  Documentation/vm/hmm.rst                | 12 +++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c   |  2 +-
>  include/linux/hmm.h                     |  5 +----
>  mm/hmm.c                                | 17 +++++++++--------
>  5 files changed, 17 insertions(+), 21 deletions(-)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
