Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34F4AB751
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Feb 2022 10:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DB410F61B;
	Mon,  7 Feb 2022 09:10:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3CB10E99F;
 Mon,  7 Feb 2022 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=OAyNE091yCbn5wGWEV3bEarGLGijE2hU2ufW9HOL5jw=; b=WGwvHWbsXwe5wqUsSmyCBTNueH
 xk61jWDsclmQ3MXQmxsiFbu7uwHqSJFlej9Qi/rp8m99Hw0XniTY4A3Grnbh0Jpf1VGSxuMJfmUYm
 ReqqD/bAe6zwXBv/R5upJOQ70pLXbkMeYTzwwq4aNSgZRXW50435OU8wfWZmtiH9zyihvpaAef/c2
 f6w1YXhaNOSTsMQILzMse2D6uGCZM5oEEQZ/xpWwfHUziH6xa1jBRLQm7OyXnhPuzWDdfaOOTiCP6
 7AOcgAjdJsbIAuZ1YHMjx3F+HE0yRYwKzMGjA9gEucL9tbBUAcfeQjrYaEbc0IpLFJ2GpP5tb3eKs
 ZwA+tflg==;
Received: from [2001:4bb8:188:3efc:2cbe:55d7:bb63:46d2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxZz-0099GK-6j; Mon, 07 Feb 2022 06:32:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Subject: start sorting out the ZONE_DEVICE refcount mess
Date: Mon,  7 Feb 2022 07:32:41 +0100
Message-Id: <20220207063249.1833066-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:10:31 +0000
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
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi all,

this series removes the offset by one refcount for ZONE_DEVICE pages
that are freed back to the driver owning them, which is just device
private ones for now, but also the planned device coherent pages
and the ehanced p2p ones pending.

It does not address the fsdax pages yet, which will be attacked in a
follow on series.

Diffstat:
 arch/arm64/mm/mmu.c                      |    1 
 arch/powerpc/kvm/book3s_hv_uvmem.c       |    1 
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |    2 
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |    1 
 drivers/gpu/drm/drm_cache.c              |    2 
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |    3 -
 drivers/gpu/drm/nouveau/nouveau_svm.c    |    1 
 drivers/infiniband/core/rw.c             |    1 
 drivers/nvdimm/pmem.h                    |    1 
 drivers/nvme/host/pci.c                  |    1 
 drivers/nvme/target/io-cmd-bdev.c        |    1 
 fs/Kconfig                               |    2 
 fs/fuse/virtio_fs.c                      |    1 
 include/linux/hmm.h                      |    9 ----
 include/linux/memremap.h                 |   22 +++++++++-
 include/linux/mm.h                       |   59 ++++-------------------------
 lib/test_hmm.c                           |    4 +
 mm/Kconfig                               |    4 -
 mm/internal.h                            |    2 
 mm/memcontrol.c                          |   11 +----
 mm/memremap.c                            |   63 ++++++++++++++++---------------
 mm/migrate.c                             |    6 --
 mm/swap.c                                |   49 ++----------------------
 23 files changed, 90 insertions(+), 157 deletions(-)
