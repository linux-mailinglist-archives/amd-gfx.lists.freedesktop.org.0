Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370914273A
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45888966C;
	Wed, 12 Jun 2019 13:12:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80B8930C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:41:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so16002815qtl.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lSxjAlC+uZbBWLnsce9oyecap+o1G1ClcqcyZBLt6wI=;
 b=gKdqs5wMex2Mm6KIJwANYP12y91Vup19QQt13d3LSZx+1wu5NddFzhaW3HOa1No5Ng
 p3i8dLFBwT+vXsYHzhB4/BmcycAull5xWtvFwX0sGBk3sC4pK6jfb4wOlBKsOwoRvJCM
 iC8ANA7vztJtmaUq1Z8GNVNmszQmBLgGA+VOd0mMSCpmqj/Ey/VwSJWHDTmUJD412Xck
 uIiMB4jgyw+mgJCku1X3owZ1yPferAe4KpQdlK8xtv/ocya8cmYgggET2R1JsYAp4Tqw
 w+ch7k2CfMtCS4ErYnxOUq6iEA68sDHvB+FVhinIsMKUE+UQqytdkQMBCJHSCDnueNJT
 dF7Q==
X-Gm-Message-State: APjAAAWFHNekBnnYjVGMa2b7z/pMkDh0HYcNGnZejuv7VKGbcdzk/IpY
 moO3XMAxYXOxDgCp9YrozBq6cw==
X-Google-Smtp-Source: APXvYqyV/onR2nJG+SUqo2rImG4GNtftgkItRoz2K7ZKcS8ciTodUxxiDupnb/jFspB22/5anKiaMA==
X-Received: by 2002:ac8:2b01:: with SMTP id 1mr63205463qtu.177.1560339686428; 
 Wed, 12 Jun 2019 04:41:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s66sm7743817qkh.17.2019.06.12.04.41.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Jun 2019 04:41:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hb1d7-0002GY-4q; Wed, 12 Jun 2019 08:41:25 -0300
