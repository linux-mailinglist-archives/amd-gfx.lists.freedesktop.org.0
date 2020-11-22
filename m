Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187DC2C0153
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 09:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099F389C3B;
	Mon, 23 Nov 2020 08:25:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD2289DDD;
 Sun, 22 Nov 2020 03:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=t7P1qjxLtvKyLv5lupmc5Zc5j0L3lqaoBXMlGIL9vWk=; b=BCb+FFzpwYCsAL5/GuZs0qQqU7
 2wigu715rAloO1MXfHFDjsI/DCCkjrJ0RLz4Myz+wD98+zNWw6243kPWNzvqzMn6Tn8JVpmOuQv+x
 7EKe3xartwVOhq4ran1ZhW92oaIukRN20h1OI3pPMusUrtae1AY4TqDUCPUPtiDgxz6eQOoVcrvcz
 Ara6lCihfF7KrYMxKPcv522GOw1XE7kmR9pLBWd69WCJIf1380JdPIessAMMrwuE8sqCmQUL7YEHL
 BXN0W+EBw/mKx6JrVL7roopk6K2PnHDj+T1EiV35semdke1klNMJQXZf1Gvzraa/TLsC310jvDxAq
 zJ5cWKdw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kgfxw-0001fc-2G; Sun, 22 Nov 2020 03:23:04 +0000
Date: Sun, 22 Nov 2020 03:23:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: trix@redhat.com
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
Message-ID: <20201122032304.GE4327@casper.infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>
X-Mailman-Approved-At: Mon, 23 Nov 2020 08:25:57 +0000
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, joe@perches.com,
 bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
> The fixer review is
> https://reviews.llvm.org/D91789
> 
> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
> The false positives are caused by macros passed to other macros and by
> some macro expansions that did not have an extra semicolon.
> 
> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
> warnings in linux-next.

Are any of them not false-positives?  It's all very well to enable
stricter warnings, but if they don't fix any bugs, they're just churn.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
