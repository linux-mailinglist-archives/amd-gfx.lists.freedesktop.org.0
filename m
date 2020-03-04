Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF5178944
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Mar 2020 04:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FE06E9A8;
	Wed,  4 Mar 2020 03:53:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from yyz.mikelr.com (unknown
 [IPv6:2602:ffb6:2:0:f816:3eff:fe0d:377b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C676E9A8
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Mar 2020 03:20:48 +0000 (UTC)
Received: from glidewell.localnet (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 6DF123CFC8;
 Tue,  3 Mar 2020 22:20:46 -0500 (EST)
From: Mikel Rychliski <mikel@mikelr.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/4] PCI: Use ioremap, not phys_to_virt for platform rom
Date: Tue, 03 Mar 2020 22:20:45 -0500
Message-ID: <2616060.jBR9Tdob1i@glidewell>
In-Reply-To: <20200303143827.GA78253@google.com>
References: <20200303143827.GA78253@google.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Mar 2020 03:53:49 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, linux-pci@vger.kernel.org,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, March 3, 2020 9:38:27 AM EST Bjorn Helgaas wrote:
> Cosmetics:
> 
> s/ioremap/ioremap()/ (also in commit log)
> s/phys_to_virt/phys_to_virt()/ (also in commit log)
> s/pci_platform_rom/pci_platform_rom()/ (commit log)
> s/rom/ROM/

> This changes the interface of pci_platform_rom() (the caller is now
> responsible for doing an iounmap()).  That should be mentioned in the
> function comment, and I think the subsequent patches should be
> squashed into this one so the interface change and the caller changes
> are done simultaneously.
> 
> Also, it looks like nvbios_platform.init() (platform_init()) needs a
> similar change?

Hi Bjorn,

Thank you for your comments. I'll make the suggested changes, add an iounmap() 
in the nouveau usage, and provide a new two-patch series.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
