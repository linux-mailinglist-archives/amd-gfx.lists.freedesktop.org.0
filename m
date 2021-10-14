Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17942EA08
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Oct 2021 09:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2CF6ECD9;
	Fri, 15 Oct 2021 07:25:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FFC6E1A2;
 Thu, 14 Oct 2021 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AP05hDHW3jnp/8SKRcKLGgYaYjlel0b7xcFX3XAvvcQ=; b=WrkEY1NXq2B+vb3ir5rv+AxuPg
 cQLMnetlragb8L7WOZfh2WRUI5amnBlq8PlDunGKpTP6nGfIOIcYnWFF9UuTTFHIVKNRkM+vx+2Dy
 COMPWhQnxXy5qu73bdmTU7k0CJi1gGHXUvMqopwf5oBqTkX1+Q9pDzR3CrmrDDfC0EKlK4c8ZaMK7
 sDvAfPn5lhegMNYQnZ7pKkzJ51QUPqeOSUOnmsleGDbkMn9aU+nkXYPeWigSuK38OwbcmnkhuI+9K
 mGfn626q1LkPL8F2E1A8enzyO5vqH5MPRzxIZ3FVVVW2IH8w34E9HLHyAbDdNUkG177gXsh8NBe0L
 iOqMMBMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mb3y7-008TLK-Fz; Thu, 14 Oct 2021 16:52:58 +0000
Date: Thu, 14 Oct 2021 17:52:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com,
 jglisse@redhat.com, apopple@nvidia.com
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <YWhgU2vJfTN6XOyl@casper.infradead.org>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014153928.16805-3-alex.sierra@amd.com>
X-Mailman-Approved-At: Fri, 15 Oct 2021 07:25:38 +0000
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

On Thu, Oct 14, 2021 at 10:39:28AM -0500, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
