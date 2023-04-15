Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30F6E40F4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Apr 2023 09:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5B910E3AA;
	Mon, 17 Apr 2023 07:30:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1310E034;
 Sat, 15 Apr 2023 12:09:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id q5so11555197wmo.4;
 Sat, 15 Apr 2023 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681560561; x=1684152561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7bl5SFQ2vJygxB6ULQ7owEqW0w5QgVbsAK3PYNhUFh4=;
 b=X3wx/SDN/wkZLlSRmWoO4XjoTTfufgaCgXTVI/8MBUXN3C5Kkoa6Jp85DZjC2wf04W
 5zmYu8D4+7x1XhIYxdSsCRIERvV0lFjGdN788237PxGzXXvNaYNGL4VtPXGRM957hh24
 /Zmj3BNC7AwR1Eo8sblwN4P+Ze+O+oJrN1YeKxDSi7T796tpi4rBrqVu4ygIiSQ6V1ea
 ntVuCJrPlMT0HzUauagKqw9sDcbJtmWoQD15O9UkaxHT6OvpdgMQmDMpIuRW3RLHxvLm
 OFPvi6W6+FXczHkXNWBfzsZPOro21B2OrSa4OuRcmpQCbBgbpZ+S3Ye6U/TxjSSDu57M
 mx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681560561; x=1684152561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bl5SFQ2vJygxB6ULQ7owEqW0w5QgVbsAK3PYNhUFh4=;
 b=R3zYBO9SMtDLoHkHLKSZNo2PlC+uSj1KE0li5hOlI7lxX+olP1WwlgrCh56EDaukz9
 ibA7ixntymTzPNOg7kbNKtAI+QyXc83hpuIUnwPgUvbOYcd2rc0c1gPsjz3G/j+10Y+9
 4lkdN1WQTsCW9F9OF6+/UsC1SIbnwrh5gzdhXg7mxNeDKYHiG23Oop5OJXNZr2mKE1ul
 s/P2cOGiiz031O10/PYWsTfROFgSyluRyhnpIs79U+HXsdlpP5CM+9zfRKcGOJ+lkHss
 IqcSAFIjbmIaGx4eZNIzumXARf4jyFhe2EqYivrrk2g7kV4jwYXLJGQLLyxK7mtSt3Hf
 ea3w==
X-Gm-Message-State: AAQBX9fgiAkL+l7RCpz3wfE+fUGiPgInWMIjrECL6AnG2Sy7ya7Nwe03
 zXbZLgpRn+GU1dwV4Wtud9s=
X-Google-Smtp-Source: AKy350Yysqw/G21F2cEQ1bzpOiU/6gRNUP/bJK1jn3guibsBFaVe0RGWhuMX5MIUHG1wPs+pj7mvig==
X-Received: by 2002:a05:600c:204c:b0:3f0:aeac:2f9c with SMTP id
 p12-20020a05600c204c00b003f0aeac2f9cmr4917397wmg.7.1681560561281; 
 Sat, 15 Apr 2023 05:09:21 -0700 (PDT)
Received: from lucifer.home ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
 by smtp.googlemail.com with ESMTPSA id
 15-20020a05600c230f00b003f16fdc6233sm134903wmo.47.2023.04.15.05.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 05:09:20 -0700 (PDT)
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 1/7] mm/gup: remove unused vmas parameter from
 get_user_pages()
Date: Sat, 15 Apr 2023 13:09:18 +0100
Message-Id: <28967f170eceeebf2591a5e4370d0642e0516f9b.1681558407.git.lstoakes@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1681558407.git.lstoakes@gmail.com>
References: <cover.1681558407.git.lstoakes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:30:15 +0000
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jarkko Sakkinen <jarkko@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "H . Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Airlie <airlied@gmail.com>,
 linux-sgx@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

No invocation of get_user_pages() uses the vmas parameter, so remove
it.

The GUP API is confusing and caveated. Recent changes have done much to
improve that, however there is more we can do. Exporting vmas is a prime
target as the caller has to be extremely careful to preclude their use
after the mmap_lock has expired or otherwise be left with dangling
pointers.

Removing the vmas parameter focuses the GUP functions upon their primary
purpose - pinning (and outputting) pages as well as performing the actions
implied by the input flags.

This is part of a patch series aiming to remove the vmas parameter
altogether.

Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/kernel/cpu/sgx/ioctl.c     | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 drivers/misc/sgi-gru/grufault.c     | 2 +-
 include/linux/mm.h                  | 3 +--
 mm/gup.c                            | 9 +++------
 mm/gup_test.c                       | 5 ++---
 virt/kvm/kvm_main.c                 | 2 +-
 7 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/sgx/ioctl.c b/arch/x86/kernel/cpu/sgx/ioctl.c
