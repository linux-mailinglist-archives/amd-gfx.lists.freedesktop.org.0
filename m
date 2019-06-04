Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF434512
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 13:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557D38966B;
	Tue,  4 Jun 2019 11:08:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1BD8966B
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 11:08:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 16so9976914wmg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 04:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=h/LcX5PkLarjCX1lSXd3PoXszvrIE7cOKCcTGRGIT4k=;
 b=XUWK5o7anSvLiIOLsXrICsQJDi6LNOnm39v60Z9YGHjlKC7tdgRiSmJb+5+HTy9K6O
 SrVVOIhu2MI4dx5rJRqvs1RpruJ9NEkVbS388g10JT20Frd+hnp0QZrD5ZEYb89jAjco
 EMdlUlQ9dz+n5MuQNOAoSseDWfkpbciTMjmcNgKjnnXnrHX8t1obwqiPm9uL1lWF0Lkk
 rhzONgnGd+40gv1rlBFvNpQHm5TBmcIJgYwFLbl43wsDsktgcUshuYbwLzh/Z0scRZJp
 i/unJETk/GWyCpoLAwX+0DiWEBkQYBy+wGsNTcz0aguQXvqn8UuGvQYjKrMkFHeDaWKV
 hjfQ==
X-Gm-Message-State: APjAAAW4mAokUlSzVcMpdLqXFDFaZFo5ZTEKYpGVV0sQ+bTxno7ZH77d
 VXAznEBn+oH5XhJs5CABUd0=
X-Google-Smtp-Source: APXvYqxhZmouF7QCnXFIAgFB2zY+G/lGhphbAT+NVe11z/rgRvw96uaeU4LIbu2mGtdO8JKY2zuQzg==
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr6183301wml.126.1559646499080; 
 Tue, 04 Jun 2019 04:08:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v184sm3006989wme.10.2019.06.04.04.08.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 04:08:18 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0 (V2)
