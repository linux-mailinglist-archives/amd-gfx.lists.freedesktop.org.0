Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA201A9630
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2020 10:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB76E913;
	Wed, 15 Apr 2020 08:23:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E18C6E913
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Apr 2020 08:23:38 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 803C520784;
 Wed, 15 Apr 2020 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586939018;
 bh=0kpxY7WRGFbm5Qwfk/sr8dvg3Yio8hbJ+U8aY4ogpnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vGM9sA8DLqJS/QtEocHEqn/OvB/TI8TVm/SPdYRlIaKnHqtE4vOYZjexduuu5974c
 hrpTnb4L2dDtN9i58/NQOYkv28mC7SPW0RuV8+EGtecJ3NngVYWdwaUqcYn8W2m3+S
 2bvaxNKzZCBZfN/N9RLXRcbMvBWXMf7Jly+QPEa0=
Date: Wed, 15 Apr 2020 17:23:31 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v3] x86: insn: Add insn_is_fpu()
Message-Id: <20200415172331.96807c231956f3a7255b0202@kernel.org>
In-Reply-To: <158648174982.1073.6608148826246795028.stgit@devnote2>
References: <20200409143212.GW20696@hirez.programming.kicks-ass.net>
 <158648174982.1073.6608148826246795028.stgit@devnote2>
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
Cc: David Zhou <David1.Zhou@amd.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, 10 Apr 2020 10:22:30 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> @@ -318,10 +331,14 @@ function convert_operands(count,opnd,       i,j,imm,mod)
>  		if (match(opcode, rex_expr))
>  			flags = add_flags(flags, "INAT_MAKE_PREFIX(INAT_PFX_REX)")
>  
> -		# check coprocessor escape : TODO
> -		if (match(opcode, fpu_expr))
> +		# x87 escape opcode needs MODRM
> +		if (match(ext, x87_expr))

Oops, it must be match(opcode, x87_expr). I'll fix it.

Thanks,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
