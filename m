Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7716921E9A9
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 09:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7276E93F;
	Tue, 14 Jul 2020 07:10:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD4D6E839
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2020 23:48:44 +0000 (UTC)
IronPort-SDR: exRhXkfSfUnfBxAX6EsgKm+qR4+whqAPOZqphMjtjXgNNylaOALvrZWfL11CAPqEWZQA22IzFN
 p2v9mnwCqDig==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="136226997"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="136226997"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 16:48:44 -0700
IronPort-SDR: 0havjBUgSXgKnYCwONegdjWVzMspwMAWNjIzAMoCeTN9tjmCBbxhy3a0Iw+Lt7bGLn/5EdjR8q
 spVo+PNPnSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="281570450"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga003.jf.intel.com with ESMTP; 13 Jul 2020 16:48:44 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Joerg Roedel" <joro@8bytes.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Peter Zijlstra" <peterz@infradead.org>, "H Peter Anvin" <hpa@zytor.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>,
 "Dave Hansen" <dave.hansen@intel.com>, "Tony Luck" <tony.luck@intel.com>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Christoph Hellwig" <hch@infradead.org>, "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v6 06/12] x86/msr-index: Define IA32_PASID MSR
Date: Mon, 13 Jul 2020 16:48:01 -0700
Message-Id: <1594684087-61184-7-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
References: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:09:57 +0000
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
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The IA32_PASID MSR (0xd93) contains the Process Address Space Identifier
(PASID), a 20-bit value. Bit 31 must be set to indicate the value
programmed in the MSR is valid. Hardware uses PASID to identify process
address space and direct responses to the right address space.

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
v2:
- Change "identify process" to "identify process address space" in the
  commit message (Thomas)

 arch/x86/include/asm/msr-index.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e8370e64a155..e5f699ff1dd6 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -237,6 +237,9 @@
 #define MSR_IA32_LASTINTFROMIP		0x000001dd
 #define MSR_IA32_LASTINTTOIP		0x000001de
 
+#define MSR_IA32_PASID			0x00000d93
+#define MSR_IA32_PASID_VALID		BIT_ULL(31)
+
 /* DEBUGCTLMSR bits (others vary by model): */
 #define DEBUGCTLMSR_LBR			(1UL <<  0) /* last branch recording */
 #define DEBUGCTLMSR_BTF_SHIFT		1
-- 
2.19.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
