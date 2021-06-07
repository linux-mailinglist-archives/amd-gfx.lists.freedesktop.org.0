Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D239E8A4
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Jun 2021 22:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45006EA12;
	Mon,  7 Jun 2021 20:42:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CDB6EA04;
 Mon,  7 Jun 2021 20:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krY6ucNhjOEYKRrS9FIyD6ZYYusuxaRq3Pns9Y4prZ3TVp3nctfzk28u5TJujGYdqpjoWSn3Bah57zgAv9n73WcCfnl1nWNA6Yw/eQ9PxnapVaD05gxpFhwVwn+AQNTj8YdD6TyqvR6KIBSFtF0YNbP2l0pAcEgs7lkQfA0NFKNThRT6LShy85+tvPy912gMW+Ga6WRwJ9k9xyUBWhoQFfqPcL1lB3XAj+vFxXhZZzvFj+2HMiNWbhi6gLdZupFNHLH8p7oMZeKNGHR7Fq3wOxsw0Tdu4APOShXvxmLhlKjg1D//tm7AtuDiNrcSAJK2qVlESl/IiYXeitIHxk9BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y6by+cj+a5kSxkkXciWS4gzS7j6Iew/i6e/lGV+t/Q=;
 b=K6A69cgfdFLv/yZfYbEKr4DVNpNU11sQCWvjX1oFe8mmC5purFkFvyuJmEDjwM2/2Zl6LTwuOvo+KSao8pxJcYb/vC7B6fbjGbp0/rpOduTQanWRGWE3A5ZQBPgIW3YBWNdhdYDsomL9X2adbOuJM6kW8lIpFjUDrTwuKr+RmLOg9hIxNb2LPLRt/lnOiO6cIDhaLggxPbrRRsp07z02BjdmLL34q4cJtplv4QxJYScN+uff6CSkpzayWomaAMQ932qfmcwtBIHrsvkIdfCiKCN6bb5uca2nfHyxpnwFIVkJbnZREdQ99OfBELBZqpTsdLTg/mGvbV4E2lK1ar8jyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y6by+cj+a5kSxkkXciWS4gzS7j6Iew/i6e/lGV+t/Q=;
 b=qLMqc15xlGSy7lyO+vyKDMSOKw0orVyPzoI/jvaZs1SCzd+dnvkyT6CTuHH/5JIVblV08jIgJzx5jdiTM9FTKAYD/DcEFsm5wpeeZisnFtj58EgR9JJ6Tzj2gdU6q2wrTZ5SbRKkNqHd0zo0koSoWuR2+T0oE8g1t9PJaGYML2k=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:40 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:40 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 2/8] mm: remove extra ZONE_DEVICE struct page refcount
