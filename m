Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE9602D22
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Oct 2022 15:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF71E10E89C;
	Tue, 18 Oct 2022 13:37:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Tue, 18 Oct 2022 10:49:23 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
 by gabe.freedesktop.org (Postfix) with ESMTP id 352B310EB98;
 Tue, 18 Oct 2022 10:49:23 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 2958692009C; Tue, 18 Oct 2022 12:39:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 231E192009B;
 Tue, 18 Oct 2022 11:39:20 +0100 (BST)
Date: Tue, 18 Oct 2022 11:39:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v6.1-rc1
In-Reply-To: <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
Message-ID: <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
References: <20221017145157.1866351-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Tue, 18 Oct 2022 13:37:40 +0000
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
Cc: D Scott Phillips <scott@os.amperecomputing.com>, linux-rdma@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kvm-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 17 Oct 2022, Geert Uytterhoeven wrote:

> >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > 2616, 2621
> 
> mips-gcc11/micro32r2_defconfig
> mips-gcc11/micro32r2el_defconfig

 Where can these configs be obtained from?

  Maciej
