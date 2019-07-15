Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E369B6B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 21:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37589AA2;
	Mon, 15 Jul 2019 19:33:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B1589AA2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 19:33:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x1so3335841wrr.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 12:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Iw1+7nrVrLhs/qgvwguINbec7h3ThriRrLNTjM1wL3Q=;
 b=oTL0OPd1ZREfHL4H9nZ+rdshtb3vjOkmDI22r8bOkDxkU7roy0Ckg2HylDwKwouqTY
 U14Mwq5FPWt9MEVhuohZQuuZIMqnUSalxE11GeQbe71aA94z55H7qMyHJgyauJvPdJhq
 RK8akHgKrRoY/JRQHyEmONfeVOge+4PDUH70PS2iNqK4oexs1e15hVFgUoSIavsuJRpG
 y82D4VVT8+RxeIAVnDxO1qWTWVaeUkXN5rfXKPZZ8PaCUDsUyzHuYYpRlqnUk0RPidlr
 PzN7zWbZjKg+R9sEVOc5XDXl/KKJrfjd9p++8Cd2Cf9+vaLIvyAENyxDSnLyJM5rUnnh
 LT7w==
X-Gm-Message-State: APjAAAWQ5Gsksl71KZTD3uxjZ2bVVIS/WjpOKpackwdR4rIm70AGM7B5
 pRfgVNNHLYg+Uyw/fteWLrwjYbLy
X-Google-Smtp-Source: APXvYqylYoX+3kjXQFDQ60yuwFwApW0ETzZPgujuUcIYTNLloBeOcNu9cd1UWzAMAb761Iz8KYjATg==
X-Received: by 2002:adf:e444:: with SMTP id t4mr29028836wrm.262.1563219185103; 
 Mon, 15 Jul 2019 12:33:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c30sm27962497wrb.15.2019.07.15.12.33.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 12:33:04 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix unaligned memory copies
To: Alex Deucher <alexdeucher@gmail.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20190713064245.20097-1-Felix.Kuehling@amd.com>
 <CADnq5_OCXiEoPU5+K2-NQ+9zNMVRd2mMwY6NYeK6Jp0ssLcjtg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a9afb49b-32ce-6cf4-f984-0330db9187d3@gmail.com>
Date: Mon, 15 Jul 2019 21:33:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CADnq5_OCXiEoPU5+K2-NQ+9zNMVRd2mMwY6NYeK6Jp0ssLcjtg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Iw1+7nrVrLhs/qgvwguINbec7h3ThriRrLNTjM1wL3Q=;
 b=GdFbtCltqebzgAjf3dL9l0OzYMZ/2T3F+IWhG3rZXgZ1GoSV5WJKHEz9UN4VufTluT
 ICKV/5pfT/YoeyDGIATTSO8T0Wz1LHiDjFDMbSzaJn/6F6OC+hqDXdCxNV1fB2u1Xipb
 56yo21BaJlnjKtGmat7EfHovd9sek9/bISbQO2ynDOvD8QI6W+APH9k+gcmQ05Q0aXYw
 QA7vodmPjW3eU79iK9pA69HRfGkCrjACZECyNbZmtH/I133PV6jbW6A/718ig6i+SIWb
 PuyqZv2+rx/OoUYfHt9SpAkpZzyR8uaW3KBDwry+PJncXte9cd1kmnKgZusP25EF4u63
 oDAw==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTUuMDcuMTkgdW0gMTg6MTIgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gU2F0LCBKdWwg
MTMsIDIwMTkgYXQgMjo0MyBBTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+IHdyb3RlOgo+PiBXaGVuIHN0YXJ0aW5nIGEgbmV3IG1tX25vZGUsIHRoZSBwYWdlX29mZnNl
dCBiZWNvbWVzIDAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgoKPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgfCAyICsrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+IGluZGV4IDM3
ZDlhM2IwOTk0Ni4uZDBmNmMyM2VjN2NmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCj4+IEBAIC0zODYsNiArMzg2LDcgQEAgaW50IGFtZGdwdV90dG1fY29w
eV9tZW1fdG9fbWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3JjX25vZGVfc3RhcnQgPSBhbWRncHVfbW1fbm9kZV9hZGRyKHNyYy0+Ym8s
ICsrc3JjX21tLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNyYy0+bWVtKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IHNyY19ub2RlX3NpemUgPSAoc3JjX21tLT5zaXplIDw8IFBBR0VfU0hJRlQpOwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBzcmNfcGFnZV9vZmZzZXQgPSAwOwo+PiAgICAgICAgICAgICAgICAg
IH0gZWxzZSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBzcmNfbm9kZV9zdGFydCArPSBj
dXJfc2l6ZTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHNyY19wYWdlX29mZnNldCA9IHNy
Y19ub2RlX3N0YXJ0ICYgKFBBR0VfU0laRSAtIDEpOwo+PiBAQCAtMzk1LDYgKzM5Niw3IEBAIGlu
dCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21lbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIGRzdF9ub2RlX3N0YXJ0ID0gYW1kZ3B1X21tX25v
ZGVfYWRkcihkc3QtPmJvLCArK2RzdF9tbSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc3QtPm1lbSk7Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBkc3Rfbm9kZV9zaXplID0gKGRzdF9tbS0+c2l6ZSA8PCBQQUdFX1NI
SUZUKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHN0X3BhZ2Vfb2Zmc2V0ID0gMDsKPj4g
ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZHN0
X25vZGVfc3RhcnQgKz0gY3VyX3NpemU7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBkc3Rf
cGFnZV9vZmZzZXQgPSBkc3Rfbm9kZV9zdGFydCAmIChQQUdFX1NJWkUgLSAxKTsKPj4gLS0KPj4g
Mi4xNy4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
