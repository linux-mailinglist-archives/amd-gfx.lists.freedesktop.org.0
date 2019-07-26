Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93313764EE
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 13:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF296ED26;
	Fri, 26 Jul 2019 11:55:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C86ED31
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 11:55:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so54157138wrr.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 04:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=9BqjdTNYLUSrFttrrEN1NX5SfODMMMxjxO9FgeFrSE0=;
 b=o2ENpAHFwbLcLOi8bClRjJ/RnGUjK2HTflM8rR+sMdbkqWkXdiJC+K3+5oSowA2qwT
 Q2TaDfecpwP9Ns1yc1vIkr0LjO2l142pIfJ4/VJOHCBZfin/z08bh5PqM2BWQvL/vqfl
 cYzymQVInal//OSNO6SdK8jxv2GonOVXfQgV0wC8/+EuVtsnElyP6ksP5Jldr9k2yyB2
 kKFgodFT76+gpQlASI+ZU8qJTM6SjyAGdPQIE+ZgYlUWlT2aWx8BO4W9Vo6ZVBEunqhL
 KAMw/QK+IWbZ34AxxCavpmUuQ7gfSNDHyXmKyf0FEnS4ZHEZHcgVMvOtn7pHNV+Mt/Ws
 UAPQ==
X-Gm-Message-State: APjAAAUgTRQrq4qJ0xHcvzihnxTW+f6w+fTZufs6/Iw987/m+adTaXFu
 Z6niH/x1/sL1EXrUG5zwRzI=
X-Google-Smtp-Source: APXvYqxEHqx0m83tE6tgohXEjbXTfoq0ucXZ1mQPRhe+FeZ+LPCXsaMcBCzQ46EMVVX9d71IL6EDsg==
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr24886846wrw.323.1564142108081; 
 Fri, 26 Jul 2019 04:55:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g11sm53157731wru.24.2019.07.26.04.55.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 04:55:07 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-3-git-send-email-andrey.grodzovsky@amd.com>
 <1723b531-097f-2687-6dc9-9de6e3e378a1@gmail.com>
 <fdf2600a-b0ef-bdca-f22b-51427bef9531@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <881edbab-df57-a1d7-bcf3-987fdbb384db@gmail.com>
