Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C832C009
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260E7884E2;
	Tue, 28 May 2019 07:25:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A078589B98
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:25:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y3so1598631wmm.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 00:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ymsDOxDMkVLQi3EC8ZytEPA9SZM9XuoW0q7f3qIB4qY=;
 b=YJ3Xr704SxcElfqfCNxBSIV/OQCa+2TjD5J6eBhZH660uqJXw4jN7wd4W9r1aWlWfR
 zhGRDBv17x2FhRAwWL7pfO+WylPWQ8fsk6vF9t4ew9NSA9x87I89MGT5wgftKeyma7ay
 QiPT37mNvi3+ne+zLXgX35D4PGD3bpDZCGXRMdvA7DiaQcxUM16MIrvbfoytMIclCbJ+
 4mrMCrw7XXTuxpU2Sf2uf9haQRpu/Lq2/cQwdtdaZCjEBRJbEmzgHv/vtf/RBONpvpEu
 L8cBkToBtGOh7YT72dW6qfA38P/vUDKd28n0iLMDUsefmAL9leqJd3j1/Yg6REiDdxwx
 bUDw==
X-Gm-Message-State: APjAAAVYapm6cziZe9e1wqjOo24xXGrs4p9UOm9aT67N7ltiGmA4CNWh
 Lkk31pan040hikQLaraGTLRJi22A
X-Google-Smtp-Source: APXvYqz/klp9bYD7+B0gaI9r9SVXdhy7T8dw0lwpW9GD7sFIa+Zzxe6KJlbw48jHfgLTz4ut+djzCA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr1950028wmc.40.1559028327135; 
 Tue, 28 May 2019 00:25:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b136sm1975683wme.30.2019.05.28.00.25.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 00:25:26 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: enable PCIE atomics ops support
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1558952326-5611-1-git-send-email-Jack.Xiao@amd.com>
 <BYAPR12MB26323A2A4408EB2EBB1A1448FC1D0@BYAPR12MB2632.namprd12.prod.outlook.com>
 <dc7f3fa5-2b67-0b05-e3f0-46f3733a430a@gmail.com>
 <f6b13954-1876-6b5a-bebf-4febeb51f155@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <81c638c3-8821-70b4-aff2-fe6508493461@gmail.com>
Date: Tue, 28 May 2019 09:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f6b13954-1876-6b5a-bebf-4febeb51f155@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ymsDOxDMkVLQi3EC8ZytEPA9SZM9XuoW0q7f3qIB4qY=;
 b=c4y6yTsv06o3ML3LeO13fZgUXKFv8n9ocOOjzmPn+C7tWAoJAQBmg5YmGg7vzCzZt9
 YhCZuacdIQZetjtR1ZdD7sVdjnMoqulNy3LSU5o8uQr/OWxnXFpsM47G2/KrabGOXsIT
 lMHtED5RTbiYANlnaU9lC0IILDCVNh7eRz331hnBfiw9InpCCwiy4uS3inWJn+Zqanwp
 dsAgAw8/FHgjOL4npXqYf95b9MLrb+kHPQfBAVVyPavXkHst6/ogote0xKcUz3CPthU/
 AHQL2XsegVnaTz2+Wyl++wNWUdQ2xqpx5S1NmSa93MCmAtY6NLeF8gIabr0dDdv4CWv9
 ZoDg==
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

