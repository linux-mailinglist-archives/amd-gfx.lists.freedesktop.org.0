Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E44B5311
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Feb 2022 15:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F7510E51A;
	Mon, 14 Feb 2022 14:19:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ADB10E4FA;
 Mon, 14 Feb 2022 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644836301; x=1676372301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fqstnbilWmleOnIjJb3aDPlLE84EFgpMrS7YjBM/2dk=;
 b=IvgyhlIAVyqiOEPZXCmb4uonwoA85Jcdc5s/4b7laEPWIUs/+35Mffuu
 S4G+knTiUJKADgopzVw0k+/SHp3N6Jkh8nEuTEqY7r4TMZpKAHqepmtH9
 5jXLXjyIn0HUarHtLgXm4EDrqqBM5QkHc+L0VR375kuThCFVyxAXZt1q7
 4Tkwa1SUNE41sKHB9pf3x5Rhj2VZ80Ow/pSQmr9f/mRLTExA2AhE0b48T
 7OclePP3BUye17yi6yCNCG8EHZwbzde2W7wCRZQTWv9C9aDnovC5UJeM2
 iVMGwEsXeaCexXHvX+F8ps/wksDGGyAW4uo6P/MBT1kyPKjST0kuzlWY+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="310803286"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="310803286"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:58:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="528087732"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:58:15 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 12:56:58 +0200
Date: Mon, 14 Feb 2022 12:56:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3 05/12] PCI: Detect root port of internal USB4 devices
 by `usb4-host-interface`
Message-ID: <Ygo1eoVe8D0b80QF@lahna>
References: <20220211193250.1904843-6-mario.limonciello@amd.com>
 <20220211214546.GA737137@bhelgaas> <YgoGAkjZgCob8Mdl@lahna>
 <20220214085202.GA21533@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214085202.GA21533@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 14 Feb 2022 14:19:38 +0000
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 09:52:02AM +0100, Lukas Wunner wrote:
> On Mon, Feb 14, 2022 at 09:34:26AM +0200, Mika Westerberg wrote:
> > On Fri, Feb 11, 2022 at 03:45:46PM -0600, Bjorn Helgaas wrote:
> > > My expectation is that "USB" (like "PCI" and "PCIe") tells me
> > > something about how a device is electrically connected and how
> > > software can operate it.  It doesn't really tell me anything about
> > > whether those electrical connections are permanent, made through an
> > > internal slot, or made through an external connector and cable.
> > 
> > It is used to identify "tunneled" ports (whether PCIe, USB 3.x or
> > DisplayPort). Tunnels are created by software (in Linux it is the
> > Thunderbolt driver) and are dynamic in nature. The USB4 links go over
> > USB Type-C cable which also is something user can plug/unplug freely.
> > 
> > I would say it is reasonable expectation that anything behind these
> > ports can be assumed as "removable".
> 
> USB gadgets may be soldered to the mainboard.  Those cannot be
> unplugged freely.  It is common practice to solder USB Ethernet
> or USB FTDI serial ports and nothing's preventing a vendor to solder
> USB4/Thunderbolt gadgets.

Right, that's why I say it is "reasonable expectation" that anything
behind these ports can be assumed "removable" :) Of course they don't
have to be but if we assume that in the driver where this actually
matters we should be on the safe side, no?
