Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7443044
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 21:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44389117;
	Wed, 12 Jun 2019 19:33:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95C889117
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 19:33:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c2so18149183wrm.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 12:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=h7+/EDq6d23O+xUtmRKOYbACB1luBD12vXbroVUq/FA=;
 b=mff8ymYoqR1qKc2dwY55nPXL5bvmEAzeeuTS7j9g3rTOcyrzMrWdDFJbls6SzRoRZp
 jRNUe774g0y1ms2rQbaSZUSn646RCCbimAD0a09w+zCjvrPQgWntMTUjwhSLRP0e5zFQ
 9dGoCbKpN42XN3tqxSEUsUpe9+JtwZqpCK8vJLr84iiVkqqOOBklsKs9Esm1MJ+1/b/A
 5ODj0WPRqOnr6XIzh/YPZZnZ8/IWNaQMaFSDVEsJDHSkvF7YPlUjfK+o771buCmOgjHw
 +wYHX0Z+Mv5sX7Wd0s/ji0kaKDNLvUtJ4BSZBVYbr7sSNB52x5KG4ieF22O8SrFN9V8d
 qQxQ==
X-Gm-Message-State: APjAAAWMiS7ufYr3Jzi6uXScZSAYeZ8FBBKNaOHGtmrUWiYxnXa+4Mu9
 v0dJBnMjBNyOXnSx9X6wTu0JD2x1
X-Google-Smtp-Source: APXvYqx7tRWG3jlRjd9PAv2RhZ+YeM5zw40ZfJbbguuNIOvg6RvndR2BUrW5vfb6dSymIg3Hvz2EQA==
X-Received: by 2002:a05:6000:146:: with SMTP id
 r6mr43206435wrx.237.1560368013239; 
 Wed, 12 Jun 2019 12:33:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x6sm957556wru.0.2019.06.12.12.33.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 12:33:32 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
To: "Yang, Philip" <Philip.Yang@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <30020639-13d8-05dc-a6e4-bef8a8618f87@amd.com>
 <bdbcb7d9-4783-d6dd-e448-c311cd695517@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <10e127de-072b-2edd-1efb-3abd73e83d6f@gmail.com>
Date: Wed, 12 Jun 2019 21:33:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bdbcb7d9-4783-d6dd-e448-c311cd695517@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=h7+/EDq6d23O+xUtmRKOYbACB1luBD12vXbroVUq/FA=;
 b=WK/NCdKKy3gtcaj5Se3gt6PsaWe1aNHTXqVV6xJV8QhueZYUuJBAXnIG+PMMB8rESd
 U3BKA3IpFu1GpJljpJnz4A3K6wPCVOt8V6vmTiRo5O8t6PMLFZ0JZ/AhPYvC4oRUZiyI
 T1ZfWoCUA5BiPWqYgnMzyJiAy0H5FsExBE7mewtSgHk+g369MY+QCrP6vPQRfpWF0h8e
 9SPKNB69Y660s9zeciDJxZ+/8/ggD+7Eibp3XDiNcyEpNsPLvIKdVOVibphkZqTzOClV
 xdbY92XAf7l3Yt8VpLCAa+ddHweBpdodanhbzBiVJOVv8JzHEv/sNX7IkNn+aMfpx4Fa
 c9fQ==
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

