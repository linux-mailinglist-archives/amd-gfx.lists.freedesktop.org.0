Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F062238C02
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 15:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE3189DC9;
	Fri,  7 Jun 2019 13:54:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B14589CAD
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 12:58:44 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c70so1146774qkg.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 05:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XZLOMkYs5vXjMI8Dkpaj3wAhdY/xEzfilUkvJL4EXH4=;
 b=pdW0N38tGzivn7/LdXBWdrY8AeyzdFrNbDEK7fHndxr2Kq3+30c/jdWjC+byqABZ2I
 PdJ1Ev14+RmsN+zZZ5yuA/KGjGGr980eVM2iRvC797Yfr2ywhLroKPSYMNJYjR3BDQR3
 vWsELwplsxwcQocDtS6NPCgM0hEzsDjPB60Aomf1sQLMX//NM5tuC/NuxV+D9GBfN+fY
 yMLOX4wQo35sXv7IkikCZJQZnl2fqgo5Z17tcSGsguvGhh3p2G/S/G30lMbbsBYUcffU
 IeXeNlF3UH5vEi18n0hDqke8SBNHNyEqPaCBKe1HMtczhZv3pYS8s37Zeu1rUCWSJ45B
 /RnQ==
X-Gm-Message-State: APjAAAUqna9EVdHZ1J4/vGD3FlTRkYikoEWh9zjjsLJfhcMgrg2BDCMb
 mEsMibQyMryoG9i+IFrYXKBXmA==
X-Google-Smtp-Source: APXvYqwLYhkbnVkO37hDdk1D8+dw0XaaSJbnZghiAkAd4Vn3rUNFhKrdJtv3yRh7yG+5koJqQBqxRg==
X-Received: by 2002:a37:b342:: with SMTP id c63mr44488163qkf.292.1559912323433; 
 Fri, 07 Jun 2019 05:58:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id p49sm1384966qtb.69.2019.06.07.05.58.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 05:58:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZESA-0007KA-Il; Fri, 07 Jun 2019 09:58:42 -0300
Date: Fri, 7 Jun 2019 09:58:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic
 from hmm_release
