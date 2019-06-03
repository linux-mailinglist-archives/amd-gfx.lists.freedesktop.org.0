Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD732E8B
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 13:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF8B8922A;
	Mon,  3 Jun 2019 11:23:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B728922A
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 11:23:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so7564420wme.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 04:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JpqNUH1fiT5FG3VhB4BlCrzYdPa6Tvhw8IX2uMmHd1Q=;
 b=uBxzJKgZDfI7wmDaESzjgWf/uhWgsvi0EGuP8PBg8Bgp/TZ6Xf5itFSU/n8rKgEF2j
 9+nQyK59NpDVvhrap9p2SlmcMqV25lU5AJKnK5QH+ZU419O3Y5EzF/n9ZehaJ9EccBYo
 L76GZinY2Adj+0ePppuoTfe0lzG7sB0SZxsuJ5bMrrieX1jr0yGXwp1iXZqKQtyTLkxm
 FVqxoPHwX+iQWg7ugGmx8QMKxnT8FtL0JVf93EBhfjre8rZJ4D8wxHHzQw1mn8eyMEOY
 YoHishlh9GSZ1G+tJhoN3OcACZwwY4Wv8UFZx8p0TNBk6++CxK61tUeFxA4GS4WhL8uo
 DfZw==
X-Gm-Message-State: APjAAAVE7HD50XQ/3TEKcM63NooCUugdJccWVl4rHkDnGO/t71JEUe/f
 tts2YeRZx0V5zIETX5KJuF6r8F88
X-Google-Smtp-Source: APXvYqwVOF6pv3M6hj2UnebIl3Y30vd/+fpxlZu+fhcObEAwZjN7Lw3J+Nji8P+NMm03eiMa7AjwMg==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr13792044wmh.103.1559560997089; 
 Mon, 03 Jun 2019 04:23:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t14sm16205290wrr.33.2019.06.03.04.23.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 04:23:16 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
 <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
 <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
 <9ae26883-4326-c60f-9a8e-d95d0d458e31@amd.com>
 <9f5f4060-5f8f-b688-2cc2-39aca92c7505@amd.com>
 <972ef129-3dae-d5eb-100f-b9be83d0afcc@gmail.com>
Message-ID: <c20fba4e-f303-75b9-4bba-bdede43237aa@gmail.com>
Date: Mon, 3 Jun 2019 13:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <972ef129-3dae-d5eb-100f-b9be83d0afcc@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JpqNUH1fiT5FG3VhB4BlCrzYdPa6Tvhw8IX2uMmHd1Q=;
 b=iYgPYzb6opMh5B5LI6CSWMElr1hKb1/foE0dR44wrR2ohXx7X8tgDhHR9EXq5NVdAv
 17OCucCt5R5jNbw3F0tolMMH8PSzEzGo031iZ6u7cUte1TMPl7o74BVRhnWe7ZpIn6SO
 /frEdH0rla3DHqGwSck6xwmIelYhk8SSqymT6ajeum2qvgG409xZh8Jtk1/oreVQLNfI
 imH2JtnkF9QNfwax6qDYwM3/+UpB2th1IyDj3XG2AaXm36CKNTi4z3S4aGzec+mHQ0RE
 7TZoVMlR97H/CvaYl9WvYTETF7wiAOF85VfYnGFs7Oped52AvfJPneLj2J4afkfLpjN9
 o7FQ==
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

