Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D1F509B
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Nov 2019 17:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9C76F9EC;
	Fri,  8 Nov 2019 16:06:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAE46F9C3
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Nov 2019 14:53:04 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id x14so2303466qvu.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Nov 2019 06:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KbZhp4AkDu7Xm430isAdIZqP2fKWimvIRojP4EOaH94=;
 b=nXWXgnQiWTNRPuwnBiDdzq9gQ4x+gO8dAy/WPUL6UUrCHVvRdXNM08TSM85R03yq9h
 NoSiyIALzXCP58R6zanY+UqLPJ5AzlXj/ioVeyMaTEIn2QNSFW9WJSY6hYsbncDW7u+c
 UiJLcJ8gvhXUL15RSFY27Ks4FOHSWHVqj1V4tNSFR6GyTWgzH4BqgJpuocp3jKgzmGta
 XaVl+zRF3Ilc8UqKXPyiMiBNfU8fNu0w8+bb2T1MGcSaJUGvK7kPO9Iugp+AmpSEW+jA
 vQLT13a4Sx1W9DrcBHdZOgffB3Erkhf/BPp4OYjv7GqMb08B8034/Zj9lUuFiYk5j4vQ
 gbCA==
X-Gm-Message-State: APjAAAVaWc7QyAp+WFLCi6im2T4UjaCckW5NgqkZKEDmgQaFGFmJtc2z
 4TQgf2vy2iSNqsaRNX9RGwuQdQ==
X-Google-Smtp-Source: APXvYqxZ049SfJ3c2UO0ME4Y6QYpdzEBI6gXk0X7dNRcV8X3z8aw7kr92ScWfx2YoejxONb2FvDR8w==
X-Received: by 2002:a05:6214:11f2:: with SMTP id
 e18mr10122108qvu.86.1573224783191; 
 Fri, 08 Nov 2019 06:53:03 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o3sm3732759qta.3.2019.11.08.06.53.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Nov 2019 06:53:02 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iT5dF-0003YQ-V5; Fri, 08 Nov 2019 10:53:01 -0400
Date: Fri, 8 Nov 2019 10:53:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
Message-ID: <20191108145301.GD10956@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <3938b588-c6c5-3bd1-8ea9-47e4d5b2045c@oracle.com>
 <20191105023108.GN22766@mellanox.com>
 <a62e58f6-d98b-1feb-d0ca-fb8210f3e831@oracle.com>
 <20191107203629.GF6730@ziepe.ca>
 <4a68acc6-3ce7-e26b-2c98-774867288410@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a68acc6-3ce7-e26b-2c98-774867288410@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 08 Nov 2019 16:06:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=KbZhp4AkDu7Xm430isAdIZqP2fKWimvIRojP4EOaH94=;
 b=CnUhcgt/uCiHhFzG5fQwx/7yL/1CG4oXAa5rt7QVxsRyYE9BvjQnSrmpCegteZ6wG6
 UdbIqy2G3VBCdlFsOHxs/+U1RPE3dzDODchlcknxyMkLszr7SBFzpBBLTiddH4Tg08Ht
 mzvu2U3GfPtm+8nhuisFAzAvLGGBD26Rr2qKwRtahR5/cWZ9Dw2546KcysI5+LmkFl4f
 uw4TZt8ZwEN4pTKLcXSMHSPwzQXJJ83lX+Vu0OBNgSn6qsoG5vEKP04ONdCWloYbp4p+
 mbwxr54K0neA//wodYLjyKVnqB2cadeD0Xva/t+JRc+rAwGI6mVj5ESfMeaSIg5DxLSM
 vL/g==
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDU6NTQ6NTJQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDExLzcvMTkgMzozNiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4g
T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTA6MTY6NDZBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+ID4KPiA+Pj4gU28sIEkgc3VwcG9zZSBpdCBjYW4gYmUgcmVsYXhlZCB0byBhIG51
bGwgdGVzdCBhbmQgYSBXQVJOX09OIHRoYXQgaXQKPiA+Pj4gaGFzbid0IGNoYW5nZWQ/Cj4gPj4g
WW91IG1lYW4KPiA+Pgo+ID4+IGlmICh1c2VfcHRlbW9kKSB7Cj4gPj4gwqDCoMKgwqDCoMKgwqAg
V0FSTl9PTihtYXAtPnZtYSAhPSB2bWEpOwo+ID4+IMKgwqDCoMKgwqDCoMKgIC4uLgo+ID4+Cj4g
Pj4KPiA+PiBZZXMsIHRoYXQgc291bmRzIGdvb2QuCj4gPiBJIGFtZW5kZWQgbXkgY29weSBvZiB0
aGUgcGF0Y2ggd2l0aCB0aGUgYWJvdmUsIGhhcyB0aGlzIHJld29yayBzaG93bgo+ID4gc2lnbnMg
b2Ygd29ya2luZz8KPiAKPiBZZXMsIGl0IHdvcmtzIGZpbmUuCj4gCj4gQnV0IHBsZWFzZSBkb24n
dCBmb3JnZXQgbm90aWZpZXIgb3BzIGluaXRpYWxpemF0aW9uLgo+IAo+IFdpdGggdGhvc2UgdHdv
IGNoYW5nZXMsCj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+CgpUaGFua3MsIEkgZ290IGJvdGggdGhpbmdzLiBJJ2xsIGZvcndhcmQg
dGhpcyB0b3dhcmQgbGludXgtbmV4dCBhbmQKcmVwb3N0IGEgdjMgCgpKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
