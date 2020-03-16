Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F7187236
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 19:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588C89DA3;
	Mon, 16 Mar 2020 18:22:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96326E49D;
 Mon, 16 Mar 2020 18:20:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E7A4568BFE; Mon, 16 Mar 2020 19:20:39 +0100 (CET)
Date: Mon, 16 Mar 2020 19:20:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/2] mm: handle multiple owners of device private pages
 in migrate_vma
Message-ID: <20200316182039.GA24736@lst.de>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-2-hch@lst.de> <20200316181707.GJ20941@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316181707.GJ20941@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Mar 2020 18:22:35 +0000
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

On Mon, Mar 16, 2020 at 03:17:07PM -0300, Jason Gunthorpe wrote:
> On Mon, Mar 16, 2020 at 06:52:58PM +0100, Christoph Hellwig wrote:
> > Add a new opaque owner field to struct dev_pagemap, which will allow
> > the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
> > and refuse to work on mappings not owned by the calling entity.
> 
> Using a pointer seems like a good solution to me.
> 
> Is this a bug fix? What is the downside for migrate on pages it
> doesn't work? I'm not up to speed on migrate..

migrating private pages not owned by driver simply won't work, as
the device can't access it.  Even inside the same driver say
GPU A can't just migrate CPU B's memory.  In that sense it is
a bug fix for the rather unlikely case of using the experimental
nouveau with multiple GPUs, or in a power secure VM (if that is
even possible).
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