Date: Wed, 12 Jun 2019 08:41:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190612114125.GA3876@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
 <20190608085425.GB32185@infradead.org>
 <20190611194431.GC29375@ziepe.ca>
 <20190612071234.GA20306@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612071234.GA20306@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lSxjAlC+uZbBWLnsce9oyecap+o1G1ClcqcyZBLt6wI=;
 b=c/H5ji3nSCh+gOvUZDZ+S49kTWjjHMkqM5K2HXt6kiI18mXJOv9nYMDgzX8sXa8uuc
 IcCdYbXGtrpY3GhKtGwh+RIXGC+PFMakdA+wusR+N3jiLNgrx4wjM95NSf+r/FPBRTNN
 yd4RlBPaK5CMMzhC7YE89oQF4gmN6FRcGMETb6SbdNYDGHpJjmCsIvQszvUQHLGeEEcf
 QKiBZ/BRdaKFgmw9CAqhzwIQ6vijVznk6tB3bDaJa089FcAOedvmz990jdY7jBdkCUSa
 1Pra7M2WAjRYPtoJQ+g7F+1qbiV5Kg4vguRuA6sY7Djm4wQOECC02VyEL2dpeO3v2WOZ
 am+Q==
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
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6MTI6MzRBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDQ6NDQ6MzFQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDE6NTQ6MjVB
TSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IEZZSSwgSSB2ZXJ5IG11Y2gg
ZGlzYWdyZWUgd2l0aCB0aGUgZGlyZWN0aW9uIHRoaXMgaXMgbW92aW5nLgo+ID4gPiAKPiA+ID4g
c3RydWN0IGhtbV9taXJyb3IgbGl0ZXJhbGx5IGlzIGEgdHJpdmlhbCBkdXBsaWNhdGlvbiBvZiB0
aGUKPiA+ID4gbW11X25vdGlmaWVycy4gIEFsbCB0aGVzZSBkcml2ZXJzIHNob3VsZCBqdXN0IHVz
ZSB0aGUgbW11X25vdGlmaWVycwo+ID4gPiBkaXJlY3RseSBmb3IgdGhlIG1pcnJvcmluZyBwYXJ0
IGluc3RlYWQgb2YgYnVpbGRpbmcgYSB0aGluZyB3cmFwcGVyCj4gPiA+IHRoYXQgYWRkcyBub3Ro
aW5nIGJ1dCBoZWxwaW5nIHRvIG1hbmFnZSB0aGUgbGlmZXRpbWUgb2Ygc3RydWN0IGhtbSwKPiA+
ID4gd2hpY2ggc2hvdWxkbid0IGV4aXN0IHRvIHN0YXJ0IHdpdGguCj4gPiAKPiA+IENocmlzdG9w
aDogV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBza2V0Y2ggYmVsb3c/Cj4gPiAKPiA+IEl0
IHdvdWxkIHJlcGxhY2UgdGhlIGhtbV9yYW5nZS9taXJyb3IvZXRjIHdpdGggYSBkaWZmZXJlbnQg
d2F5IHRvCj4gPiBidWlsZCB0aGUgc2FtZSBsb2NraW5nIHNjaGVtZSB1c2luZyBzb21lIG9wdGlv
bmFsIGhlbHBlcnMgbGlua2VkIHRvCj4gPiB0aGUgbW11IG5vdGlmaWVyPwo+ID4gCj4gPiAoanVz
dCBhIHNrZXRjaCwgc3RpbGwgbmVlZHMgYSBsb3QgbW9yZSB0aGlua2luZykKPiAKPiBJIGxpa2Ug
dGhlIGlkZWEuICBBIGZldyBuaXRwaWNrczogQ2FuIHdlIGF2b2lkIGhhdmluZyB0byBzdG9yZSB0
aGUKPiBtbSBpbiBzdHJ1Y3QgbW11X25vdGlmaWVyPyBJIHRoaW5rIHdlIGNvdWxkIGp1c3QgZWFz
aWx5IHBhc3MgaXQgYXMgYQo+IHBhcmFtZXRlciB0byB0aGUgaGVscGVycy4KClllcywgYnV0IEkg
dGhpbmsgYW55IGRyaXZlciB0aGF0IG5lZWRzIHRvIHVzZSB0aGlzIEFQSSB3aWxsIGhhdmUgdG8K
aG9sZCB0aGUgJ3N0cnVjdCBtbV9zdHJ1Y3QnIGFuZCB0aGUgJ3N0cnVjdCBtbXVfbm90aWZpZXIn
IHRvZ2V0aGVyIChpZQpPRFAgZG9lcyB0aGlzIGluIGliX3Vjb250ZXh0X3Blcl9tbSksIHNvIGlm
IHdlIHB1dCBpdCBpbiB0aGUgbm90aWZpZXIKdGhlbiBpdCBpcyB0cml2aWFsbHkgYXZhaWxhYmxl
IGV2ZXJ3aGVyZSBpdCBpcyBuZWVkZWQsIGFuZCB0aGUKbW11X25vdGlmaWVyIGNvZGUgdGFrZXMg
Y2FyZSBvZiB0aGUgbGlmZXRpbWUgZm9yIHRoZSBkcml2ZXIuCgo+IFRoZSB3cml0ZSBsb2NrIGNh
c2Ugb2YgbW1faW52bG9ja19zdGFydF93cml0ZV9hbmRfbG9jayBpcyBwcm9iYWJseQo+IHdvcnRo
IGZhY3RvcmluZyBpbnRvIHNlcGFyYXRlIGhlbHBlcj8gSSBjYW4gc2VlIGNhc2VzIHdoZXJlIGRy
aXZlcnMKPiB3YW50IHRvIGp1c3QgdXNlIGl0IGRpcmVjdGx5IGlmIHRoZXkgbmVlZCB0byBmb3Jj
ZSBnZXR0aW5nIHRoZSBsb2NrCj4gd2l0aG91dCB0aGUgY2hhbmNlIG9mIGEgbG9uZyB3YWl0LgoK
VGhlIGVudGlyZSBwdXJwb3NlIG9mIHRoZSBpbnZsb2NrIGlzIHRvIGF2b2lkIGdldHRpbmcgdGhl
IHdyaXRlIGxvY2sKb24gbW1hcF9zZW0gYXMgYSBmYXN0IHBhdGggLSBpZiB0aGUgZHJpdmVyIHdp
c2hlcyB0byB1c2UgbW1hcF9zZW0KbG9ja2luZyBvbmx5IHRoZW4gaXQgc2hvdWxkIGp1c3QgZG8g
c28gZGlyZWN0bHkgYW5kIGZvcmdldCBhYm91dCB0aGUKaW52bG9jay4KCk5vdGUgdGhhdCB0aGlz
IHBhdGNoIGlzIGp1c3QgYW4gQVBJIHNrZXRjaCwgSSBoYXZlbid0IGZ1bGx5IGNoZWNrZWQKdGhh
dCB0aGUgcmFuZ2Vfc3RhcnQvZW5kIGFyZSBhY3R1YWxseSBhbHdheXMgY2FsbGVkIHVuZGVyIG1t
YXBfc2VtLAphbmQgSSBhbHJlYWR5IGZvdW5kIHRoYXQgcmVsZWFzZSBpcyBub3QuIFNvIHRoZXJl
IHdpbGwgbmVlZCB0byBiZSBzb21lCnByZXBlcmF0b3J5IGFkanVzdG1lbnRzIGJlZm9yZSB3ZSBj
YW4gdXNlIGRvd25fd3JpdGUobW1hcF9zZW0pIGFzIGEKbG9ja2luZyBzdHJhdGVneSBoZXJlLgoK
VGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
