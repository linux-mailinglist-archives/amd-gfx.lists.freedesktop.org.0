Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1018DF9C
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2020 11:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10936E320;
	Sat, 21 Mar 2020 10:45:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0C56E0D9;
 Sat, 21 Mar 2020 08:20:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C3FCA68AFE; Sat, 21 Mar 2020 09:20:41 +0100 (CET)
Date: Sat, 21 Mar 2020 09:20:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Message-ID: <20200321082041.GA28613@lst.de>
References: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
 <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
 <20200319181716.GK20941@ziepe.ca>
 <89e33770-a0ab-e1ec-d5e5-535edefd3fd3@nvidia.com>
 <20200320000345.GO20941@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320000345.GO20941@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:45 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 09:03:45PM -0300, Jason Gunthorpe wrote:
> > Should tests enable the feature or the feature enable the test?
> > IMHO, if the feature is being compiled into the kernel, that should
> > enable the menu item for the test. If the feature isn't selected,
> > no need to test it :-)
> 
> I ment if DEVICE_PRIVATE should be a user selectable option at all, or
> should it be turned on when a driver like nouveau is selected.

I don't think it should be user selectable.  This is an implementation
detail users can't know about.

> Is there some downside to enabling DEVICE_PRIVATE?

The option itself adds a little more code to the core kernel, and
introduces a few additional branches in core mm code.

But more importantly it pulls in the whole pgmap infrastructure.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
