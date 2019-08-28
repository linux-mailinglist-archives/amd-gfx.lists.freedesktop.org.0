Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766BA0AE9
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A1589F38;
	Wed, 28 Aug 2019 19:57:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F4889EF7
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:55 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id p13so830721qkg.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2kIb1JLbUPO3u7V1QYmrgkKPWcqoAQwf1em8+0ku08=;
 b=r2FbsojLzsOo9E7D56p1N+Eo7D3ovhZZBOz51YoC+P4D7EpZYTphfYP+irWMVQM/yP
 CnNqxmU8xsshOX9PgdDWZ1pvwQApoNTNGWRcM/DWdEWi3L+l4U5QycAQ2pmlG6w3hg92
 rsjX7ELi3oX4Q5V0UfpGgMMz60/a53DatXRjIHWjTP9n1X3a3VOHUFDpZ2aU9Mmb9fpD
 QMm97hzA9/KRxDXBhS1i4SX1jQM/WSp4y3TaKzDyeKz0WBB2tpSgigggiUwJyWSsyKL2
 AxWKQpqTGKpipCqXqEPrTN4Dln70xlpZc6zPVivza0mHbr3UfDv4BIXCixM/Mq5AKG07
 HAdw==
X-Gm-Message-State: APjAAAWumUsJny3HzAjXaxR57uaDXw664iYnf1/6Rxkzv75hznSt9oso
 U1eG9npERaqc8ikqzKFJ7d4Hssqf
X-Google-Smtp-Source: APXvYqywYhWI+K9ueU3DI3baeovTBWu1tAodWkDtlVK+Bj2ajN66R2VXn04+cRMxAbmjWdcOLYEfYw==
X-Received: by 2002:a05:620a:16c3:: with SMTP id
 a3mr5566981qkn.315.1567022214267; 
 Wed, 28 Aug 2019 12:56:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/23] drm/amd/display: Add DCN2.1 changes to DML
Date: Wed, 28 Aug 2019 14:56:21 -0500
Message-Id: <20190828195622.28941-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2kIb1JLbUPO3u7V1QYmrgkKPWcqoAQwf1em8+0ku08=;
 b=qeVIdWKLH9AmJh80/jPwXXbVgJMYTTj8rBh4bpwbq1fpGT+bEMaMXNgUdTPTfwVg2+
 n7zMgqlwASxUpv8KG63IYOk2waxoeO4Rb+GmtW9Mj+mN6lKg/rONgQOPvNU/sL7zreRy
 2gJaRVZU5E1W9SURp9ovN4Q0s6REMvQY8gOFztDxF2S4OhM4m9M8OOu655EmqsnTFcy3
 vjmAAn0zI8Z9OFICeaqwWTN9napfRPOcqyueMD3M4W6DnFo9jZxF/G5RWo9m1y1xVx1d
 BHpFOfeQssaISUvjNpgq/hxIehEPpyXjbo+PEUbwo5rHM1ICpyag8NzAb29puPZg6ddN
 HQow==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpIb29rIHVwIHRoZSBETUwgY2hhbmdl
cyBmb3IgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2VmaWxlICAgfCAgNCAr
KysrCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfbGliLmMgfCAxOSAr
KysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2VmaWxlIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmlsZQppbmRleCBiMjY3YzBm
YzY0ZTcuLmFmMmE4NjRhNmRhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RtbC9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZG1sL01ha2VmaWxlCkBAIC02Myw2ICs2MywxMCBAQCBpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19E
Q04yXzAKIERNTCArPSBkaXNwbGF5X21vZGVfdmJhLm8gZGNuMjAvZGlzcGxheV9ycV9kbGdfY2Fs
Y18yMC5vIGRjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjAubwogRE1MICs9IGRjbjIwL2Rpc3BsYXlf
cnFfZGxnX2NhbGNfMjB2Mi5vIGRjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5vCiBlbmRpZgor
aWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8xCitETUwgKz0gZGNuMjEvZGlzcGxheV9ycV9k
bGdfY2FsY18yMS5vIGRjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEubworZW5kaWYKKwogCiBBTURf
REFMX0RNTCA9ICQoYWRkcHJlZml4ICQoQU1EREFMUEFUSCkvZGMvZG1sLywkKERNTCkpCiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2Rl
X2xpYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVf
bGliLmMKaW5kZXggOTZkZmNkOGMzNmJjLi43MDRlZmVmZGNiYTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX2xpYi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX2xpYi5jCkBAIC0z
MSw2ICszMSwxMCBAQAogI2luY2x1ZGUgImRjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5oIgog
I2luY2x1ZGUgImRjbjIwL2Rpc3BsYXlfcnFfZGxnX2NhbGNfMjB2Mi5oIgogI2VuZGlmCisjaWZk
ZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8xCisjaW5jbHVkZSAiZGNuMjEvZGlzcGxheV9tb2Rl
X3ZiYV8yMS5oIgorI2luY2x1ZGUgImRjbjIxL2Rpc3BsYXlfcnFfZGxnX2NhbGNfMjEuaCIKKyNl
bmRpZgogCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzApCiBjb25zdCBzdHJ1
Y3QgZG1sX2Z1bmNzIGRtbDIwX2Z1bmNzID0gewpAQCAtNDgsNiArNTIsMTUgQEAgY29uc3Qgc3Ry
dWN0IGRtbF9mdW5jcyBkbWwyMHYyX2Z1bmNzID0gewogfTsKICNlbmRpZgogCisjaWZkZWYgQ09O
RklHX0RSTV9BTURfRENfRENOMl8xCitjb25zdCBzdHJ1Y3QgZG1sX2Z1bmNzIGRtbDIxX2Z1bmNz
ID0geworICAgICAgICAudmFsaWRhdGUgPSBkbWwyMV9Nb2RlU3VwcG9ydEFuZFN5c3RlbUNvbmZp
Z3VyYXRpb25GdWxsLAorICAgICAgICAucmVjYWxjdWxhdGUgPSBkbWwyMV9yZWNhbGN1bGF0ZSwK
KyAgICAgICAgLnJxX2RsZ19nZXRfZGxnX3JlZyA9IGRtbDIxX3JxX2RsZ19nZXRfZGxnX3JlZywK
KyAgICAgICAgLnJxX2RsZ19nZXRfcnFfcmVnID0gZG1sMjFfcnFfZGxnX2dldF9ycV9yZWcKK307
CisjZW5kaWYKKwogdm9pZCBkbWxfaW5pdF9pbnN0YW5jZShzdHJ1Y3QgZGlzcGxheV9tb2RlX2xp
YiAqbGliLAogCQljb25zdCBzdHJ1Y3QgX3Zjc19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCAqc29j
X2JiLAogCQljb25zdCBzdHJ1Y3QgX3Zjc19kcGlfaXBfcGFyYW1zX3N0ICppcF9wYXJhbXMsCkBA
IC02NSw2ICs3OCwxMiBAQCB2b2lkIGRtbF9pbml0X2luc3RhbmNlKHN0cnVjdCBkaXNwbGF5X21v
ZGVfbGliICpsaWIsCiAJCWxpYi0+ZnVuY3MgPSBkbWwyMHYyX2Z1bmNzOwogCQlicmVhazsKICNl
bmRpZgorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMQorICAgICAgICBjYXNlIERNTF9Q
Uk9KRUNUX0RDTjIxOgorICAgICAgICAgICAgICAgIGxpYi0+ZnVuY3MgPSBkbWwyMV9mdW5jczsK
KyAgICAgICAgICAgICAgICBicmVhazsKKyNlbmRpZgorCiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJ
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
