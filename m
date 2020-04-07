Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AE1A106B
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Apr 2020 17:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B98896D8;
	Tue,  7 Apr 2020 15:41:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6C38864B
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Apr 2020 15:41:17 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B9B120730;
 Tue,  7 Apr 2020 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586274077;
 bh=8pU6tiXi9rnuNRWdnhlU0X7jG5tusWkAVjZTaY2jevI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=06qyQNXRyys01kGYppgJpj6KNzoPjQaxeWNQ4ceuhDI+nINHs/fybUDtA0656lKff
 FngeSccYnMRDoriIRvhrCsscLZjMnfSY2/kefq0bR4Xlg2rBfTJoVJid1cS0We9BLp
 2M7tqJ9AoOU8n0Wtj9fJk8TGmh47BEK7LcvFPh1c=
Date: Wed, 8 Apr 2020 00:41:11 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: AMD DC graphics display code enables -mhard-float, -msse,
 -msse2 without any visible FPU state protection
Message-Id: <20200408004111.3dd597f2a7c6172b4c71a9ba@kernel.org>
In-Reply-To: <20200407111535.GT20730@hirez.programming.kicks-ass.net>
References: <CAG48ez2Sx4ELkM94aD_h_J7K7KBOeuGmvZLKRkg3n_f2WoZ_cg@mail.gmail.com>
 <4c5fe55d-9db9-2f61-59b2-1fb2e1b45ed0@amd.com>
 <20200402141308.GB20730@hirez.programming.kicks-ass.net>
 <20200403142837.f61a18d7bd32fd73777479ad@kernel.org>
 <20200403112113.GN20730@hirez.programming.kicks-ass.net>
 <20200404120808.05e9aa61500265be2e031bd6@kernel.org>
 <20200404143224.GL2452@worktop.programming.kicks-ass.net>
 <20200405121930.e3ea3e7acc7588102de483e2@kernel.org>
 <20200406102107.GI20730@hirez.programming.kicks-ass.net>
 <20200407185008.c819005f0174cae76c44a135@kernel.org>
 <20200407111535.GT20730@hirez.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, 7 Apr 2020 13:15:35 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Apr 07, 2020 at 06:50:08PM +0900, Masami Hiramatsu wrote:
> > On Mon, 6 Apr 2020 12:21:07 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > arch/x86/mm/extable.o: warning: objtool: ex_handler_fprestore()+0x8b: fpu_safe hint not an FPU instruction
> > > 008b  36b:      48 0f ae 0d 00 00 00    fxrstor64 0x0(%rip)        # 373 <ex_handler_fprestore+0x93>
> > > 
> > > arch/x86/kvm/x86.o: warning: objtool: kvm_load_guest_fpu.isra.0()+0x1fa: fpu_safe hint not an FPU instruction
> > > 01fa    1d2fa:  48 0f ae 4b 40          fxrstor64 0x40(%rbx)
> > 
> > Ah, fxstor will not chang the FPU/MMX/SSE regs but just store it on memory.
> > OK, I'll remove it from the list.
> 
> Yeah, I don't much care if its in or out, but the way I was reading that
> patch it _should_ be in, but then it doesn't seem to recognise it.

Oops, I misread. OK. I fixed the issue.

> 
> > > Also, all the VMX bits seems to qualify as FPU (I can't remember seeing
> > > that previously):
> > 
> > Oops, let me check it.
> 
> I just send you another patch that could do with insn_is_vmx()
> (sorry!!!)

Hmm, it is hard to find out the vmx insns. Maybe we need to clarify it by
opcode pattern. (like "VM.*")

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
