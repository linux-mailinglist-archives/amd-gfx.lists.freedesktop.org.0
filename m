Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E01760D9
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 18:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C936E042;
	Mon,  2 Mar 2020 17:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AB56E042
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 17:16:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c24so90070wml.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 09:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NDxRevsMcFdjVJ5sIEqx0/O+/yt3D7MERxB7JnsyD+c=;
 b=rfjrEDK92c8RW3zZVcfWAxX4qWVo8186QuQnQVJNiToc52oPHQFPIifTxhGs8s+ddc
 26nAbtGaYnVrx5HVUJklJ875Wf3msjUgH1vpnT6CCPJvDHFfBABasEf7efcVU3nvlU0J
 omIbJdcXpeQzWU7QIqBYBJawVAjQYkqFF1CzD3J/7WAU2O5KMUPl/jx2/dU6+loO8V90
 3Gcbgn3Y5VIDkNK5KmEP5NRbOG+11QX/kPXN+ERiVd6QYRlXnw2Z38cqwAN8jwMbOPOF
 02ADhcTGVNQ1LNujPBtCai+5aulx2dVslT6NhEPUJurapbfz9XZ6l6aeg8yvVJQI+NIy
 xz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NDxRevsMcFdjVJ5sIEqx0/O+/yt3D7MERxB7JnsyD+c=;
 b=dBwCuuDHppKlTCNCXBw2gw09OXOyof04uol4SDWiYHBBu2LQbslIyr1Sxv9Oa3XWi7
 VB/NqkteMDYPmcYurrMpTfAuDSLxejxX0ItTg410RtzeH1OjOHHPqdJ5eXyJxt0n9TqN
 ZvwrhQu4Sxpz4jFn3fa3aYlJPV6SHXdUueEUXWyreKAqWTK7uAx6czxbeepirMvocOnf
 kQYHLWj/wtRePUz13hiUSLSwhy9ShfNms3kZHrX86z5CIKLBitazZ8VySASbawOgltnt
 f3QFDQrUe731ZLrVxVQSt5uFme/K8zytUJv6LcfDBbIdwBaj1QAe1jjGXZ4m+8Qt33Qn
 19jA==
X-Gm-Message-State: ANhLgQ0mz6XwoWXoqxkundD10SO0nebAr38dGjUk/fHXT9l4moW68LVA
 ocyIvGA0q1TNjvj/TiJQb+A=
X-Google-Smtp-Source: ADFU+vu6GEc84nhm4aJn0KXoOD2pbPfsIKiNQbXno+nItl5ufdHU5gI34JBtRY2WcJBDuIu0x0c11g==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr101300wmj.25.1583169400499;
 Mon, 02 Mar 2020 09:16:40 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z10sm48765wmk.31.2020.03.02.09.16.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 09:16:39 -0800 (PST)
Subject: Re: [PATCH v5 1/4] drm/amdgpu: set compute queue priority at mqd_init
To: Nirmoy <nirmodas@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20200302125836.56915-1-nirmoy.das@amd.com>
 <10f79f2c-4baf-e004-d75b-68836ea2e5bc@amd.com>
 <e98f6ea5-bb79-3c8a-354a-33e1b7a53e4b@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <97941567-fa4f-747e-44a8-7d61257ee354@gmail.com>
