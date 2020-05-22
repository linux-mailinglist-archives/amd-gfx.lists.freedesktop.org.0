Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22711DF124
	for <lists+amd-gfx@lfdr.de>; Fri, 22 May 2020 23:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818A06E8B3;
	Fri, 22 May 2020 21:30:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24B06E12A
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 21:23:01 +0000 (UTC)
IronPort-SDR: tbF6qeolVVGdN41cNGgx8Xh7ombuEENShlJfSpyMHkFDK4Gi/ENy5OUdkBa+DBunEX9M09wkJe
 qwsVo0Iz+0fA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 14:23:01 -0700
IronPort-SDR: LiwlEqjWmJ9bjga5yIs0sF0VQ7OZWXFfYtzBjxTgZM2jmOD7E2e+h6OA3h1lJvbeAA3aTVJssU
 IytinhJ6OmHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; d="scan'208";a="374874193"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2020 14:23:01 -0700
Date: Fri, 22 May 2020 14:21:25 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: drm/amdkfd: Change pasid's type to unsigned int
Message-ID: <20200522212125.GB39766@romley-ivt3.sc.intel.com>
References: <20200522192554.GA39766@romley-ivt3.sc.intel.com>
 <d6318005-4860-b82f-e2fc-21fa9f1c1683@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6318005-4860-b82f-e2fc-21fa9f1c1683@amd.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Fri, 22 May 2020 21:30:44 +0000
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
Cc: Yong Zhao <Yong.Zhao@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi, Felix,

On Fri, May 22, 2020 at 03:40:06PM -0400, Felix Kuehling wrote:
> Hi Fenghua,
> 
> The PASID width in KFD is currently limited to 16 bits. I believe this
> reflects what our hardware can handle. KFD will never allocate a PASID
> bigger than 16 bits. That said, I'm OK with changing this field in the
> kfd_process structure to unsigned int. Generally, I find uint16_t in
> structures not very useful except in tightly packed structures such as
> packet formats or ioctl arguments.

Thank you very much for your insight!

I'm writing the patch set to define pasid as "unsigned int" consistently
in iommu. I'll put the amdkfd changes (only a few changes including this
pasid change in struct kfd_processin) one patch and send it to you for
review.

-Fenghua
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
