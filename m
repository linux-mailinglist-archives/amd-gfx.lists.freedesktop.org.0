Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB0513D056
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2020 23:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D316EB7B;
	Wed, 15 Jan 2020 22:52:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51A6EB7B
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 22:52:07 +0000 (UTC)
Received: from localhost (mobile-166-170-223-177.mycingular.net
 [166.170.223.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 988A72081E;
 Wed, 15 Jan 2020 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579128726;
 bh=0jNy+bobnBWd+ED66N9jPcEYOVLG/NFcQWJ+mvQW0TY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hdU01DoGzk9pytuLR41mFaaeQQOM0CGn/WnY9xkIKdvKWXgQBUNVfIx8xRKtSmoK5
 Y3Re/uaRZeHQZyxbnguJMAXhL2G6ap15ohQw4x0MzdBX+BjwBIZA6IriKHv5hEWHdD
 av0nyU0MuVJsi6cJBr48iKBH+jA0ae6/3MMhlkDc=
Date: Wed, 15 Jan 2020 16:52:04 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/2] Adjust AMD GPU ATS quirks
Message-ID: <20200115225204.GA222285@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MbiwYBNj5tB9=Dwj02Mi4GwJ7_5uBtx+8RkOdfC5HqLw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux PCI <linux-pci@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 03:20:18PM -0500, Alex Deucher wrote:
> On Wed, Jan 15, 2020 at 3:17 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, Jan 15, 2020 at 12:26:32PM -0500, Alex Deucher wrote:
> > > On Wed, Jan 15, 2020 at 12:14 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Tue, Jan 14, 2020 at 05:41:44PM -0600, Bjorn Helgaas wrote:
> > > > > On Tue, Jan 14, 2020 at 03:55:21PM -0500, Alex Deucher wrote:
> > > > > > We've root caused the issue and clarified the quirk.
> > > > > > This also adds a new quirk for a new GPU.
> > > > > >
> > > > > > Alex Deucher (2):
> > > > > >   pci: Clarify ATS quirk
> > > > > >   pci: add ATS quirk for navi14 board (v2)
> > > > > >
> > > > > >  drivers/pci/quirks.c | 32 +++++++++++++++++++++++++-------
> > > > > >  1 file changed, 25 insertions(+), 7 deletions(-)
> > > > >
> > > > > I propose the following, which I intend to be functionally identical.
> > > > > It just doesn't repeat the pci_info() and pdev->ats_cap = 0.
> > > >
> > > > Applied to pci/misc for v5.6, thanks!
> > >
> > > Can we add this to stable as well?
> >
> > Done!  Do you want it in v5.5?  It's pretty localized so looks pretty
> > low-risk.
> 
> Sure.  Thanks!

Moved to for-linus for v5.5.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
