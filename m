Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99A8E27B
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 03:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DBB6E88B;
	Thu, 15 Aug 2019 01:42:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBC66E879
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 00:13:21 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m2so549792qkd.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 17:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qzhD8inHCWGPsSExfxoS4FMI+7+fcQwlxaBDgT12qb4=;
 b=pYJxYarepDSTBV3Y+NLE/NDB4q//GGFr6096npd+bqnB/XjGTIHxgpgyaFSurngjjy
 coysOTaHSTe3mbdwjJsqGK/7lr+SJHwuOj7nPGGLwtAlHSSy97pzo0rROs/N2bkCsIG8
 U/BXGzH6MJzciMy4dfjuWbpso+KkI7pcexrvB4wWhjRlx3Km42xKPpV5Fxfip4UF1AHV
 FmT3AWd3mZASic8P0Hp82gdp1RSzDAQWjSTbydWfmrHk+vxJYlnx7IrHY6pNEYe8DrAJ
 ygNejPWx3t5D347a9c/69XKAaQ1pzrWAMETS81Jf4lATCC3bVIvYVwJ1WQ/FE4Td1/NR
 AMJw==
X-Gm-Message-State: APjAAAWFxFfMI6AXSVilA4F+tDttzzBqDqfp7bFTf2WWyLffzS3W+g1I
 RxeKQtCNgrUVrmS7X5heAOyN/Q==
X-Google-Smtp-Source: APXvYqxctXlgOtCTuI+nHfly9zVzKydMCFWuaFknzokpvDUX3JdzMaNu+TsBvuyQsnsSgXcVbMLc+w==
X-Received: by 2002:a05:620a:130d:: with SMTP id
 o13mr1851841qkj.285.1565828000618; 
 Wed, 14 Aug 2019 17:13:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i5sm756517qti.0.2019.08.14.17.13.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 17:13:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy3OJ-0003bl-SN; Wed, 14 Aug 2019 21:13:19 -0300
Date: Wed, 14 Aug 2019 21:13:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v3 hmm 03/11] mm/mmu_notifiers: add a get/put scheme for
 the registration
Message-ID: <20190815001319.GF11200@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-4-jgg@ziepe.ca>
 <0a23adb8-b827-cd90-503e-bfa84166c67e@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a23adb8-b827-cd90-503e-bfa84166c67e@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 01:42:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qzhD8inHCWGPsSExfxoS4FMI+7+fcQwlxaBDgT12qb4=;
 b=kQ7rO4RrHFSZ6MZuuxxoF8VbnBnjRycJLb07elyvEnUiIa4wJgsVinEba3cE2MqTB9
 fJulQuWx6Y5tYTxlddWTc11PBfISadqD+ExfUHnpoPQON92Ku+S5Y/WG1rnAqUDmFm/t
 sZdh11B/5WH1wkWaQw580ROrmY5paRB/mKD6yO6YRdOAjXFOKeMa/lNRNHsDHR11a2YM
 fH5CrO9kz+3OETBgm2cIOfKwCC5iyZs6YtbJwN/rErrCwql6u7WwlNfS1W19r/IYCdLa
 OB/xGbNt8+DZYg3Zcz43LE9VgkFuylrF77Y+9lVNSAp5BzomHMMBV2AknnHcgTQXagXw
 j3Dg==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Dimitri Sivanich <sivanich@sgi.com>, Gavin Shan <shangw@linux.vnet.ibm.com>,
 Andrea Righi <andrea@betterlinux.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDI6MjA6MzFQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gOC82LzE5IDQ6MTUgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+
IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+IAo+ID4gTWFueSBw
bGFjZXMgaW4gdGhlIGtlcm5lbCBoYXZlIGEgZmxvdyB3aGVyZSB1c2Vyc3BhY2Ugd2lsbCBjcmVh
dGUgc29tZQo+ID4gb2JqZWN0IGFuZCB0aGF0IG9iamVjdCB3aWxsIG5lZWQgdG8gY29ubmVjdCB0
byB0aGUgc3Vic3lzdGVtJ3MKPiA+IG1tdV9ub3RpZmllciBzdWJzY3JpcHRpb24gZm9yIHRoZSBk
dXJhdGlvbiBvZiBpdHMgbGlmZXRpbWUuCj4gPiAKPiA+IEluIHRoaXMgY2FzZSB0aGUgc3Vic3lz
dGVtIGlzIHVzdWFsbHkgdHJhY2tpbmcgbXVsdGlwbGUgbW1fc3RydWN0cyBhbmQgaXQKPiA+IGlz
IGRpZmZpY3VsdCB0byBrZWVwIHRyYWNrIG9mIHdoYXQgc3RydWN0IG1tdV9ub3RpZmllcidzIGhh
dmUgYmVlbgo+ID4gYWxsb2NhdGVkIGZvciB3aGF0IG1tJ3MuCj4gPiAKPiA+IFNpbmNlIHRoaXMg
aGFzIGJlZW4gb3BlbiBjb2RlZCBpbiBhIHZhcmlldHkgb2YgZXhjaXRpbmcgd2F5cywgcHJvdmlk
ZSBjb3JlCj4gPiBmdW5jdGlvbmFsaXR5IHRvIGRvIHRoaXMgc2FmZWx5Lgo+ID4gCj4gPiBUaGlz
IGFwcHJvYWNoIHVzZXMgdGhlIHN0cmN0IG1tdV9ub3RpZmllcl9vcHMgKiBhcyBhIGtleSB0byBk
ZXRlcm1pbmUgaWYKPiAKPiBzL3N0cmN0L3N0cnVjdAoKWWVzLCB0aGFua3MgZm9yIGFsbCBvZiB0
aGlzLCBJIGxpa2UgaGF2aW5nIGNvbW1lbnRzLCBidXQgSSdtIGEKdGVycmlibGUgcHJvb2ZyZWFk
ZXIgOigKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
