Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01583868
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 20:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7176E52A;
	Tue,  6 Aug 2019 18:08:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE98C89017
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 17:44:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so85378576qtn.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 10:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bZtzSRQjhSrRQjuTGnm0cayQZPAGjzejTXG905wfdw0=;
 b=P4b/NJrdMveku2DIfZtWrfxpQEMFGegKb5dZ6013Dn5FBjJS1fkgryCqw68680Cpri
 aa1BBi3Ny++XkiihGFZBg+nbZxAw/XXFmZuNrJyQbkq6dkZ3asjEDMP//7nr1TKAwRp9
 0I+KCwvsa61hSqYLcd7Dgx11dRmTghsLlPfpPc9El/3R7ApNcKnHUtq3q8e0SC+ZAUpC
 V8YCS8SXNyws+IFKwCc4A7S1jjtQiAVdBA+0k0AXDqNIv3Ht8fRVWJZCBDkTZ3mRY1cM
 9hySge6MbmnJthP1zEy/KpJPbXSKBi9xB+0gUrnv7Y0Pl2RAxBDuPlQl9BCTK91CTT83
 DN2A==
X-Gm-Message-State: APjAAAVPEBgw7Qrh+cSNGHA2yu+48VUxshEjNWpVX/po4XsemxkwZnW/
 cEajj2zBlZq1HTgoF9S9LqFzzg==
X-Google-Smtp-Source: APXvYqyZhLDncBVUJEIu2HEUQvEmb0gPiZCNGeOuB4xFtTfpcIsHYizrdBS0HYUKqNFQSDBwyqBK0g==
X-Received: by 2002:ac8:43d8:: with SMTP id w24mr4245586qtn.25.1565113492016; 
 Tue, 06 Aug 2019 10:44:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i22sm46601023qti.30.2019.08.06.10.44.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 10:44:51 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3Vz-0008Vn-5w; Tue, 06 Aug 2019 14:44:51 -0300
Date: Tue, 6 Aug 2019 14:44:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/15] mm: make HMM_MIRROR an implicit option
Message-ID: <20190806174451.GL11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-15-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 06 Aug 2019 18:08:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bZtzSRQjhSrRQjuTGnm0cayQZPAGjzejTXG905wfdw0=;
 b=kGCc9AZ3EnQ1hENpi10zxnp8FPxEY+gZ4u/zkReV8Gk0g4EsnIsOyP2vX5idcMBB+N
 VqjEaaMot6kbdFxVmOlEm3tUIYXwEQT/y/7s11UZ+8vUXizamKWn9OUzoZVObkKRPWF5
 PC2DJb3kBYP003JMyG9RuoIAMt1yp2NAIcUhv0kLoc/5yOiIHRVEpLR3JQfH/W8OKUNe
 XjpQ60F11rN9ibmfNaecBWtkVeRv7sFxnhwEglCFAfG9t9UMxDtUa5fCeFlLC9UqkNOe
 29/8m0lfjCMFnxcTMwNskT+B5FKI1Hwf/xwSEWFHQlKgvBiwTtYdYbvXxZ38LEH2twL7
 VMaQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NTJQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gTWFrZSBITU1fTUlSUk9SIGFuIG9wdGlvbiB0aGF0IGlzIHNlbGVjdGVkIGJ5
IGRyaXZlcnMgd2FudGluZyB0byB1c2UgaXQKPiBpbnN0ZWFkIG9mIGEgdXNlciB2aXNpYmxlIG9w
dGlvbiBhcyBpdCBpcyBqdXN0IGEgbG93LWxldmVsCj4gaW1wbGVtZW50YXRpb24gZGV0YWlsLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnIHwgIDQgKysrLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9LY29uZmlnICAgIHwgIDQgKysrLQo+ICBtbS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
