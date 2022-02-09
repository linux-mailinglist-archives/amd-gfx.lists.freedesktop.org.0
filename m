Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052704AF8D4
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Feb 2022 18:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E8D10E39A;
	Wed,  9 Feb 2022 17:56:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C6489CDD;
 Wed,  9 Feb 2022 17:48:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8151B68B05; Wed,  9 Feb 2022 18:48:37 +0100 (CET)
Date: Wed, 9 Feb 2022 18:48:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
Message-ID: <20220209174836.GA24864@lst.de>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-7-hch@lst.de>
 <3287da2f-defa-9adb-e21c-c498972e674d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3287da2f-defa-9adb-e21c-c498972e674d@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 09 Feb 2022 17:56:49 +0000
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 04:19:29PM -0500, Felix Kuehling wrote:
>
> Am 2022-02-07 um 01:32 schrieb Christoph Hellwig:
>> Move the check for the actual pgmap types that need the free at refcount
>> one behavior into the out of line helper, and thus avoid the need to
>> pull memremap.h into mm.h.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> The amdkfd part looks good to me.
>
> It looks like this patch is not based on Alex Sierra's coherent memory 
> series. He added two new helpers is_device_coherent_page and 
> is_dev_private_or_coherent_page that would need to be moved along with 
> is_device_private_page and is_pci_p2pdma_page.

FYI, here is a branch that contains a rebase of the coherent memory
related patches on top of this series:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/pgmap-refcount

I don't have a good way to test this, but I'll at least let the build bot
finish before sending it out (probably tomorrow).