V2VsbCB0aGF0IHdlIGV2aWN0IGhlcmUgaXMgcGVyZmVjdGx5IGludGVudGlvbmFsLgoKVGhlIGxh
cHRvcCBJJ20gdHlwaW5nIG9uIGFjdHVhbGx5IGRvbid0IHdvcmsgd2l0aG91dCB0aGlzLCBzbyBw
bGVhc2UgCmRvbid0IHRvdWNoIGFueSBvZiB0aGF0LgoKQ2hyaXN0aWFuLgoKQW0gMTIuMDYuMTkg
dW0gMjA6MDYgc2NocmllYiBZYW5nLCBQaGlsaXA6Cj4gVGhhdCdzIGtpbmQgb2YgaGFjayBiZWNh
dXNlIGRtYTMyIHpvbmUgaXMgbm90IG5lZWRlZCwgaXQgaGFzIGJhZCBlZmZlY3QKPiB0byB0cmln
Z2VyIHVubmVjZXNzYXJ5IGV2aWN0aW9uIGZvciBLRkRUZXN0LkJpZ0J1ZlN0cmVzc1Rlc3QuIEJ1
dAo+IHR0bV9ib19nbG9iYWxfaW5pdC0+dHRtX21lbV9nbG9iYWxfaW5pdCBhbHdheXMgY3JlYXRl
IGRtYTMyIHpvbmUgd2l0aG91dAo+IGFjY2VwdGluZyBhbnkgcGFyYW1ldGVyLgo+Cj4gVG8gYXZv
aWQgdHRtX21lbV9nbG9iYWxfYWxsb2NfcGFnZSBhY2NvdW50IHRvIGRtYTMyIHpvbmUsIGFub3Ro
ZXIgb3B0aW9uCj4gaXMgdG8gYWRkIGEgbmV3IGZsYWcgdG8gdHRtX29wZXJhdGlvbl9jdHgtPmZs
YWdzLCB0aGF0IGxvb2tzIG5vdCBnb29kCj4gZWl0aGVyLgo+Cj4gVGhhbmtzLAo+IFBoaWxpcAo+
Cj4gT24gMjAxOS0wNi0xMiAxOjIzIHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPj4gVFRN
IGl0c2VsZiBoYXMgc29tZSBsb2dpYyBmb3IgbmVlZF9kbWEzMiBhbmQgVFRNX1BBR0VfRkxBR19E
TUEzMi4gSQo+PiBiZWxpZXZlIHRoYXQgc2hvdWxkIGFscmVhZHkgaGFuZGxlIHRoaXMuIG5lZWRf
ZG1hMzIgaXMgcGFzc2VkIGZyb20KPj4gYW1kZ3B1IHRvIHR0bV9ib19kZXZpY2VfaW5pdCB0byBi
ZGV2LT5uZWVkX2RtYTMyLiB0dG1fdHRfY3JlYXRlCj4+IHRyYW5zbGF0ZXMgdGhhdCB0byBwYWdl
X2ZsYWdzIHw9IFRUTV9QQUdFX0ZMQUdfRE1BMzIgYW5kIHBhc3NlcyB0aGF0IHRvCj4+IGJkZXYt
PmRyaXZlci0+dHRtX3R0X2NyZWF0ZS4gVGhlIHR3byBwYWdlIGFsbG9jYXRvcnMgaW4gdHRtX3Bh
Z2VfYWxsb2MuYwo+PiBhbmQgdHRtX3BhZ2VfYWxsb2NfZG1hLmMgY2hlY2sgdHRtLT5wYWdlX2Zs
YWdzLiBJcyB0aGF0IGNoYWluIGJyb2tlbgo+PiBzb21ld2hlcmU/IE92ZXJyaWRpbmcgZ2xvYi0+
bWVtX2dsb2ItPm51bV96b25lcyBmcm9tIGFtZGdwdSBzZWVtcyB0byBiZQo+PiBhIGJpdCBvZiBh
IGhhY2suCj4+Cj4+IFJlZ2FyZHMsCj4+ICAgIMKgIEZlbGl4Cj4+Cj4+IE9uIDIwMTktMDYtMTIg
ODoxMywgWWFuZywgUGhpbGlwIHdyb3RlOgo+Pj4gVFRNIGNyZWF0ZSB0d28gem9uZXMsIGtlcm5l
bCB6b25lIGFuZCBkbWEzMiB6b25lIGZvciBzeXN0ZW0gbWVtb3J5LiBJZgo+Pj4gc3lzdGVtIG1l
bW9yeSBhZGRyZXNzIGFsbG9jYXRlZCBpcyBiZWxvdyA0R0IsIHRoaXMgYWNjb3VudCB0byBkbWEz
MiB6b25lCj4+PiBhbmQgd2lsbCBleGhhdXN0IGRtYTMyIHpvbmUgYW5kIHRyaWdnZXIgdW5uZXNz
c2FyeSBUVE0gZXZpY3Rpb24uCj4+Pgo+Pj4gUGF0Y2ggImRybS90dG06IEFjY291bnQgZm9yIGtl
cm5lbCBhbGxvY2F0aW9ucyBpbiBrZXJuZWwgem9uZSBvbmx5IiBvbmx5Cj4+PiBoYW5kbGUgdGhl
IGFsbG9jYXRpb24gZm9yIGFjY19zaXplLCB0aGUgc3lzdGVtIG1lbW9yeSBwYWdlIGFsbG9jYXRp
b24gaXMKPj4+IHRocm91Z2ggdHRtX21lbV9nbG9iYWxfYWxsb2NfcGFnZSB3aGljaCBzdGlsbCBh
Y2NvdW50IHRvIGRtYTMyIHpvbmUgaWYKPj4+IHBhZ2UgaXMgYmVsb3cgNEdCLgo+Pj4KPj4+IENo
YW5nZS1JZDogSTI4OWI4NWQ4OTFiOGY2NGExNDIyYzQyYjFlYWIzOTgwOThhYjdlZjcKPj4+IFNp
Z25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+Pj4gLS0tCj4+
PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNCArKysrCj4+
PiAgICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPj4+IGluZGV4IDI3NzhmZjYzZDk3ZC4uNzliYjlk
ZmU2MTdiIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMK
Pj4+IEBAIC0xNjg2LDYgKzE2ODYsMTAgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKPj4+ICAgICAJfQo+Pj4gICAgIAlhZGV2LT5tbWFuLmluaXRpYWxp
emVkID0gdHJ1ZTsKPj4+ICAgICAKPj4+ICsJLyogT25seSBrZXJuZWwgem9uZSAobm8gZG1hMzIg
em9uZSkgaWYgZGV2aWNlIGRvZXMgbm90IHJlcXVpcmUgZG1hMzIgKi8KPj4+ICsJaWYgKCFhZGV2
LT5uZWVkX2RtYTMyKQo+Pj4gKwkJYWRldi0+bW1hbi5iZGV2Lmdsb2ItPm1lbV9nbG9iLT5udW1f
em9uZXMgPSAxOwo+Pj4gKwo+Pj4gICAgIAkvKiBXZSBvcHQgdG8gYXZvaWQgT09NIG9uIHN5c3Rl
bSBwYWdlcyBhbGxvY2F0aW9ucyAqLwo+Pj4gICAgIAlhZGV2LT5tbWFuLmJkZXYubm9fcmV0cnkg
PSB0cnVlOwo+Pj4gICAgIAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
