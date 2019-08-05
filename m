Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2F8159C
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 11:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4A189D3E;
	Mon,  5 Aug 2019 09:37:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA8389D3E
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 09:37:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y4so83698744wrm.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 05 Aug 2019 02:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=jE5DiOn2Th7IWIx4eHlcnEzzKDGnwiNA5zMMAJHcI6k=;
 b=StcLsyfP46IB9NWAG6X7ZfzLyrT6B4MlwNxZ5Uks9AZwvKnBrIWePuf/vd97V8+XFr
 4i1EMeWzauboKw6V8wZrbumQ/FikrVKlULEP+ESuwZUjdPWpkiHdvAB/PN/pmLf61Awm
 DEEXRAjBGKz5kSV0H0nK75Vmk2Bw741N2fLRuG7pIf1uWtQ0F29tTG9hQpMmmdLuEPGa
 fOsmZsvWh5iaHs5hG1vDwwPi5F9UcZjzB3Q7sMDjGFVrs4Vn2IAwaHsimHamLMGFz/hm
 AJpf2fHIGun2McjMj786Q1wW9VxK1LeN9MCfoUZ+vi0MTnElXuUkFl+If9dRoK1tVMtb
 P66w==
X-Gm-Message-State: APjAAAVDEt9qOzjt/SjhGijMTt8D9y8UI9ZtEKi3icO+EsBEokYz5z7s
 HNfSD6EYdwkzd8PEcLIBdVhEK8fp
X-Google-Smtp-Source: APXvYqydv7E2hxjCs8hBIQg2pl5QvAP9UAFThtBE3Bv5VU0aEUczCO4UgRgsA0MPqk2sc72wpcd9oQ==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr34780083wrr.86.1564997847717; 
 Mon, 05 Aug 2019 02:37:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h14sm83210111wrs.66.2019.08.05.02.37.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 02:37:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <855377a1-69ca-891e-1dad-5b93f57671da@gmail.com>
Date: Mon, 5 Aug 2019 11:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jE5DiOn2Th7IWIx4eHlcnEzzKDGnwiNA5zMMAJHcI6k=;
 b=XWd1+eglvsEM7/qzHrVvE+uDtPTWQNp6qAOO3O05KHPPEQoByKwpbSHa44cQJvlsUN
 vC6PFKw6H35By7SY08o/TcrEBu0LP81/rVRUR3FFpX61/mTzejfZwYsl3ajR1PqCx4iw
 Ck/8UAWjcOfdpGgLfl51vHDY1NpkETT29JlAEsGo/hYmr7oUzPFBNX1n1CfMyD4yr+Zq
 32GLT1bqYjXSPXH2+9Eo/UB2ikEhZAuErnIJRPcyTmhZ7aWAVTUGgN329FfSOu5kcRnn
 T8d6Idrr1P8Dv181LbtP5geMZEy9/bV2dClcXjo3QIMEAVyXGhnb+bGDXkyk+pN2V8E5
 xUxQ==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDIuMDguMTkgdW0gMTg6MDQgc2NocmllYiBaZW5nLCBPYWs6Cj4gVGhpcyBpcyBmb3Iga2Zk