index 21ca0a831b70..5d390df21440 100644
--- a/arch/x86/kernel/cpu/sgx/ioctl.c
+++ b/arch/x86/kernel/cpu/sgx/ioctl.c
@@ -214,7 +214,7 @@ static int __sgx_encl_add_page(struct sgx_encl *encl,
 	if (!(vma->vm_flags & VM_MAYEXEC))
 		return -EACCES;
 
-	ret = get_user_pages(src, 1, 0, &src_page, NULL);
+	ret = get_user_pages(src, 1, 0, &src_page);
 	if (ret < 1)
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 1e8e287e113c..0597540f0dde 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -362,7 +362,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 		struct page **pages = ttm->pages + pinned;
 
 		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
-				   pages, NULL);
+				   pages);
 		if (r < 0)
 			goto release_pages;
 
diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
index b836936e9747..378cf02a2aa1 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -185,7 +185,7 @@ static int non_atomic_pte_lookup(struct vm_area_struct *vma,
 #else
 	*pageshift = PAGE_SHIFT;
 #endif
-	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page, NULL) <= 0)
+	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page) <= 0)
 		return -EFAULT;
 	*paddr = page_to_phys(page);
 	put_page(page);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 37554b08bb28..b14cc4972d0b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2380,8 +2380,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
 			   unsigned int gup_flags, struct page **pages,
 			   struct vm_area_struct **vmas, int *locked);
 long get_user_pages(unsigned long start, unsigned long nr_pages,
-			    unsigned int gup_flags, struct page **pages,
-			    struct vm_area_struct **vmas);
+		    unsigned int gup_flags, struct page **pages);
 long pin_user_pages(unsigned long start, unsigned long nr_pages,
 		    unsigned int gup_flags, struct page **pages,
 		    struct vm_area_struct **vmas);
diff --git a/mm/gup.c b/mm/gup.c
index 1f72a717232b..7e454d6b157e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2251,8 +2251,6 @@ long get_user_pages_remote(struct mm_struct *mm,
  * @pages:      array that receives pointers to the pages pinned.
  *              Should be at least nr_pages long. Or NULL, if caller
  *              only intends to ensure the pages are faulted in.
- * @vmas:       array of pointers to vmas corresponding to each page.
- *              Or NULL if the caller does not require them.
  *
  * This is the same as get_user_pages_remote(), just with a less-flexible
  * calling convention where we assume that the mm being operated on belongs to
@@ -2260,16 +2258,15 @@ long get_user_pages_remote(struct mm_struct *mm,
  * obviously don't pass FOLL_REMOTE in here.
  */
 long get_user_pages(unsigned long start, unsigned long nr_pages,
-		unsigned int gup_flags, struct page **pages,
-		struct vm_area_struct **vmas)
+		    unsigned int gup_flags, struct page **pages)
 {
 	int locked = 1;
 
-	if (!is_valid_gup_args(pages, vmas, NULL, &gup_flags, FOLL_TOUCH))
+	if (!is_valid_gup_args(pages, NULL, NULL, &gup_flags, FOLL_TOUCH))
 		return -EINVAL;
 
 	return __get_user_pages_locked(current->mm, start, nr_pages, pages,
-				       vmas, &locked, gup_flags);
+				       NULL, &locked, gup_flags);
 }
 EXPORT_SYMBOL(get_user_pages);
 
diff --git a/mm/gup_test.c b/mm/gup_test.c
index 8ae7307a1bb6..9ba8ea23f84e 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -139,8 +139,7 @@ static int __gup_test_ioctl(unsigned int cmd,
 						 pages + i);
 			break;
 		case GUP_BASIC_TEST:
-			nr = get_user_pages(addr, nr, gup->gup_flags, pages + i,
-					    NULL);
+			nr = get_user_pages(addr, nr, gup->gup_flags, pages + i);
 			break;
 		case PIN_FAST_BENCHMARK:
 			nr = pin_user_pages_fast(addr, nr, gup->gup_flags,
@@ -161,7 +160,7 @@ static int __gup_test_ioctl(unsigned int cmd,
 						    pages + i, NULL);
 			else
 				nr = get_user_pages(addr, nr, gup->gup_flags,
-						    pages + i, NULL);
+						    pages + i);
 			break;
 		default:
 			ret = -EINVAL;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d255964ec331..7f31e0a4adb5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2474,7 +2474,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
 {
 	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
 
-	rc = get_user_pages(addr, 1, flags, NULL, NULL);
+	rc = get_user_pages(addr, 1, flags, NULL);
 	return rc == -EHWPOISON;
 }
 
-- 
2.40.0

