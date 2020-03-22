Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BE18E9E2
	for <lists+amd-gfx@lfdr.de>; Sun, 22 Mar 2020 16:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D92D6E0CF;
	Sun, 22 Mar 2020 15:48:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607106E0CB
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2020 15:48:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m17so4576083wrw.11
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2020 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1L9gqluaxmiBilOa3Ah8IDOS3YEnvVjD69scSSVndLU=;
 b=gzP297lr/0BQJ5TlO4VTDBwDwtOwMtnLK3g5IqOpo2jzvX3fb6b8BMLO5htib00a0Z
 t31aoIx3RkF+VmH2wmHksn1rtSGbvWp51yyC1cNVS127WD2Wj4Ggw7JVpeNbt9ygEz3U
 rgeqbmJtRr78TMjvhz0kCJ9KItGDOVa5jEXGo9+0pVUuu7ZP2Ji231U8gG56KV7GZtX1
 K+Bh8yNY5I6Ct307fJrMeSXQLc1FTafc97azqjzdc7iOAle9Y7hc1JBqPwlC2TBMmNMk
 WtonE1EFg/HxjSSTeCSHjgMRl/q62EuOEshITFtu1vAHh1TSVXmakshP3hbPYEvX/ouA
 OaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1L9gqluaxmiBilOa3Ah8IDOS3YEnvVjD69scSSVndLU=;
 b=Q3NRroDEjcBm+OyKYvnNBhb9LuI3Z2fGEjgrzvtrQUISoYnbD9GPlwBl/0Z8yLICmy
 V9o/T5Wd1ZGiDmdBQt7ix0vFYp26/fx59sBcvz2HMHRgjwYvD4hgq0Cim9cCEFeAEouy
 Z3XPf8REmkTiQFp/ODJ3IRcoevbxG3tvVvb83ROuD2/moEy6ZCgdsXQlJYDEwNLN8VTU
 0RnkNgJx65QwxryYEd5NvVnkpa1M1eFIOOwSFZyXJ2j+y9KPPZAuzWjs6JuyyD8sNvVd
 bw487HdFMuBrN+ZUAU0hfSQjjkG+KNhZiVqSoNBULmDifXvuMq6O4utCtzIr54LQsH5g
 z7jA==
X-Gm-Message-State: ANhLgQ24ONzEW8gIVkC8wTidDnRbZucoZFdD3CtBIzJVIxqo77zEPQd0
 T1bCDdJpEG7k+MsHSsdzUO37IRdK
X-Google-Smtp-Source: ADFU+vvZvqUJqBD4FNi3R5JjAaXK3omSPe8XVN04mBjvJgtifWxwcaP+9+DnqCpa4rtoJicChWZ5wA==
X-Received: by 2002:a05:6000:370:: with SMTP id
 f16mr24901577wrf.9.1584892117325; 
 Sun, 22 Mar 2020 08:48:37 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:30b8:db04:7ef1:ff43])
 by smtp.gmail.com with ESMTPSA id i12sm19450368wro.46.2020.03.22.08.48.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Mar 2020 08:48:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	Felix.Kuehling@amd.com
Subject: [PATCH 1/2] drm/amdgpu: cleanup amdgpu_ttm_copy_mem_to_mem and
 amdgpu_map_buffer v2
