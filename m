Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5004B0FE1
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Feb 2022 15:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A137D10E8DA;
	Thu, 10 Feb 2022 14:11:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169B810E7FA
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Feb 2022 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644490427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCuMYRkRk63t/uEdzFuVnTeGbIgzIgM+Be/IRayUXNE=;
 b=a0/GjYJgVX/qxgYPyX3rAuEVWMBAPotAKG3Rl4M0UhDtvCU2kghYuJdeiqZm5/H+GS2i8Q
 SieNUh0Q8XShGOn1ypPhe6zocB2pGGRBhCE6TVVlo7cwxJpLh2Jc5p63IJORGvUVnSx/Bw
 paTKe5Y5pbgodVjseaklQTeInvbG2AM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-1LCmXJRbNWqrgUvDxgzQ6g-1; Thu, 10 Feb 2022 05:53:41 -0500
X-MC-Unique: 1LCmXJRbNWqrgUvDxgzQ6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 l4-20020a05600c4f0400b0037bb2ce79d8so4142332wmq.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Feb 2022 02:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JCuMYRkRk63t/uEdzFuVnTeGbIgzIgM+Be/IRayUXNE=;
 b=jb/GVz+bfVz6jYgmDWFvyEJDoL+94wu2lHcJmk5bNVepxIsusC+nm6g+QQcZ0lHpsF
 f8hiBaWYnHmYmfTWt2MgViQKKqqW+Hev7rooFmOrIz0tmKbJUp4RY/lsFV4McjTwY29i
 +NWfnNObv3GgojAAXFvZdQihpm71edthcBQTY+FpES6YaEoI/VaOyvpzJuhq9zbN0yZb
 9RWKbmpi7qrnJ6V65pFwbkNscUl9Nq1slwmpbwSm4ZSo7mUoldbNZ+6B6e46GFkS2va1
 CGvsEJjmP9DBTxBF/zpEtnVyz/IrtSlnyAr11oAp1PW1eqojRekvJOX73GGLP8VTnEzB
 lAUg==
X-Gm-Message-State: AOAM533eVzESim8cMXAhAOBMwHGcVx0eeeAJLcl5Encnybx5B+dHZPoP
 jghDbnLR59PbsEKY9Taqs1UB2KvUyk9K24W5Ew66kRD+ve4D54+dYxxYLMmlYJN6rGjUtxc7PtC
 /H9Nt2SletI66mzNJLJCaSQx45A==
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr1662387wmq.66.1644490419925; 
 Thu, 10 Feb 2022 02:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkvT5JZHYXYtY2UOZZws+goRiFcmq1p9MqivWc75eF2pkGueO44gfahvAR0YnoX7ep2nRGuw==
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr1662365wmq.66.1644490419644; 
 Thu, 10 Feb 2022 02:53:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:f900:7b04:69ec:2caf:3b42?
 (p200300cbc70bf9007b0469ec2caf3b42.dip0.t-ipconnect.de.
 [2003:cb:c70b:f900:7b04:69ec:2caf:3b42])
 by smtp.gmail.com with ESMTPSA id 11sm21492095wrb.30.2022.02.10.02.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 02:53:39 -0800 (PST)
Message-ID: <9117b387-3c73-0236-51d1-9e6baf43b34e@redhat.com>
Date: Thu, 10 Feb 2022 11:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 14:11:33 +0000
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 07.02.22 05:26, Alistair Popple wrote:
> Currently any attempts to pin a device coherent page will fail. This is
> because device coherent pages need to be managed by a device driver, and
> pinning them would prevent a driver from migrating them off the device.
> 
> However this is no reason to fail pinning of these pages. These are
> coherent and accessible from the CPU so can be migrated just like
> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> them first try migrating them out of ZONE_DEVICE.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> 
> Changes for v2:
> 
>  - Added Felix's Acked-by
>  - Fixed missing check for dpage == NULL
> 
>  mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 95 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 56d9577..5e826db 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
>  
>  #ifdef CONFIG_MIGRATION
>  /*
> + * Migrates a device coherent page back to normal memory. Caller should have a
> + * reference on page which will be copied to the new page if migration is
> + * successful or dropped on failure.
> + */
> +static struct page *migrate_device_page(struct page *page,
> +					unsigned int gup_flags)
> +{
> +	struct page *dpage;
> +	struct migrate_vma args;
> +	unsigned long src_pfn, dst_pfn = 0;
> +
> +	lock_page(page);
> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> +	args.src = &src_pfn;
> +	args.dst = &dst_pfn;
> +	args.cpages = 1;
> +	args.npages = 1;
> +	args.vma = NULL;
> +	migrate_vma_setup(&args);
> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> +		return NULL;
> +
> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
> +
> +	/*
> +	 * get/pin the new page now so we don't have to retry gup after
> +	 * migrating. We already have a reference so this should never fail.
> +	 */
> +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> +		__free_pages(dpage, 0);
> +		dpage = NULL;
> +	}
> +
> +	if (dpage) {
> +		lock_page(dpage);
> +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> +	}
> +
> +	migrate_vma_pages(&args);
> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> +		copy_highpage(dpage, page);
> +	migrate_vma_finalize(&args);
> +	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
> +		if (gup_flags & FOLL_PIN)
> +			unpin_user_page(dpage);
> +		else
> +			put_page(dpage);
> +		dpage = NULL;
> +	}
> +
> +	return dpage;
> +}
> +
> +/*
>   * Check whether all pages are pinnable, if so return number of pages.  If some
>   * pages are not pinnable, migrate them, and unpin all pages. Return zero if
>   * pages were migrated, or if some pages were not successfully isolated.
> @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  			continue;
>  		prev_head = head;
>  		/*
> -		 * If we get a movable page, since we are going to be pinning
> -		 * these entries, try to move them out if possible.
> +		 * Device coherent pages are managed by a driver and should not
> +		 * be pinned indefinitely as it prevents the driver moving the
> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> +		 * migrating page out of device memory.
>  		 */
>  		if (is_dev_private_or_coherent_page(head)) {
> +			/*
> +			 * device private pages will get faulted in during gup
> +			 * so it shouldn't be possible to see one here.
> +			 */
>  			WARN_ON_ONCE(is_device_private_page(head));
> -			ret = -EFAULT;
> -			goto unpin_pages;
> +			WARN_ON_ONCE(PageCompound(head));
> +
> +			/*
> +			 * migration will fail if the page is pinned, so convert
> +			 * the pin on the source page to a normal reference.
> +			 */
> +			if (gup_flags & FOLL_PIN) {
> +				get_page(head);
> +				unpin_user_page(head);
> +			}
> +
> +			pages[i] = migrate_device_page(head, gup_flags);



For ordinary migrate_pages(), we'll unpin all pages and return 0 so the
caller will retry pinning by walking the page tables again.

Why can't we apply the same mechanism here? This "let's avoid another
walk" looks unnecessary complicated to me, but I might be wrong.

-- 
Thanks,

David / dhildenb

