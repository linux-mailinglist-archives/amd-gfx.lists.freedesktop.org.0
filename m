Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A7732DA2
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 12:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3D89003;
	Mon,  3 Jun 2019 10:17:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1968289003
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 10:17:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s3so3214361wms.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 03:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5p4lx7lYJHBAyXODxvimhraHr2CIoU9812mZ98LMlQg=;
 b=DD+dJriLHfj58ZaCrOyvn0rCLD8pWuMZL+LQzRIrxFRTb7MFjO8flZ1Q7xPErJE9xp
 WFJl1aPrSnhOo9iPPB9PPUrEcqqPuUwp3IQDJ+riUY1+PmBL4cTCKEIbY04ZMTLpqb2l
 JJJBK4pX1G8HbKlgRK8P5TtLbCoNRKTYso7Od6jDnd2fIExcAf/lKjMVToj8/OObUD4V
 Q351l+Q6/6wzc8LQKOraqNBI0tgQnVrZrQbmZFyGaGlTJvNVggo2FqOEDQMUD34tpCuC
 GizlND8S9UPrefSWsCeuKsbdOhOs96EzTgICy31HgiZTOhxPpC6W6kvINPJ9hh6R/Q5K
 it4A==
X-Gm-Message-State: APjAAAX/4/ar4fqESLvF0EwFNg3PbThUULtk6pwNIuc8KZgXG55EP+Pl
 upm5uHMfikNGW+PgtlIb4RQ8+X/N
X-Google-Smtp-Source: APXvYqwAcLy84m3hQWjrlcMiqVS/kthtLSYi82TIrmIzJSs1YM/bKsDBKhcR8xmE5/Wf7xGQY0uzjQ==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr13727888wmi.0.1559557037533; 
 Mon, 03 Jun 2019 03:17:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k185sm19818049wma.3.2019.06.03.03.17.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 03:17:17 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
 <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
 <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
 <9ae26883-4326-c60f-9a8e-d95d0d458e31@amd.com>
 <9f5f4060-5f8f-b688-2cc2-39aca92c7505@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <972ef129-3dae-d5eb-100f-b9be83d0afcc@gmail.com>
Date: Mon, 3 Jun 2019 12:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9f5f4060-5f8f-b688-2cc2-39aca92c7505@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5p4lx7lYJHBAyXODxvimhraHr2CIoU9812mZ98LMlQg=;
 b=VdaEYdgrhwL7+/vVYDpULaixvsURvLfOtMecgeyHCu6avKI0yskrQoTPr0tHRxINGU
 kngRApL9h7Zqdyr8VW8rr2C7chYP6kwOjf1aVnBRsiph1aiRkL2F6vaVips9WW8K9xW7
 n7/4jYbMABsrAuoJs0DvhTLjakBk4U/6/QbvUYPs4BJX7gQPHVWAmdqA7DJhiC6vXWwd
 1LZQdNEYAJDfNxT5/3pewYsZtHX9T0s/T1i5Cq3hSXcLw9pWIh8qyqJ6p+V+ql98jpfM
 tyJLmBJI0JcycdMSGXU85Np2x3bTDQSCPhY2m1c/wje0wLcMVBb4WUPXkOjr9nT+YTp8
 BWUw==
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

