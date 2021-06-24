Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935293B2832
	for <lists+amd-gfx@lfdr.de>; Thu, 24 Jun 2021 09:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6596B6EA1E;
	Thu, 24 Jun 2021 07:06:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844806E9E3;
 Thu, 24 Jun 2021 05:30:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 244BF68AFE; Thu, 24 Jun 2021 07:30:49 +0200 (CEST)
Date: Thu, 24 Jun 2021 07:30:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <20210624053048.GB25004@lst.de>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <YM9NXrGlhdp0qb7S@mit.edu> <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 24 Jun 2021 07:06:12 +0000
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
 Theodore Ts'o <tytso@mit.edu>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 05:49:55PM -0400, Felix Kuehling wrote:
> For the reference counting changes we could use the dax driver with hmem 
> and use efi_fake_mem on the kernel command line to create some 
> DEVICE_GENERIC pages. I'm open to suggestions for good user mode tests to 
> exercise dax functionality on this type of memory.
>
> For the migration helper changes we could modify or parametrize 
> lib/hmm_test.c to create DEVICE_GENERIC pages instead of DEVICE_PRIVATE. 
> Then run tools/testing/selftests/vm/hmm-tests.c.

We'll also need a real in-tree user of the enhanced DEVICE_GENERIC memory.
So while the refcounting cleanups early in the series are something I'd
really like to see upstream as soon as everything is sorted out, the
actual bits that can't only be used by your updated driver should wait
for that.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
