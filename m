Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5C4B30C
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 09:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C580C6E2F9;
	Wed, 19 Jun 2019 07:27:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461E89B7D
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 13:05:46 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so8503518qkc.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 06:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TTs4qX/AlYeTgBhCVY6oKlnamVeM1+PLnw1E3BGPQ7k=;
 b=IjCUg563LsiDCBiDJ8TIDBmqv+LmNfwIzUJQgN9e6VkWgALpNoKHHGdBDxYh/reMf2
 Ha8sUzmCOt0XDfFnbTPUJWt/qlG3orkJ/m4AHi3jJV5yS1/HAcLIcyJT0QOMHadmkJhX
 PXV8cl6Dok81enEzsvT255XJTJxpFH6sMTSlFYJSKrR8jfl4jkC6iCOLDUdjG1Es9H2+
 Ly03L2lAaVI/f4W6BCeHFpVs/SO3+SXv6AoXMF/OXx5xZGLQx1gHTnEDZJ59LLV6sSXj
 o26VUxx6vaHQwR9rcUA1RG2xd/ieWsfjgcUW3yGyzBZ4AfFvC4SWQ3SlarLj2phHM8ug
 MdYQ==
X-Gm-Message-State: APjAAAXcUfeUrpH4NktBfpk5HPC+2aEhSHiOnrizx7rT2ZuO7BUMVTsk
 8GhoxGhQjxNsw2AlOFyexd+aPA==
X-Google-Smtp-Source: APXvYqyTVmV2qJESAaYOKHbD1BjBEsgUZPM0i2g79H7bXawYK5ERfS0qh6JfLB9C36JFGw7C3yUXcw==
X-Received: by 2002:ae9:ed0a:: with SMTP id c10mr91466247qkg.207.1560863145518; 
 Tue, 18 Jun 2019 06:05:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id k15sm7008956qtg.22.2019.06.18.06.05.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 06:05:45 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdDo0-0002Yh-HV; Tue, 18 Jun 2019 10:05:44 -0300
Date: Tue, 18 Jun 2019 10:05:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 02/12] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190618130544.GC6961@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-3-jgg@ziepe.ca>
 <20190615135906.GB17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615135906.GB17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:27:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TTs4qX/AlYeTgBhCVY6oKlnamVeM1+PLnw1E3BGPQ7k=;
 b=HSw6uNWbQt7fjJEsOb5v36NS40qEnnvUQQOjF8RYBujsDACr03g6V1BCXbU+eBSqgE
 PkA+PsoTe9P7s1R1QtqFnAPzo/EF0jJEZAr6tsjkwmr6bfdZ90QRfQscfOxkLlDOvybP
 Swzg2ZlAGssU+HOBqU4mE1v3gbJZ/njoW2LtezmgzdRWxLtbcsPt+AxODrrQQ57lBck6
 w1NOErizBGOfwHoHv6R+Rr9DtnvHuBJAl6gq8Zzn0we2Jq+p11rahAQx0yLw5X1G4Fb3
 BYHFnuVdQJ8DB5EIRKcdRgWqsSU3aocFHyuDxLPSQ6xUqP+lxAtEF+CfR+M6EBbrnn2T
 dTOQ==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDY6NTk6MDZBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDBQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+ID4gCj4gPiBSYWxwaCBvYnNlcnZlcyB0aGF0IGhtbV9yYW5nZV9yZWdpc3Rlcigp
