Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C111BE78D
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2020 21:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4273E6EB0B;
	Wed, 29 Apr 2020 19:41:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256996EB0E
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Apr 2020 19:38:52 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id t20so2911033qtq.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Apr 2020 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wSYESb9Z3lobUMcKhRgLVx/Jnc91KqPEgi7fezuq0cw=;
 b=NfXC63zzpf/8TqXiV12LVXGiDGkba+94lBawHeUu83K8kLO8LRDgkxz43bWbbguQFH
 aCgsfAqUHnw9A7jIE+4yQDpSBQ9ejSEwi62fbLyNgrZQF6E45SKOlcrZpp3ZA+x+T81t
 05c9+uMkRiw5dJ58ysX0oVJvqft33g+XCuCp2l8cUvJI6iP1S8Vujxgbk5X6fDpsk2TX
 Vd6i5AIIK/Oyu4Q/ttB0qTWO+51Joo3U4fWF4Lkf2S6hLdFNWplzSuZgTs6i+e6rfv//
 X3HxIzTHtwQ7e5jBUgRqMi3T5DsoKatOu2U5HWkn6PujV760l328OCDPIQi8nYsNU/Lp
 pAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wSYESb9Z3lobUMcKhRgLVx/Jnc91KqPEgi7fezuq0cw=;
 b=C+GCdiFKVXqIkvjJIFJDOyvFRKrw+U+KHzZBTXsi/dFYN5C9e9ftlix4MFd+/Ibxxa
 dG/KzLD2tyP0mSH5L4mbqofO2F3uAwbbCoHHpBdNvQHJCwrZihunKAWSN9tVZjT09VNo
 CCfYsBL0NS9K3Tj26+wWnj+ZXTEnaSJ7B+yjgkLGkjchx0Sy+qWaN3Aj2fPIgp1/eG0Q
 AWyMiXEO2cbTSxc3ZAR6qwnktWoE2YjNT4xbjkQ/yP9ftpWZ9RJFo7exA2+sSt40aL6R
 OgAiKjb1dhUfFejjBxy5j7GObBGE+xJp192gN+1qXgSUDdufvYrdsQLm4FBADpS8TTKE
 cRhg==
X-Gm-Message-State: AGi0Pua+1lgRuonnHX26Sx9UsPunhwKi3eEd7qpcymAwKWLbj2XmgPWI
 9gSfxYlhFQ8XLDa7Ly6jh0m4Fw==
X-Google-Smtp-Source: APiQypKXiOYH85US8Z7h6G2+cqWcYKpnBdMFUGM9XeOFtVhWzW/P0ELjxN2G8888g6EU3/+MJwFu8g==
X-Received: by 2002:ac8:3a83:: with SMTP id x3mr24832605qte.44.1588189131135; 
 Wed, 29 Apr 2020 12:38:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m12sm92419qki.75.2020.04.29.12.38.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:38:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jTsXh-0005C7-Ba; Wed, 29 Apr 2020 16:38:49 -0300
Date: Wed, 29 Apr 2020 16:38:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH hmm 2/5] mm/hmm: make hmm_range_fault return 0 or -1
Message-ID: <20200429193849.GA3824@ziepe.ca>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <2-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <20200422055229.GB22366@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422055229.GB22366@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 29 Apr 2020 19:41:26 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 07:52:29AM +0200, Christoph Hellwig wrote:
> On Tue, Apr 21, 2020 at 09:21:43PM -0300, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > hmm_vma_walk->last is supposed to be updated after every write to the
> > pfns, so that it can be returned by hmm_range_fault(). However, this is
> > not done consistently. Fortunately nothing checks the return code of
> > hmm_range_fault() for anything other than error.
> > 
> > More importantly last must be set before returning -EBUSY as it is used to
> > prevent reading an output pfn as an input flags when the loop restarts.
> > 
> > For clarity and simplicity make hmm_range_fault() return 0 or -ERRNO. Only
> > set last when returning -EBUSY.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> >  Documentation/vm/hmm.rst                |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ++--
> >  drivers/gpu/drm/nouveau/nouveau_svm.c   |  6 +++---
> >  include/linux/hmm.h                     |  2 +-
> >  mm/hmm.c                                | 25 +++++++++----------------
> >  5 files changed, 16 insertions(+), 23 deletions(-)
> > 
> > diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> > index 4e3e9362afeb10..9924f2caa0184c 100644
> > +++ b/Documentation/vm/hmm.rst
> > @@ -161,7 +161,7 @@ device must complete the update before the driver callback returns.
> >  When the device driver wants to populate a range of virtual addresses, it can
> >  use::
> >  
> > -  long hmm_range_fault(struct hmm_range *range);
> > +  int hmm_range_fault(struct hmm_range *range);
> >  
> >  It will trigger a page fault on missing or read-only entries if write access is
> >  requested (see below). Page faults use the generic mm page fault code path just
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > index 6309ff72bd7876..efc1329a019127 100644
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -852,12 +852,12 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
> >  	down_read(&mm->mmap_sem);
> >  	r = hmm_range_fault(range);
> >  	up_read(&mm->mmap_sem);
> > -	if (unlikely(r <= 0)) {
> > +	if (unlikely(r)) {
> >  		/*
> >  		 * FIXME: This timeout should encompass the retry from
> >  		 * mmu_interval_read_retry() as well.
> >  		 */
> > -		if ((r == 0 || r == -EBUSY) && !time_after(jiffies, timeout))
> > +		if ((r == -EBUSY) && !time_after(jiffies, timeout))
> 
> Please also kill the superflous inner braces here.
> 
> > + * Return: 0 or -ERRNO with one of the following status codes:
> 
> Maybe say something like:
> 
>     * Returns 0 on success or one of the following error codes:
> 
> Otherwise this looks good:

Got it, thanks

Jason
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
