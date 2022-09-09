Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F80D5B4041
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Sep 2022 21:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9C910EE21;
	Fri,  9 Sep 2022 19:55:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B5510EE28
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Sep 2022 19:55:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DD31B82625;
 Fri,  9 Sep 2022 19:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E1EC433C1;
 Fri,  9 Sep 2022 19:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662753345;
 bh=KMgedXlIXbQ75nEAN7Xt8YHn1LF5kcWjC6xSs+xcx8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OVegD8hdC13AAJMu8fof3s42PoWb1yHd/xu6eQf9MeQAOYDDKOfyqAX45vyABcuue
 s4l5OF0fViOlIP0gDIqFYgan+98sL74x5NZnIpPca6cWWIXLslAaEYwOw7icc4W8bx
 QxkscX+zucLUNVKEcgOO6vbYMvJVFExK4NzHszVydrP4vK9dFpDNLXvNyFA08uCypv
 H6LnvpQgS9Gzwf5fEZLrKuLYjBa5dQSTLFZCc+3EUvWeQcnwMrjzE/l0Jyu5fRU0B6
 7eQ6dzVfwcTPMkrTryWZbl1MBvdqCVMLfvgIdyo/L5cINegoyFkFaymaOg82gSJ0e8
 tvX+ezj3YFhvg==
Date: Fri, 9 Sep 2022 14:55:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Don't enable LTR if not supported
Message-ID: <20220909195543.GA310962@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7b2f76a-772d-78d9-a1f8-68c32477f21f@amd.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>,
 "wielkiegie@gmail.com" <wielkiegie@gmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 01:11:54PM +0530, Lazar, Lijo wrote:
> 
> 
> On 9/8/2022 11:27 PM, Bjorn Helgaas wrote:
> > On Thu, Sep 08, 2022 at 04:42:38PM +0000, Lazar, Lijo wrote:
> > > I am not sure if ASPM settings can be generalized by PCIE core.
> > > Performance vs Power savings when ASPM is enabled will require some
> > > additional tuning and that will be device specific.
> > 
> > Can you elaborate on this?  In the universe of drivers, very few do
> > their own ASPM configuration, and it's usually to work around hardware
> > defects, e.g., L1 doesn't work on some e1000e devices, L0s doesn't
> > work on some iwlwifi devices, etc.
> > 
> > The core does know how to configure all the ASPM features defined in
> > the PCIe spec, e.g., L0s, L1, L1.1, L1.2, and LTR.
> > 
> > > In some of the other ASICs, this programming is done in VBIOS/SBIOS
> > > firmware. Having it in driver provides the advantage of additional
> > > tuning without forcing a VBIOS upgrade.
> > 
> > I think it's clearly the intent of the PCIe spec that ASPM
> > configuration be done by generic code.  Here are some things that
> > require a system-level view, not just an individual device view:
> > 
> >    - L0s, L1, and L1 Substates cannot be enabled unless both ends
> >      support it (PCIe r6.0, secs 5.4.1.4, 7.5.3.7, 5.5.4).
> > 
> >    - Devices advertise the "Acceptable Latency" they can accept for
> >      transitions from L0s or L1 to L0, and the actual latency depends
> >      on the "Exit Latencies" of all the devices in the path to the Root
> >      Port (sec 5.4.1.3.2).
> > 
> >    - LTR (required by L1.2) cannot be enabled unless it is already
> >      enabled in all upstream devices (sec 6.18).  This patch relies on
> >      "ltr_path", which works now but relies on the PCI core never
> >      reconfiguring the upstream path.
> > 
> > There might be amdgpu-specific features the driver needs to set up,
> > but if drivers fiddle with architected features like LTR behind the
> > PCI core's back, things are likely to break.
> > 
> 
> The programming is mostly related to entry conditions and spec leaves it to
> implementation.
> 
> From r4.0 spec -
> "
> This specification does not dictate when a component with an Upstream Port
> must initiate a transition to the L1 state. The interoperable mechanisms for
> transitioning into and out of L1 are defined within this specification;
> however, the specific ASPM policy governing when to transition into L1 is
> left to the implementer.
> ...
> Another approach would be for the Downstream device to initiate a transition
> to the L1 state once the Link has been idle in L0 for a set amount of time.
> "
> 
> Some of the programming like below relates to timings for entry.
> 
>         def = data = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP3);
>         data |= 0x5DE0 <<
> RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER__SHIFT;
>         data |= 0x0010 <<
> RCC_BIF_STRAP3__STRAP_VLINK_PM_L1_ENTRY_TIMER__SHIFT;
>         if (def != data)
>                 WREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP3, data);
> 
> Similarly for LTR, as it provides a dynamic mechanism to report tolerance
> while in L1 substates, the tolerance timings can be tuned through registers
> though there is a threshold.

I don't object to the driver programming device-specific things,
although there might be issues if it does that after the core has
already configured and enabled ASPM -- the driver might need to
temporarily disable ASPM while it updates parameters, then re-enable
it.

I *do* object to the driver programming PCIe-generic things that the
PCI core thinks it owns.  It's especially annoying if the driver uses
device-specific #defines and access methods for generic PCIe things
because then we can't even find potential conflicts.

> > > From: Alex Deucher <alexdeucher@gmail.com>
> > > On Thu, Sep 8, 2022 at 12:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > 
> > > > Do you know why the driver configures ASPM itself?  If the PCI core is
> > > > doing something wrong (and I'm sure it is, ASPM support is kind of a
> > > > mess), I'd much prefer to fix up the core where *all* drivers can
> > > > benefit from it.
> > > 
> > > This is the programming sequence we get from our hardware team and it
> > > is used on both windows and Linux.  As far as I understand it windows
> > > doesn't handle this in the core, it's up to the individual drivers to
> > > enable it.  I'm not familiar with how this should be enabled
> > > generically, but at least for our hardware, it seems to have some
> > > variation compared to what is done in the PCI core due to stability,
> > > etc. It seems to me that this may need asic specific implementations
> > > for a lot of hardware depending on the required programming sequences.
> > > E.g., various asics may need hardware workaround for bugs or platform
> > > issues, etc.  I can ask for more details from our hardware team.
> > 
> > If the PCI core has stability issues, I want to fix them.  This
> > hardware may have its own stability issues, and I would ideally like
> > to have drivers use interfaces like pci_disable_link_state() to avoid
> > broken things.  Maybe we need new interfaces for more subtle kinds of
> > breakage.
> > 
> > Bjorn
> > 