QW0gMDEuMDYuMTkgdW0gMDA6MDEgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0w
NS0zMSA1OjMyIHAubS4sIFlhbmcsIFBoaWxpcCB3cm90ZToKPj4gT24gMjAxOS0wNS0zMSAzOjQy
IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPj4+IE9uIDIwMTktMDUtMzEgMToyOCBwLm0u
LCBZYW5nLCBQaGlsaXAgd3JvdGU6Cj4+Pj4gT24gMjAxOS0wNS0zMCA2OjM2IHAubS4sIEt1ZWhs
aW5nLCBGZWxpeCB3cm90ZToKPj4+Pj4+ICAgICAgICAKPj4+Pj4+ICAgICAgICAjaWYgSVNfRU5B
QkxFRChDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSKQo+Pj4+Pj4gLQlpZiAoZ3R0LT5yYW5nZXMg
JiYKPj4+Pj4+IC0JICAgIHR0bS0+cGFnZXNbMF0gPT0gaG1tX3Bmbl90b19wYWdlKCZndHQtPnJh
bmdlc1swXSwKPj4+Pj4+IC0JCQkJCSAgICAgZ3R0LT5yYW5nZXNbMF0ucGZuc1swXSkpCj4+Pj4+
PiArCWlmIChndHQtPnJhbmdlICYmCj4+Pj4+PiArCSAgICB0dG0tPnBhZ2VzWzBdID09IGhtbV9k
ZXZpY2VfZW50cnlfdG9fcGFnZShndHQtPnJhbmdlLAo+Pj4+Pj4gKwkJCQkJCSAgICAgIGd0dC0+
cmFuZ2UtPnBmbnNbMF0pKQo+Pj4+PiBJIHRoaW5rIGp1c3QgY2hlY2tpbmcgZ3R0LT5yYW5nZSBo
ZXJlIGlzIGVub3VnaC4gSWYgZ3R0LT5yYW5nZSBpcyBub3QKPj4+Pj4gTlVMTCBoZXJlLCB3ZSdy
ZSBsZWFraW5nIG1lbW9yeS4KPj4+Pj4KPj4+PiBJZiBqdXN0IGNoZWNraW5nIGd0dC0+cmFuZ2Us
IHRoZXJlIGlzIGEgZmFsc2Ugd2FybmluZyBpbiBhbWRncHVfdGVzdAo+Pj4+IHVzZXJwdHIgY2Fz
ZSBpbiBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZSBwYXRoLiBJZiB1c2VycHRyIGlzIGludmFsaWRh
dGVkLAo+Pj4+IHRoZW4gdHRtLT5wYWdlc1swXSBpcyBvdXRkYXRlZCBwYWdlcywgbG9iai0+dXNl
cl9wYWdlcyBpcyBuZXcgcGFnZXMsIGl0Cj4+Pj4gZ29lcyB0byB0dG1fdHRfdW5iaW5kIGZpcnN0
IHRvIHVucGluIG9sZCBwYWdlcyAodGhpcyBjYXVzZXMgZmFsc2UKPj4+PiB3YXJuaW5nKSB0aGVu
IGNhbGwgYW1kZ3B1X3R0bV90dF9zZXRfdXNlcl9wYWdlcy4KPj4+IEJ1dCBkb2Vzbid0IHRoYXQg
bWVhbiB3ZSdyZSBsZWFraW5nIHRoZSBndHQtPnJhbmdlIHNvbWV3aGVyZT8KPj4+Cj4+IHR0bV90
dF91bmJpbmQgaXMgY2FsbGVkIGZyb20gdHRtX3R0X2Rlc3Ryb3kgYW5kIGFtZGdwdV9jc19saXN0
X3ZhbGlkYXRlLAo+PiB0aGUgbGF0ZXIgb25lIGNhdXNlcyBmYWxzZSB3YXJuaW5nLiB0dG1fdHRt
X2Rlc3RvcnkgcGF0aCBpcyBmaW5lIHRvIG9ubHkKPj4gY2hlY2sgZ3R0LT5yYW5nZS4KPj4KPj4g
RG91YmxlIGNoZWNrZWQsIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMgYW5kCj4+IGFtZGdw
dV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZSBhbHdheXMgbWF0Y2ggaW4gYm90aCBwYXRocywg
c28gbm8gbGVhawo+PiBndHQtPnJhbmdlLgo+Pgo+PiAxLiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9j
dGwKPj4gICAgICAgICAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcwo+PiAgICAgICAgICAg
ICAgdHRtLT5wYWdlcyBmb3IgdXNlcnB0ciBwYWdlcwo+PiAgICAgICAgICBhbWRncHVfdHRtX3R0
X2dldF91c2VyX3BhZ2VzX2RvbmUKPj4KPj4gMi4gYW1kZ3B1X2NzX2lvY3RsCj4+ICAgICAgICAg
IGFtZGdwdV9jc19wYXJzZXJfYm9zCj4+ICAgICAgICAgICAgICBhbWRncHVfdHRtX3R0X2dldF91
c2VyX3BhZ2VzCj4+ICAgICAgICAgICAgICBpZiAodXNlcnBhZ2VfaW52YWxpZGF0ZWQpCj4+ICAg
ICAgICAgICAgICAgICAgZS0+dXNlcl9wYWdlcyBmb3IgbmV3IHBhZ2VzCj4+ICAgICAgICAgICAg
ICBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZQo+PiAgICAgICAgICAgICAgICAgIGlmICh1c2VycGFn
ZV9pbnZhbGlkYXRlZCkKPj4gICAgICAgICAgICAgICAgICAgICB0dG1fdHRfdW5iaW5kIHR0bS0+
cGFnZXMgLy8gdGhpcyBjYXVzZXMgd2FybmluZwo+PiAgICAgICAgICAgICAgICAgICAgIGFtZGdw
dV90dG1fdHRfc2V0X3VzZXJfcGFnZXModHRtLT5wYWdlcywgZS0+dXNlcl9wYWdlcykKPiBIbW0s
IEkgdGhpbmsgYW1kZ3B1X2NzIGlzIGRvaW5nIHNvbWV0aGluZyB3ZWlyZCB0aGVyZS4gSXQgZG9l
cyBzb21lCj4gZG91YmxlIGJvb2sta2VlcGluZyBvZiB0aGUgdXNlciBwYWdlcyBpbiB0aGUgQk8g
bGlzdCBhbmQgdGhlIFRUTSBCTy4gV2UKPiBkaWQgc29tZXRoaW5nIHNpbWlsYXIgZm9yIEtGRCBh
bmQgc2ltcGxpZmllZCBpdCB3aGVuIG1vdmluZyB0byBITU0uIEl0Cj4gY291bGQgcHJvYmFibHkg
YmUgc2ltcGxpZmllZCBmb3IgYW1kZ3B1X2NzIGFzIHdlbGwuIEJ1dCBub3QgaW4gdGhpcwo+IHBh
dGNoIHNlcmllcy4KClRoYXQgYWN0dWFsbHkgc291bmRzIGxpa2UgYSBidWcgdG8gbWUuCgpJdCBp
cyBtb3N0IGxpa2VseSBhIGxlZnRvdmVyIGZyb20gdGhlIHRpbWUgd2hlbiB3ZSBjb3VsZG4ndCBn
ZXQgdGhlIApwYWdlcyBmb3IgYSBCTyB3aGlsZSB0aGUgQk8gd2FzIHJlc2VydmVkLgoKR29pbmcg
dG8gdGFrZSBhIGNsb3NlciBsb29rLApDaHJpc3RpYW4uCgo+Cj4gSSdsbCByZXZpZXcgeW91ciB1
cGRhdGVkIGNoYW5nZS4KPgo+IFRoYW5rcywKPiAgIMKgIEZlbGl4Cj4KPgo+PiAgICAgICAgICBh
bWRncHVfY3Nfc3VibWl0Cj4+ICAgICAgICAgICAgICBhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzX2RvbmUKPj4KPj4+IFJlZ2FyZHMsCj4+PiAgICAgwqAgRmVsaXgKPj4+Cj4+Pgo+Pj4+IEkg
d2lsbCBzdWJtaXQgcGF0Y2ggdjIsIHRvIGFkZCByZXRyeSBpZiBobW1fcmFuZ2VfZmF1bHQgcmV0
dXJucyAtRUFHQUlOLgo+Pj4+IHVzZSBremFsbG9jIHRvIGFsbG9jYXRlIHNtYWxsIHNpemUgcmFu
Z2UuCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gUGhpbGlwCj4+Pj4KPj4+Pj4gUmVnYXJkcywKPj4+
Pj4gICAgICAgwqAgRmVsaXgKPj4+Pj4KPj4+Pj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