Date: Mon, 2 Mar 2020 18:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e98f6ea5-bb79-3c8a-354a-33e1b7a53e4b@amd.com>
Content-Language: en-US
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDIuMDMuMjAgdW0gMTU6MjAgc2NocmllYiBOaXJtb3k6Cj4gSGkgQ2hyaXN0aWFuCj4KPiBP
biAzLzIvMjAgMjoxMCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4KPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCAKPj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAo+Pj4gaW5kZXggMjRjYWZm
MDg1ZDAwLi4yMDFjNmFjN2JmOWQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmluZy5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmluZy5oCj4+PiBAQCAtMjIyLDYgKzIyMiw3IEBAIHN0cnVjdCBhbWRncHVfcmlu
ZyB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBtdXRleMKgwqDCoMKgwqDCoMKgIHByaW9yaXR5X211
dGV4Owo+Pj4gwqDCoMKgwqDCoCAvKiBwcm90ZWN0ZWQgYnkgcHJpb3JpdHlfbXV0ZXggKi8KPj4+
IMKgwqDCoMKgwqAgaW50wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmlvcml0eTsKPj4+ICvCoMKg
wqAgYm9vbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2Z4X3BpcGVfcHJpb3JpdHk7Cj4+Cj4+IERp
ZG4ndCB5b3Ugd2FudGVkIHRvIG1ha2UgdGhpcyBhbiBlbnVtPyBPciB3YXMgdGhhdCBhbm90aGVy
IGZpZWxkLgo+Cj4gU2hhbGwgSSBtb3ZlIGdmeF9waXBlX3ByaW9yaXR5IHRvIGFtZGdwdV9yaW5n
LmjCoCBmcm9tIGFtZGdwdV9nZnguaAo+Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3JpbmcuaAo+IEBAIC0zNSw2ICszNSwxMyBAQAo+IMKgI2RlZmluZSBBTURHUFVf
TUFYX1ZDRV9SSU5HU8KgwqDCoMKgwqDCoMKgwqDCoMKgIDMKPiDCoCNkZWZpbmUgQU1ER1BVX01B
WF9VVkRfRU5DX1JJTkdTwqDCoMKgwqDCoMKgIDIKPgo+ICsvKiBnZnggcmluZydzIHBpcGUgcHJp
b3JpdHkgKi8KPiArZW51bSBnZnhfcGlwZV9wcmlvcml0eSB7Cj4gK8KgwqDCoMKgwqDCoCBBTURH
UFVfR0ZYX1BJUEVfUFJJT19OT1JNQUwgPSAxLAo+ICvCoMKgwqDCoMKgwqAgQU1ER1BVX0dGWF9Q
SVBFX1BSSU9fSElHSCwKPiArwqDCoMKgwqDCoMKgIEFNREdQVV9HRlhfUElQRV9QUklPX01BWAo+
ICt9Owo+Cj4gb3IgZWxzZQo+Cj4gQEAgLTIyMiw3ICsyMjksOCBAQCBzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgewo+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtdXRleMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cHJpb3JpdHlfbXV0ZXg7Cj4gwqDCoMKgwqDCoMKgwqAgLyogcHJvdGVjdGVkIGJ5IHByaW9yaXR5
X211dGV4ICovCj4gwqDCoMKgwqDCoMKgwqAgaW50wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwcmlvcml0eTsKPiAtwqDCoMKgwqDCoMKgIGJvb2zCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZnhfcGlwZV9wcmlvcml0eTsKPiArCj4gK8KgwqDC
oMKgwqDCoCBlbnVtIGdmeF9waXBlX3ByaW9yaXR5wqAgcGlwZV9wcmlvcml0eTsKPgo+IGRvZXNu
J3Qgd29yayBiZWNhdXNlIG9mIGNvbXBpbGF0aW9uIGVycm9yOiAiIGZpZWxkIOKAmHBpcGVfcHJp
b3JpdHnigJkgaGFzIAo+IGluY29tcGxldGUgdHlwZSIKCk1obSwgbGV0IG1lIGFzayBmcm9tIHRo
ZSBvdGhlciBkaXJlY3Rpb246IFdoYXQgaXMgdGhhdCBnb29kIGZvciBpbiB0aGUgCmZpcnN0IHBs
YWNlPwoKQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGlzIGlzIGp1c3QgdG8gY29tbXVuaWNhdGUgdG8g
dGhlIGN0eCBoYW5kbGluZyB3aGF0IApwcmlvcml0eSBhIGh3IHJpbmcgaGFzLCByaWdodD8KCkJ1
dCB3aGF0IHdlIGFjdHVhbGx5IG5lZWQgaW4gdGhlIGN0eCBoYW5kbGluZyBpcyBhbiBhcnJheSBv
ZiByaW5nIHdpdGggCm5vcm1hbCBhbmQgaGlnaCBwcmlvcnR5LiBTbyB3aHkgZG9uJ3Qgd2UgY3Jl
YXRlIHRoYXQgaW4gdGhlIGZpcnN0IHBsYWNlPwoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFJl
Z2FyZHMsCj4KPiBOaXJtb3kKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