Date: Fri, 26 Jul 2019 13:55:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fdf2600a-b0ef-bdca-f22b-51427bef9531@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9BqjdTNYLUSrFttrrEN1NX5SfODMMMxjxO9FgeFrSE0=;
 b=b9GrrfPTHKevViNCUeDmbRfc3AqWTnUv29owYnpYRiYQ6hjUKa0ojSm5RGN/CbflIX
 IwSVKBHgCswg95bODFoFKUG+X8dF/h8roW3faqtqVv1rx/OrSqclsIhYThjX/+hgpS5/
 Uk0hgJBU1EccK2RLKhiinM86OtmLbA2UaKsKr+Tnf/EmYXy6gT/1TZg1SJqtwjsm1o1O
 aUuX5uE0/sAudxCgmVxbO8jTUbC3pJvmb7IvCO/rDkqbuD9a0XnPsdMrmC5rcHSU8LKq
 NV8rsE4o+CETQBKZrSNMh1L0UF7sCBlqSxfKelEh/WRR++uXCXGEWqGK4og55E0SMDwe
 uqmw==
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
Cc: Alexander.Deucher@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, shirish.s@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDcuMTkgdW0gMTA6NTQgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDE5LTA3
LTI2IDk6MTEgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjUuMDcuMTkgdW0g
MTY6MjQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+IE1vdmUgdGhlIGxvZ2ljIHRvIGNs
ZWFyIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpbgo+Pj4gYW1kZ3B1X2JvX2RvX2Ny
ZWF0ZSBpbnRvIHN0YW5kYWxvbmUgaGVscGVyIHNvIGl0IGNhbiBiZSByZXVzZWQKPj4+IGluIG90
aGVyIGZ1bmN0aW9ucy4KPj4+Cj4+PiB2NDoKPj4+IFN3aXRjaCB0byByZXR1cm4gYm9vbC4KPj4+
Cj4+PiB2NTogRml4IHR5cG9zLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4gLS0tCj4+PiAgwqAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNjEKPj4+ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuaCB8wqAgMiArCj4+PiAgwqAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25z
KCspLCAyNiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYwo+Pj4gaW5kZXggOTg5YjdiNS4uODcwMjA2MiAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+PiBAQCAtNDEz
LDYgKzQxMyw0MCBAQCBzdGF0aWMgYm9vbCBhbWRncHVfYm9fdmFsaWRhdGVfc2l6ZShzdHJ1Y3QK
Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+PiAgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+
PiAgwqAgfQo+Pj4gIMKgICtib29sIGFtZGdwdV9ib19zdXBwb3J0X3Vzd2ModTY0IGJvX2ZsYWdz
KQo+Pj4gK3sKPj4+ICsKPj4+ICsjaWZkZWYgQ09ORklHX1g4Nl8zMgo+Pj4gK8KgwqDCoCAvKiBY
WFg6IFdyaXRlLWNvbWJpbmVkIENQVSBtYXBwaW5ncyBvZiBHVFQgc2VlbSBicm9rZW4gb24gMzIt
Yml0Cj4+PiArwqDCoMKgwqAgKiBTZWUgaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9ODQ2MjcKPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+PiArI2VsaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiAhZGVmaW5lZChDT05GSUdfWDg2
X1BBVCkKPj4+ICvCoMKgwqAgLyogRG9uJ3QgdHJ5IHRvIGVuYWJsZSB3cml0ZS1jb21iaW5pbmcg
d2hlbiBpdCBjYW4ndCB3b3JrLCBvciB0aGluZ3MKPj4+ICvCoMKgwqDCoCAqIG1heSBiZSBzbG93
Cj4+PiArwqDCoMKgwqAgKiBTZWUgaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9ODg3NTgKPj4+ICvCoMKgwqDCoCAqLwo+Pj4gKwo+Pj4gKyNpZm5kZWYgQ09ORklH
X0NPTVBJTEVfVEVTVAo+Pj4gKyN3YXJuaW5nIFBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5k
IENPTkZJR19YODZfUEFUIGZvciBiZXR0ZXIKPj4+IHBlcmZvcm1hbmNlIFwKPj4+ICvCoMKgwqDC
oCB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nCj4+PiArI2VuZGlmCj4+PiArCj4+PiArwqDCoMKg
IGlmIChib19mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykKPj4+ICvCoMKg
wqDCoMKgwqDCoCBEUk1fSU5GT19PTkNFKCJQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJSIGFuZCBD
T05GSUdfWDg2X1BBVAo+Pj4gZm9yICIKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJiZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZ1xuIik7
Cj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBtZXNzYWdlIGJlbG9uZ3MgaGVyZS4KPj4KPj4gWy4uLl0K
Pj4+IEBAIC00NjYsMzMgKzUwMCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0ZShz
dHJ1Y3QKPj4+IFsuLi5dCj4+PiArwqDCoMKgIGlmICghYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Yyhi
by0+ZmxhZ3MpKQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBiby0+ZmxhZ3MgJj0gfkFNREdQVV9H
RU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKPj4gUmF0aGVyIGhlcmUgd2Ugc2hvdWxkIGRvICJpZiAo
Ym9fZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MKPj4gJiYgIWFtZGdwdV9i
b19zdXBwb3J0X3Vzd2MoKSkiIGFuZCB0aGVuIGNsZWFyIHRoZSBmbGFnIGFuZCBhbHNvIHByaW50
Cj4+IHRoZSB3YXJuaW5nLgo+IFRoYXQgd291bGQgcmVxdWlyZSBkdXBsaWNhdGluZyB0aGUgQ09O
RklHX1g4Nl9QQVQgcmVsYXRlZCBsb2dpYyBoZXJlIGFzCj4gd2VsbCwgd2hpY2ggaXMgYSBiaXQg
dWdseS4KCkFjdHVhbGx5IEkgd291bGQgc2F5IHdlIHNob3VsZCBkcm9wIHRoaXMgZXh0cmEgY2hl
Y2sgYW5kIGFsd2F5cyBlbWl0IGEgCm1lc3NhZ2UgdGhhdCBVU1dDIGlzIGRpc2FibGVkIGZvciB0
aGlzIHBsYXRmb3JtLgoKV2Ugbm93IG5lZWQgaXQgZm9yIG1vcmUgdGhhbiBqdXN0IGJldHRlciBw
ZXJmb3JtYW5jZSBhbmQgaXQgc2hvdWxkIGJlIApleHBsaWNpdGx5IG5vdGVkIHRoYXQgdGhpcyBp
cyBub3QgYXZhaWxhYmxlIGluIHRoZSBsb2dzLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