Date: Mon,  7 Jun 2021 15:42:20 -0500
Message-Id: <20210607204226.7743-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03884221-d9dd-4b52-883e-08d929f4cb00
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4495E642316D97B10D52B488FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ssgw0FocgGrtLADCtgqkPyBeRZOnYMiy+nLWmZfYHCtEfbH7cx/l/4fMw5c+FF9cyfsWS6z4jyezriiNjjEp4T+gLufNM4ZtZ8O58wLTggkHl8x79MW6HgMuoMtknaXfS7/yUxMLJP2WPzogfIDqFD6QOj79JueCDGDNigIUAQAgWHYWZ5RjvJZ/CmgQZHl+A8+jkWjV1qa5Wpyt2IvoFaNKq1XLyhvG9nB5Ip7kU/tDUKQRv/Nfp17f9Sfg8C10MFCJmO971QJo3t+hceLBa7EzDmaY+VqBl5DejdngXGQx7FFMiw6ay2KTIHiE8eqeXZ+p8+hp/f71ZGLfl8b2uD/m5yPfAlapldU8LCB1IY97wWbWQKb0SThVOV+UhBSsd4bV4LoAv7cMCMtW0tv7HsXtpeoCztBSnVRkvrxCLuxzGmErCJC9IXklaIOa7TEbpwojBWn8OhxkS55xg/3SdYfo40vjrOKl53ylAxFa+u5u4quDQuDUp5ffcwO+uzWcqlxy9Kcbn/4HGQFVIgQ/PXKFMHF1BibH4sBppw8LSwZrf7IiusOc7JzUSPZoIzOI3Iz4aRjbxoniMUxwaQJKXb28HlWxxlWmWEqw4Kt+Diffri0cLFpcyhwLgm8mNjxP/zWFcEH9uY1bFbLTo+ywCONv9ePoHLxlpNdUD0ZhTjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(30864003)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(36756003)(8676002)(38350700002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X9eY/jnkJ3WZxKsvP3XU4BxddkDM7ISwRBzaZJpVTJ7hHxYHJjlrEbJJFoWC?=
 =?us-ascii?Q?ZEqojXKnqoB6YQj/SACbDJ20e4eAv9Af67jktMOIMEJc9P4YBeHyvWwFvfXi?=
 =?us-ascii?Q?1t4Gajs3sILefLTUlsVfVFWPl1gLDzqNOEAhSvHxsMOA9SAUCL+BJExpk3hT?=
 =?us-ascii?Q?ViQ2oAg/z/fR/BWbCKulZ46QCeFGQ3sgAG34xbZM6j6OP/v19QbUODfF/V8/?=
 =?us-ascii?Q?RPcvJH9pFtRxKJ0aVhqEBxjWHLRa6XDVoM6HlMmird39glUJGVDhUzrjm0oc?=
 =?us-ascii?Q?fbwCB/oaLdCrWbtcCKkTi2mEAAJ+lLIpn2dsXANXwuKOmqrbYVt9tMkIceLb?=
 =?us-ascii?Q?tI0psFzMGiAU3qSf2yVYCEJra+9KFYqaby0vcOajmpzZvRZVa4liqsIli0nv?=
 =?us-ascii?Q?5KGYURgm0TFInHUTyQ+4SFTlxBQ+mbG7DctHu1a+9cm/JUNREIWGl4anI4WK?=
 =?us-ascii?Q?UqNZsEcrAoqUSUnmnm6joFHPItkOgpMNmus8p0YHy52CRfMsdHhXl06ZH0z1?=
 =?us-ascii?Q?x5oDCbDQU4jDeCY8ndKI8fHNzGIMkuw5DheZNIZNNff3Z8fqBAXkHzl93I12?=
 =?us-ascii?Q?mntObIh4dKv2QYSi3oCoP/8NCWEXeSGy2fKCIXyjwq/sCqa+SC8ZoS10xFXL?=
 =?us-ascii?Q?U0WQPPSIYk4GPOvN2ELvNM4poW3uOn7NVHRNGO12I20WxVXGSWdNV0G1x6gk?=
 =?us-ascii?Q?/wWzaQPdKnN7bOIefJskTEQzNCZnEPrtNHITp3mb5pif2T/RBmeA/kNpAjYz?=
 =?us-ascii?Q?C5etNe55VA9TUPRznVFw3ut9YM9kZ9SQrrca+2wXv11c4QyutgUdlV94S3sq?=
 =?us-ascii?Q?QqK1Hp+pkWU07jvgLJ8+sTkx7mxeMu1Srw4v/JP/bRSATfqbrsRs51ZQQf0X?=
 =?us-ascii?Q?XFzWunDHOrurZyTUkj6qiAP+NZH+yEXiHHsyLLokxb+G/xLadDIVy3XkaEG1?=
 =?us-ascii?Q?oj7CeCzEYiLzzjgRopiyba9RUppHO93S280fiXIwlqFVTiqeKGrkabi5udkE?=
 =?us-ascii?Q?eCgCrwZlFUWVSN+Z6zZaJJ71EkPAMYBzgFhBPhemztQZM1g7hQYgvPYdbNFA?=
 =?us-ascii?Q?Verfru5byFLjFmVCCQcLPSi0ShPMZ9WazYdUMDiUYEwJ6ZfBqRdCCn0JPabE?=
 =?us-ascii?Q?28zXh3iVLtQRHrSYZGtAoixjbMZA/hZQuUtDJgUJl4OtvT7JhlxQbSsS352i?=
 =?us-ascii?Q?Kz5/+dV8sKq1uuv3B6iNUQhS++qeNZizxNFp36CoWVGyMCffnK1fDUSeuEVQ?=
 =?us-ascii?Q?ha9Ji2KHach6CPaxX7CddKCcKWa5qL/nAV0WeUfdAQQpuIyhDUcvE82gnyWn?=
 =?us-ascii?Q?anpjRoPNdtM3Pg/mm0ziSEqw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03884221-d9dd-4b52-883e-08d929f4cb00
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:40.5827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cj+unjeU6ncObsiBzeD09ZKhIH/EwYCylrdLsCydnwxWqebGtmV2j7nz5jLytAcQfBkTcvde7wJ2nffXLNZ1gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

ZONE_DEVICE struct pages have an extra reference count that complicates the
code for put_page() and several places in the kernel that need to check the
reference count to see that a page is not being used (gup, compaction,
migration, etc.). Clean up the code so the reference count doesn't need to
be treated specially for ZONE_DEVICE.

v2:
AS: merged this patch in linux 5.11 version

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  4 +-
 include/linux/dax.h                    |  2 +-
 include/linux/memremap.h               |  7 +--
 include/linux/mm.h                     | 44 -----------------
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 68 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 12 files changed, 45 insertions(+), 147 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 84e5a2dc8be5..acee67710620 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -711,7 +711,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 out_clear:
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..8bc7120e1216 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -324,7 +324,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
-	get_page(page);
+	init_page_count(page);
 	lock_page(page);
 	return page;
 }
