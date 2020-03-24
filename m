Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D8190750
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2020 09:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E921C6E45C;
	Tue, 24 Mar 2020 08:14:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB5B6E43B
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:12 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id f7so2115982qvr.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rP5gDKTxRal88aL3AV5WtEMvRZc38NV86zzyK+lBqtQ=;
 b=iHwqZjCG+OlxOBwnmkPYZ3sfKTn7/buiXu1Mt4UrscwhHTg5T+vSBVrp6VvL6GsEXI
 jlOOWXICOV8dJ7mZVSH/3bAA0i+ACyfu1M49RlXImE0q0oAJ/iZV61OUweUStr2SgdP8
 NLTOYRwny9se+Bdewa4DkcNvFPl7m4IVrzMTGixJZUJbAGZBHdY+0tKkMF1GhqTZ2yCz
 wasdcGCRCN4fzlclH2qkf5PSYwVbxh6sITVDrK02pEpGEf3WO7uqxRjoodOLlZo3Nz5h
 RFj3T2i/VsWNddYwwE/hPRb6lGkyijZY9Rib+oVPAfINSNbvbogrCngKYJ6VXKCsIQ1I
 9QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rP5gDKTxRal88aL3AV5WtEMvRZc38NV86zzyK+lBqtQ=;
 b=YbCSSab+q8kXxjDJWcyROx3tuWtsn+DQPWVWKOUiEH9RRDxqpQwbI4m0q0suvr8X8R
 w3cS1JsFdwIOXR3726ZSyY5dKLWoHwpvbUXZo6oXg8ERK5Lch47IS3Kup+czaFDGR1Lp
 NXIwOD7sg5Qtz+3NttAOdEPM5OGT+w8d2cxQvHAyFBVYZrrPNeYi5zEH3ryyBl0+aJVf
 Um4uClmNQhNJiIosvQqB2Sv9ekIw27DmkbjdHpfMPna3UWpslj3cEJ5tI28NYM1vWMKF
 y8vDcyF9lDkRgtWD6hFwGQ3bUCmdiEkdKSe6O1NwkRTqjI1x9/UjbMK+di9NW6v50Rla
 /UtQ==
X-Gm-Message-State: ANhLgQ3qF1qm8pPfSEn9NAQUdBWozfzcTRusCNulVQbeQkNLPjSN+Gno
 neVlSJoWN9mvBwC4v8+1oerDWA==
X-Google-Smtp-Source: ADFU+vtzOvVz5k63PI5BvDBeCC1EMUBt/jXcl7iD590LuqeDvie5OF/CVQLPkNI/ifw73K/0TaLfZg==
X-Received: by 2002:ad4:45ae:: with SMTP id y14mr1552691qvu.119.1585012511322; 
 Mon, 23 Mar 2020 18:15:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id j50sm13712706qta.42.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9t-0000qi-WD; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 0/9] Small hmm_range_fault() cleanups
Date: Mon, 23 Mar 2020 22:14:48 -0300
Message-Id: <20200324011457.2817-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:14:14 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

This is v2 of the first simple series with a few additional patches of little
adjustments.

This needs an additional patch to the hmm tester:

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 033a12c7ab5b6d..da15471a2bbf9a 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1274,7 +1274,7 @@ TEST_F(hmm2, snapshot)
 	/* Check what the device saw. */
 	m = buffer->mirror;
 	ASSERT_EQ(m[0], HMM_DMIRROR_PROT_ERROR);
-	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_NONE);
+	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_ERROR);
 	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);

v2 changes:
 - Simplify and rename the flags, rework hmm_vma_walk_test in patch 2 (CH)
 - Adjust more comments in patch 3 (CH, Ralph)
 - Put the ugly boolean logic into a function in patch 3 (CH)
 - Update commit message of patch 4 (CH)
 - Adjust formatting in patch 5 (CH)
 Patches 6, 7, 8 are new

v1: https://lore.kernel.org/r/20200320164905.21722-1-jgg@ziepe.ca

Jason Gunthorpe (9):
  mm/hmm: remove pgmap checking for devmap pages
  mm/hmm: return the fault type from hmm_pte_need_fault()
  mm/hmm: remove unused code and tidy comments
  mm/hmm: remove HMM_FAULT_SNAPSHOT
  mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE #ifdef
  mm/hmm: use device_private_entry_to_pfn()
  mm/hmm: do not unconditionally set pfns when returning EBUSY
  mm/hmm: do not set pfns when returning an error code
  mm/hmm: return error for non-vma snapshots

 Documentation/vm/hmm.rst                |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |   2 +-
 include/linux/hmm.h                     | 109 +--------
 mm/hmm.c                                | 312 ++++++++++--------------
 5 files changed, 133 insertions(+), 304 deletions(-)

-- 
2.25.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
