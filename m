Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14392AD13C
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Nov 2020 09:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FB7898A8;
	Tue, 10 Nov 2020 08:25:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0179.hostedemail.com
 [216.40.44.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1783E89533;
 Tue, 10 Nov 2020 02:52:14 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id F008012CB;
 Tue, 10 Nov 2020 02:52:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:4321:4605:5007:6117:6119:6742:6743:7652:7875:7903:8660:10004:10400:10848:11232:11658:11783:11914:12043:12048:12297:12679:12740:12895:13019:13069:13148:13230:13311:13357:13439:13894:14181:14659:14721:21080:21451:21627:21939:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: ink22_1714ef1272f1
X-Filterd-Recvd-Size: 2439
Received: from [192.168.0.160] (cpe-72-134-80-165.natsow.res.rr.com
 [72.134.80.165]) (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Tue, 10 Nov 2020 02:52:09 +0000 (UTC)
Message-ID: <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
Subject: Re: Subject: [RFC] clang tooling cleanups
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, linux-kernel@vger.kernel.org, 
 clang-built-linux@googlegroups.com, cocci <cocci@systeme.lip6.fr>
Date: Mon, 09 Nov 2020 18:52:08 -0800
In-Reply-To: <20201027164255.1573301-1-trix@redhat.com>
References: <20201027164255.1573301-1-trix@redhat.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:25:45 +0000
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, 2020-10-27 at 09:42 -0700, trix@redhat.com wrote:
> This rfc will describe
> An upcoming treewide cleanup.
> How clang tooling was used to programatically do the clean up.
> Solicit opinions on how to generally use clang tooling.
> =

> The clang warning -Wextra-semi-stmt produces about 10k warnings.
> Reviewing these, a subset of semicolon after a switch looks safe to
> fix all the time.  An example problem
> =

> void foo(int a) {
> =A0=A0=A0=A0=A0switch(a) {
> =A0=A0=A0=A0=A0	       case 1:
> 	       ...
> =A0=A0=A0=A0=A0}; <--- extra semicolon
> }
> =

> Treewide, there are about 100 problems in 50 files for x86_64 allyesconfi=
g.
> These fixes will be the upcoming cleanup.

coccinelle already does some of these.

For instance: scripts/coccinelle/misc/semicolon.cocci

Perhaps some tool coordination can be done here as
coccinelle/checkpatch/clang/Lindent call all be used
to do some facet or another of these cleanup issues.



_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
