Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2533ECF16
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Aug 2021 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE4D89C25;
	Mon, 16 Aug 2021 07:13:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFAE89D40;
 Sun, 15 Aug 2021 15:40:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A1BF167357; Sun, 15 Aug 2021 17:40:47 +0200 (CEST)
Date: Sun, 15 Aug 2021 17:40:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com,
 jglisse@redhat.com, Roger Pau Monne <roger.pau@citrix.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v6 08/13] mm: call pgmap->ops->page_free for
 DEVICE_GENERIC pages
Message-ID: <20210815154047.GC32384@lst.de>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-9-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813063150.2938-9-alex.sierra@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Aug 2021 07:13:00 +0000
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

On Fri, Aug 13, 2021 at 01:31:45AM -0500, Alex Sierra wrote:
> Add MEMORY_DEVICE_GENERIC case to free_zone_device_page callback.
> Device generic type memory case is now able to free its pages properly.

How is this going to work for the two existing MEMORY_DEVICE_GENERIC
that now change behavior?  And which don't have a ->page_free callback
at all?

> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  mm/memremap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 5aa8163fd948..5773e15b6ac9 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -459,7 +459,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -static void free_device_private_page(struct page *page)
> +static void free_device_page(struct page *page)
>  {
>  
>  	__ClearPageWaiters(page);
> @@ -498,7 +498,8 @@ void free_zone_device_page(struct page *page)
>  		wake_up_var(&page->_refcount);
>  		return;
>  	case MEMORY_DEVICE_PRIVATE:
> -		free_device_private_page(page);
> +	case MEMORY_DEVICE_GENERIC:
> +		free_device_page(page);
>  		return;
>  	default:
>  		return;
> -- 
> 2.32.0
---end quoted text---
