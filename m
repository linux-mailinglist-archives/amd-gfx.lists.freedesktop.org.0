Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9E1C1D9A
	for <lists+amd-gfx@lfdr.de>; Fri,  1 May 2020 21:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2716ED36;
	Fri,  1 May 2020 19:08:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ED36ED27
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 May 2020 18:20:51 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l78so10071976qke.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 01 May 2020 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9L5E7jU6qZTDlvCOWkCRO/8Kuf781Iwupk1hf9V6HE=;
 b=eYmQvXSg2qYixEnFQmQuL+BJ+s8QgjZuAUWgykXDJtrLFr4P7m0W0/kP4+Y9MPtVGF
 GEtSJxpgWBu1fFkH22lWF08AwssVopEXTWDUEIaIhY1gusdYSK7RSGLQWVyHUcUiscS/
 zC+WOzhPtGtzljjGaHzCeO82gTrSkS/cgxlzAFQnW+Z+1V4rjPNc1V5KavEj8FQOPQJO
 Kn+VMBhPoimubTHqFkT18vbtXQHq2UzpqbTCQon6hutFydkMZzQ4VfcDXSbLuUnRsErB
 sDHwnuX4OpC9+SKhVmRSRGYXmrvVZ7i2dvPleR4e1IM2Qp1itlViF6ePitJ9Y1gWAgkQ
 aagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9L5E7jU6qZTDlvCOWkCRO/8Kuf781Iwupk1hf9V6HE=;
 b=pdbqAYgXYV8m33IB8b1lWRKg0v5cWenUuFWXDWRE9LsrK74IJt+GX52ryjAb+ga7U4
 s6F58/GeP9VP+TfuViUkHg1hxn9cyyQ+9JKMwXEpXhOUPDB/fJQDNRLjq6og1hzlhAQ9
 4ZqkB6vgb24L2cXvA9x4jMwLI7+nVK14zustck+Ml8KF9PVMJaxXZnsuUMImIkk0X4cJ
 l8LAe7rx3rkEHUmNS6ZG2oR5eBsTCpu3E2lWJt/H9ykf7RHx/pHkcFhs1VykcPErs9CU
 /+/gWs/4MFbHrzvgfU1JgA6vA+Hbq6WZz2W1JM4gsFE/GL2WYe3lxAdfFoG6TZhGs6rv
 hJFA==
X-Gm-Message-State: AGi0PuYGfuhokrF33s262Dqh4Iddi//f6Fwu+PMIhCS3KerHF/u13v+R
 /Qlm04svlpwUvyU2CVAmwmY1Tw==
X-Google-Smtp-Source: APiQypIa020BYepbg1xvIoG68mrjNEDBs6npTd0MXTuT5809Lcttkf/1iLQ1dmFR5/ot2aOBBNAYqg==
X-Received: by 2002:a05:620a:16aa:: with SMTP id
 s10mr4887237qkj.225.1588357250518; 
 Fri, 01 May 2020 11:20:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x24sm3205396qth.80.2020.05.01.11.20.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 11:20:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jUaHI-0006oc-Ly; Fri, 01 May 2020 15:20:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org,
	Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH hmm v2 3/5] drm/amdgpu: remove dead code after
 hmm_range_fault()
Date: Fri,  1 May 2020 15:20:46 -0300
Message-Id: <3-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
In-Reply-To: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
References: 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 19:08:02 +0000
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
 amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Since amdgpu does not use the snapshot mode of hmm_range_fault() a
successful return already proves that all entries in the pfns are
HMM_PFN_VALID, there is no need to check the return result of
hmm_device_entry_to_page().

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7eb745b8acce0f..41ae7f96f48194 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -862,17 +862,13 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 		goto out_free_pfns;
 	}
 
-	for (i = 0; i < ttm->num_pages; i++) {
-		/* FIXME: The pages cannot be touched outside the notifier_lock */
+	/*
+	 * Due to default_flags, all pages are HMM_PFN_VALID or
+	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
+	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
+	 */
+	for (i = 0; i < ttm->num_pages; i++)
 		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
-		if (unlikely(!pages[i])) {
-			pr_err("Page fault failed for pfn[%lu] = 0x%llx\n",
-			       i, range->pfns[i]);
-			r = -ENOMEM;
-
-			goto out_free_pfns;
-		}
-	}
 
 	gtt->range = range;
 	mmput(mm);
-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
