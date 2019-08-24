Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6D9BD3C
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Aug 2019 13:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C5E6E0BC;
	Sat, 24 Aug 2019 11:12:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F66E0BC
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 11:12:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so10850236wru.13
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 04:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=r6g6qxtxrzTNrjw+kK4Exb/5+/vuXxwPbOV+phgIdbI=;
 b=j6aMV2QcAQ1KHE6ibrjWCFd5yV/NRkZfLE8SYHbk8PXGuGXlKRxBuWHidLzi+PpASU
 Hk/HHSHSpMco3bLfVZ4gh//8U4FroPfnswrKdA2KOa7qm3mZsR2LdHkrMs8Sdmb24L2X
 lAZzN0Mp98UrCoxZa5JREvikeVlqfEjmRo6acS6cflvaxi3fkP7b/A+zuOT1G/RN1a9z
 Dx4X9mJjn4mQxZiNYg6mHfrC5Nx63/+XQ6GtSNsM/xQ2NVujksbytP/lvymENps+IK5A
 NVLTYnKGsp3XAmcIn4t6SmqVJGQSSCcTgiOqjLW9g0CdCs6Dmy/9I4nFTvHz/q/9VkjV
 QfdA==
X-Gm-Message-State: APjAAAUYdp9ITH+ilQo0f1YJcAnbBuxKzgWXRRsMeCz52xkPzQgwCW0I
 f1YPslGgi+yVmaEG8f7dKv9Rq7LE
X-Google-Smtp-Source: APXvYqz4GHuPycW04Yi4VsX+1r0w4C2FvYsIE+nRRTMPC7HyG0WRlrgybl0+ulH29hrPIPg4pt6D4g==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr10195051wrs.108.1566645123441; 
 Sat, 24 Aug 2019 04:12:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a23sm11249715wma.24.2019.08.24.04.12.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2019 04:12:02 -0700 (PDT)
Subject: Re: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-2-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a3042a0c-7993-2659-3942-ad81df3e9146@gmail.com>
Date: Sat, 24 Aug 2019 13:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823213249.10749-2-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r6g6qxtxrzTNrjw+kK4Exb/5+/vuXxwPbOV+phgIdbI=;
 b=VYJXzUXcYy1tnJru7QczzWLqS1h52rAJN/ikwpM14unA/KB/uiIs572gvpmmOYNnAC
 RtHCtsM1q6cl57z27Q9L2517vxYDVJk8L5Mgh77adV93llCsVf0edFyUGpKkTECkBB0z
 kORN57wXABU0bUokAKWobVW1nO9NM1Hcf/6egB9VWJjwjrsR+f7/4htoHtHc/f5LZIXj
 ekZI83khsGS8fXUOrAG4fzUG63Fuacuyr/8AW/rrTPRYhp3glNyunXFxp7Cy3azMpL52
 ATX5fZk7FTsDbE8cY+76njpjwPCddFBPaDbllC0OIbCsMIqua128SsjZI0ePYz0OX6Ak
 EgNw==
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjMuMDguMTkgdW0gMjM6MzMgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gRnJvbTogT2Fr
IFplbmcgPE9hay5aZW5nQGFtZC5jb20+Cj4KPiBBZGQgZGVmaW5pdGlvbiBvZiBhbGwgc3VwcG9y
dGVkIG10eXBlcy4gVGhlIFJXIG10eXBlCj4gaXMgcmVjZW50bHkgaW50cm9kdWNlZCBmb3IgYXJj
dHVydXMuIEFsc28gYWRkIGRlZmluaXRpb24KPiBvZiBhIGZsYWcgdG8gcHJvYmUgYW5kIHBvc3Np
Ymx5IGludmFsaWRhdGUgcmVtb3RlIEdQVQo+IGNhY2hlLCB3aGljaCB3aWxsIGJlIHVzZWQgbGF0
ZXIgaW4gdGhpcyBzZXJpZXMuCgpNYXliZSBzZXBhcmF0ZSB0aGF0IGludG8gdHdvIHBhdGNoZXM/
CgpDaHJpc3RpYW4uCgo+Cj4gQ2hhbmdlLUlkOiBJOTZmYzliYjRiNmIxZTYyYmRjMTBiNjAwZDhh
YWE2YTgwMjEyOGQ2ZAo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggfCA5ICsr
KysrKystLQo+ICAgaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggICAgICAgICAgfCA0ICsr
KysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4gaW5kZXggMmVkYTNhOGMz
MzBkLi43YTc3NDc3YWY2YTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uaAo+IEBAIC04MCw4ICs4MCwxMyBAQCBzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnk7Cj4g
ICAjZGVmaW5lIEFNREdQVV9QVEVfTVRZUEVfVkcxMChhKQkoKHVpbnQ2NF90KShhKSA8PCA1NykK
PiAgICNkZWZpbmUgQU1ER1BVX1BURV9NVFlQRV9WRzEwX01BU0sJQU1ER1BVX1BURV9NVFlQRV9W
RzEwKDNVTEwpCj4gICAKPiAtI2RlZmluZSBBTURHUFVfTVRZUEVfTkMgMAo+IC0jZGVmaW5lIEFN
REdQVV9NVFlQRV9DQyAyCj4gK2VudW0gYW1kZ3B1X210eXBlIHsKPiArCUFNREdQVV9NVFlQRV9O
QyA9IDAsCj4gKwlBTURHUFVfTVRZUEVfV0MgPSAxLAo+ICsJQU1ER1BVX01UWVBFX0NDID0gMiwK
PiArCUFNREdQVV9NVFlQRV9VQyA9IDMsCj4gKwlBTURHUFVfTVRZUEVfUlcgPSA0LAo+ICt9Owo+
ICAgCj4gICAjZGVmaW5lIEFNREdQVV9QVEVfREVGQVVMVF9BVEMgIChBTURHUFVfUFRFX1NZU1RF
TSAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBBTURHUFVfUFRF
X1NOT09QRUQgICAgXAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0u
aCBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gaW5kZXggY2E5N2I2ODAyMjc1Li45
N2U4ZTUxZjc2YWEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgK
PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+IEBAIC01MDMsNiArNTAzLDEw
IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV9vcCB7Cj4gICAjZGVmaW5lIEFNREdQVV9WTV9NVFlQ
RV9DQwkJKDMgPDwgNSkKPiAgIC8qIFVzZSBVQyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZ
UEUgKi8KPiAgICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBFX1VDCQkoNCA8PCA1KQo+ICsvKiBVc2Ug
UlcgTVRZUEUgaW5zdGVhZCBvZiBkZWZhdWx0IE1UWVBFICovCj4gKyNkZWZpbmUgQU1ER1BVX1ZN
X01UWVBFX1JXCQkoNSA8PCA1KQo+ICsvKiBDYWNoZWFibGUvc25vb3BhYmxlICovCj4gKyNkZWZp
bmUgQU1ER1BVX1ZNX1BBR0VfSU5WQUxJREFURV9QUk9CRQkoMSA8PCA5KQo+ICAgCj4gICBzdHJ1
Y3QgZHJtX2FtZGdwdV9nZW1fdmEgewo+ICAgCS8qKiBHRU0gb2JqZWN0IGhhbmRsZSAqLwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
