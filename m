Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612EF3B6BA
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89C78915F;
	Mon, 10 Jun 2019 14:08:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C747E892DC
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 20:44:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a132so2084569qkb.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 13:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WewlwoMSKKpuUVFlw9dKTixdONarEXfImL/UTTPP7B8=;
 b=d8nqnvHCANycmiYyu1K5KVpvkyggusgM/BbYqQsKBlB3kHyPwaS5hhTzb+sSHStdcx
 uvHBTqtG4qqv1mEEOFkf4NSyR17v8QX8jO8d3SlusOWf08pDeIquESEPqvTW5BSTQeTb
 1LUifG6A9PDRMN42lPVSG2SfyWveIUvbvhpT7fZ7EMHhUoIBQ9Sp5e6kFQYnHFVIxBSS
 erBHl5P2/ybtkSgpruKIRXhFV0wENi4cxfyrtmhkqn9piOzuNe3CY7b9xwz2fDicPm44
 TYDdn62qMJaYrqcUV1Avzor8vZXEPx/Bnw2NNSClKNrvya9S3KTYCwbyYJmj/06wBEJ+
 9+9g==
X-Gm-Message-State: APjAAAWXxrJzCvS5moqTXgNEwhUHQOehXHzQBO1PPg7OnOgE+IUzH/uB
 ZAsHumClxIOlMOSaSb3foWnZ6w==
X-Google-Smtp-Source: APXvYqxD7hqThTbaMz7g+9dYXpp8HEemZOxyQw6X/LVcsbVXF36bw89VVAJrstOqneJu+6WWHcc1+Q==
X-Received: by 2002:a37:f50f:: with SMTP id l15mr27246401qkk.343.1559940268771; 
 Fri, 07 Jun 2019 13:44:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id e4sm1836237qtc.3.2019.06.07.13.44.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 13:44:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZLit-0001Nv-PI; Fri, 07 Jun 2019 17:44:27 -0300
Date: Fri, 7 Jun 2019 17:44:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
Message-ID: <20190607204427.GU14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
 <20190607191302.GR14802@ziepe.ca>
 <e17aa8c5-790c-d977-2eb8-c18cdaa4cbb3@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e17aa8c5-790c-d977-2eb8-c18cdaa4cbb3@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WewlwoMSKKpuUVFlw9dKTixdONarEXfImL/UTTPP7B8=;
 b=X0GGyDmYUIAZHt6qiBEP8KPAY6d75AVDJMz+L5eUnnWz9vTyYpreN8jlE7M6wtP1lF
 IDIcHQxP26GyfWw+o3noCioNyR5xkWWs1gKA+rdMJlD2sUOGdd0MrpRDRqNydQ9e7LcD
 8vcAXaxGgIGxeb1czpxE2GAaLGoDzu6No3mD6tMxqFJ2qHHOgRXfkUd9CrtNwOLuLCap
 Nn/nkrny4hyodmxLuC94m/gBMHcrLlsFK4MLipaiLGAjy6FjV+gCOnjwovaawgrcFS4J
 qwpJwBquFgb8t/8P6oJTqd4lG3V4ZQcEgxb1hEV9C51LFb7t5ZHp/uRuPMVrTa+QGz/o
 /lKg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MjE6MTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cgo+ID4gV2hhdCBJIHdhbnQgdG8gZ2V0IHRvIGlzIGEgcGF0dGVybiBsaWtlIHRoaXM6