To: "S, Shirish" <Shirish.S@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Jerry.Zhang@amd.com" <Jerry.Zhang@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>
References: <1559637339-2124-1-git-send-email-shirish.s@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1bcb4a94-313e-168f-18d4-311bd409f13a@gmail.com>
Date: Tue, 4 Jun 2019 13:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559637339-2124-1-git-send-email-shirish.s@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=h/LcX5PkLarjCX1lSXd3PoXszvrIE7cOKCcTGRGIT4k=;
 b=NT/359CDXG9kqQhlEZE0hh/bCtd27WooF/h1B3jLCF9aII4SfgSdfklSnofzPX7OTe
 vYoLv9vY7lrDtJ0NexjPzu/dy4+63oQz/yir1PWUeyd9YS/zRIx3ENiPNeZs1B1ZEg/o
 ovdRSksNgrWbFRgW8q2C9+W4SvMxDslUBJatBPFvHXtMWgyh94smsr4wDegRcJBYbvjf
 AhIc0T/iCWUM7LippdVVxXamjsLGqm+BFUBBddfeFbhv84PPGdvLBxvc71aUJv/pfrnp
 QUa5lw40b6d7gdoxbjo+LrXS2ar+cg3jG3lD7Zqul37pGtDApeSrg5eIuhATynHwsnv+
 w7yQ==
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
Reply-To: christian.koenig@amd.com
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDQuMDYuMTkgdW0gMTA6MzYgc2NocmllYiBTLCBTaGlyaXNoOgo+IEZyb206IExvdWlzIExp
IDxDaGluZy1zaGloLkxpQGFtZC5jb20+Cj4KPiBbV2hhdF0KPiB2Y2UgcmluZyB0ZXN0IGZhaWxz
IGNvbnNpc3RlbnRseSBkdXJpbmcgcmVzdW1lIGluIHMzIGN5Y2xlLCBkdWUgdG8KPiBtaXNtYXRj
aCByZWFkICYgd3JpdGUgcG9pbnRlcnMuCj4gT24gZGVidWcvYW5hbHlzaXMgaXRzIGZvdW5kIHRo
YXQgcnB0ciB0byBiZSBjb21wYXJlZCBpcyBub3QgYmVpbmcKPiBjb3JyZWN0bHkgdXBkYXRlZC9y
ZWFkLCB3aGljaCBsZWFkcyB0byB0aGlzIGZhaWx1cmUuCj4gQmVsb3cgaXMgdGhlIGZhaWx1cmUg
c2lnbmF0dXJlOgo+IAlbZHJtOmFtZGdwdV92Y2VfcmluZ190ZXN0X3JpbmddICpFUlJPUiogYW1k
Z3B1OiByaW5nIDEyIHRlc3QgZmFpbGVkCj4gCVtkcm06YW1kZ3B1X2RldmljZV9pcF9yZXN1bWVf
cGhhc2UyXSAqRVJST1IqIHJlc3VtZSBvZiBJUCBibG9jayA8dmNlX3YzXzA+IGZhaWxlZCAtMTEw
Cj4gCVtkcm06YW1kZ3B1X2RldmljZV9yZXN1bWVdICpFUlJPUiogYW1kZ3B1X2RldmljZV9pcF9y
ZXN1bWUgZmFpbGVkICgtMTEwKS4KPgo+IFtIb3ddCj4gZmV0Y2ggcnB0ciBhcHByb3ByaWF0ZWx5
LCBtZWFuaW5nIG1vdmUgaXRzIHJlYWQgbG9jYXRpb24gZnVydGhlciBkb3duCj4gaW4gdGhlIGNv
ZGUgZmxvdy4KPiBXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCB0aGUgczMgZmFpbHVyZSBpcyBubyBt
b3JlIHNlZW4gZm9yID41ayBzMyBjeWNsZXMsCj4gd2hpY2ggb3RoZXJ3aXNlIGlzIHByZXR0eSBj
b25zaXN0ZW50Lgo+Cj4gVjI6IHJlbW92ZSByZWR1bnRhbnQgZmV0Y2ggb2YgcnB0cgo+Cj4gU2ln
bmVkLW9mZi1ieTogTG91aXMgTGkgPENoaW5nLXNoaWguTGlAYW1kLmNvbT4KClJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNDOiBzdGFibGUu
Li4KCldobyBkb2VzIHRoZSBzYW1lIHBhdGNoIGZvciBVVkQgYW5kIFZDTj8gRXhhY3RseSB0aGUg
c2FtZSB0aGluZyBpcyB3cm9uZyAKdGhlcmUgYXMgd2VsbC4KCkNocmlzdGlhbi4KCj4gLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgfCA0ICsrKy0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMKPiBpbmRleCBjMDIxYjExLi5mNzE4OWUyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+IEBAIC0xMDcyLDcg
KzEwNzIsNyBAQCB2b2lkIGFtZGdwdV92Y2VfcmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdTY0IGFkZHIsIHU2NCBzZXEsCj4gICBpbnQgYW1kZ3B1X3ZjZV9yaW5nX3Rl
c3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4gICB7Cj4gICAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Owo+IC0JdWludDMyX3QgcnB0ciA9IGFtZGdwdV9y
aW5nX2dldF9ycHRyKHJpbmcpOwo+ICsJdWludDMyX3QgcnB0cjsKPiAgIAl1bnNpZ25lZCBpOwo+
ICAgCWludCByLCB0aW1lb3V0ID0gYWRldi0+dXNlY190aW1lb3V0Owo+ICAgCj4gQEAgLTEwODQs
NiArMTA4NCw4IEBAIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZykKPiAgIAlpZiAocikKPiAgIAkJcmV0dXJuIHI7Cj4gICAKPiArCXJwdHIgPSBh
bWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsKPiArCj4gICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgVkNFX0NNRF9FTkQpOwo+ICAgCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsKPiAgIAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
