Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9541A363B
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Apr 2020 16:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECE36E226;
	Thu,  9 Apr 2020 14:50:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCEC6E226
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2020 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UaY+F14JIF5fNnFl5Q0dxEWbJVvhGgScCq/Av6dpNmk=; b=tKQj+I8QN0CWaEHBaQakSjP1MS
 NFMrpBCBq1e6c51EZI6d6hUiCFB0HPjMG5DJ9ONn+g69FXwgZiYKAT2OR3mkVPFdFudBMApREZSfL
 jVduc+H0ZTMlL6GNHH01b9l/NQp2VHMzeB+IhtRxnIQ3YTpqodDbZVICtGRLhzoxljjvJ/UsckgFz
 GCJhFdUEZhD2IZm6IWCfgHVtZ+YVW4WXYiZDCPa62xLXIiDbX7LBbOr5joW631gIp9epNaMHg5kEV
 BFtZmCV4v2gY0qCnIZ6o4hT3KvqbZqU0mnBgYweLXCISBPfCtZkbGcJtcjjoIMzjrsbZ5OfVS5Ssw
 iF1N53Hg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMYRB-0002N4-OD; Thu, 09 Apr 2020 14:45:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC72B300B38;
 Thu,  9 Apr 2020 16:45:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 949002BB012BC; Thu,  9 Apr 2020 16:45:46 +0200 (CEST)
Date: Thu, 9 Apr 2020 16:45:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2] x86: insn: Add insn_is_fpu()
Message-ID: <20200409144546.GP20760@hirez.programming.kicks-ass.net>
References: <20200407155449.GF20730@hirez.programming.kicks-ass.net>
 <158636215075.6641.10786116450376715657.stgit@devnote2>
 <20200409143212.GW20696@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409143212.GW20696@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Thu, 09 Apr 2020 14:50:20 +0000
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
Cc: David Zhou <David1.Zhou@amd.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jann Horn <jannh@google.com>, Leo Li <sunpeng.li@amd.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 04:32:12PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 09, 2020 at 01:09:11AM +0900, Masami Hiramatsu wrote:
> > Add insn_is_fpu(insn) which tells that the insn is
> > whether touch the FPU/SSE/MMX register or the instruction
> > of FP coprocessor.
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > ---
> 
> Sadly, it turns out I need "FWAIT" too, which I tried adding like the
> below, but that comes apart most mighty :/
> 
> The trouble is that FWAIT doesn't take a MODRM, so the previous
> assumption that INAT_FPU implied INAT_MODRM needs to be broken, and I
> think that ripples through somewhere.
> 
> (also, your patch adds some whitespace to convert_operands(), not sure
> that was intended)
> 
> --- a/arch/x86/lib/x86-opcode-map.txt
> +++ b/arch/x86/lib/x86-opcode-map.txt
> @@ -206,7 +206,7 @@ Table: one byte opcode
>  98: CBW/CWDE/CDQE
>  99: CWD/CDQ/CQO
>  9a: CALLF Ap (i64)
> -9b: FWAIT/WAIT
> +9b: FWAIT/WAIT {FPU}
>  9c: PUSHF/D/Q Fv (d64)
>  9d: POPF/D/Q Fv (d64)
>  9e: SAHF
> --- a/arch/x86/tools/gen-insn-attr-x86.awk
> +++ b/arch/x86/tools/gen-insn-attr-x86.awk
> @@ -331,9 +331,13 @@ function convert_operands(count,opnd,
>  		if (match(opcode, rex_expr))
>  			flags = add_flags(flags, "INAT_MAKE_PREFIX(INAT_PFX_REX)")
>  
> +		# check coprocessor escape
> +		if (match(ext, "^ESC"))
> +			flags = add_flags(flags, "INAT_MODRM")

I'm an idiot; that needs to be:

		if (match(opcode, "^ESC"))

> +
>  		# check FPU/MMX/SSE superscripts
>  		if (match(ext, fpu_expr))
> -			flags = add_flags(flags, "INAT_MODRM | INAT_FPU")
> +			flags = add_flags(flags, "INAT_FPU")
>  
>  		# check VEX codes
>  		if (match(ext, evexonly_expr))
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
