Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA355053D
	for <lists+amd-gfx@lfdr.de>; Sat, 18 Jun 2022 15:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936D510E46B;
	Sat, 18 Jun 2022 13:54:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6047A11A6F5
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jun 2022 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655459498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2XL8pkjreEj3h2zo18bB3t5OqDKTr/JgGg6/1/Ir4Q=;
 b=NRVq/kabZ2ufeDdk+qoqt4OUnx8BsBjVDpXb7M0cTyD4jjp3+aZLD3wqTekpuigHR6Drtp
 DxBDtdPcv9QWYcZrSfSiC2wZuflCUZTDetUxEsAe/g6lfBWOCzhXeRfgNTHFqRkVsKmgXS
 Au3wkieXa+838s5F3XR3DrlB9oTgjus=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-ECEQDUYENwyR51Tlj9_0iQ-1; Fri, 17 Jun 2022 05:51:37 -0400
X-MC-Unique: ECEQDUYENwyR51Tlj9_0iQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so837707wra.15
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jun 2022 02:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=W2XL8pkjreEj3h2zo18bB3t5OqDKTr/JgGg6/1/Ir4Q=;
 b=VHHaV9L0MLRQL9LnMzdKTZ7WWhegl5euxRSQ1UpAtlJbXNpQfk2CvoBlcHxo87RSZZ
 EP2kpPaTRQuI1zsgMCiNNm+4GaYP1K4IEs67arzy1NdIlVUds57HJ2Q+qY4EfvKBA/1r
 ba91HUaEdO6UcB+ZvMANLhD6cY/9j1+R89Fr96pIGoen+AhgqkeR99WpjMu/zs7TwYlv
 Qb3MfLyxfpCnu22CM3c7n0FsKeAXiRMPjX9ujM5J5HSL0OXO9RqI801OzCrZUqcpqGny
 AcQvKcF0qeNdNoHql8qHMurLR/z17l/WpBFoEaXI03l8aN5hDyHg0p8sPtS/9FlDQ85l
 FQ2w==
X-Gm-Message-State: AJIora+H7JmKvw9SACyZGvUv7w/JZ0+qZRk1ZXXP4FzAFbxwpUnHYrXU
 2JerEt/4sLjvwnBH38iswbvAJjA+aclwKL7eoarybLXpqaGMXyHB/BpHskh3RDNlVh3150HU5Ba
 6oU8SFycTPualOV6osnpNn7NIiw==
X-Received: by 2002:a5d:4108:0:b0:213:b585:66c7 with SMTP id
 l8-20020a5d4108000000b00213b58566c7mr8407245wrp.335.1655459495982; 
 Fri, 17 Jun 2022 02:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPq26W2EV6yn5ge0JaefggrEXKWcvxXJQoWeAk7go6hHo/0LCo2WNzDgeOAFhBKPGgtatufQ==
X-Received: by 2002:a5d:4108:0:b0:213:b585:66c7 with SMTP id
 l8-20020a5d4108000000b00213b58566c7mr8407226wrp.335.1655459495720; 
 Fri, 17 Jun 2022 02:51:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7e00:bb5b:b526:5b76:5824?
 (p200300cbc70a7e00bb5bb5265b765824.dip0.t-ipconnect.de.
 [2003:cb:c70a:7e00:bb5b:b526:5b76:5824])
 by smtp.gmail.com with ESMTPSA id
 i188-20020a1c3bc5000000b0039ee52c1345sm2080057wma.4.2022.06.17.02.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:51:35 -0700 (PDT)
Message-ID: <ae6c6566-4c9b-0547-c2e4-3df7cb2bed33@redhat.com>
Date: Fri, 17 Jun 2022 11:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-3-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
In-Reply-To: <20220531200041.24904-3-alex.sierra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 18 Jun 2022 13:54:45 +0000
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 31.05.22 22:00, Alex Sierra wrote:
> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW. They do not support LRU lists, NUMA migration or THP.
> 
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>  fs/proc/task_mmu.c | 2 +-
>  include/linux/mm.h | 3 ++-
>  mm/gup.c           | 6 +++++-
>  mm/huge_memory.c   | 2 +-
>  mm/khugepaged.c    | 9 ++++++---
>  mm/ksm.c           | 6 +++---
>  mm/madvise.c       | 4 ++--
>  mm/memory.c        | 9 ++++++++-
>  mm/mempolicy.c     | 2 +-
>  mm/migrate.c       | 4 ++--
>  mm/mlock.c         | 2 +-
>  mm/mprotect.c      | 2 +-
>  12 files changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 2d04e3470d4c..2dd8c8a66924 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1792,7 +1792,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
>  		return NULL;
>  
>  	page = vm_normal_page(vma, addr, pte);
> -	if (!page)
> +	if (!page || is_zone_device_page(page))
>  		return NULL;
>  
>  	if (PageReserved(page))
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bc8f326be0ce..d3f43908ff8d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -601,7 +601,7 @@ struct vm_operations_struct {
>  #endif
>  	/*
>  	 * Called by vm_normal_page() for special PTEs to find the
> -	 * page for @addr.  This is useful if the default behavior
> +	 * page for @addr. This is useful if the default behavior
>  	 * (using pte_page()) would not find the correct page.
>  	 */
>  	struct page *(*find_special_page)(struct vm_area_struct *vma,
> @@ -2934,6 +2934,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
>  #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>  #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
>  #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
> +#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */

Does that statement hold for special pages like the shared zeropage?

Also, this flag is only valid for in-kernel follow_page() but not for
the ordinary GUP interfaces. What are the semantics there? Is it fenced?


I really wonder if you should simply similarly teach the handful of
users of follow_page() to just special case these pages ... sounds
cleaner to me then adding flags with unclear semantics. Alternatively,
properly document what that flag is actually doing and where it applies.


I know, there was discussion on ... sorry for jumping in now, but this
doesn't look clean to me yet.

-- 
Thanks,

David / dhildenb