Date: Sun, 22 Mar 2020 16:48:34 +0100
Message-Id: <20200322154835.2702-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2xlYW51cCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21lbSBieSB1c2luZyBmZXdlciB2YXJpYWJs
ZXMKZm9yIHRoZSBzYW1lIHZhbHVlLgoKUmVuYW1lIGFtZGdwdV9tYXBfYnVmZmVyIHRvIGFtZGdw
dV90dG1fbWFwX2J1ZmZlciwgbW92ZSBpdAp0byBhdm9pZCB0aGUgZm9yd2FyZCBkZWNsZXJhdGlv
biwgY2xlYW51cCBieSBtb3ZpbmcgdGhlIG1hcApkZWNpc3Npb24gaW50byB0aGUgZnVuY3Rpb24g
YW5kIGFkZCBzb21lIGRvY3VtZW50YXRpb24uCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KCnYyOiBh
ZGQgc29tZSBtb3JlIGNsZWFudXAgc3VnZ2VzdGVkIGJ5IEZlbGl4CgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMjY5ICsrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmggfCAg
IDQgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyksIDEzOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggNjY1ZGIyMzUz
YTc4Li41M2RlOTlkYmFlYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKQEAgLTYyLDEyICs2Miw2IEBACiAKICNkZWZpbmUgQU1ER1BVX1RUTV9WUkFNX01BWF9EV19S
RUFECShzaXplX3QpMTI4CiAKLXN0YXRpYyBpbnQgYW1kZ3B1X21hcF9idWZmZXIoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKLQkJCSAgICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0sIHVu
c2lnbmVkIG51bV9wYWdlcywKLQkJCSAgICAgdWludDY0X3Qgb2Zmc2V0LCB1bnNpZ25lZCB3aW5k
b3csCi0JCQkgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgYm9vbCB0bXosCi0JCQkgICAg
IHVpbnQ2NF90ICphZGRyKTsKLQogc3RhdGljIGludCBhbWRncHVfaW52YWxpZGF0ZV9jYWNoZXMo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IGZsYWdzKQogewogCXJldHVybiAw
OwpAQCAtMjgyLDcgKzI3Niw3IEBAIHN0YXRpYyB1aW50NjRfdCBhbWRncHVfbW1fbm9kZV9hZGRy
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAgKgogICovCiBzdGF0aWMgc3RydWN0IGRy
bV9tbV9ub2RlICphbWRncHVfZmluZF9tbV9ub2RlKHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtLAot
CQkJCQkgICAgICAgdW5zaWduZWQgbG9uZyAqb2Zmc2V0KQorCQkJCQkgICAgICAgdWludDY0X3Qg
Km9mZnNldCkKIHsKIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm1tX25vZGUgPSBtZW0tPm1tX25vZGU7
CiAKQEAgLTI5Myw2ICsyODcsOTQgQEAgc3RhdGljIHN0cnVjdCBkcm1fbW1fbm9kZSAqYW1kZ3B1
X2ZpbmRfbW1fbm9kZShzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSwKIAlyZXR1cm4gbW1fbm9kZTsK
IH0KIAorLyoqCisgKiBhbWRncHVfdHRtX21hcF9idWZmZXIgLSBNYXAgbWVtb3J5IGludG8gdGhl
IEdBUlQgd2luZG93cworICogQGJvOiBidWZmZXIgb2JqZWN0IHRvIG1hcAorICogQG1lbTogbWVt
b3J5IG9iamVjdCB0byBtYXAKKyAqIEBtbV9ub2RlOiBkcm1fbW0gbm9kZSBvYmplY3QgdG8gbWFw
CisgKiBAbnVtX3BhZ2VzOiBudW1iZXIgb2YgcGFnZXMgdG8gbWFwCisgKiBAb2Zmc2V0OiBvZmZz
ZXQgaW50byBAbW1fbm9kZSB3aGVyZSB0byBzdGFydAorICogQHdpbmRvdzogd2hpY2ggR0FSVCB3
aW5kb3cgdG8gdXNlCisgKiBAcmluZzogRE1BIHJpbmcgdG8gdXNlIGZvciB0aGUgY29weQorICog
QHRtejogaWYgd2Ugc2hvdWxkIHNldHVwIGEgVE1aIGVuYWJsZWQgbWFwcGluZworICogQGFkZHI6
IHJlc3VsdGluZyBhZGRyZXNzIGluc2lkZSB0aGUgTUMgYWRkcmVzcyBzcGFjZQorICoKKyAqIFNl
dHVwIG9uZSBvZiB0aGUgR0FSVCB3aW5kb3dzIHRvIGFjY2VzcyBhIHNwZWNpZmljIHBpZWNlIG9m
IG1lbW9yeSBvciByZXR1cm4KKyAqIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGZvciBsb2NhbCBtZW1v
cnkuCisgKi8KK3N0YXRpYyBpbnQgYW1kZ3B1X3R0bV9tYXBfYnVmZmVyKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCisJCQkJIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtLAorCQkJCSBzdHJ1
Y3QgZHJtX21tX25vZGUgKm1tX25vZGUsCisJCQkJIHVuc2lnbmVkIG51bV9wYWdlcywgdWludDY0
X3Qgb2Zmc2V0LAorCQkJCSB1bnNpZ25lZCB3aW5kb3csIHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywKKwkJCQkgYm9vbCB0bXosIHVpbnQ2NF90ICphZGRyKQoreworCXN0cnVjdCB0dG1fZG1hX3R0
ICpkbWEgPSBjb250YWluZXJfb2YoYm8tPnR0bSwgc3RydWN0IHR0bV9kbWFfdHQsIHR0bSk7CisJ
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2OworCXN0cnVjdCBhbWRncHVf
am9iICpqb2I7CisJdW5zaWduZWQgbnVtX2R3LCBudW1fYnl0ZXM7CisJZG1hX2FkZHJfdCAqZG1h
X2FkZHJlc3M7CisJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7CisJdWludDY0X3Qgc3JjX2FkZHIs
IGRzdF9hZGRyOworCXVpbnQ2NF90IGZsYWdzOworCWludCByOworCisJQlVHX09OKGFkZXYtPm1t
YW4uYnVmZmVyX2Z1bmNzLT5jb3B5X21heF9ieXRlcyA8CisJICAgICAgIEFNREdQVV9HVFRfTUFY
X1RSQU5TRkVSX1NJWkUgKiA4KTsKKworCS8qIE1hcCBvbmx5IHdoYXQgY2FuJ3QgYmUgYWNjZXNz
ZWQgZGlyZWN0bHkgKi8KKwlpZiAobWVtLT5zdGFydCAhPSBBTURHUFVfQk9fSU5WQUxJRF9PRkZT
RVQpIHsKKwkJKmFkZHIgPSBhbWRncHVfbW1fbm9kZV9hZGRyKGJvLCBtbV9ub2RlLCBtZW0pICsg
b2Zmc2V0OworCQlyZXR1cm4gMDsKKwl9CisKKwkqYWRkciA9IGFkZXYtPmdtYy5nYXJ0X3N0YXJ0
OworCSphZGRyICs9ICh1NjQpd2luZG93ICogQU1ER1BVX0dUVF9NQVhfVFJBTlNGRVJfU0laRSAq
CisJCUFNREdQVV9HUFVfUEFHRV9TSVpFOworCSphZGRyICs9IG9mZnNldCAmIH5QQUdFX01BU0s7
CisKKwludW1fZHcgPSBBTElHTihhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9udW1fZHcs
IDgpOworCW51bV9ieXRlcyA9IG51bV9wYWdlcyAqIDg7CisKKwlyID0gYW1kZ3B1X2pvYl9hbGxv
Y193aXRoX2liKGFkZXYsIG51bV9kdyAqIDQgKyBudW1fYnl0ZXMsICZqb2IpOworCWlmIChyKQor
CQlyZXR1cm4gcjsKKworCXNyY19hZGRyID0gbnVtX2R3ICogNDsKKwlzcmNfYWRkciArPSBqb2It
Pmlic1swXS5ncHVfYWRkcjsKKworCWRzdF9hZGRyID0gYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRl
di0+Z2FydC5ibyk7CisJZHN0X2FkZHIgKz0gd2luZG93ICogQU1ER1BVX0dUVF9NQVhfVFJBTlNG
RVJfU0laRSAqIDg7CisJYW1kZ3B1X2VtaXRfY29weV9idWZmZXIoYWRldiwgJmpvYi0+aWJzWzBd
LCBzcmNfYWRkciwKKwkJCQlkc3RfYWRkciwgbnVtX2J5dGVzLCBmYWxzZSk7CisKKwlhbWRncHVf
cmluZ19wYWRfaWIocmluZywgJmpvYi0+aWJzWzBdKTsKKwlXQVJOX09OKGpvYi0+aWJzWzBdLmxl
bmd0aF9kdyA+IG51bV9kdyk7CisKKwlkbWFfYWRkcmVzcyA9ICZkbWEtPmRtYV9hZGRyZXNzW29m
ZnNldCA+PiBQQUdFX1NISUZUXTsKKwlmbGFncyA9IGFtZGdwdV90dG1fdHRfcHRlX2ZsYWdzKGFk
ZXYsIGJvLT50dG0sIG1lbSk7CisJaWYgKHRteikKKwkJZmxhZ3MgfD0gQU1ER1BVX1BURV9UTVo7
CisKKwlyID0gYW1kZ3B1X2dhcnRfbWFwKGFkZXYsIDAsIG51bV9wYWdlcywgZG1hX2FkZHJlc3Ms
IGZsYWdzLAorCQkJICAgICZqb2ItPmlic1swXS5wdHJbbnVtX2R3XSk7CisJaWYgKHIpCisJCWdv
dG8gZXJyb3JfZnJlZTsKKworCXIgPSBhbWRncHVfam9iX3N1Ym1pdChqb2IsICZhZGV2LT5tbWFu
LmVudGl0eSwKKwkJCSAgICAgIEFNREdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQsICZmZW5jZSk7
CisJaWYgKHIpCisJCWdvdG8gZXJyb3JfZnJlZTsKKworCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwor
CisJcmV0dXJuIHI7CisKK2Vycm9yX2ZyZWU6CisJYW1kZ3B1X2pvYl9mcmVlKGpvYik7CisJcmV0
dXJuIHI7Cit9CisKIC8qKgogICogYW1kZ3B1X2NvcHlfdHRtX21lbV90b19tZW0gLSBIZWxwZXIg
ZnVuY3Rpb24gZm9yIGNvcHkKICAqIEBhZGV2OiBhbWRncHUgZGV2aWNlCkBAIC0zMDksNzkgKzM5
MSw2MiBAQCBzdGF0aWMgc3RydWN0IGRybV9tbV9ub2RlICphbWRncHVfZmluZF9tbV9ub2RlKHN0
cnVjdCB0dG1fbWVtX3JlZyAqbWVtLAogICoKICAqLwogaW50IGFtZGdwdV90dG1fY29weV9tZW1f
dG9fbWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJICAgICAgIHN0cnVjdCBhbWRn
cHVfY29weV9tZW0gKnNyYywKLQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2NvcHlfbWVtICpkc3Qs
CisJCQkgICAgICAgY29uc3Qgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqc3JjLAorCQkJICAgICAg
IGNvbnN0IHN0cnVjdCBhbWRncHVfY29weV9tZW0gKmRzdCwKIAkJCSAgICAgICB1aW50NjRfdCBz
aXplLCBib29sIHRteiwKIAkJCSAgICAgICBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsCiAJCQkgICAg
ICAgc3RydWN0IGRtYV9mZW5jZSAqKmYpCiB7CisJY29uc3QgdWludDMyX3QgR1RUX01BWF9CWVRF
UyA9IChBTURHUFVfR1RUX01BWF9UUkFOU0ZFUl9TSVpFICoKKwkJCQkJQU1ER1BVX0dQVV9QQUdF
X1NJWkUpOworCisJdWludDY0X3Qgc3JjX25vZGVfc2l6ZSwgZHN0X25vZGVfc2l6ZSwgc3JjX29m
ZnNldCwgZHN0X29mZnNldDsKIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5tbWFu
LmJ1ZmZlcl9mdW5jc19yaW5nOwogCXN0cnVjdCBkcm1fbW1fbm9kZSAqc3JjX21tLCAqZHN0X21t
OwotCXVpbnQ2NF90IHNyY19ub2RlX3N0YXJ0LCBkc3Rfbm9kZV9zdGFydCwgc3JjX25vZGVfc2l6
ZSwKLQkJIGRzdF9ub2RlX3NpemUsIHNyY19wYWdlX29mZnNldCwgZHN0X3BhZ2Vfb2Zmc2V0Owog
CXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gTlVMTDsKIAlpbnQgciA9IDA7Ci0JY29uc3QgdWlu
dDY0X3QgR1RUX01BWF9CWVRFUyA9IChBTURHUFVfR1RUX01BWF9UUkFOU0ZFUl9TSVpFICoKLQkJ
CQkJQU1ER1BVX0dQVV9QQUdFX1NJWkUpOwogCiAJaWYgKCFhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5j
c19lbmFibGVkKSB7CiAJCURSTV9FUlJPUigiVHJ5aW5nIHRvIG1vdmUgbWVtb3J5IHdpdGggcmlu
ZyB0dXJuZWQgb2ZmLlxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCXNyY19tbSA9IGFt
ZGdwdV9maW5kX21tX25vZGUoc3JjLT5tZW0sICZzcmMtPm9mZnNldCk7Ci0Jc3JjX25vZGVfc3Rh
cnQgPSBhbWRncHVfbW1fbm9kZV9hZGRyKHNyYy0+Ym8sIHNyY19tbSwgc3JjLT5tZW0pICsKLQkJ
CQkJICAgICBzcmMtPm9mZnNldDsKLQlzcmNfbm9kZV9zaXplID0gKHNyY19tbS0+c2l6ZSA8PCBQ
QUdFX1NISUZUKSAtIHNyYy0+b2Zmc2V0OwotCXNyY19wYWdlX29mZnNldCA9IHNyY19ub2RlX3N0
YXJ0ICYgKFBBR0VfU0laRSAtIDEpOworCXNyY19vZmZzZXQgPSBzcmMtPm9mZnNldDsKKwlzcmNf
bW0gPSBhbWRncHVfZmluZF9tbV9ub2RlKHNyYy0+bWVtLCAmc3JjX29mZnNldCk7CisJc3JjX25v
ZGVfc2l6ZSA9IChzcmNfbW0tPnNpemUgPDwgUEFHRV9TSElGVCkgLSBzcmNfb2Zmc2V0OwogCi0J
ZHN0X21tID0gYW1kZ3B1X2ZpbmRfbW1fbm9kZShkc3QtPm1lbSwgJmRzdC0+b2Zmc2V0KTsKLQlk
c3Rfbm9kZV9zdGFydCA9IGFtZGdwdV9tbV9ub2RlX2FkZHIoZHN0LT5ibywgZHN0X21tLCBkc3Qt
Pm1lbSkgKwotCQkJCQkgICAgIGRzdC0+b2Zmc2V0OwotCWRzdF9ub2RlX3NpemUgPSAoZHN0X21t
LT5zaXplIDw8IFBBR0VfU0hJRlQpIC0gZHN0LT5vZmZzZXQ7Ci0JZHN0X3BhZ2Vfb2Zmc2V0ID0g
ZHN0X25vZGVfc3RhcnQgJiAoUEFHRV9TSVpFIC0gMSk7CisJZHN0X29mZnNldCA9IGRzdC0+b2Zm
c2V0OworCWRzdF9tbSA9IGFtZGdwdV9maW5kX21tX25vZGUoZHN0LT5tZW0sICZkc3Rfb2Zmc2V0
KTsKKwlkc3Rfbm9kZV9zaXplID0gKGRzdF9tbS0+c2l6ZSA8PCBQQUdFX1NISUZUKSAtIGRzdF9v
ZmZzZXQ7CiAKIAltdXRleF9sb2NrKCZhZGV2LT5tbWFuLmd0dF93aW5kb3dfbG9jayk7CiAKIAl3
aGlsZSAoc2l6ZSkgewotCQl1bnNpZ25lZCBsb25nIGN1cl9zaXplOwotCQl1aW50NjRfdCBmcm9t
ID0gc3JjX25vZGVfc3RhcnQsIHRvID0gZHN0X25vZGVfc3RhcnQ7CisJCXVpbnQzMl90IHNyY19w
YWdlX29mZnNldCA9IHNyY19vZmZzZXQgJiB+UEFHRV9NQVNLOworCQl1aW50MzJfdCBkc3RfcGFn
ZV9vZmZzZXQgPSBkc3Rfb2Zmc2V0ICYgflBBR0VfTUFTSzsKIAkJc3RydWN0IGRtYV9mZW5jZSAq
bmV4dDsKKwkJdWludDMyX3QgY3VyX3NpemU7CisJCXVpbnQ2NF90IGZyb20sIHRvOwogCiAJCS8q
IENvcHkgc2l6ZSBjYW5ub3QgZXhjZWVkIEdUVF9NQVhfQllURVMuIFNvIGlmIHNyYyBvciBkc3QK
IAkJICogYmVnaW5zIGF0IGFuIG9mZnNldCwgdGhlbiBhZGp1c3QgdGhlIHNpemUgYWNjb3JkaW5n
bHkKIAkJICovCi0JCWN1cl9zaXplID0gbWluMyhtaW4oc3JjX25vZGVfc2l6ZSwgZHN0X25vZGVf
c2l6ZSksIHNpemUsCi0JCQkJR1RUX01BWF9CWVRFUyk7Ci0JCWlmIChjdXJfc2l6ZSArIHNyY19w
YWdlX29mZnNldCA+IEdUVF9NQVhfQllURVMgfHwKLQkJICAgIGN1cl9zaXplICsgZHN0X3BhZ2Vf
b2Zmc2V0ID4gR1RUX01BWF9CWVRFUykKLQkJCWN1cl9zaXplIC09IG1heChzcmNfcGFnZV9vZmZz
ZXQsIGRzdF9wYWdlX29mZnNldCk7Ci0KLQkJLyogTWFwIG9ubHkgd2hhdCBuZWVkcyB0byBiZSBh
Y2Nlc3NlZC4gTWFwIHNyYyB0byB3aW5kb3cgMCBhbmQKLQkJICogZHN0IHRvIHdpbmRvdyAxCi0J
CSAqLwotCQlpZiAoc3JjLT5tZW0tPnN0YXJ0ID09IEFNREdQVV9CT19JTlZBTElEX09GRlNFVCkg
ewotCQkJciA9IGFtZGdwdV9tYXBfYnVmZmVyKHNyYy0+Ym8sIHNyYy0+bWVtLAotCQkJCQlQRk5f
VVAoY3VyX3NpemUgKyBzcmNfcGFnZV9vZmZzZXQpLAotCQkJCQlzcmNfbm9kZV9zdGFydCwgMCwg
cmluZywgdG16LAotCQkJCQkmZnJvbSk7Ci0JCQlpZiAocikKLQkJCQlnb3RvIGVycm9yOwotCQkJ
LyogQWRqdXN0IHRoZSBvZmZzZXQgYmVjYXVzZSBhbWRncHVfbWFwX2J1ZmZlciByZXR1cm5zCi0J
CQkgKiBzdGFydCBvZiBtYXBwZWQgcGFnZQotCQkJICovCi0JCQlmcm9tICs9IHNyY19wYWdlX29m
ZnNldDsKLQkJfQorCQljdXJfc2l6ZSA9IG1pbjMoc3JjX25vZGVfc2l6ZSwgZHN0X25vZGVfc2l6
ZSwgc2l6ZSk7CisJCWN1cl9zaXplID0gbWluKEdUVF9NQVhfQllURVMgLSBzcmNfcGFnZV9vZmZz
ZXQsIGN1cl9zaXplKTsKKwkJY3VyX3NpemUgPSBtaW4oR1RUX01BWF9CWVRFUyAtIGRzdF9wYWdl
X29mZnNldCwgY3VyX3NpemUpOworCisJCS8qIE1hcCBzcmMgdG8gd2luZG93IDAgYW5kIGRzdCB0
byB3aW5kb3cgMS4gKi8KKwkJciA9IGFtZGdwdV90dG1fbWFwX2J1ZmZlcihzcmMtPmJvLCBzcmMt
Pm1lbSwgc3JjX21tLAorCQkJCQkgIFBGTl9VUChjdXJfc2l6ZSArIHNyY19wYWdlX29mZnNldCks
CisJCQkJCSAgc3JjX29mZnNldCwgMCwgcmluZywgdG16LCAmZnJvbSk7CisJCWlmIChyKQorCQkJ
Z290byBlcnJvcjsKIAotCQlpZiAoZHN0LT5tZW0tPnN0YXJ0ID09IEFNREdQVV9CT19JTlZBTElE
X09GRlNFVCkgewotCQkJciA9IGFtZGdwdV9tYXBfYnVmZmVyKGRzdC0+Ym8sIGRzdC0+bWVtLAot
CQkJCQlQRk5fVVAoY3VyX3NpemUgKyBkc3RfcGFnZV9vZmZzZXQpLAotCQkJCQlkc3Rfbm9kZV9z
dGFydCwgMSwgcmluZywgdG16LAotCQkJCQkmdG8pOwotCQkJaWYgKHIpCi0JCQkJZ290byBlcnJv
cjsKLQkJCXRvICs9IGRzdF9wYWdlX29mZnNldDsKLQkJfQorCQlyID0gYW1kZ3B1X3R0bV9tYXBf
YnVmZmVyKGRzdC0+Ym8sIGRzdC0+bWVtLCBkc3RfbW0sCisJCQkJCSAgUEZOX1VQKGN1cl9zaXpl
ICsgZHN0X3BhZ2Vfb2Zmc2V0KSwKKwkJCQkJICBkc3Rfb2Zmc2V0LCAxLCByaW5nLCB0bXosICZ0
byk7CisJCWlmIChyKQorCQkJZ290byBlcnJvcjsKIAogCQlyID0gYW1kZ3B1X2NvcHlfYnVmZmVy
KHJpbmcsIGZyb20sIHRvLCBjdXJfc2l6ZSwKIAkJCQkgICAgICAgcmVzdiwgJm5leHQsIGZhbHNl
LCB0cnVlLCB0bXopOwpAQCAtMzk3LDIzICs0NjIsMjAgQEAgaW50IGFtZGdwdV90dG1fY29weV9t
ZW1fdG9fbWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCiAJCXNyY19ub2RlX3NpemUg
LT0gY3VyX3NpemU7CiAJCWlmICghc3JjX25vZGVfc2l6ZSkgewotCQkJc3JjX25vZGVfc3RhcnQg
PSBhbWRncHVfbW1fbm9kZV9hZGRyKHNyYy0+Ym8sICsrc3JjX21tLAotCQkJCQkJCSAgICAgc3Jj
LT5tZW0pOwotCQkJc3JjX25vZGVfc2l6ZSA9IChzcmNfbW0tPnNpemUgPDwgUEFHRV9TSElGVCk7
Ci0JCQlzcmNfcGFnZV9vZmZzZXQgPSAwOworCQkJKytzcmNfbW07CisJCQlzcmNfbm9kZV9zaXpl
ID0gc3JjX21tLT5zaXplIDw8IFBBR0VfU0hJRlQ7CisJCQlzcmNfb2Zmc2V0ID0gMDsKIAkJfSBl
bHNlIHsKLQkJCXNyY19ub2RlX3N0YXJ0ICs9IGN1cl9zaXplOwotCQkJc3JjX3BhZ2Vfb2Zmc2V0
ID0gc3JjX25vZGVfc3RhcnQgJiAoUEFHRV9TSVpFIC0gMSk7CisJCQlzcmNfb2Zmc2V0ICs9IGN1
cl9zaXplOwogCQl9CisKIAkJZHN0X25vZGVfc2l6ZSAtPSBjdXJfc2l6ZTsKIAkJaWYgKCFkc3Rf
bm9kZV9zaXplKSB7Ci0JCQlkc3Rfbm9kZV9zdGFydCA9IGFtZGdwdV9tbV9ub2RlX2FkZHIoZHN0
LT5ibywgKytkc3RfbW0sCi0JCQkJCQkJICAgICBkc3QtPm1lbSk7Ci0JCQlkc3Rfbm9kZV9zaXpl
ID0gKGRzdF9tbS0+c2l6ZSA8PCBQQUdFX1NISUZUKTsKLQkJCWRzdF9wYWdlX29mZnNldCA9IDA7
CisJCQkrK2RzdF9tbTsKKwkJCWRzdF9ub2RlX3NpemUgPSBkc3RfbW0tPnNpemUgPDwgUEFHRV9T
SElGVDsKKwkJCWRzdF9vZmZzZXQgPSAwOwogCQl9IGVsc2UgewotCQkJZHN0X25vZGVfc3RhcnQg
Kz0gY3VyX3NpemU7Ci0JCQlkc3RfcGFnZV9vZmZzZXQgPSBkc3Rfbm9kZV9zdGFydCAmIChQQUdF
X1NJWkUgLSAxKTsKKwkJCWRzdF9vZmZzZXQgKz0gY3VyX3NpemU7CiAJCX0KIAl9CiBlcnJvcjoK
QEAgLTc1NCw4ICs4MTYsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdHRtX2lvX21lbV9mcmVlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZQogc3RhdGljIHVuc2ln
bmVkIGxvbmcgYW1kZ3B1X3R0bV9pb19tZW1fcGZuKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCiAJCQkJCSAgIHVuc2lnbmVkIGxvbmcgcGFnZV9vZmZzZXQpCiB7CisJdWludDY0X3Qgb2Zm
c2V0ID0gKHBhZ2Vfb2Zmc2V0IDw8IFBBR0VfU0hJRlQpOwogCXN0cnVjdCBkcm1fbW1fbm9kZSAq
bW07Ci0JdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAocGFnZV9vZmZzZXQgPDwgUEFHRV9TSElGVCk7
CiAKIAltbSA9IGFtZGdwdV9maW5kX21tX25vZGUoJmJvLT5tZW0sICZvZmZzZXQpOwogCXJldHVy
biAoYm8tPm1lbS5idXMuYmFzZSA+PiBQQUdFX1NISUZUKSArIG1tLT5zdGFydCArCkBAIC0xNjA2
LDggKzE2NjgsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fYWNjZXNzX21lbW9yeShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWlmIChiby0+bWVtLm1lbV90eXBlICE9IFRUTV9QTF9W
UkFNKQogCQlyZXR1cm4gLUVJTzsKIAotCW5vZGVzID0gYW1kZ3B1X2ZpbmRfbW1fbm9kZSgmYWJv
LT50Ym8ubWVtLCAmb2Zmc2V0KTsKLQlwb3MgPSAobm9kZXMtPnN0YXJ0IDw8IFBBR0VfU0hJRlQp
ICsgb2Zmc2V0OworCXBvcyA9IG9mZnNldDsKKwlub2RlcyA9IGFtZGdwdV9maW5kX21tX25vZGUo
JmFiby0+dGJvLm1lbSwgJnBvcyk7CisJcG9zICs9IChub2Rlcy0+c3RhcnQgPDwgUEFHRV9TSElG
VCk7CiAKIAl3aGlsZSAobGVuICYmIHBvcyA8IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsKIAkJ
dWludDY0X3QgYWxpZ25lZF9wb3MgPSBwb3MgJiB+KHVpbnQ2NF90KTM7CkBAIC0yMDMzLDcyICsy
MDk2LDYgQEAgaW50IGFtZGdwdV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKIAlyZXR1cm4gdHRtX2JvX21tYXAoZmlscCwgdm1hLCAmYWRldi0+bW1h
bi5iZGV2KTsKIH0KIAotc3RhdGljIGludCBhbWRncHVfbWFwX2J1ZmZlcihzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAotCQkJICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSwgdW5zaWdu
ZWQgbnVtX3BhZ2VzLAotCQkJICAgICB1aW50NjRfdCBvZmZzZXQsIHVuc2lnbmVkIHdpbmRvdywK
LQkJCSAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBib29sIHRteiwKLQkJCSAgICAgdWlu
dDY0X3QgKmFkZHIpCi17Ci0Jc3RydWN0IGFtZGdwdV90dG1fdHQgKmd0dCA9ICh2b2lkICopYm8t
PnR0bTsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7Ci0Jc3RydWN0
IHR0bV90dCAqdHRtID0gYm8tPnR0bTsKLQlzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iOwotCXVuc2ln
bmVkIG51bV9kdywgbnVtX2J5dGVzOwotCWRtYV9hZGRyX3QgKmRtYV9hZGRyZXNzOwotCXN0cnVj
dCBkbWFfZmVuY2UgKmZlbmNlOwotCXVpbnQ2NF90IHNyY19hZGRyLCBkc3RfYWRkcjsKLQl1aW50
NjRfdCBmbGFnczsKLQlpbnQgcjsKLQotCUJVR19PTihhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+
Y29weV9tYXhfYnl0ZXMgPAotCSAgICAgICBBTURHUFVfR1RUX01BWF9UUkFOU0ZFUl9TSVpFICog
OCk7Ci0KLQkqYWRkciA9IGFkZXYtPmdtYy5nYXJ0X3N0YXJ0OwotCSphZGRyICs9ICh1NjQpd2lu
ZG93ICogQU1ER1BVX0dUVF9NQVhfVFJBTlNGRVJfU0laRSAqCi0JCUFNREdQVV9HUFVfUEFHRV9T
SVpFOwotCi0JbnVtX2R3ID0gQUxJR04oYWRldi0+bW1hbi5idWZmZXJfZnVuY3MtPmNvcHlfbnVt
X2R3LCA4KTsKLQludW1fYnl0ZXMgPSBudW1fcGFnZXMgKiA4OwotCi0JciA9IGFtZGdwdV9qb2Jf
YWxsb2Nfd2l0aF9pYihhZGV2LCBudW1fZHcgKiA0ICsgbnVtX2J5dGVzLCAmam9iKTsKLQlpZiAo
cikKLQkJcmV0dXJuIHI7Ci0KLQlzcmNfYWRkciA9IG51bV9kdyAqIDQ7Ci0Jc3JjX2FkZHIgKz0g
am9iLT5pYnNbMF0uZ3B1X2FkZHI7Ci0KLQlkc3RfYWRkciA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0
KGFkZXYtPmdhcnQuYm8pOwotCWRzdF9hZGRyICs9IHdpbmRvdyAqIEFNREdQVV9HVFRfTUFYX1RS
QU5TRkVSX1NJWkUgKiA4OwotCWFtZGdwdV9lbWl0X2NvcHlfYnVmZmVyKGFkZXYsICZqb2ItPmli
c1swXSwgc3JjX2FkZHIsCi0JCQkJZHN0X2FkZHIsIG51bV9ieXRlcywgZmFsc2UpOwotCi0JYW1k
Z3B1X3JpbmdfcGFkX2liKHJpbmcsICZqb2ItPmlic1swXSk7Ci0JV0FSTl9PTihqb2ItPmlic1sw
XS5sZW5ndGhfZHcgPiBudW1fZHcpOwotCi0JZG1hX2FkZHJlc3MgPSAmZ3R0LT50dG0uZG1hX2Fk
ZHJlc3Nbb2Zmc2V0ID4+IFBBR0VfU0hJRlRdOwotCWZsYWdzID0gYW1kZ3B1X3R0bV90dF9wdGVf
ZmxhZ3MoYWRldiwgdHRtLCBtZW0pOwotCWlmICh0bXopCi0JCWZsYWdzIHw9IEFNREdQVV9QVEVf
VE1aOwotCi0JciA9IGFtZGdwdV9nYXJ0X21hcChhZGV2LCAwLCBudW1fcGFnZXMsIGRtYV9hZGRy
ZXNzLCBmbGFncywKLQkJCSAgICAmam9iLT5pYnNbMF0ucHRyW251bV9kd10pOwotCWlmIChyKQot
CQlnb3RvIGVycm9yX2ZyZWU7Ci0KLQlyID0gYW1kZ3B1X2pvYl9zdWJtaXQoam9iLCAmYWRldi0+
bW1hbi5lbnRpdHksCi0JCQkgICAgICBBTURHUFVfRkVOQ0VfT1dORVJfVU5ERUZJTkVELCAmZmVu
Y2UpOwotCWlmIChyKQotCQlnb3RvIGVycm9yX2ZyZWU7Ci0KLQlkbWFfZmVuY2VfcHV0KGZlbmNl
KTsKLQotCXJldHVybiByOwotCi1lcnJvcl9mcmVlOgotCWFtZGdwdV9qb2JfZnJlZShqb2IpOwot
CXJldHVybiByOwotfQotCiBpbnQgYW1kZ3B1X2NvcHlfYnVmZmVyKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgdWludDY0X3Qgc3JjX29mZnNldCwKIAkJICAgICAgIHVpbnQ2NF90IGRzdF9vZmZz
ZXQsIHVpbnQzMl90IGJ5dGVfY291bnQsCiAJCSAgICAgICBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3Ys
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKaW5kZXggMjExODJjYWFkZTIx
Li4xMWMwZTc5ZTcxMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgK
QEAgLTg5LDggKzg5LDggQEAgaW50IGFtZGdwdV9jb3B5X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVpbnQ2NF90IHNyY19vZmZzZXQsCiAJCSAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNl
ICoqZmVuY2UsIGJvb2wgZGlyZWN0X3N1Ym1pdCwKIAkJICAgICAgIGJvb2wgdm1fbmVlZHNfZmx1
c2gsIGJvb2wgdG16KTsKIGludCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21lbShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKLQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2NvcHlfbWVtICpzcmMs
Ci0JCQkgICAgICAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqZHN0LAorCQkJICAgICAgIGNvbnN0
IHN0cnVjdCBhbWRncHVfY29weV9tZW0gKnNyYywKKwkJCSAgICAgICBjb25zdCBzdHJ1Y3QgYW1k
Z3B1X2NvcHlfbWVtICpkc3QsCiAJCQkgICAgICAgdWludDY0X3Qgc2l6ZSwgYm9vbCB0bXosCiAJ
CQkgICAgICAgc3RydWN0IGRtYV9yZXN2ICpyZXN2LAogCQkJICAgICAgIHN0cnVjdCBkbWFfZmVu
Y2UgKipmKTsKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cg==