Message-ID: <20190607125842.GE14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-12-jgg@ziepe.ca>
 <3edc47bd-e8f6-0e65-5844-d16901890637@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3edc47bd-e8f6-0e65-5844-d16901890637@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:54:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XZLOMkYs5vXjMI8Dkpaj3wAhdY/xEzfilUkvJL4EXH4=;
 b=N80l5v8nv6hIG51GGBM5+5TLSkvUjSSCa9Cn4MGZUpD+wY28VR23asHPPM24ICOwL2
 nAbR23abB3zKIl8/4vBjtjhFTTbIPzEqJYil1OYzPPhROYxXgqqdNOuNSancrYWXqewx
 BnOcJSJOWmic6p2onjwo9+ZCZdNNNr4DcNaiX2EqP7jgfF8/mbDYj0Z94+7C0i3GdDBI
 zT37XTlbwh3fm0/MZZEKJkZRVsb/IAcRWwlHOUDFHaMaYFqITiRjZIAd1IGyPQGV5mA7
 00nLqMYxsjqP5MczltRg1QpmNV4fmex4E92/bFXMahKwHP+EKfNY+zQ4QqMf53bT1nRI
 Zm2Q==
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
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDg6NDc6MjhQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJv
bTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gCj4gPiBobW1fcmVsZWFz
ZSgpIGlzIGNhbGxlZCBleGFjdGx5IG9uY2UgcGVyIGhtbS4gb3BzLT5yZWxlYXNlKCkgY2Fubm90
Cj4gPiBhY2NpZGVudGFsbHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBi
YWNrIG9udG8KPiA+IGhtbS0+bWlycm9yc19zZW0uCj4gPiAKPiA+IFRoaXMgZml4ZXMgYSB1c2Ug
YWZ0ZXItZnJlZSByYWNlIG9mIHRoZSBmb3JtOgo+ID4gCj4gPiAgICAgICAgQ1BVMCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGhtbV9yZWxlYXNlKCkKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVwX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsK
PiA+ICBobW1fbWlycm9yX3VucmVnaXN0ZXIobWlycm9yKQo+ID4gICBkb3duX3dyaXRlKCZobW0t
Pm1pcnJvcnNfc2VtKTsKPiA+ICAgdXBfd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwo+ID4gICBr
ZnJlZShtaXJyb3IpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtaXJyb3ItPm9wcy0+cmVsZWFzZShtaXJyb3IpCj4gPiAKPiA+IFRoZSBvbmx5IHVzZXIg
d2UgaGF2ZSB0b2RheSBmb3Igb3BzLT5yZWxlYXNlIGlzIGFuIGVtcHR5IGZ1bmN0aW9uLCBzbyB0
aGlzCj4gPiBpcyB1bmFtYmlndW91c2x5IHNhZmUuCj4gPiAKPiA+IEFzIGEgY29uc2VxdWVuY2Ug
b2YgcGx1Z2dpbmcgdGhpcyByYWNlIGRyaXZlcnMgYXJlIG5vdCBhbGxvd2VkIHRvCj4gPiByZWdp
c3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMgZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAg
bW0vaG1tLmMgfCAyOCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gPiBpbmRleCA3MDlkMTM4ZGQ0OTAyNy4uM2E0NWRk
M2Q3NzgyNDggMTAwNjQ0Cj4gPiArKysgYi9tbS9obW0uYwo+ID4gQEAgLTEzNiwyNiArMTM2LDE2
IEBAIHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKPiA+ICAJV0FSTl9PTighbGlzdF9lbXB0eSgmaG1tLT5yYW5nZXMp
KTsKPiA+ICAJbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2spOwo+ID4gIAo+ID4gLQlkb3duX3dyaXRl
KCZobW0tPm1pcnJvcnNfc2VtKTsKPiA+IC0JbWlycm9yID0gbGlzdF9maXJzdF9lbnRyeV9vcl9u
dWxsKCZobW0tPm1pcnJvcnMsIHN0cnVjdCBobW1fbWlycm9yLAo+ID4gLQkJCQkJICBsaXN0KTsK
PiA+IC0Jd2hpbGUgKG1pcnJvcikgewo+ID4gLQkJbGlzdF9kZWxfaW5pdCgmbWlycm9yLT5saXN0
KTsKPiA+IC0JCWlmIChtaXJyb3ItPm9wcy0+cmVsZWFzZSkgewo+ID4gLQkJCS8qCj4gPiAtCQkJ
ICogRHJvcCBtaXJyb3JzX3NlbSBzbyB0aGUgcmVsZWFzZSBjYWxsYmFjayBjYW4gd2FpdAo+ID4g
LQkJCSAqIG9uIGFueSBwZW5kaW5nIHdvcmsgdGhhdCBtaWdodCBpdHNlbGYgdHJpZ2dlciBhCj4g
PiAtCQkJICogbW11X25vdGlmaWVyIGNhbGxiYWNrIGFuZCB0aHVzIHdvdWxkIGRlYWRsb2NrIHdp
dGgKPiA+IC0JCQkgKiB1cy4KPiA+IC0JCQkgKi8KPiA+IC0JCQl1cF93cml0ZSgmaG1tLT5taXJy
b3JzX3NlbSk7Cj4gPiArCWRvd25fcmVhZCgmaG1tLT5taXJyb3JzX3NlbSk7Cj4gCj4gVGhpcyBp
cyBjbGVhbmVyIGFuZCBzaW1wbGVyLCBidXQgSSBzdXNwZWN0IGl0IGlzIGxlYWRpbmcgdG8gdGhl
IGRlYWRsb2NrCj4gdGhhdCBSYWxwaCBDYW1wYmVsbCBpcyBzZWVpbmcgaW4gaGlzIGRyaXZlciB0
ZXN0aW5nLiAoQW5kIGluIGdlbmVyYWwsIGhvbGRpbmcKPiBhIGxvY2sgZHVyaW5nIGEgZHJpdmVy
IGNhbGxiYWNrIHVzdWFsbHkgbGVhZHMgdG8gZGVhZGxvY2tzLikKCkkgdGhpbmsgUmFscGggaGFz
IG5ldmVyIHNlZW4gdGhpcyBwYXRjaCAoaXQgaXMgbmV3KSwgc28gaXQgbXVzdCBiZSBvbmUKb2Yg
dGhlIGVhcmxpZXIgcGF0Y2hlcy4uCgo+IFJhbHBoLCBpcyB0aGlzIHRoZSBvbmU/IEl0J3MgdGhl
IG9ubHkgcGxhY2UgaW4gdGhpcyBwYXRjaHNldCB3aGVyZSBJIGNhbgo+IHNlZSBhIGxvY2sgYXJv
dW5kIGEgY2FsbGJhY2sgdG8gZHJpdmVyIGNvZGUsIHRoYXQgd2Fzbid0IHRoZXJlIGJlZm9yZS4g
U28KPiBJJ20gcHJldHR5IHN1cmUgaXQgaXMgdGhlIG9uZS4uLgoKQ2FuIHlvdSBzaGFyZSB0aGUg
bG9ja2RlcCByZXBvcnQgcGxlYXNlPwoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
