Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A64B309
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 09:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0936E2F7;
	Wed, 19 Jun 2019 07:27:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1B56E200
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 18:04:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i125so9166104qkd.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 11:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=okyRjZf9B5dx07ohdH8HMJVvyCKHxrwwt6GBfDyhnYI=;
 b=GRVVuegdhYFuGZmiJ3GxeohHi1OOHvCPuOFD3y9NCALnMYg9oNax37yTmUHIZIM3cs
 EpIqnSkSOvBCHOPaTpJ2bhmmkFTF1XO5GP/Jv9yGCSpA1AyYThqKloNKhbCf8TlNRcCC
 lk+sEGr42uO144mvM2EfUcGs3qm2prVz7S7gM+BeISgeEO/Jz426+i+coTNKl3F6xHjI
 BtmNYdnrd0wtjXgm42uQfHUovMIi2bgIaR+isKvKJrksrou+MgyF/F8d0DHC0XziftRS
 YRwl8CUQyQcvpQqLyKbtt75AQY59HueMEtB/2IbwFA2itSborraXt8rSKncSvXsUxIFd
 BfEQ==
X-Gm-Message-State: APjAAAXZwh6I+fkjf+Ri55ybCbB4e2KntdVHyrH86BCeJlG8wL65FJi+
 jtdaVhLrGpq7N7uuO4kcJ/7fOQ==
X-Google-Smtp-Source: APXvYqxWj2mDmFVY7ZvaCukxL5n3PqpZ3GEOoAN38QvZ41wgpTgMsHaVHbX3mqFkOs2ObrlkBJP2FA==
X-Received: by 2002:a37:aa0d:: with SMTP id t13mr94831459qke.167.1560881063938; 
 Tue, 18 Jun 2019 11:04:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id v9sm7988792qti.60.2019.06.18.11.04.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 11:04:23 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdIT0-0003OU-LC; Tue, 18 Jun 2019 15:04:22 -0300
Date: Tue, 18 Jun 2019 15:04:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 09/12] mm/hmm: Poison hmm_range during unregister
Message-ID: <20190618180422.GK6961@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-10-jgg@ziepe.ca>
 <20190615141726.GI17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615141726.GI17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:27:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=okyRjZf9B5dx07ohdH8HMJVvyCKHxrwwt6GBfDyhnYI=;
 b=jk6is7nSmkWA4Mc6UVjL/PYCTdkXKQ2ikA9XsaXq/PVjcroLlHZkg7ij4JP4DcORqH
 mz8lBKypK4EhTBlTjipdOVoZzqs0gooV5BD71kqo+EzYxmAiZwcr3ZQj3Jc5ivJVFMB3
 SRH/D9/kqYfRYwCCtFBsV7hlq6/6O+dR1xHwPPtPvVT+3sHCHfJTkoXL6OJ7Nqg43IOp
 f3/QmIYWWGqf0baTFPWhHh7bvk25F0pqfrvx58LZl/dY4EtGWcfVbqRSn7iaWy2yh6Ru
 MY2y2SfyB7BxsCkTQT3M4PYdMaeNVflw3viT0XZ7VJ1d216JuQ8nS/UHNPCLcOBws+l9
 inpg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MTc6MjZBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiAtCS8qIFNhbml0eSBjaGVjayB0aGlzIHJlYWxseSBzaG91bGQgbm90IGhh
cHBlbi4gKi8KPiA+IC0JaWYgKGhtbSA9PSBOVUxMIHx8IHJhbmdlLT5lbmQgPD0gcmFuZ2UtPnN0
YXJ0KQo+ID4gLQkJcmV0dXJuOwo+ID4gLQo+ID4gIAltdXRleF9sb2NrKCZobW0tPmxvY2spOwo+
ID4gIAlsaXN0X2RlbF9yY3UoJnJhbmdlLT5saXN0KTsKPiA+ICAJbXV0ZXhfdW5sb2NrKCZobW0t
PmxvY2spOwo+ID4gIAo+ID4gIAkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBieSBobW1fcmFuZ2Vf
cmVnaXN0ZXIoKSAqLwo+ID4gLQlyYW5nZS0+dmFsaWQgPSBmYWxzZTsKPiA+ICAJbW1wdXQoaG1t
LT5tbSk7Cj4gPiAgCWhtbV9wdXQoaG1tKTsKPiA+IC0JcmFuZ2UtPmhtbSA9IE5VTEw7Cj4gPiAr
Cj4gPiArCS8qCj4gPiArCSAqIFRoZSByYW5nZSBpcyBub3cgaW52YWxpZCBhbmQgdGhlIHJlZiBv
biB0aGUgaG1tIGlzIGRyb3BwZWQsIHNvCj4gPiArICAgICAgICAgKiBwb2lzb24gdGhlIHBvaW50
ZXIuICBMZWF2ZSBvdGhlciBmaWVsZHMgaW4gcGxhY2UsIGZvciB0aGUgY2FsbGVyJ3MKPiA+ICsg
ICAgICAgICAqIHVzZS4KPiA+ICsgICAgICAgICAqLwo+ID4gKwlyYW5nZS0+dmFsaWQgPSBmYWxz
ZTsKPiA+ICsJbWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihyYW5nZS0+
aG1tKSk7Cj4gCj4gRm9ybWF0dGluZyBzZWVtcyB0byBiZSBtZXNzZWQgdXAuICBCdXQgYWdhaW4g
SSBkb24ndCBzZWUgdGhlIHZhbHVlCj4gaW4gdGhlIHBvaXNvbmluZywganVzdCBsZXQgbm9ybWFs
IGxpbmtlZCBsaXN0IGRlYnVnZ2luZyBkbyBpdHMgd29yay4KPiBUaGUgb3RoZXIgY2xlYW51cHMg
bG9va3MgZmluZSB0byBtZS4KCnRhYnMgdnMgc3BhY2VzLCBJIGZpeGVkIGl0LiBUaGlzIG9uZSBp
cyBtb3JlIG11cmt5IHRoYW4gdGhlIG90aGVyIC0gaXQKaXMgdG8gcHJldmVudCB0aGUgY2FsbGVy
IGZyb20gdXNpbmcgYW55IG9mIHRoZSByYW5nZSBBUElzIGFmdGVyIHRoZQpyYW5nZSBpcyB1bnJl
Z2lzdGVyZWQsIGJ1dCB3ZSBjb3VsZCBhbHNvIHNhZmVseSB1c2UgTlVMTCBoZXJlLCBJCnRoaW5r
LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