Cj4gPiAKPiA+IHBhZ2VmYXVsdCgpOgo+ID4gCj4gPiAgICAgaG1tX3JhbmdlX3JlZ2lzdGVyKCZy
YW5nZSk7Cj4gPiBhZ2FpbjoKPiA+ICAgICAvKiBPbiB0aGUgc2xvdyBwYXRoLCBpZiB3ZSBhcHBl
YXIgdG8gYmUgbGl2ZSBsb2NrZWQgdGhlbiB3ZSBnZXQKPiA+ICAgICAgICB0aGUgd3JpdGUgc2lk
ZSBvZiBtbWFwX3NlbSB3aGljaCB3aWxsIGJyZWFrIHRoZSBsaXZlIGxvY2ssCj4gPiAgICAgICAg
b3RoZXJ3aXNlIHRoaXMgZ2V0cyB0aGUgcmVhZCBsb2NrICovCj4gPiAgICAgaWYgKGhtbV9yYW5n
ZV9zdGFydF9hbmRfbG9jaygmcmFuZ2UpKQo+ID4gICAgICAgICAgIGdvdG8gZXJyOwo+ID4gCj4g
PiAgICAgbG9ja2RlcF9hc3NlcnRfaGVsZChyYW5nZS0+bW0tPm1tYXBfc2VtKTsKPiA+IAo+ID4g
ICAgIC8vIE9wdGlvbmFsOiBBdm9pZCB1c2VsZXNzIGV4cGVuc2l2ZSB3b3JrCj4gPiAgICAgaWYg
KGhtbV9yYW5nZV9uZWVkc19yZXRyeSgmcmFuZ2UpKQo+ID4gICAgICAgIGdvdG8gYWdhaW47Cj4g
PiAgICAgaG1tX3JhbmdlXyh0b3VjaCB2bWFzKQo+ID4gCj4gPiAgICAgdGFrZV9sb2NrKGRyaXZl
ci0+dXBkYXRlKTsKPiA+ICAgICBpZiAoaG1tX3JhbmdlX2VuZCgmcmFuZ2UpIHsKPiA+ICAgICAg
ICAgcmVsZWFzZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKPiA+ICAgICAgICAgZ290byBhZ2FpbjsK
PiA+ICAgICB9Cj4gPiAgICAgLy8gRmluaXNoIGRyaXZlciB1cGRhdGVzCj4gPiAgICAgcmVsZWFz
ZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKPiA+IAo+ID4gICAgIC8vIFJlbGVhc2VzIG1tYXBfc2Vt
Cj4gPiAgICAgaG1tX3JhbmdlX3VucmVnaXN0ZXJfYW5kX3VubG9jaygmcmFuZ2UpOwo+ID4gCj4g
PiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+IAo+ID4gSXMgaXQgY2xlYXI/Cj4gPiAKPiA+IEphc29u
Cj4gPiAKPiAKPiBBcmUgeW91IHRhbGtpbmcgYWJvdXQgYWNxdWlyaW5nIG1tYXBfc2VtIGluIGht
bV9yYW5nZV9zdGFydF9hbmRfbG9jaygpPwo+IFVzdWFsbHksIHRoZSBmYXVsdCBjb2RlIGhhcyB0
byBsb2NrIG1tYXBfc2VtIGZvciByZWFkIGluIG9yZGVyIHRvCj4gY2FsbCBmaW5kX3ZtYSgpIHNv
IGl0IGNhbiBzZXQgcmFuZ2Uudm1hLgoKPiBJZiBITU0gZHJvcHMgbW1hcF9zZW0gLSB3aGljaCBJ
IGRvbid0IHRoaW5rIGl0IHNob3VsZCwganVzdCByZXR1cm4gYW4KPiBlcnJvciB0byB0ZWxsIHRo
ZSBjYWxsZXIgdG8gZHJvcCBtbWFwX3NlbSBhbmQgcmV0cnkgLSB0aGUgZmluZF92bWEoKQo+IHdp
bGwgbmVlZCB0byBiZSByZXBlYXRlZCBhcyB3ZWxsLgoKT3ZlcmFsbCBJIGRvbid0IHRoaW5rIGl0
IG1ha2VzIGEgbG90IG9mIHNlbnNlIHRvIHNsZWVwIGZvciByZXRyeSBpbgpobW1fcmFuZ2Vfc3Rh
cnRfYW5kX2xvY2soKSB3aGlsZSBob2xkaW5nIG1tYXBfc2VtLiBJdCB3b3VsZCBiZSBiZXR0ZXIK
dG8gZHJvcCB0aGF0IGxvY2ssIHNsZWVwLCB0aGVuIHJlLWFjcXVpcmUgaXQgYXMgcGFydCBvZiB0
aGUgaG1tIGxvZ2ljLgoKVGhlIGZpbmRfdm1hIHNob3VsZCBiZSBkb25lIGluc2lkZSB0aGUgY3Jp
dGljYWwgc2VjdGlvbiBjcmVhdGVkIGJ5CmhtbV9yYW5nZV9zdGFydF9hbmRfbG9jaygpLCBub3Qg
YmVmb3JlIGl0LiBJZiB3ZSBhcmUgcmV0cnlpbmcgdGhlbiB3ZQphbHJlYWR5IHNsZXB0IGFuZCB0
aGUgYWRkaXRpb25hbCBDUFUgY29zdCB0byByZXBlYXQgdGhlIGZpbmRfdm1hIGlzCmltbWF0ZXJp
YWwsIElNSE8/CgpEbyB5b3Ugc2VlIGEgcmVhc29uIHdoeSB0aGUgZmluZF92bWEoKSBldmVyIG5l
ZWRzIHRvIGJlIGJlZm9yZSB0aGUKJ2FnYWluJyBpbiBteSBhYm92ZSBleGFtcGxlPyByYW5nZS52
bWEgZG9lcyBub3QgbmVlZCB0byBiZSBzZXQgZm9yCnJhbmdlX3JlZ2lzdGVyLgoKPiBJJ20gYWxz
byBub3Qgc3VyZSBhYm91dCBhY3F1aXJpbmcgdGhlIG1tYXBfc2VtIGZvciB3cml0ZSBhcyB3YXkg
dG8KPiBtaXRpZ2F0ZSB0aHJhc2hpbmcuIEl0IHNlZW1zIHRvIG1lIHRoYXQgaWYgYSBkZXZpY2Ug
YW5kIGEgQ1BVIGFyZQo+IGJvdGggZmF1bHRpbmcgb24gdGhlIHNhbWUgcGFnZSwKCk9uZSBvZiB0
aGUgcmVhc29ucyB0byBwcmVmZXIgdGhpcyBhcHByb2FjaCBpcyB0aGF0IGl0IG1lYW5zIHdlIGRv
bid0Cm5lZWQgdG8ga2VlcCB0cmFjayBvZiB3aGljaCByYW5nZXMgd2UgYXJlIGZhdWx0aW5nLCBh
bmQgaWYgdGhlcmUgaXMgYQpsb3Qgb2YgKnVucmVsYXRlZCogZmF1bHQgYWN0aXZpdHkgKHVubGlr
ZWx5Pykgd2UgY2FuIHJlc29sdmUgaXQgdXNpbmcKbW1hcCBzZW0gaW5zdGVhZCBvZiB0aGlzIGVs
YWJvcmF0ZSByYW5nZXMgc2NoZW1lIGFuZCByZWxhdGVkCmxvY2tpbmcuIAoKVGhpcyB3b3VsZCBy
ZWR1Y2UgdGhlIG92ZXJhbGwgd29yayBpbiB0aGUgcGFnZSBmYXVsdCBhbmQKaW52YWxpZGF0ZV9z
dGFydC9lbmQgcGF0aHMgZm9yIHRoZSBjb21tb24gdW5jb250ZW5kZWQgY2FzZXMuCgo+IHNvbWUg
c29ydCBvZiBiYWNrb2ZmIGRlbGF5IGlzIG5lZWRlZCB0byBsZXQgb25lIHNpZGUgb3IgdGhlIG90
aGVyCj4gbWFrZSBzb21lIHByb2dyZXNzLgoKV2hhdCB0aGUgd3JpdGUgc2lkZSBvZiB0aGUgbW1h
cF9zZW0gd291bGQgZG8gaXMgZm9yY2UgdGhlIENQVSBhbmQKZGV2aWNlIHRvIGNsZWFubHkgdGFr
ZSB0dXJucy4gT25jZSB0aGUgZGV2aWNlIHBhZ2VzIGFyZSByZWdpc3RlcmVkCnVuZGVyIHRoZSB3
cml0ZSBzaWRlIHRoZSBDUFUgd2lsbCBoYXZlIHRvIHdhaXQgaW4gaW52YWxpZGF0ZV9zdGFydCBm
b3IKdGhlIGRyaXZlciB0byBjb21wbGV0ZSBhIHNob290ZG93biwgdGhlbiB0aGUgd2hvbGUgdGhp
bmcgc3RhcnRzIGFsbApvdmVyIGFnYWluLiAKCkl0IGlzIGNlcnRhaW5seSBpbWFnaW5hYmxlIHNv
bWV0aGluZyBjb3VsZCBoYXZlIGEgJ21pbiBsaWZlJyB0aW1lciBmb3IKYSBkZXZpY2UgbWFwcGlu
ZyBhbmQgaG9sZCBtbSBpbnZhbGlkYXRlX3N0YXJ0LCBhbmQgZGV2aWNlIHBhZ2VmYXVsdApmb3Ig
dGhhdCBtaW4gdGltZSB0byBwcm9tb3RlIGJldHRlciBzaGFyaW5nLgoKQnV0LCBpZiB3ZSBkb24n
dCB1c2UgdGhlIG1tYXBfc2VtIHRoZW4gd2UgY2FuIGxpdmVsb2NrIGFuZCB0aGUgZGV2aWNlCndp
bGwgc2VlIGFuIHVucmVjb3ZlcmFibGUgZXJyb3IgZnJvbSB0aGUgdGltZW91dCB3aGljaCBtZWFu
cyB3ZSBoYXZlCnJpc2sgdGhhdCB1bmRlciBsb2FkIHRoZSBzeXN0ZW0gd2lsbCBzaW1wbHkgb2Jz
Y3VyZWx5IGZhaWwuIFRoaXMgc2VlbXMKdW5hY2NlcHRhYmxlIHRvIG1lLi4KClBhcnRpY3VsYXJs
eSBzaW5jZSBmb3IgdGhlIE9EUCB1c2UgY2FzZSB0aGUgaXNzdWUgaXMgbm90IHRyYXNoaW5nCm1p
Z3JhdGlvbiBhcyBhIEdQVSBtaWdodCBoYXZlLCBidXQgc2ltcGxlIHN5c3RlbSBzdGFiaWxpdHkg
dW5kZXIgc3dhcApsb2FkLiBXZSBkbyBub3Qgd2FudCB0aGUgT0RQIHBhZ2VmYXVsdCB0byBwZXJt
YW5lbnRseSBmYWlsIGR1ZSB0bwp0aW1lb3V0IGlmIHRoZSBWTUEgaXMgc3RpbGwgdmFsaWQuLgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
