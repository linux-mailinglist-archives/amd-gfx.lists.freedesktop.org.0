Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287218EEF6
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2020 06:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788E89F03;
	Mon, 23 Mar 2020 05:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20BA6E1F7;
 Sat, 21 Mar 2020 15:18:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 264F468BEB; Sat, 21 Mar 2020 16:18:26 +0100 (CET)
Date: Sat, 21 Mar 2020 16:18:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
Message-ID: <20200321151825.GA7692@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de> <20200320134109.GA30230@ziepe.ca>
 <20200321082236.GB28613@lst.de> <20200321123804.GV20941@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200321123804.GV20941@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 23 Mar 2020 05:03:28 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Mar 21, 2020 at 09:38:04AM -0300, Jason Gunthorpe wrote:
> > I don't think there is any specific protection.  Let me see if we
> > can throw in a get_dev_pagemap here
> 
> The page tables are RCU protected right? could we do something like
> 
>  if (is_device_private_entry()) {
>        rcu_read_lock()
>        if (READ_ONCE(*ptep) != pte)
>            return -EBUSY;
>        hmm_is_device_private_entry()
>        rcu_read_unlock()
>  }
> 
> ?

Are they everywhere?  I'd really love to hear from people that really
know this ara..

> 
> Then pgmap needs a synchronize_rcu before the struct page's are
> destroyed (possibly gup_fast already requires this?)
> 
> I've got some other patches trying to close some of these styles of
> bugs, but 
> 
> > note that current mainline doesn't even use it for this path..
> 
> Don't follow?

If you look at mainline (or any other tree), we only do a
get_dev_pagemap for devmap ptes.  But device private pages are encoded
as non-present swap ptes.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
