Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCCD3A1E03
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Jun 2021 22:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55396EAE1;
	Wed,  9 Jun 2021 20:16:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654826EAC1;
 Wed,  9 Jun 2021 19:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UH3lAzOdTh+IWIakCPK1+pjcs9tc455Ii5H0NpMj5HQ=; b=UOr7TeU72onoL1BADvA8sludVR
 O0O0b/bAG0JaDE3AANqu6LVvKzTyrjkyzKnK7AV4hfgUgCxky0b15Wq22z0cub5XH3UDDpbeV0k1h
 cl+iY0ZAzjh+Z0q1zAmzBxxKMj4SY6xBc1TWMIlzXkMVXlCj7V6huXkWai0rvBmRiT2ini4+NVIep
 jSeXlbTZLehdxPApYe2d+Dvo0CP7qEML19dIH18MPzv1na1AA03Ck6hS3A9Wi7nqLe2JCD5+bE3MP
 4RH8ZIMezLLC+mmKRDHrNL6g3Ok7ddxb34dlgNGxO2Q4UL2UFbBW+riLGJBNGIaGbxyF3zXA0cpO8
 3wN3c47g==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lr3nb-000pwc-KT; Wed, 09 Jun 2021 19:23:38 +0000
Date: Wed, 9 Jun 2021 20:23:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [RFC PATCH v2 1/8] ext4/xfs: add page refcount helper
Message-ID: <YMEVN8XZbCnyPu9/@casper.infradead.org>
References: <20210607204226.7743-1-alex.sierra@amd.com>
 <20210607204226.7743-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607204226.7743-2-alex.sierra@amd.com>
X-Mailman-Approved-At: Wed, 09 Jun 2021 20:16:21 +0000
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 03:42:19PM -0500, Alex Sierra wrote:
> +++ b/include/linux/dax.h
> @@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
>  	return mapping->host && IS_DAX(mapping->host);
>  }
>  
> +static inline bool dax_layout_is_idle_page(struct page *page)
> +{
> +	return page_ref_count(page) == 1;
> +}

We already have something called an idle page, and that's quite a
different thing from this.  How about dax_page_unused() (it's a use
count, so once it's got down to its minimum value, it's unused)?

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