IGNhbiBvbmx5IGJlIGNhbGxlZCBieSBhIGRyaXZlcgo+ID4gd2hpbGUgYSBtaXJyb3IgaXMgcmVn
aXN0ZXJlZC4gTWFrZSB0aGlzIGNsZWFyIGluIHRoZSBBUEkgYnkgcGFzc2luZyBpbiB0aGUKPiA+
IG1pcnJvciBzdHJ1Y3R1cmUgYXMgYSBwYXJhbWV0ZXIuCj4gPiAKPiA+IFRoaXMgYWxzbyBzaW1w
bGlmaWVzIHVuZGVyc3RhbmRpbmcgdGhlIGxpZmV0aW1lIG1vZGVsIGZvciBzdHJ1Y3QgaG1tLCBh
cwo+ID4gdGhlIGhtbSBwb2ludGVyIG11c3QgYmUgdmFsaWQgYXMgcGFydCBvZiBhIHJlZ2lzdGVy
ZWQgbWlycm9yIHNvIGFsbCB3ZQo+ID4gbmVlZCBpbiBobW1fcmVnaXN0ZXJfcmFuZ2UoKSBpcyBh
IHNpbXBsZSBrcmVmX2dldC4KPiAKPiBMb29rcyBnb29kLCBhdCBsZWFzdCBhbiBhbiBpbnRlcm1l
ZGlhdGUgc3RlcDoKPiAKPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Cj4gCj4gPiBpbmRleCBmNjk1NmQ3OGUzY2IyNS4uMjJhOTdhZGExMDhiNGUgMTAwNjQ0Cj4g
PiArKysgYi9tbS9obW0uYwo+ID4gQEAgLTkxNCwxMyArOTE0LDEzIEBAIHN0YXRpYyB2b2lkIGht
bV9wZm5zX2NsZWFyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAo+ID4gICAqIFRyYWNrIHVwZGF0
ZXMgdG8gdGhlIENQVSBwYWdlIHRhYmxlIHNlZSBpbmNsdWRlL2xpbnV4L2htbS5oCj4gPiAgICov
Cj4gPiAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKPiA+
IC0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+ICsJCSAgICAgICBzdHJ1Y3QgaG1t
X21pcnJvciAqbWlycm9yLAo+ID4gIAkJICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAg
CQkgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCj4gPiAgCQkgICAgICAgdW5zaWduZWQgcGFnZV9z
aGlmdCkKPiA+ICB7Cj4gPiAgCXVuc2lnbmVkIGxvbmcgbWFzayA9ICgoMVVMIDw8IHBhZ2Vfc2hp
ZnQpIC0gMVVMKTsKPiA+IC0Jc3RydWN0IGhtbSAqaG1tOwo+ID4gKwlzdHJ1Y3QgaG1tICpobW0g
PSBtaXJyb3ItPmhtbTsKPiA+ICAKPiA+ICAJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4gPiAgCXJh
bmdlLT5obW0gPSBOVUxMOwo+ID4gQEAgLTkzNCwyMCArOTM0LDE1IEBAIGludCBobW1fcmFuZ2Vf
cmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gPiAgCXJhbmdlLT5zdGFydCA9IHN0
YXJ0Owo+ID4gIAlyYW5nZS0+ZW5kID0gZW5kOwo+IAo+IEJ1dCB3aGlsZSB5b3UncmUgYXQgaXQ6
ICB0aGUgY2FsbGluZyBjb252ZW50aW9ucyBvZiBobW1fcmFuZ2VfcmVnaXN0ZXIKPiBhcmUgc3Rp
bGwgcmF0aGVyIG9kZCwgYXMgdGhlIHN0YWV0LCBlbmQgYW5kIHBhZ2Vfc2hpZnQgYXJndW1lbnRz
IGFyZQo+IG9ubHkgdXNlZCB0byBmaWxsIG91dCBmaWVsZHMgaW4gdGhlIHJhbmdlIHN0cnVjdHVy
ZSBwYXNzZWQgaW4uICBNaWdodAo+IGJlIHdvcnRoIGNsZWFuaW5nIHVwIGFzIHdlbGwgaWYgd2Ug
Y2hhbmdlIHRoZSBjYWxsaW5nIGNvbnZlbnRpb24uCgpJJ20gdGhpbmtpbmcgdG8gdGFja2xlIHRo
YXQgYXMgcGFydCBvZiB0aGUgbW11IG5vdGlmaWZlciBpbnZsb2NrCmlkZWEuLiBPbmNlIHRoZSBy
YW5nZSBsb29zZXMgdGhlIGxvY2sgdGhlbiB3ZSBkb24ndCByZWFsbHkgbmVlZCB0bwpyZWdpc3Rl
ciBpdCBhdCBhbGwuCgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