QW0gMjcuMDUuMTkgdW0gMjA6MjMgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0w
NS0yNyA3OjUxIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IFRoYXQgaWRlYSBzb3Vu
ZHMgc2FuZSB0byBtZSBhcyB3ZWxsLgo+Pgo+PiBCeSB0aGUgd2F5LCBkbyB3ZSBzb21ld2hlcmUg
c2lnbmFsIHRvIHVzZXJzcGFjZSBpZiBhdG9taWNzIGFyZQo+PiBzdXBwb3J0ZWQgb3Igbm90Pwo+
IFllcy4gS0ZEIHRvcG9sb2d5IChhIGZsYWcgaW4gdGhlIGlvbGluaykgcHJvdmlkZXMgdGhhdCBp
bmZvcm1hdGlvbiB0bwo+IHVzZXIgbW9kZS4KClllYWgsIGJ1dCB3ZSBhcmUgZW5hYmxpbmcgdGhp
cyBmb3IgdGhlIHJlbmRlciBub2RlIGFzIHdlbGwuCgpRdWVzdGlvbiBpcyBub3cgaWYgd2UgaGF2
ZSB0aGF0IGluIHRoZSBpbmZvIElPQ1RMIG9yIG5vdD8gSSBzdHJvbmdseSAKc3VzcGVjdCB0aGF0
J3Mgbm90IHByZXNlbnQgdGhlcmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywK
PiAgIMKgIEZlbGl4Cj4KPgo+PiBJIG1lYW4gd291bGQgYmUgbmljZSB0byBrZWVwIHRoZSBzdGF0
ZSBpbnNpZGUgYWRldiBpZiB0aGlzIGZhaWxzIGZvcgo+PiBzb21lIHJlYXNvbi4KPj4KPj4gQ2hy
aXN0aWFuLgo+Pgo+PiBBbSAyNy4wNS4xOSB1bSAxMzoxNiBzY2hyaWViIFpoYW5nLCBIYXdraW5n
Ogo+Pj4gSG93IGFib3V0IHB1dCBwY2lfZW5hYmxlX2F0b21pY19vcHNfdG9fcm9vdCBhaGVhZCBv
Zgo+Pj4gYW1kZ3B1X2RldmljZV9pcF9lYXJseV9pbml0LCB3aGlsZSBtb3ZlIHBjaV9hdG9taWNf
cmVxdWVzdGVkIGZyb20ga2ZkCj4+PiBkZXZpY2UgdG8ga2dkIGRldmljZSA/IEluIHN1Y2ggd2F5
LCB3ZSBjYW4gYXZvaWQgZHVwbGljYXRlIGF0b21pYwo+Pj4gcmVxdWVzdCBmcm9tIGJvdGggYW1k
Z3B1IGFuZCBhbWRrZmQuCj4+Pgo+Pj4gUmVnYXJkcywKPj4+IEhhd2tpbmcKPj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YKPj4+IFhpYW8sIEphY2sKPj4+IFNlbnQ6
IDIwMTnlubQ15pyIMjfml6UgMTg6MTkKPj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+Pj4gQ2M6IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQuY29tPgo+Pj4gU3ViamVjdDog
W1BBVENIXSBkcm0vYW1kZ3B1OiBlbmFibGUgUENJRSBhdG9taWNzIG9wcyBzdXBwb3J0Cj4+Pgo+
Pj4gR1BVIGF0b21pY3Mgb3BlcmF0aW9uIGRlcGVuZHMgb24gUENJRSBhdG9taWNzIHN1cHBvcnQu
Cj4+PiBBbHdheXMgZW5hYmxlIFBDSUUgYXRvbWljcyBvcHMgc3VwcG9ydCBpbiBjYXNlIHRoYXQg
aXQgaGFzbid0IGJlZW4KPj4+IGVuYWJsZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDcgKysrKysrKwo+Pj4gIMKgIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gaW5kZXggYmRkMWZlNzMuLmEyYzYwNjQgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gQEAgLTI1
NjIsNiArMjU2MiwxMyBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlCj4+PiAqYWRldiwKPj4+ICDCoMKgwqDCoMKgIGlmIChhZGV2LT5yaW9fbWVtID09IE5VTEwp
Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9JTkZPKCJQQ0kgSS9PIEJBUiBpcyBub3QgZm91
bmQuXG4iKTsKPj4+ICDCoCArwqDCoMKgIC8qIGVuYWJsZSBQQ0lFIGF0b21pYyBvcHMgKi8KPj4+
ICvCoMKgwqAgciA9IHBjaV9lbmFibGVfYXRvbWljX29wc190b19yb290KGFkZXYtPnBkZXYsCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBDSV9FWFBfREVWQ0FQMl9BVE9NSUNf
Q09NUDMyIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUENJX0VYUF9ERVZD
QVAyX0FUT01JQ19DT01QNjQpOwo+Pj4gK8KgwqDCoCBpZiAocikKPj4+ICvCoMKgwqDCoMKgwqDC
oCBEUk1fSU5GTygiUENJRSBhdG9taWMgb3BzIGlzIG5vdCBzdXBwb3J0ZWRcbiIpOwo+Pj4gKwo+
Pj4gIMKgwqDCoMKgwqAgYW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKGFkZXYpOwo+Pj4gIMKg
IMKgwqDCoMKgwqAgLyogZWFybHkgaW5pdCBmdW5jdGlvbnMgKi8KPj4+IC0tIAo+Pj4gMS45LjEK
Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
