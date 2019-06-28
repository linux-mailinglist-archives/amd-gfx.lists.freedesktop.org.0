Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F324359A6A
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 14:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891306E90B;
	Fri, 28 Jun 2019 12:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39F76E90A
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 12:18:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p13so6045629wru.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 05:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vf+Nwm1yuvpI8PwHbHUiLtKmam7sHZlBZ3H2MAn1NgQ=;
 b=chuqSVboLjPXtot5/9j1Np47lOu9/pkmUXlHg69pqXhRs+EL4oLZ7fNpD8yWIIR0lU
 56do7QJeHB3LV7G7Mu/80wf5NoaL3aZcFMN8W1XLTQlVBPRLS2cnXGyuZIGxkVQdD28N
 A2DBdMITONU1BhwSM7mb/RpzBK4g6n+sRfenlw247hrIecWUd6TC1KmR08muCgxahTK7
 U0cVI1ET853lx9qrK9zx+ZP4OIQYAkflzqPfGNY57Ddxt2bAPnNl14fzQ/exM6/jaUaR
 VhOzJVNBqaQva7+n7JV2WsjDNU2Nyt23AowEGdbFr2N5s0tos6XaLDxc1cQzG1iQfDJh
 I5rg==
X-Gm-Message-State: APjAAAVZTMcLiFydRAmLjUF0RpLWgvkYdaYONAqH95pMFzDRRTzGGAUI
 0Nt8UJDaFIYnmgRdIM6xHW0ZfyFw
X-Google-Smtp-Source: APXvYqwxNTkEQjr5gB5JM1qawpKhyCd2mQ0ZO7ktnCenJsnZssQxyHaIBzmrI1joANd/CertPwQK5Q==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr8183612wrs.152.1561724295353; 
 Fri, 28 Jun 2019 05:18:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6946:7a72:691a:cf7d])
 by smtp.gmail.com with ESMTPSA id a64sm7236740wmf.1.2019.06.28.05.18.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 05:18:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/amdgpu: allow direct submission in the VM backends
