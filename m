Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22DAE618
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 10:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F116E894;
	Tue, 10 Sep 2019 08:56:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FC66E894
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 08:56:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h7so17430667wrw.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 01:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Fua90kevUoGtgwxE+rylDmmLi5KaivgPw4hVeEl1bIE=;
 b=KjzQ3vzwTCcl89wwRlBBuIALTWf5G0v/gxT+qJGzoUWFzCYRjRXqE+7woAozwGWn8E
 lJ0TUNTHjPWddBzQFYd1EHatulfNkvQTXgZHoDRGQKZ1+LGdtg3newJgdPJZJE4EIIP+
 DgyjSq8tXfD9c1O2OiXp1Irpx3yx+q1v9wARykUiuKFGHtp+xU1VzPFIT7LXPtdTT8os
 AxVE7Yqjyf/0976sqxL547BUhNi3Li87xPprpjgIeiwRiEmtMg4qv+9A9XBpc5hgXm/V
 fme/HLQLIiLxmsJ2scpxVJZfNMeQMPeEVUP1smR2Hl0FRwjhBA6V+Q3z0ckxRzio51eZ
 0kyw==
X-Gm-Message-State: APjAAAXDKiC6f+Kok8lPcp/7/giaa4SyS6fRYzgsid1gzRSuoEywpm4y
 VlrWMFvDSAz1Sccp0utr5I4=
X-Google-Smtp-Source: APXvYqx96Cifr9s7HiWSMI+GY7Aoo2Eq6lyREyaUJrcSCQntgih9S+TeH9PyOTumG5133jjUIgu08Q==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr25189951wru.66.1568105769221; 
 Tue, 10 Sep 2019 01:56:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id i73sm2825518wmg.33.2019.09.10.01.56.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Sep 2019 01:56:08 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: grab the id mgr lock while accessing
 passid_mapping
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: amd-gfx@lists.freedesktop.org, "Deng, Emily" <Emily.Deng@amd.com>
References: <20190909115908.43755-1-christian.koenig@amd.com>
Message-ID: <65fe177d-e9fb-3eeb-b77a-479c92dcae6d@gmail.com>
Date: Tue, 10 Sep 2019 10:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909115908.43755-1-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Fua90kevUoGtgwxE+rylDmmLi5KaivgPw4hVeEl1bIE=;
 b=vezB3GleOcm4IpcrLQJRYE0c4uJiVYPkKDm3ouay2xm7/VzmLAYt9MGwaGkcMAEWFG
 bjAqm2NdYURAzsjYZSZKnJs+DJ7iGDIrqc/iPvUMab19YNlqvQ7jiFngcngTI4/yvbID
 Bzwp64MUQ26E6PFjulZJ4kfK8LrY50lRo0AN5qR6AlLfNZ7Ngi+F9xor5N0J0bLwoDs6
 JNwwnatpCpTBsZxMaKL6ASgXMzWlZfETyG2W0YqUWLhoQBG67/JTkkRmMlVd2Jy/BfGA
 lf1/LP9Bap2FRZv4Ay8Nn/dih93HToBF9JZ/UsEAQOvhVcrHDLeSfd8Hia/nztNJUOYs
 qUrw==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZyEKCkFtIDA5LjA5LjE5IHVtIDEzOjU5IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBO
ZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGFjdHVhbGx5IGRyb3BwaW5nIHRoZSByaWdodCBmZW5j
ZS4KPiBDb3VsZCBiZSBkb25lIHdpdGggUkNVIGFzIHdlbGwsIGJ1dCB0byBjb21wbGljYXRlZCBm
b3IgYSBmaXguCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYyB8IDEyICsrKysrKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jCj4gaW5kZXggYjI4NWFiMjUxNDZkLi5lMTE3NjQxNjRjYmYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBAIC0xMDM2LDEwICsxMDM2LDggQEAgaW50IGFt
ZGdwdV92bV9mbHVzaChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHN0cnVjdCBhbWRncHVfam9i
ICpqb2IsIGJvb2wgbmVlZF8KPiAgIAkJaWQtPm9hX2Jhc2UgIT0gam9iLT5vYV9iYXNlIHx8Cj4g
ICAJCWlkLT5vYV9zaXplICE9IGpvYi0+b2Ffc2l6ZSk7Cj4gICAJYm9vbCB2bV9mbHVzaF9uZWVk
ZWQgPSBqb2ItPnZtX25lZWRzX2ZsdXNoOwo+IC0JYm9vbCBwYXNpZF9tYXBwaW5nX25lZWRlZCA9
IGlkLT5wYXNpZCAhPSBqb2ItPnBhc2lkIHx8Cj4gLQkJIWlkLT5wYXNpZF9tYXBwaW5nIHx8Cj4g
LQkJIWRtYV9mZW5jZV9pc19zaWduYWxlZChpZC0+cGFzaWRfbWFwcGluZyk7Cj4gICAJc3RydWN0
IGRtYV9mZW5jZSAqZmVuY2UgPSBOVUxMOwo+ICsJYm9vbCBwYXNpZF9tYXBwaW5nX25lZWRlZDsK
PiAgIAl1bnNpZ25lZCBwYXRjaF9vZmZzZXQgPSAwOwo+ICAgCWludCByOwo+ICAgCj4gQEAgLTEw
NDksNiArMTA0NywxMiBAQCBpbnQgYW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgYm9vbCBuZWVkXwo+ICAgCQlwYXNpZF9tYXBw
aW5nX25lZWRlZCA9IHRydWU7Cj4gICAJfQo+ICAgCj4gKwltdXRleF9sb2NrKCZpZF9tZ3ItPmxv
Y2spOwo+ICsJaWYgKGlkLT5wYXNpZCAhPSBqb2ItPnBhc2lkIHx8ICFpZC0+cGFzaWRfbWFwcGlu
ZyB8fAo+ICsJICAgICFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoaWQtPnBhc2lkX21hcHBpbmcpKQo+
ICsJCXBhc2lkX21hcHBpbmdfbmVlZGVkID0gdHJ1ZTsKPiArCW11dGV4X3VubG9jaygmaWRfbWdy
LT5sb2NrKTsKPiArCj4gICAJZ2RzX3N3aXRjaF9uZWVkZWQgJj0gISFyaW5nLT5mdW5jcy0+ZW1p
dF9nZHNfc3dpdGNoOwo+ICAgCXZtX2ZsdXNoX25lZWRlZCAmPSAhIXJpbmctPmZ1bmNzLT5lbWl0
X3ZtX2ZsdXNoICAmJgo+ICAgCQkJam9iLT52bV9wZF9hZGRyICE9IEFNREdQVV9CT19JTlZBTElE
X09GRlNFVDsKPiBAQCAtMTA4OCw5ICsxMDkyLDExIEBAIGludCBhbWRncHVfdm1fZmx1c2goc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLCBib29sIG5lZWRf
Cj4gICAJfQo+ICAgCj4gICAJaWYgKHBhc2lkX21hcHBpbmdfbmVlZGVkKSB7Cj4gKwkJbXV0ZXhf
bG9jaygmaWRfbWdyLT5sb2NrKTsKPiAgIAkJaWQtPnBhc2lkID0gam9iLT5wYXNpZDsKPiAgIAkJ
ZG1hX2ZlbmNlX3B1dChpZC0+cGFzaWRfbWFwcGluZyk7Cj4gICAJCWlkLT5wYXNpZF9tYXBwaW5n
ID0gZG1hX2ZlbmNlX2dldChmZW5jZSk7Cj4gKwkJbXV0ZXhfdW5sb2NrKCZpZF9tZ3ItPmxvY2sp
Owo+ICAgCX0KPiAgIAlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiAgIAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
