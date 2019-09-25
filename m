Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A9BDB1C
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 11:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A09889861;
	Wed, 25 Sep 2019 09:36:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEAC89873
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 09:36:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y19so5850775wrd.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 02:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Gj7r9B2shwY2k9EuTDP53EPMVtHM7hebcwKN0oizz0k=;
 b=a5l/eosWm9j9tBEKD0+KlzusV2ky3cA3cI5sFJnnDpBu3zoXukvQ2eVBlns9GqOUoB
 SZK8IsWawiglsXrFG5vflkGAXSK+iyR3jEsdQbgarj+eIkywO6OVSYaZpTqLZCNQ55zt
 xxDCt5YR84W4LS2JjZ1dllDaBxeXl4mY+qEkzPMRnIF0gJNX6al7zhBaYA9ng/G4ZRM0
 x+NHvuA4gUcDmgalVtbx3rXcHyh0jq3ZMt+TMdzyQHUprVvW1Jqz4kRXcyn3k4Qr5PzU
 GYfV86t+EuYiAXhejt9wNdCmWy4UcRGHRrRCJlwguJ3y86dDnVWmAiuZsKXfVcfCILHN
 lxnQ==
X-Gm-Message-State: APjAAAVr1UefBGcsyXRrXz2KkYDR96cjgPzQyy5aY9eT4M7AbbJ90uH8
 x2Hqk8mMGqItg2ZWxGPdemKTa30L
X-Google-Smtp-Source: APXvYqzBZrjnK418M+x5eMmcklDzYC+W3U0cPHl/L7tXH7knIEckgr50HiH6a/U1Rh9mO1lc1jWC8g==
X-Received: by 2002:adf:e78a:: with SMTP id n10mr3376916wrm.67.1569404162286; 
 Wed, 25 Sep 2019 02:36:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 79sm934012wmb.7.2019.09.25.02.36.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 02:36:01 -0700 (PDT)
Subject: Re: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
To: "Deng, Emily" <Emily.Deng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190924115624.10949-1-christian.koenig@amd.com>
 <MN2PR12MB29750C8C515A2924B3454E488F870@MN2PR12MB2975.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <05ae5f93-535b-96c9-9687-db9e8de456be@gmail.com>
Date: Wed, 25 Sep 2019 11:36:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB29750C8C515A2924B3454E488F870@MN2PR12MB2975.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Gj7r9B2shwY2k9EuTDP53EPMVtHM7hebcwKN0oizz0k=;
 b=K3f3nBqTBHGVmmpr3YZIRu0zi6GDRBvl24o4qK8ec7pe5Gre/ZxdMSYFGhBwfiC6Kh
 WaB2ed1s6Jdo2fAAmBCQsBH1XTyhLvTHooUJUmMDghzpq+b1CELjtUQcWGJM+gFHZN0p
 +NMcoaxNaRWcV2KibJktIqGmTogi7VyCyib2Y2S8dspOVrSCSB+JApmXG9+pRxRAYRsG
 MMhPOhYTB4L1kb1QAY/0dBfXDQLE6klcmb99q/nCKGZ9RoMUVq6T5YknvFsNEcYw3INt
 7mJp8UXuA8GQi6xogoumvvuGR3Ta76Jna24WKB0xDKoxwnviOj9ZcjiHGOKO+kiG70Cx
 W+Bw==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRW1pbHksCgpoYXZlIHlvdSBhbHNvIHRlc3RlZCB0aGlzPyBJIGRvbid0IGhhdmUgdGhlIGhh
cmR3YXJlIHRvIHRlc3QgaXQgc28gdGhhdCAKd291bGQgYmUgcmF0aGVyIG5pY2UgdG8gaGF2ZS4K
ClRoYW5rcywKQ2hyaXN0aWFuLgoKQW0gMjUuMDkuMTkgdW0gMTE6MzEgc2NocmllYiBEZW5nLCBF
bWlseToKPiBSZXZpZXdlZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgo+Cj4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNr
b2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPgo+PiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1i
ZXIgMjQsIDIwMTkgNzo1NiBQTQo+PiBUbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IFN1YmplY3Q6IFtQQVRDSF0gZHJt
N2FtZGdwdTogb25jZSBtb3JlIGZpeCBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdAo+Pgo+PiBX
aGVuIENQVSBhY2Nlc3MgaXMgbmVlZGVkIHdlIHNob3VsZCB0ZWxsIHRoYXQgdG8KPj4gYW1kZ3B1
X2JvX2NyZWF0ZV9yZXNlcnZlZCgpIG9yIG90aGVyd2lzZSB0aGUgYWNjZXNzIGlzIGRlbmllZCBs
YXRlciBvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+PiAtLS0KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X29iamVjdC5jIHwgOSArKysrKystLS0KPj4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYwo+PiBpbmRleCAxMmQyYWRjZGYxNGUuLmYxMGI2MTc1ZTIwYyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+PiBAQCAt
MzY5LDcgKzM2OSw3IEBAIGludCBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChzdHJ1Y3QKPj4g
YW1kZ3B1X2RldmljZSAqYWRldiwKPj4gCXNpemUgPSBBTElHTihzaXplLCBQQUdFX1NJWkUpOwo+
Pgo+PiAJciA9IGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQoYWRldiwgc2l6ZSwgUEFHRV9TSVpF
LCBkb21haW4sCj4+IGJvX3B0ciwKPj4gLQkJCQkgICAgICBOVUxMLCBOVUxMKTsKPj4gKwkJCQkg
ICAgICBOVUxMLCBjcHVfYWRkcik7Cj4+IAlpZiAocikKPj4gCQlyZXR1cm4gcjsKPj4KPj4gQEAg
LTM3NywxMiArMzc3LDE1IEBAIGludCBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChzdHJ1Y3QK
Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gCSAqIFJlbW92ZSB0aGUgb3JpZ2luYWwgbWVtIG5v
ZGUgYW5kIGNyZWF0ZSBhIG5ldyBvbmUgYXQgdGhlCj4+IHJlcXVlc3QKPj4gCSAqIHBvc2l0aW9u
Lgo+PiAJICovCj4+ICsJaWYgKGNwdV9hZGRyKQo+PiArCQlhbWRncHVfYm9fa3VubWFwKCpib19w
dHIpOwo+PiArCj4+ICsJdHRtX2JvX21lbV9wdXQoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIp
LT50Ym8ubWVtKTsKPj4gKwo+PiAJZm9yIChpID0gMDsgaSA8ICgqYm9fcHRyKS0+cGxhY2VtZW50
Lm51bV9wbGFjZW1lbnQ7ICsraSkgewo+PiAJCSgqYm9fcHRyKS0+cGxhY2VtZW50c1tpXS5mcGZu
ID0gb2Zmc2V0ID4+IFBBR0VfU0hJRlQ7Cj4+IAkJKCpib19wdHIpLT5wbGFjZW1lbnRzW2ldLmxw
Zm4gPSAob2Zmc2V0ICsgc2l6ZSkgPj4gUEFHRV9TSElGVDsKPj4gCX0KPj4gLQo+PiAtCXR0bV9i
b19tZW1fcHV0KCYoKmJvX3B0ciktPnRibywgJigqYm9fcHRyKS0+dGJvLm1lbSk7Cj4+IAlyID0g
dHRtX2JvX21lbV9zcGFjZSgmKCpib19wdHIpLT50Ym8sICYoKmJvX3B0ciktPnBsYWNlbWVudCwK
Pj4gCQkJICAgICAmKCpib19wdHIpLT50Ym8ubWVtLCAmY3R4KTsKPj4gCWlmIChyKQo+PiAtLQo+
PiAyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