Date: Fri, 28 Jun 2019 14:18:08 +0200
Message-Id: <20190628121812.1400-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vf+Nwm1yuvpI8PwHbHUiLtKmam7sHZlBZ3H2MAn1NgQ=;
 b=A+j7FPaSmaofCkhlleByribyZt2ZaeDEqFL1BzcnIIJuWJmMCK21AQ4jfDhrvMELDa
 WKzGvTT4aQlZ8fjFsEvtKzSXEffZBim5mUnN5zuZT/5LpoxX46D92nNcM41z6aWfIWM/
 dNG+HpOwPqJsPfeH5y3UOatC4VSUHTD+DdTSumDt31q0jsbGM16PBZuC+JYSShYih2o1
 FNzSpfoo1zPWJIRJr0YdUVYParhTI58m3p212PYktdQR3dP5Kc05NfsL6DUYgppFrRav
 WESoZ5cImoO/lSem5hfnoWnYhvEN6ZX9IpJDTouTrAaaHOx7vcMbRHyQedFt4F0pL0ig
 QQuA==
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
Cc: Felix.Kuehling@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgdXMgdG8gdXBkYXRlIHBhZ2UgdGFibGVzIGRpcmVjdGx5IHdoaWxlIGluIGEg
cGFnZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
aCAgICAgIHwgIDUgKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2Nw
dS5jICB8ICA0ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEu
YyB8IDI5ICsrKysrKysrKysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5oCmluZGV4IDQ4OWExNjJjYTYyMC4uNTk0MWFjY2VhMDYxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uaApAQCAtMTk3LDYgKzE5NywxMSBAQCBzdHJ1Y3QgYW1kZ3B1X3Zt
X3VwZGF0ZV9wYXJhbXMgewogCSAqLwogCXN0cnVjdCBhbWRncHVfdm0gKnZtOwogCisJLyoqCisJ
ICogQGRpcmVjdDogaWYgY2hhbmdlcyBzaG91bGQgYmUgbWFkZSBkaXJlY3RseQorCSAqLworCWJv
b2wgZGlyZWN0OworCiAJLyoqCiAJICogQHBhZ2VzX2FkZHI6CiAJICoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYwppbmRleCA1MjIyZDE2NWFiZmMuLmY5NGU0ODk2
MDc5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2Nw
dS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYwpAQCAt
NDksNiArNDksMTAgQEAgc3RhdGljIGludCBhbWRncHVfdm1fY3B1X3ByZXBhcmUoc3RydWN0IGFt
ZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLCB2b2lkICpvd25lciwKIHsKIAlpbnQgcjsKIAorCS8q
IERvbid0IHdhaXQgZm9yIGFueXRoaW5nIGR1cmluZyBwYWdlIGZhdWx0ICovCisJaWYgKHAtPmRp
cmVjdCkKKwkJcmV0dXJuIDA7CisKIAkvKiBXYWl0IGZvciBQVCBCT3MgdG8gYmUgaWRsZS4gUFRz
IHNoYXJlIHRoZSBzYW1lIHJlc3YuIG9iamVjdAogCSAqIGFzIHRoZSByb290IFBEIEJPCiAJICov
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYwppbmRleCBkZGQx
ODFmNWVkMzcuLjg5MWQ1OTcwNjNjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtX3NkbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm1fc2RtYS5jCkBAIC02OCwxNyArNjgsMTcgQEAgc3RhdGljIGludCBhbWRncHVfdm1f
c2RtYV9wcmVwYXJlKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwKIAlpZiAocikK
IAkJcmV0dXJuIHI7CiAKLQlyID0gYW1kZ3B1X3N5bmNfZmVuY2UocC0+YWRldiwgJnAtPmpvYi0+
c3luYywgZXhjbHVzaXZlLCBmYWxzZSk7Ci0JaWYgKHIpCi0JCXJldHVybiByOworCXAtPm51bV9k
d19sZWZ0ID0gbmR3OworCisJaWYgKHAtPmRpcmVjdCkKKwkJcmV0dXJuIDA7CiAKLQlyID0gYW1k
Z3B1X3N5bmNfcmVzdihwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCByb290LT50Ym8ucmVzdiwKLQkJ
CSAgICAgb3duZXIsIGZhbHNlKTsKKwlyID0gYW1kZ3B1X3N5bmNfZmVuY2UocC0+YWRldiwgJnAt
PmpvYi0+c3luYywgZXhjbHVzaXZlLCBmYWxzZSk7CiAJaWYgKHIpCiAJCXJldHVybiByOwogCi0J
cC0+bnVtX2R3X2xlZnQgPSBuZHc7Ci0JcmV0dXJuIDA7CisJcmV0dXJuIGFtZGdwdV9zeW5jX3Jl
c3YocC0+YWRldiwgJnAtPmpvYi0+c3luYywgcm9vdC0+dGJvLnJlc3YsCisJCQkJb3duZXIsIGZh
bHNlKTsKIH0KIAogLyoqCkBAIC05OSwxMyArOTksMjEgQEAgc3RhdGljIGludCBhbWRncHVfdm1f
c2RtYV9jb21taXQoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLAogCXN0cnVjdCBk
bWFfZmVuY2UgKmY7CiAJaW50IHI7CiAKLQlyaW5nID0gY29udGFpbmVyX29mKHAtPnZtLT5lbnRp
dHkucnEtPnNjaGVkLCBzdHJ1Y3QgYW1kZ3B1X3JpbmcsIHNjaGVkKTsKKwlpZiAocC0+ZGlyZWN0
KQorCQlyaW5nID0gcC0+YWRldi0+dm1fbWFuYWdlci5wYWdlX2ZhdWx0OworCWVsc2UKKwkJcmlu
ZyA9IGNvbnRhaW5lcl9vZihwLT52bS0+ZW50aXR5LnJxLT5zY2hlZCwKKwkJCQkgICAgc3RydWN0
IGFtZGdwdV9yaW5nLCBzY2hlZCk7CiAKIAlXQVJOX09OKGliLT5sZW5ndGhfZHcgPT0gMCk7CiAJ
YW1kZ3B1X3JpbmdfcGFkX2liKHJpbmcsIGliKTsKIAlXQVJOX09OKGliLT5sZW5ndGhfZHcgPiBw
LT5udW1fZHdfbGVmdCk7Ci0JciA9IGFtZGdwdV9qb2Jfc3VibWl0KHAtPmpvYiwgJnAtPnZtLT5l
bnRpdHksCi0JCQkgICAgICBBTURHUFVfRkVOQ0VfT1dORVJfVk0sICZmKTsKKworCWlmIChwLT5k
aXJlY3QpCisJCXIgPSBhbWRncHVfam9iX3N1Ym1pdF9kaXJlY3QocC0+am9iLCByaW5nLCAmZik7
CisJZWxzZQorCQlyID0gYW1kZ3B1X2pvYl9zdWJtaXQocC0+am9iLCAmcC0+dm0tPmVudGl0eSwK
KwkJCQkgICAgICBBTURHUFVfRkVOQ0VfT1dORVJfVk0sICZmKTsKIAlpZiAocikKIAkJZ290byBl
cnJvcjsKIApAQCAtMTIwLDcgKzEyOCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3NkbWFfY29t
bWl0KHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwKIAlyZXR1cm4gcjsKIH0KIAot
CiAvKioKICAqIGFtZGdwdV92bV9zZG1hX2NvcHlfcHRlcyAtIGNvcHkgdGhlIFBURXMgZnJvbSBt
YXBwaW5nCiAgKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
