Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DEC4906F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07206E06B;
	Mon, 17 Jun 2019 19:50:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25CB899E6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i34so7024407qta.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGDop3GexFwx87lDrYtKxxVrgJ7REqmWqgo+OPT7A/s=;
 b=qxnbWJ/IOacajSNcD8XXMdm/WtWpKXVJR9SjxAVkomc+IevlM4Xf+F55HUg20iAgcN
 wRuHxttPYmZYn5nOnGmBMAZyxp1JxH8XVOs8DmuUWlN1dA2nOAeP948QFqt0a3h6OZiP
 uVXyLJASitMSQR1EbpyMs4G6Fhwwai/5X7tdzx8AzmGyRdTkR6wkK8cnwbOcKBJkIl5H
 GrhoXPxbJNg/tjuV13ucHFxmI1ZjkurVqwz+IJCNLLR4+03k3rCm87V4mgD4hGYFCLOw
 zUnSgQFG0Lnq72HV2Ne7cEzTAVtivtpuFVGvk/W0yHYNAyONehyFLy8u/spmNwjjEhSh
 n7nA==
X-Gm-Message-State: APjAAAXe/PHKqBSgE/PiH5XY3kQjO/udnu3DEN+dBCecYJV9MqcbIgpG
 4XBI4Y4R1jnhKyEvS2vJjKOehEVZi8OOmw==
X-Google-Smtp-Source: APXvYqwfpkejQ4eyPugZLf3MGnsA394I/kqedlFtCTw0jIfWKUlNyIlen2HUPH7yN4L0leGP/b3sIA==
X-Received: by 2002:a0c:81e7:: with SMTP id 36mr23214378qve.5.1560801030489;
 Mon, 17 Jun 2019 12:50:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 434/459] drm/amd/display: Enable DSC power-gating for DSC
 streams
Date: Mon, 17 Jun 2019 14:49:23 -0500
Message-Id: <20190617194948.18667-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGDop3GexFwx87lDrYtKxxVrgJ7REqmWqgo+OPT7A/s=;
 b=tPybqYc/VmsEa/TL/5HoUxwpYyXMYRxuAWdMc24U2feLtBhp7My5jfetxc6U1CVFts
 tIaUfqagC9FwNjRSo6Zmb9yu1tYVp6xjhoKo+zwJ+Mrci2OXVF7rNJ+Z7mNDg1o9A++9
 kr6NgnmjljoCs8QkEW8WN9+PNwL3CT2aCwhQyIOjLdQ//skwi0oubAlWapBqNiU9sB43
 d9gKi1BgTTuFIHVZJdfZWv6W03ddH06rY/JVn0cnW5MDgX/WwagpYn+qeCC+nWdy/VU5
 CRW31MCJRM8hfCorhsF4+WD3lQqtB4/2lCO9HJuZi1QttqxuKSKkGLwjW29DBYHAXWRO
 xpNw==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <Martin.Leung@amd.com>, Nevenko Stupar <Nevenko.Stupar@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KQ3VycmVu
dGx5IERTQyBwb3dlciBnYXRpbmcgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBiZWNhdXNlIHRoZSBw
b3dlcgp0cmFuc2l0aW9uIGRvZXNuJ3QgaGFwcGVuLCBjYXVzaW5nIGEgY3Jhc2ggb24gc29tZSBz
eXN0ZW1zCgpbaG93XQpGaXggdGhlIGxhY2sgb2YgcG93ZXIgc3RhdGUgdHJhbnNpdGlvbiBhbmQg
ZW5hYmxlIERTQyBwb3dlciBnYXRpbmcKYnkgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IE5pa29s
YSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBMZXVu
ZyA8TWFydGluLkxldW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBOZXZlbmtvIFN0dXBhciA8TmV2
ZW5rby5TdHVwYXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMg
ICAgfCA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfcmVzb3VyY2UuYyB8IDMgLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9od3NlcS5jCmluZGV4IGY3ODhhMzlhMWRmMS4uOTE0MDcxMzkzZDFjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YwpAQCAtMjIyLDYgKzIyMiw3IEBAIHN0YXRpYyB2b2lkIGRjbjIwX2RzY19wZ19jb250cm9sKAog
ewogCXVpbnQzMl90IHBvd2VyX2dhdGUgPSBwb3dlcl9vbiA/IDAgOiAxOwogCXVpbnQzMl90IHB3
cl9zdGF0dXMgPSBwb3dlcl9vbiA/IDAgOiAyOworCXVpbnQzMl90IG9yZ19pcF9yZXF1ZXN0X2Nu
dGwgPSAwOwogCiAJaWYgKGh3cy0+Y3R4LT5kYy0+ZGVidWcuZGlzYWJsZV9kc2NfcG93ZXJfZ2F0
ZSkKIAkJcmV0dXJuOwpAQCAtMjI5LDYgKzIzMCwxMCBAQCBzdGF0aWMgdm9pZCBkY24yMF9kc2Nf
cGdfY29udHJvbCgKIAlpZiAoUkVHKERPTUFJTjE2X1BHX0NPTkZJRykgPT0gMCkKIAkJcmV0dXJu
OwogCisJUkVHX0dFVChEQ19JUF9SRVFVRVNUX0NOVEwsIElQX1JFUVVFU1RfRU4sICZvcmdfaXBf
cmVxdWVzdF9jbnRsKTsKKwlpZiAob3JnX2lwX3JlcXVlc3RfY250bCA9PSAwKQorCQlSRUdfU0VU
KERDX0lQX1JFUVVFU1RfQ05UTCwgMCwgSVBfUkVRVUVTVF9FTiwgMSk7CisKIAlzd2l0Y2ggKGRz
Y19pbnN0KSB7CiAJY2FzZSAwOiAvKiBEU0MwICovCiAJCVJFR19VUERBVEUoRE9NQUlOMTZfUEdf
Q09ORklHLApAQCAtMjgyLDYgKzI4Nyw5IEBAIHN0YXRpYyB2b2lkIGRjbjIwX2RzY19wZ19jb250
cm9sKAogCQlCUkVBS19UT19ERUJVR0dFUigpOwogCQlicmVhazsKIAl9CisKKwlpZiAob3JnX2lw
X3JlcXVlc3RfY250bCA9PSAwKQorCQlSRUdfU0VUKERDX0lQX1JFUVVFU1RfQ05UTCwgMCwgSVBf
UkVRVUVTVF9FTiwgMCk7CiB9CiAjZW5kaWYKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBmMmMyY2JmNDExNGIu
LmQ3MjZmMzZjNWUzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTcyNCw5ICs3MjQsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRjX2RlYnVnX29wdGlvbnMgZGVidWdfZGVmYXVsdHNfZGlhZ3MgPSB7CiAJCS5k
aXNhYmxlX3BwbGliX3dtX3JhbmdlID0gdHJ1ZSwKIAkJLmRpc2FibGVfc3R1dHRlciA9IHRydWUs
CiAJCS5zY2xfcmVzZXRfbGVuZ3RoMTAgPSB0cnVlLAotI2lmZGVmIENPTkZJR19EUk1fQU1EX0RD
X0RTQ19TVVBQT1JUCi0JCS5kaXNhYmxlX2RzY19wb3dlcl9nYXRlID0gdHJ1ZSwKLSNlbmRpZgog
fTsKIAogdm9pZCBkY24yMF9kcHBfZGVzdHJveShzdHJ1Y3QgZHBwICoqZHBwKQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