diff --git a/fs/dax.c b/fs/dax.c
index 321f4ddc6643..7b4c6b35b098 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -560,14 +560,14 @@ static void *grab_mapping_entry(struct xa_state *xas,
 
 /**
  * dax_layout_busy_page_range - find first pinned page in @mapping
- * @mapping: address space to scan for a page with ref count > 1
+ * @mapping: address space to scan for a page with ref count > 0
  * @start: Starting offset. Page containing 'start' is included.
  * @end: End offset. Page containing 'end' is included. If 'end' is LLONG_MAX,
  *       pages from 'start' till the end of file are included.
  *
  * DAX requires ZONE_DEVICE mapped pages. These pages are never
  * 'onlined' to the page allocator so they are considered idle when
- * page->count == 1. A filesystem uses this interface to determine if
+ * page->count == 0. A filesystem uses this interface to determine if
  * any page in the mapping is busy, i.e. for DMA, or other
  * get_user_pages() usages.
  *
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 8909a91cd381..9487dc06b220 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -245,7 +245,7 @@ static inline bool dax_mapping(struct address_space *mapping)
 
 static inline bool dax_layout_is_idle_page(struct page *page)
 {
-	return page_ref_count(page) == 1;
+	return page_ref_count(page) == 0;
 }
 
 #define dax_wait_page(_inode, _page, _wait_cb)				\
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 79c49e7f5c30..327f32427d21 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -66,9 +66,10 @@ enum memory_type {
 
 struct dev_pagemap_ops {
 	/*
-	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
-	 * reach 0 refcount unless there is a refcount bug. This allows the
-	 * device driver to implement its own memory management.)
+	 * Called once the page refcount reaches 0. The reference count
+	 * should be reset to one with init_page_count(page) before reusing
+	 * the page. This allows the device driver to implement its own
+	 * memory management.
 	 */
 	void (*page_free)(struct page *page);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c9900aedc195..d8d79bb94be8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1117,39 +1117,6 @@ static inline bool is_zone_device_page(const struct page *page)
 }
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page);
-DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
-
-static inline bool page_is_devmap_managed(struct page *page)
-{
-	if (!static_branch_unlikely(&devmap_managed_key))
-		return false;
-	if (!is_zone_device_page(page))
-		return false;
-	switch (page->pgmap->type) {
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_FS_DAX:
-		return true;
-	default:
-		break;
-	}
-	return false;
-}
-
-void put_devmap_managed_page(struct page *page);
-
-#else /* CONFIG_DEV_PAGEMAP_OPS */
-static inline bool page_is_devmap_managed(struct page *page)
-{
-	return false;
-}
-
-static inline void put_devmap_managed_page(struct page *page)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static inline bool is_device_private_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
@@ -1196,17 +1163,6 @@ static inline void put_page(struct page *page)
 {
 	page = compound_head(page);
 
-	/*
-	 * For devmap managed pages we need to catch refcount transition from
-	 * 2 to 1, when refcount reach one it means the page is free and we
-	 * need to inform the device driver through callback. See
-	 * include/linux/memremap.h and HMM for details.
-	 */
-	if (page_is_devmap_managed(page)) {
-		put_devmap_managed_page(page);
-		return;
-	}
-
 	if (put_page_testzero(page))
 		__put_page(page);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 80a78877bd93..6998f10350ea 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -561,7 +561,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	}
 
 	dpage->zone_device_data = rpage;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 
