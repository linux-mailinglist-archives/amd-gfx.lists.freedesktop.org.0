Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4240DAAD
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Sep 2021 15:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582786EDAC;
	Thu, 16 Sep 2021 13:07:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1AD6EB72;
 Thu, 16 Sep 2021 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631793098;
 bh=hO8MM7rkDgtjlX2BKCZzkCfApidbr4y2lSSjjuo6Spc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=T879eZw4oyZmXCoQBzMn6TSL7TK2u4yA9WcOVdZAZ0H1ES0BfZh+c8qlaAlgIPIpC
 EZnQfXlJ4z5xni7cnClkogAdyVLHlN0VyzknQ+r9zr6EpGugkqsddQqZZrBGZDfrR0
 9M+jMUqC/HazPpVpqowHJ+tlxvnuziqzSjk0KDQRmXiXxxaF7vMYJKwoebP5X7vITE
 bMJsOzJQ7uNDCIvfTBD7ylQk7c+vA2OSB/um9B8TH/DnrN+ZCARHPzrHaVfJh6WWqX
 eRpDp98PeMg6OvGq/UiCuletGr7nCgKoxmLkqF4TIS7Ah9AEH2oeKN2Got5wDxjEQU
 5Tn4zy5KEZ4Kw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9FmR1HjKz9sXS;
 Thu, 16 Sep 2021 21:51:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Borislav Petkov <bp@alien8.de>, Sathyanarayanan Kuppuswamy
 <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-efi@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Paul
 Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org, Andi Kleen
 <ak@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 linux-graphics-maintainer@vmware.com, Tom Lendacky
 <thomas.lendacky@amd.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/8] powerpc/pseries/svm: Add a powerpc version of
 cc_platform_has()
In-Reply-To: <YULztMRLJ55YLVU9@infradead.org>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <9d4fc3f8ea7b325aaa1879beab1286876f45d450.1631141919.git.thomas.lendacky@amd.com>
 <YUCOTIPPsJJpLO/d@zn.tnic> <87lf3yk7g4.fsf@mpe.ellerman.id.au>
 <YUHGDbtiGrDz5+NS@zn.tnic>
 <f8388f18-5e90-5d0f-d681-0b17f8307dd4@csgroup.eu>
 <YULztMRLJ55YLVU9@infradead.org>
Date: Thu, 16 Sep 2021 21:51:30 +1000
Message-ID: <87czp8kabh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 16 Sep 2021 13:06:59 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Christoph Hellwig <hch@infradead.org> writes:
> On Wed, Sep 15, 2021 at 07:18:34PM +0200, Christophe Leroy wrote:
>> Could you please provide more explicit explanation why inlining such an
>> helper is considered as bad practice and messy ?
>
> Because now we get architectures to all subly differ.  Look at the mess
> for ioremap and the ioremap* variant.
>
> The only good reason to allow for inlines if if they are used in a hot
> path.  Which cc_platform_has is not, especially not on powerpc.

Yes I agree, it's not a hot path so it doesn't really matter, which is
why I Acked it.

I think it is possible to do both, share the declaration across arches
but also give arches flexibility to use an inline if they prefer, see
patch below.

I'm not suggesting we actually do that for this series now, but I think
it would solve the problem if we ever needed to in future.

cheers


diff --git a/arch/powerpc/platforms/pseries/cc_platform.c b/arch/powerpc/include/asm/cc_platform.h
similarity index 74%
rename from arch/powerpc/platforms/pseries/cc_platform.c
rename to arch/powerpc/include/asm/cc_platform.h
index e8021af83a19..6285c3c385a6 100644
--- a/arch/powerpc/platforms/pseries/cc_platform.c
+++ b/arch/powerpc/include/asm/cc_platform.h
@@ -7,13 +7,10 @@
  * Author: Tom Lendacky <thomas.lendacky@amd.com>
  */
 
-#include <linux/export.h>
 #include <linux/cc_platform.h>
-
-#include <asm/machdep.h>
 #include <asm/svm.h>
 
-bool cc_platform_has(enum cc_attr attr)
+static inline bool arch_cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
@@ -23,4 +20,3 @@ bool cc_platform_has(enum cc_attr attr)
 		return false;
 	}
 }
-EXPORT_SYMBOL_GPL(cc_platform_has);
diff --git a/arch/x86/include/asm/cc_platform.h b/arch/x86/include/asm/cc_platform.h
new file mode 100644
index 000000000000..0a4220697043
--- /dev/null
+++ b/arch/x86/include/asm/cc_platform.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_CC_PLATFORM_H_
+#define _ASM_X86_CC_PLATFORM_H_
+
+bool arch_cc_platform_has(enum cc_attr attr);
+
+#endif // _ASM_X86_CC_PLATFORM_H_
diff --git a/arch/x86/kernel/cc_platform.c b/arch/x86/kernel/cc_platform.c
index 3c9bacd3c3f3..77e8c3465979 100644
--- a/arch/x86/kernel/cc_platform.c
+++ b/arch/x86/kernel/cc_platform.c
@@ -11,11 +11,11 @@
 #include <linux/cc_platform.h>
 #include <linux/mem_encrypt.h>
 
-bool cc_platform_has(enum cc_attr attr)
+bool arch_cc_platform_has(enum cc_attr attr)
 {
 	if (sme_me_mask)
 		return amd_cc_platform_has(attr);
 
 	return false;
 }
-EXPORT_SYMBOL_GPL(cc_platform_has);
+EXPORT_SYMBOL_GPL(arch_cc_platform_has);
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index 253f3ea66cd8..f3306647c5d9 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -65,6 +65,8 @@ enum cc_attr {
 
 #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
 
+#include <asm/cc_platform.h>
+
 /**
  * cc_platform_has() - Checks if the specified cc_attr attribute is active
  * @attr: Confidential computing attribute to check
@@ -77,7 +79,10 @@ enum cc_attr {
  * * TRUE  - Specified Confidential Computing attribute is active
  * * FALSE - Specified Confidential Computing attribute is not active
  */
-bool cc_platform_has(enum cc_attr attr);
+static inline bool cc_platform_has(enum cc_attr attr)
+{
+	return arch_cc_platform_has(attr);
+}
 
 #else	/* !CONFIG_ARCH_HAS_CC_PLATFORM */
 


