Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631419EBBD
	for <lists+amd-gfx@lfdr.de>; Sun,  5 Apr 2020 15:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861C16E249;
	Sun,  5 Apr 2020 13:54:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4735A6E09C
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 Apr 2020 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dBfBsCmH+Eo1IEVIov38NE0cr2dP5E/BRHhdQtoIDak=; b=zuv5E7NjreiQ5XBFzn1PjCMVNV
 5jlV9xfeyuYdiFQDdIRKMCVcHcR7OrMF8OAi/cb5kWg2eHOLySIleDucXovsfjveBE5dBEfeOnEJ5
 xsf/mpIZYKRsNwcAOBoysY7X4sjUDDX9+F1Drp9vz/ft02QfFO3C9Ava5WHPWQtbN1a2u6VWKpHh+
 IOUVxvbxQkUagwelFrXW1GOjQ8vB6FFg+A7tRCvITwxk0ajpOTFj7oBMN6LBb8gEL8901GSrdKqD9
 tR8vLwcHLqSSFTZCIFQDgCsmVr9OAeBqyoB/7oykglpseUcht3wj4PGhIdxS5Q/elLYDQJmY0t62n
 ACn+msaA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKjqV-0000fy-P3; Sat, 04 Apr 2020 14:32:28 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5AE919834EB; Sat,  4 Apr 2020 16:32:24 +0200 (CEST)
Date: Sat, 4 Apr 2020 16:32:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: AMD DC graphics display code enables -mhard-float, -msse, -msse2
 without any visible FPU state protection
Message-ID: <20200404143224.GL2452@worktop.programming.kicks-ass.net>
References: <CAG48ez2Sx4ELkM94aD_h_J7K7KBOeuGmvZLKRkg3n_f2WoZ_cg@mail.gmail.com>
 <4c5fe55d-9db9-2f61-59b2-1fb2e1b45ed0@amd.com>
 <20200402141308.GB20730@hirez.programming.kicks-ass.net>
 <20200403142837.f61a18d7bd32fd73777479ad@kernel.org>
 <20200403112113.GN20730@hirez.programming.kicks-ass.net>
 <20200404120808.05e9aa61500265be2e031bd6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200404120808.05e9aa61500265be2e031bd6@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 05 Apr 2020 13:54:42 +0000
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
 Josh Poimboeuf <jpoimboe@redhat.com>, Jann Horn <jannh@google.com>,
 Leo Li <sunpeng.li@amd.com>, the arch/x86 maintainers <x86@kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Apr 04, 2020 at 12:08:08PM +0900, Masami Hiramatsu wrote:
> From c609be0b6403245612503fca1087628655bab96c Mon Sep 17 00:00:00 2001
> From: Masami Hiramatsu <mhiramat@kernel.org>
> Date: Fri, 3 Apr 2020 16:58:22 +0900
> Subject: [PATCH] x86: insn: Add insn_is_fpu()
> 
> Add insn_is_fpu(insn) which tells that the insn is
> whether touch the MMX/XMM/YMM register or the instruction
> of FP coprocessor.

Looks good, although I changed it a little like so:

--- a/arch/x86/include/asm/insn.h
+++ b/arch/x86/include/asm/insn.h
@@ -133,11 +133,12 @@ static inline int insn_is_fpu(struct ins
 {
 	if (!insn->opcode.got)
 		insn_get_opcode(insn);
-	if (inat_is_fpu(insn->attr)) {
+	if (inat_is_fpu(insn->attr)) {
 		if (insn->attr & INAT_FPUIFVEX)
 			return insn_is_avx(insn);
 		return 1;
 	}
+	return 0;
 }
 
 static inline int insn_has_emulate_prefix(struct insn *insn)
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -269,14 +269,14 @@ d4: AAM Ib (i64)
 d5: AAD Ib (i64)
 d6:
 d7: XLAT/XLATB
-d8: ESC
-d9: ESC
-da: ESC
-db: ESC
-dc: ESC
-dd: ESC
-de: ESC
-df: ESC
+d8: FPU
+d9: FPU
+da: FPU
+db: FPU
+dc: FPU
+dd: FPU
+de: FPU
+df: FPU
 # 0xe0 - 0xef
 # Note: "forced64" is Intel CPU behavior: they ignore 0x66 prefix
 # in 64-bit mode. AMD CPUs accept 0x66 prefix, it causes RIP truncation
--- a/arch/x86/tools/gen-insn-attr-x86.awk
+++ b/arch/x86/tools/gen-insn-attr-x86.awk
@@ -65,10 +65,11 @@ BEGIN {
 	modrm_expr = "^([CDEGMNPQRSUVW/][a-z]+|NTA|T[012])"
 	force64_expr = "\\([df]64\\)"
 	rex_expr = "^REX(\\.[XRWB]+)*"
-	mmxreg_expr = "^[HLNPQUVW][a-z]+"
-	mmx_expr = "^\\((emms|fxsave|fxrstor|ldmxcsr|stmxcsr)\\)"
-	mmxifvex_expr = "^CMOV" # CMOV is non-vex non-mmx
-	fpu_expr = "^ESC"
+
+	mmxreg_expr = "^[HLNPQUVW][a-z]+" # MMX/SSE register operands
+	mmx_expr = "^\\(emms\\)"	  # MMX/SSE nmemonics lacking operands
+	mmxifvex_expr = "^CMOV"		  # nmemonics NOT an AVX
+	fpu_expr = "^FPU"
 
 	lprefix1_expr = "\\((66|!F3)\\)"
 	lprefix2_expr = "\\(F3\\)"

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
