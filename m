Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC23CBABA
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Jul 2021 18:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC04A6E9C8;
	Fri, 16 Jul 2021 16:47:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9176E9A4;
 Fri, 16 Jul 2021 15:07:49 +0000 (UTC)
Received: from callcc.thunk.org (96-65-121-81-static.hfc.comcastbusiness.net
 [96.65.121.81]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 16GF7fnw014809
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:07:42 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id D6FEA4202F5; Fri, 16 Jul 2021 11:07:40 -0400 (EDT)
Date: Fri, 16 Jul 2021 11:07:40 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <YPGgvNxfOCx/Sp0g@mit.edu>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <YM9NXrGlhdp0qb7S@mit.edu>
 <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <905418d1-9099-0ea8-a6e6-84cc8ef3d0b0@amd.com>
X-Mailman-Approved-At: Fri, 16 Jul 2021 16:47:10 +0000
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
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 05:49:55PM -0400, Felix Kuehling wrote:
> 
> I can think of two ways to test the changes for MEMORY_DEVICE_GENERIC in
> this patch series in a way that is reproducible without special hardware and
> firmware:
> 
> For the reference counting changes we could use the dax driver with hmem and
> use efi_fake_mem on the kernel command line to create some DEVICE_GENERIC
> pages. I'm open to suggestions for good user mode tests to exercise dax
> functionality on this type of memory.

Sorry for the thread necromancy, but now that the merge window is
past....

Today I test ext4's dax support, without having any $$$ DAX hardware,
by using the kernel command line "memmap=4G!9G:memmap=9G!14G" which
reserves memory so that creates two pmem device and then I run
xfstests with DAX enabled using qemu or using a Google Compute Engine
VM, using TEST_DEV=/dev/pmem0 and SCRATCH_DEV=/dev/pmem1.

If you can give me a recipe for what kernel configs I should enable,
and what magic kernel command line arguments to use, then I'd be able
to test your patch set with ext4.

Cheers,

						- Ted
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
