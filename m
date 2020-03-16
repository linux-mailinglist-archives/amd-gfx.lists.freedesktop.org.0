Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA9187319
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 20:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5623589C93;
	Mon, 16 Mar 2020 19:13:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2456E492;
 Mon, 16 Mar 2020 18:49:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9EC4C68BFE; Mon, 16 Mar 2020 19:49:35 +0100 (CET)
Date: Mon, 16 Mar 2020 19:49:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Message-ID: <20200316184935.GA25322@lst.de>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Mar 2020 19:13:14 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
>
> On 3/16/20 10:52 AM, Christoph Hellwig wrote:
>> No driver has actually used properly wire up and support this feature.
>> There is various code related to it in nouveau, but as far as I can tell
>> it never actually got turned on, and the only changes since the initial
>> commit are global cleanups.
>
> This is not actually true. OpenCL 2.x does support SVM with nouveau and
> device private memory via clEnqueueSVMMigrateMem().
> Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
> migrated and this change would conflict with that.

Can you explain me how we actually invoke this code?

For that we'd need HMM_PFN_DEVICE_PRIVATE NVIF_VMM_PFNMAP_V0_VRAM
set in ->pfns before calling hmm_range_fault, which isn't happening.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