diff --git a/mm/internal.h b/mm/internal.h
index 25d2b2439f19..d3e58746f2d2 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -623,4 +623,12 @@ struct migration_target_control {
 	gfp_t gfp_mask;
 };
 
+#ifdef CONFIG_DEV_PAGEMAP_OPS
+void free_zone_device_page(struct page *page);
+#else
+static inline void free_zone_device_page(struct page *page)
+{
+}
+#endif
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/memremap.c b/mm/memremap.c
index 16b2fb482da1..614b3d600e95 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
 
@@ -37,32 +38,6 @@ unsigned long memremap_compat_align(void)
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
-EXPORT_SYMBOL(devmap_managed_key);
-
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_dec(&devmap_managed_key);
-}
-
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_inc(&devmap_managed_key);
-}
-#else
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-}
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static void pgmap_array_delete(struct range *range)
 {
 	xa_store_range(&pgmap_array, PHYS_PFN(range->start), PHYS_PFN(range->end),
@@ -87,16 +62,6 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
 	return (range->start + range_len(range)) >> PAGE_SHIFT;
 }
 
-static unsigned long pfn_next(unsigned long pfn)
-{
-	if (pfn % 1024 == 0)
-		cond_resched();
-	return pfn + 1;
-}
-
-#define for_each_device_pfn(pfn, map, i) \
-	for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
-
 static void dev_pagemap_kill(struct dev_pagemap *pgmap)
 {
 	if (pgmap->ops && pgmap->ops->kill)
@@ -152,20 +117,18 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 
 void memunmap_pages(struct dev_pagemap *pgmap)
 {
-	unsigned long pfn;
 	int i;
 
 	dev_pagemap_kill(pgmap);
 	for (i = 0; i < pgmap->nr_range; i++)
-		for_each_device_pfn(pfn, pgmap, i)
-			put_page(pfn_to_page(pfn));
+		percpu_ref_put_many(pgmap->ref, pfn_end(pgmap, i) -
+						pfn_first(pgmap, i));
 	dev_pagemap_cleanup(pgmap);
 
 	for (i = 0; i < pgmap->nr_range; i++)
 		pageunmap_range(pgmap, i);
 
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
-	devmap_managed_enable_put(pgmap);
 }
 EXPORT_SYMBOL_GPL(memunmap_pages);
 
@@ -361,8 +324,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 	}
 
-	devmap_managed_enable_get(pgmap);
-
 	/*
 	 * Clear the pgmap nr_range as it will be incremented for each
 	 * successfully processed range. This communicates how many
@@ -477,16 +438,10 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page)
+static void free_device_private_page(struct page *page)
 {
-	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
-		wake_up_var(&page->_refcount);
-		return;
-	}
 
 	__ClearPageWaiters(page);
-
 	mem_cgroup_uncharge(page);
 
 	/*
@@ -513,4 +468,19 @@ void free_devmap_managed_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
 }
+
+void free_zone_device_page(struct page *page)
+{
+	switch (page->pgmap->type) {
+	case MEMORY_DEVICE_FS_DAX:
+		/* notify page idle */
+		wake_up_var(&page->_refcount);
+		return;
+	case MEMORY_DEVICE_PRIVATE:
+		free_device_private_page(page);
+		return;
+	default:
+		return;
+	}
+}
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
diff --git a/mm/migrate.c b/mm/migrate.c
index 20ca887ea769..8c2430d3e77b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -376,11 +376,6 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 {
 	int expected_count = 1;
 
-	/*
-	 * Device private pages have an extra refcount as they are
-	 * ZONE_DEVICE pages.
-	 */
-	expected_count += is_device_private_page(page);
 	if (mapping)
 		expected_count += thp_nr_pages(page) + page_has_private(page);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 519a60d5b6f7..4612c457d0b0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6210,6 +6210,9 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		__init_single_page(page, pfn, zone_idx, nid);
 
+		/* ZONE_DEVICE pages start with a zero reference count. */
+		set_page_count(page, 0);
+
 		/*
 		 * Mark page reserved as it will need to wait for onlining
 		 * phase for it to be fully associated with a zone.
diff --git a/mm/swap.c b/mm/swap.c
index 2cca7141470c..0a12af814065 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -114,12 +114,11 @@ static void __put_compound_page(struct page *page)
 void __put_page(struct page *page)
 {
 	if (is_zone_device_page(page)) {
-		put_dev_pagemap(page->pgmap);
-
 		/*
 		 * The page belongs to the device that created pgmap. Do
 		 * not return it to page allocator.
 		 */
+		free_zone_device_page(page);
 		return;
 	}
 