QW0gMDMuMDYuMTkgdW0gMTI6MTcgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDAxLjA2
LjE5IHVtIDAwOjAxIHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Ogo+PiBPbiAyMDE5LTA1LTMxIDU6
MzIgcC5tLiwgWWFuZywgUGhpbGlwIHdyb3RlOgo+Pj4gT24gMjAxOS0wNS0zMSAzOjQyIHAubS4s
IEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPj4+PiBPbiAyMDE5LTA1LTMxIDE6MjggcC5tLiwgWWFu
ZywgUGhpbGlwIHdyb3RlOgo+Pj4+PiBPbiAyMDE5LTA1LTMwIDY6MzYgcC5tLiwgS3VlaGxpbmcs
IEZlbGl4IHdyb3RlOgo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCDCoMKgwqDCoMKgwqAgI2lmIElTX0VO
QUJMRUQoQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUikKPj4+Pj4+PiAtwqDCoMKgIGlmIChndHQt
PnJhbmdlcyAmJgo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB0dG0tPnBhZ2VzWzBdID09IGhtbV9w
Zm5fdG9fcGFnZSgmZ3R0LT5yYW5nZXNbMF0sCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBndHQtPnJhbmdlc1swXS5wZm5zWzBdKSkKPj4+
Pj4+PiArwqDCoMKgIGlmIChndHQtPnJhbmdlICYmCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHR0
bS0+cGFnZXNbMF0gPT0gaG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+cmFuZ2UsCj4+Pj4+
Pj4gKyBndHQtPnJhbmdlLT5wZm5zWzBdKSkKPj4+Pj4+IEkgdGhpbmsganVzdCBjaGVja2luZyBn
dHQtPnJhbmdlIGhlcmUgaXMgZW5vdWdoLiBJZiBndHQtPnJhbmdlIGlzIAo+Pj4+Pj4gbm90Cj4+
Pj4+PiBOVUxMIGhlcmUsIHdlJ3JlIGxlYWtpbmcgbWVtb3J5Lgo+Pj4+Pj4KPj4+Pj4gSWYganVz
dCBjaGVja2luZyBndHQtPnJhbmdlLCB0aGVyZSBpcyBhIGZhbHNlIHdhcm5pbmcgaW4gYW1kZ3B1
X3Rlc3QKPj4+Pj4gdXNlcnB0ciBjYXNlIGluIGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlIHBhdGgu
IElmIHVzZXJwdHIgaXMgCj4+Pj4+IGludmFsaWRhdGVkLAo+Pj4+PiB0aGVuIHR0bS0+cGFnZXNb
MF0gaXMgb3V0ZGF0ZWQgcGFnZXMsIGxvYmotPnVzZXJfcGFnZXMgaXMgbmV3IAo+Pj4+PiBwYWdl
cywgaXQKPj4+Pj4gZ29lcyB0byB0dG1fdHRfdW5iaW5kIGZpcnN0IHRvIHVucGluIG9sZCBwYWdl
cyAodGhpcyBjYXVzZXMgZmFsc2UKPj4+Pj4gd2FybmluZykgdGhlbiBjYWxsIGFtZGdwdV90dG1f
dHRfc2V0X3VzZXJfcGFnZXMuCj4+Pj4gQnV0IGRvZXNuJ3QgdGhhdCBtZWFuIHdlJ3JlIGxlYWtp
bmcgdGhlIGd0dC0+cmFuZ2Ugc29tZXdoZXJlPwo+Pj4+Cj4+PiB0dG1fdHRfdW5iaW5kIGlzIGNh
bGxlZCBmcm9tIHR0bV90dF9kZXN0cm95IGFuZCAKPj4+IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRl
LAo+Pj4gdGhlIGxhdGVyIG9uZSBjYXVzZXMgZmFsc2Ugd2FybmluZy4gdHRtX3R0bV9kZXN0b3J5
IHBhdGggaXMgZmluZSB0byAKPj4+IG9ubHkKPj4+IGNoZWNrIGd0dC0+cmFuZ2UuCj4+Pgo+Pj4g
RG91YmxlIGNoZWNrZWQsIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMgYW5kCj4+PiBhbWRn
cHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUgYWx3YXlzIG1hdGNoIGluIGJvdGggcGF0aHMs
IHNvIG5vIAo+Pj4gbGVhawo+Pj4gZ3R0LT5yYW5nZS4KPj4+Cj4+PiAxLiBhbWRncHVfZ2VtX3Vz
ZXJwdHJfaW9jdGwKPj4+IMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9w
YWdlcwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bS0+cGFnZXMgZm9yIHVzZXJwdHIg
cGFnZXMKPj4+IMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19k
b25lCj4+Pgo+Pj4gMi4gYW1kZ3B1X2NzX2lvY3RsCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGFtZGdw
dV9jc19wYXJzZXJfYm9zCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlcwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1c2VycGFn
ZV9pbnZhbGlkYXRlZCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGUtPnVz
ZXJfcGFnZXMgZm9yIG5ldyBwYWdlcwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdw
dV9jc19saXN0X3ZhbGlkYXRlCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAodXNlcnBhZ2VfaW52YWxpZGF0ZWQpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0dG1fdHRfdW5iaW5kIHR0bS0+cGFnZXMgLy8gdGhpcyBjYXVzZXMgd2Fybmlu
Zwo+Pj4gYW1kZ3B1X3R0bV90dF9zZXRfdXNlcl9wYWdlcyh0dG0tPnBhZ2VzLCBlLT51c2VyX3Bh
Z2VzKQo+PiBIbW0sIEkgdGhpbmsgYW1kZ3B1X2NzIGlzIGRvaW5nIHNvbWV0aGluZyB3ZWlyZCB0
aGVyZS4gSXQgZG9lcyBzb21lCj4+IGRvdWJsZSBib29rLWtlZXBpbmcgb2YgdGhlIHVzZXIgcGFn
ZXMgaW4gdGhlIEJPIGxpc3QgYW5kIHRoZSBUVE0gQk8uIFdlCj4+IGRpZCBzb21ldGhpbmcgc2lt
aWxhciBmb3IgS0ZEIGFuZCBzaW1wbGlmaWVkIGl0IHdoZW4gbW92aW5nIHRvIEhNTS4gSXQKPj4g
Y291bGQgcHJvYmFibHkgYmUgc2ltcGxpZmllZCBmb3IgYW1kZ3B1X2NzIGFzIHdlbGwuIEJ1dCBu
b3QgaW4gdGhpcwo+PiBwYXRjaCBzZXJpZXMuCj4KPiBUaGF0IGFjdHVhbGx5IHNvdW5kcyBsaWtl
IGEgYnVnIHRvIG1lLgo+Cj4gSXQgaXMgbW9zdCBsaWtlbHkgYSBsZWZ0b3ZlciBmcm9tIHRoZSB0
aW1lIHdoZW4gd2UgY291bGRuJ3QgZ2V0IHRoZSAKPiBwYWdlcyBmb3IgYSBCTyB3aGlsZSB0aGUg
Qk8gd2FzIHJlc2VydmVkLgoKTWhtLCBhdCBsZWFzdCBpdCdzIG5vdCByYWN5IGluIHRoZSB3YXkg
SSB0aG91Z2h0IGl0IHdvdWxkIGJlLiBCdXQgaXQgaXMgCmNlcnRhaW5seSBzdGlsbCBvdmVya2ls
bCBhbmQgc2hvdWxkIGJlIHNpbXBsaWZpZWQuCgpQaGlsaXAgYXJlIHlvdSB0YWtpbmcgYSBsb29r
IG9yIHNob3VsZCBJIHRhY2tsZSB0aGlzPwoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4KPiBHb2lu
ZyB0byB0YWtlIGEgY2xvc2VyIGxvb2ssCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IEknbGwgcmV2aWV3
IHlvdXIgdXBkYXRlZCBjaGFuZ2UuCj4+Cj4+IFRoYW5rcywKPj4gwqAgwqAgRmVsaXgKPj4KPj4K
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X2NzX3N1Ym1pdAo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZQo+Pj4KPj4+PiBSZWdh
cmRzLAo+Pj4+IMKgwqDCoCDCoCBGZWxpeAo+Pj4+Cj4+Pj4KPj4+Pj4gSSB3aWxsIHN1Ym1pdCBw
YXRjaCB2MiwgdG8gYWRkIHJldHJ5IGlmIGhtbV9yYW5nZV9mYXVsdCByZXR1cm5zIAo+Pj4+PiAt
RUFHQUlOLgo+Pj4+PiB1c2Uga3phbGxvYyB0byBhbGxvY2F0ZSBzbWFsbCBzaXplIHJhbmdlLgo+
Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+IFBoaWxpcAo+Pj4+Pgo+Pj4+Pj4gUmVnYXJkcywKPj4+
Pj4+IMKgwqDCoMKgwqAgwqAgRmVsaXgKPj4+Pj4+Cj4+Pj4+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
