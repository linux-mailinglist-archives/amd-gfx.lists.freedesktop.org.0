Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F41FB60D
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2020 17:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709F6E0A2;
	Tue, 16 Jun 2020 15:24:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2C06E86A
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2020 15:11:36 +0000 (UTC)
IronPort-SDR: OwrXofif4uOAJsraMtDS04Ftb0t/pudjzqJ7FVY7hA73L7tlUlZIk/p/5d0EgQ0HtBRkO8n4Md
 S+wMFUpLPpUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 08:11:36 -0700
IronPort-SDR: SwSn7gnGYbdK+kflKxePGQpLDi6Nn79/DH91IjaxvnM8WNKqmDDB6H+G96jm7432GHx9wtSMu7
 KHuOqv+1JqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="382897812"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2020 08:11:34 -0700
Date: Tue, 16 Jun 2020 08:11:35 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 08/12] mm: Define pasid in mm
Message-ID: <20200616151134.GA15763@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-9-git-send-email-fenghua.yu@intel.com>
 <20200616082819.GA590740@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616082819.GA590740@myrica>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Tue, 16 Jun 2020 15:24:44 +0000
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
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi, Jean,

On Tue, Jun 16, 2020 at 10:28:19AM +0200, Jean-Philippe Brucker wrote:
> On Fri, Jun 12, 2020 at 05:41:29PM -0700, Fenghua Yu wrote:
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 64ede5f150dc..5778db3aa42d 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -538,6 +538,10 @@ struct mm_struct {
> >  		atomic_long_t hugetlb_usage;
> >  #endif
> >  		struct work_struct async_put_work;
> > +
> > +#ifdef CONFIG_PCI_PASID
> 
> Non-PCI devices can also use a PASID (e.g. Arm's SubstreamID). How about
> CONFIG_IOMMU_SUPPORT?

Sure. I will change it to CONFIG_IOMMU_SUPPORT.

Thanks.

-Fenghua
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