@@ -878,29 +877,18 @@ void release_pages(struct page **pages, int nr)
 		if (is_huge_zero_page(page))
 			continue;
 
+		if (!put_page_testzero(page))
+			continue;
+
 		if (is_zone_device_page(page)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
-			/*
-			 * ZONE_DEVICE pages that return 'false' from
-			 * page_is_devmap_managed() do not require special
-			 * processing, and instead, expect a call to
-			 * put_page_testzero().
-			 */
-			if (page_is_devmap_managed(page)) {
-				put_devmap_managed_page(page);
-				continue;
-			}
-			if (put_page_testzero(page))
-				put_dev_pagemap(page->pgmap);
+			free_zone_device_page(page);
 			continue;
 		}
 
-		if (!put_page_testzero(page))
-			continue;
-
 		if (PageCompound(page)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
@@ -1142,26 +1130,3 @@ void __init swap_setup(void)
 	 * _really_ don't want to cluster much more
 	 */
 }
-
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void put_devmap_managed_page(struct page *page)
-{
-	int count;
-
-	if (WARN_ON_ONCE(!page_is_devmap_managed(page)))
-		return;
-
-	count = page_ref_dec_return(page);
-
-	/*
-	 * devmap page refcounts are 1-based, rather than 0-based: if
-	 * refcount is 1, then the page is free and the refcount is
-	 * stable because nobody holds a reference on the page.
-	 */
-	if (count == 1)
-		free_devmap_managed_page(page);
-	else if (!count)
-		__put_page(page);
-}
-EXPORT_SYMBOL(put_devmap_managed_page);
-#endif
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
