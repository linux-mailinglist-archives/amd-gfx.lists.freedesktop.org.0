Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9C1FA30C
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2020 23:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A086E528;
	Mon, 15 Jun 2020 21:48:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512BD6E509
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2020 20:56:28 +0000 (UTC)
IronPort-SDR: DTuF3dI2B5Y/x0Al8FmKhcN1FiMWlPSOxohi30kftJIv/7PsPusXM/fl2WgC1ijCORfOcPJvk2
 ET1s65mSP+WA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 13:56:27 -0700
IronPort-SDR: muuOGndW6l2twqgKRUp5gHj+I6DHwdVVXjshaVMnzZ31gcVkdJsq7yUI+1XuAIXfF8xffWXCmG
 4mfjL2O9CNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,516,1583222400"; d="scan'208";a="261210056"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2020 13:56:26 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.56]) by
 ORSMSX107.amr.corp.intel.com ([169.254.1.92]) with mapi id 14.03.0439.000;
 Mon, 15 Jun 2020 13:56:15 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Andy Lutomirski <luto@amacapital.net>, "Yu, Fenghua" <fenghua.yu@intel.com>
Subject: RE: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Thread-Topic: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Thread-Index: AQHWQRt0fMmHYsE9aUKb3rSjyAIL46jZyC2AgACD5gCAAAQ1gIAAJA2AgAAFHACAAAbEgIAAA+gAgAATCICAAAmFgP//iy/g
Date: Mon, 15 Jun 2020 20:56:15 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F66C849@ORSMSX115.amr.corp.intel.com>
References: <20200615201735.GE13792@romley-ivt3.sc.intel.com>
 <C41D099B-BE2E-4D0E-A7B5-7CE587E11930@amacapital.net>
In-Reply-To: <C41D099B-BE2E-4D0E-A7B5-7CE587E11930@amacapital.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 21:48:37 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Yu, 
 Yu-cheng" <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

> Are we planning to keep PASID live once a task has used it once or are we going to swap it lazily?  If the latter, a percpu variable might be better.

Current plan is "touch it once and the task owns it until exit(2)"

Maybe someday in the future when we have data on how applications
actually use accelerators we could look at something more complex
if usage patterns look like it would be beneficial.

-Tony
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
