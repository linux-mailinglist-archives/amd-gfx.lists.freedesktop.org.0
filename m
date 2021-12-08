Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED61846EDB3
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Dec 2021 17:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C674C10E117;
	Thu,  9 Dec 2021 16:52:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411486F4FF
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Dec 2021 13:53:48 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id v22so2205194qtx.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Dec 2021 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n9Y+oLn3kk/oxvbwaSHPA0YUJg6Lr4J3Kc7nJ3JG/nE=;
 b=GoexrLnjj1VsVdZoaP5pXTc9vHNtb3FB/yqoPYxnUbJ+/S+d+vBnWe6dlAY4RUbiHb
 YEIRVrACKQidTrAVCzxZrfgOkALMUBdtNg3xnk5TlFEnnLGZIYssGyDfwIuVAmGISuRj
 VArI6DY0phSTcH16IZiubLx6kuEL//Sf3bK1iiUeL66xetRRuTIHb52KOy53R2oEnBsl
 5+9PifTqlvZzWLgqbsPTPkl9yTPcJbID5QJXtWjjg3Kj9lp7EXRSfLCsT2fqIsqnCxOl
 Yx7nCNwEt1VOHHNcJ4MNJdMatjqwgaaioDRXeq68Gv72oT5rChdSGBcB6jERNyYT7WNq
 Zk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n9Y+oLn3kk/oxvbwaSHPA0YUJg6Lr4J3Kc7nJ3JG/nE=;
 b=6mlWCrVGoospNhpHjw1uP0gSk45J//WlFWexZOH4U2ZpYqWGzBXUEPkUu5y2MtYImB
 4TQ5vgncyKyfjnyfmiHEph/Nw2MX/3ho71e7Tc+hovn7T+p8EycGAKuRNLnvYWxnAxGE
 fcHNwUOmx3jzvjeovykqJd9n5Ybdz/GV1ByB9IOZePbFNt/s4BIJ5DEjghxCL3Bvs/mD
 G3u1by6b/MPbKdE9fPGKnHyHc6iq83YtQXAOmIEFhbPb/3R6dl3wB6que8aO2VvjU6Ji
 JL81fSXITFUuFTGlgcdNswhydGE2B2rjovqvwFVP3TIEN4Wu9a0OXC6txBOHlhv5nrGO
 iQwA==
X-Gm-Message-State: AOAM532PF676gRnlXXh+hW2joiQ2PIAxqLxzxsETgdznlds08ROjoB47
 /TSr8/JwQ+Nit1z1TX8TYmii7g==
X-Google-Smtp-Source: ABdhPJyYKvKS0NpCR6PWWVWY6+Vf6yq8PVBWsAJ1cY1C/Ayv7lr1154+ZV+fGaKDlVe8F/mvWjHimA==
X-Received: by 2002:a05:622a:4ca:: with SMTP id
 q10mr8015431qtx.631.1638971627307; 
 Wed, 08 Dec 2021 05:53:47 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id c7sm1763527qtc.32.2021.12.08.05.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 05:53:46 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1muxOD-000nGF-Ki; Wed, 08 Dec 2021 09:53:45 -0400
Date: Wed, 8 Dec 2021 09:53:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Message-ID: <20211208135345.GC6467@ziepe.ca>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-4-alex.sierra@amd.com>
 <2858338.J0npWUQLIM@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2858338.J0npWUQLIM@nvdebian>
X-Mailman-Approved-At: Thu, 09 Dec 2021 08:23:15 +0000
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 10:31:58PM +1100, Alistair Popple wrote:
> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
> > Avoid long term pinning for Coherent device type pages. This could
> > interfere with their own device memory manager.
> > If caller tries to get user device coherent pages with PIN_LONGTERM flag
> > set, those pages will be migrated back to system memory.
> > 
> > Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >  mm/gup.c | 32 ++++++++++++++++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 886d6148d3d0..1572eacf07f4 100644
> > +++ b/mm/gup.c
> > @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
> >  #endif /* CONFIG_ELF_CORE */
> >  
> >  #ifdef CONFIG_MIGRATION
> > +static int migrate_device_page(unsigned long address,
> > +				struct page *page)
> > +{
> > +	struct vm_area_struct *vma = find_vma(current->mm, address);
> > +	struct vm_fault vmf = {
> > +		.vma = vma,
> > +		.address = address & PAGE_MASK,
> > +		.flags = FAULT_FLAG_USER,
> > +		.pgoff = linear_page_index(vma, address),
> > +		.gfp_mask = GFP_KERNEL,
> > +		.page = page,
> > +	};
> > +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
> > +		return page->pgmap->ops->migrate_to_ram(&vmf);
> 
> How does this synchronise against pgmap being released? As I understand things
> at this point we're not holding a reference on either the page or pgmap, so
> the page and therefore the pgmap may have been freed.

For sure, this can't keep touching the pages[] array after it unpinned
them:

> >  	if (gup_flags & FOLL_PIN) {
> >  		unpin_user_pages(pages, nr_pages);
               ^^^^^^^^^^^^^^^^^^^

> >  	} else {
> >  		for (i = 0; i < nr_pages; i++)
> >  			put_page(pages[i]);
> >  	}
> > +	if (is_device_page(head))
> > +		return migrate_device_page(start + page_index * PAGE_SIZE, head);

It was safe before this patch as isolate_lru_page(head) has a
get_page() inside.

Also, please try hard not to turn this function into goto spaghetti

> I think a similar problem exists for device private fault handling as well and
> it has been on my list of things to fix for a while. I think the solution is to
> call try_get_page(), except it doesn't work with device pages due to the whole
> refcount thing. That issue is blocking a fair bit of work now so I've started
> looking into it.

Where is this?

Jason