IHRvIHJldXNlIGFtZGdwdSBUTEIgaW52YWxpZGF0aW9uIGZ1bmN0aW9uLiBUaGVyZQo+IGlzIGFs
cmVhZHkgYSBnbWMgZnVuY3Rpb24gZmx1c2hfZ3B1X3RsYiB0byBmbHVzaCBUTEIgb24gYWxsIHZt
Cj4gaHViLiBPbiBnZngxMCwga2ZkIG9ubHkgbmVlZHMgdG8gZmx1c2ggVExCIG9uIGdmeCBodWIg
YnV0IG5vdAo+IG9uIG1tIGh1Yi4gU28gZXhwb3J0IGEgZnVuY3Rpb24gZm9yIEtGRCBmbHVzaCBU
TEIgb25seSBvbiBnZngKPiBodWIuCgpJIHdvdWxkIHJhdGhlciBnbyBhaGVhZCBhbmQgYWRkIGFu
b3RoZXIgcGFyYW1ldGVyIHRvIGZsdXNoX2dwdV90bGIgdG8gCm5vdGUgd2hpY2ggaHViIG5lZWRz
IGZsdXNoaW5nLgoKV2UgY2FuIHByb2JhYmx5IGVhc2lseSBleHRlbmQgdGhlIGZldyBjYWxsZXJz
IHRvIGZsdXNoIGFsbCBodWJzIG5lZWRlZC4KCkNocmlzdGlhbi4KCj4KPiBDaGFuZ2UtSWQ6IEk1
OGZmMDA5NjlmODg0MzhjZmQzZGM3ZTlkZWI3YmZmMGMxYmI0MTMzCj4gU2lnbmVkLW9mZi1ieTog
T2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ21jLmggfCA0ICsrKysKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192MTBfMC5jICB8IDEgKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21j
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKPiBpbmRleCAwNzEx
NDVhLi4wYmQ0YTRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nbWMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMu
aAo+IEBAIC04OCw2ICs4OCw5IEBAIHN0cnVjdCBhbWRncHVfdm1odWIgewo+ICAgICogR1BVIE1D
IHN0cnVjdHVyZXMsIGZ1bmN0aW9ucyAmIGhlbHBlcnMKPiAgICAqLwo+ICAgc3RydWN0IGFtZGdw
dV9nbWNfZnVuY3Mgewo+ICsJLyogZmx1c2ggdm0gdGxiIG9mIHNwZWNpZmljIGh1YiAqLwo+ICsJ
dm9pZCAoKmZsdXNoX3ZtX2h1Yikoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90
IHZtaWQsCj4gKwkJCQkgICB1bnNpZ25lZCBpbnQgdm1odWIsIHVpbnQzMl90IGZsdXNoX3R5cGUp
Owo+ICAgCS8qIGZsdXNoIHRoZSB2bSB0bGIgdmlhIG1taW8gKi8KPiAgIAl2b2lkICgqZmx1c2hf
Z3B1X3RsYikoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQkgICAgICB1aW50MzJf
dCB2bWlkLCB1aW50MzJfdCBmbHVzaF90eXBlKTsKPiBAQCAtMTgwLDYgKzE4Myw3IEBAIHN0cnVj
dCBhbWRncHVfZ21jIHsKPiAgIAlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAgICAqcmFzX2lmOwo+ICAg
fTsKPiAgIAo+ICsjZGVmaW5lIGFtZGdwdV9nbWNfZmx1c2hfdm1faHViKGFkZXYsIHZtaWQsIHZt
aHViLCB0eXBlKSAoKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5mbHVzaF92bV9odWIoKGFkZXYpLCAo
dm1pZCksICh2bWh1YiksICh0eXBlKSkpCj4gICAjZGVmaW5lIGFtZGdwdV9nbWNfZmx1c2hfZ3B1
X3RsYihhZGV2LCB2bWlkLCB0eXBlKSAoYWRldiktPmdtYy5nbWNfZnVuY3MtPmZsdXNoX2dwdV90
bGIoKGFkZXYpLCAodm1pZCksICh0eXBlKSkKPiAgICNkZWZpbmUgYW1kZ3B1X2dtY19lbWl0X2Zs
dXNoX2dwdV90bGIociwgdm1pZCwgYWRkcikgKHIpLT5hZGV2LT5nbWMuZ21jX2Z1bmNzLT5lbWl0
X2ZsdXNoX2dwdV90bGIoKHIpLCAodm1pZCksIChhZGRyKSkKPiAgICNkZWZpbmUgYW1kZ3B1X2dt
Y19lbWl0X3Bhc2lkX21hcHBpbmcociwgdm1pZCwgcGFzaWQpIChyKS0+YWRldi0+Z21jLmdtY19m
dW5jcy0+ZW1pdF9wYXNpZF9tYXBwaW5nKChyKSwgKHZtaWQpLCAocGFzaWQpKQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCj4gaW5kZXggNGUzYWMxMC4uMjQ3NTE1ZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCj4gQEAgLTQxNiw2ICs0MTYs
NyBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZ2V0X3ZtX3BkZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgaW50IGxldmVsLAo+ICAgfQo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGFt
ZGdwdV9nbWNfZnVuY3MgZ21jX3YxMF8wX2dtY19mdW5jcyA9IHsKPiArCS5mbHVzaF92bV9odWIg
PSBnbWNfdjEwXzBfZmx1c2hfdm1faHViLAo+ICAgCS5mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8w
X2ZsdXNoX2dwdV90bGIsCj4gICAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192MTBfMF9lbWl0
X2ZsdXNoX2dwdV90bGIsCj4gICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192MTBfMF9lbWl0
X3Bhc2lkX21hcHBpbmcsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
