Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07732119C6
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D03894E7;
	Thu,  2 May 2019 13:09:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB27894E7
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:09:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b10so2748068wmj.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 02 May 2019 06:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EYX9mwy0GJAVDlhNZXcmAoE3js0m3EbkTPnqefBrF5g=;
 b=l7VgLnYgpuZ0NkvHMi6IjattMGhHCyDxAfUwYtdg0KAW5lWZlDgEguTT73LLhfwNnt
 Brl95MdBmzyW9tc7Qc16PdL7HaKiQ0vMd/+dppDxdal5R9s6eKxNSO7Q3eu3mDmAOlee
 yDnt9e3EbWgMVv9e2SESTTp3Pib6rQ7fHbCbEXVORkCn7yb3sAYlLHDKykUqViOa5xDI
 trXjZxgCm8SmWE3ygyG0NT2FWHMjQohRmhWnVK65RqgNJU4KUOVg0xO8XkPWRqKwEbkr
 lCXNUbXSTK/+AXbDrM6je3mqEd9up2aexE0bKm1NvfV2ax0klOzPNTu24DW0+wWtb9lK
 uOTg==
X-Gm-Message-State: APjAAAX4RgItkebkQdU0InOzx/EJi+zCC6Lusfc/kxFw28Guv1JgoRVm
 ytYfsXA7OFih/gcZn0D4xxnvc4JS
X-Google-Smtp-Source: APXvYqz2rS+eCnn4YFD6V9yzcV1/9hg/oB1+FxW8r8DRK1rxSxNbTn5Xx+51ih8DioZ1dZKyIDYZBg==
X-Received: by 2002:a1c:491:: with SMTP id 139mr2153416wme.64.1556802575684;
 Thu, 02 May 2019 06:09:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p2sm33138569wru.73.2019.05.02.06.09.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 06:09:35 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/display: Use int for signed error code checks in
 commit planes
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20190502130317.5506-1-nicholas.kazlauskas@amd.com>
 <b70af187-37f7-4f19-16c2-61839968d8e8@gmail.com>
Message-ID: <abe0ec29-ca85-2170-4d06-c7b7f767d4e9@gmail.com>
Date: Thu, 2 May 2019 15:09:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b70af187-37f7-4f19-16c2-61839968d8e8@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=EYX9mwy0GJAVDlhNZXcmAoE3js0m3EbkTPnqefBrF5g=;
 b=pvmrS7I2ylRBK4I3mWG0xNyiZ7GpEiIxPRJOk4tT1glNHCjeHpuA17Ha9Hiy3DfOeO
 vKK8KB4Fw3zgW5vtVr7eUYz4ENKrikeJzpShZFKUqIkHIcuUlNObQR+yB0Y4DCciRTS2
 ITtS1dLSlzPxWqG41wXjiKBy2XD9xP3EH1s3dQxhZ7D51Q3WaUQR7aWSJ4t5GBbPZDxa
 QyF/odbocBwD8Oh+8TegalBGz0mETKnudAOSG1k7ez30uNvNF9QpjlQ5fsJimAtlqgmj
 NFoeHqn5R9B0U9kIvBzYD5s9r+Y3e174pDQsTEpQcpbAEvuEZ3tm0bwr3mKdLaxOwqVJ
 ucmA==
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

QW0gMDIuMDUuMTkgdW0gMTU6MDggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDAyLjA1
LjE5IHVtIDE1OjAzIHNjaHJpZWIgTmljaG9sYXMgS2F6bGF1c2thczoKPj4gW1doeV0KPj4KPj4g
VGhlIHR5cGUgb2YgJ3InIGlzIHVpbnQzMl90IGFuZCB0aGUgcmV0dXJuIGNvZGVzIGZvciBib3Ro
Ogo+Pgo+PiAtIHJlc2VydmF0aW9uX29iamVjdF93YWl0X3RpbWVvdXRfcmN1Cj4+IC0gYW1kZ3B1
X2JvX3Jlc2VydmUKPj4KPj4gLi4uYXJlIHNpZ25lZC4gV2hpbGUgaXQgd29ya3MgZm9yIHRoZSBs
YXR0ZXIgc2luY2UgdGhlIGNoZWNrIGlzCj4+IGRvbmUgb24gIT0gMCBpdCBkb2Vzbid0IHdvcmsg
Zm9yIHRoZSBmb3JtZXIgc2luY2Ugd2UgY2hlY2sgPD0gMC4KPj4KPj4gW0hvd10KPj4KPj4gTWFr
ZSAncicgYW4gaW50IGluIGNvbW1pdCBwbGFuZXMgc28gd2UncmUgbm90IGRvaW5nIGFueSB1bnNp
Z25lZC9zaWduZWQKPj4gY29udmVyc2lvbiBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4KPj4g
UmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0Bh
bWQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KCk9oLCB3YWl0IGEgc2Vjb25kLiBTaG91bGRuJ3QgdGhpcyBldmVuIGJlIGEg
bG9uZyBpbnN0ZWFkIG9mIGFuIGludD8KCkNocmlzdGlhbi4KCj4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA0ICsrLS0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+PiBpbmRleCBiZWNkOGNiM2FhYjYuLjcyMmY4NjNjZTRhNCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+IEBA
IC01MzMyLDcgKzUzMzIsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5lcyhz
dHJ1Y3QgCj4+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9jcnRjICpwY3J0YywKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgd2FpdF9mb3JfdmJsYW5r
KQo+PiDCoCB7Cj4+IC3CoMKgwqAgdWludDMyX3QgaSwgcjsKPj4gK8KgwqDCoCB1aW50MzJfdCBp
Owo+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IHRpbWVzdGFtcF9uczsKPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZTsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
ICpvbGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7Cj4+IEBAIC01MzQyLDcgKzUzNDIs
NyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5lcyhzdHJ1Y3QgCj4+IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlLAo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkbV9jcnRjX3N0YXRlICph
Y3J0Y19zdGF0ZSA9IAo+PiB0b19kbV9jcnRjX3N0YXRlKG5ld19wY3J0Y19zdGF0ZSk7Cj4+IMKg
wqDCoMKgwqAgc3RydWN0IGRtX2NydGNfc3RhdGUgKmRtX29sZF9jcnRjX3N0YXRlID0KPj4gdG9f
ZG1fY3J0Y19zdGF0ZShkcm1fYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgcGNydGMp
KTsKPj4gLcKgwqDCoCBpbnQgcGxhbmVzX2NvdW50ID0gMCwgdnBvcywgaHBvczsKPj4gK8KgwqDC
oCBpbnQgciwgcGxhbmVzX2NvdW50ID0gMCwgdnBvcywgaHBvczsKPj4gwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIGZsYWdzOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKmFibzsKPj4g
wqDCoMKgwqDCoCB1aW50NjRfdCB0aWxpbmdfZmxhZ3M7Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
