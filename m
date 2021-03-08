Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14F2330FB4
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Mar 2021 14:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0976E3DF;
	Mon,  8 Mar 2021 13:40:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3F66E3D8
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Mar 2021 13:40:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dx17so20476844ejb.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Mar 2021 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5fvYtSaElAmq2WLUELQeK4OKjyFCYcgjs36OAcwLVWs=;
 b=lRTN0YpxVHUHuBqAreRG/uUBTZC9C8vjJy+SZi4b21gdWwTLp+sLLeKQjPMhRfzEUw
 1i76KzC1LVrgCF2yAQ3VqKtecuniZeU8rE+6EqvUpp6FH83L8xoWdhlR6msZGBfjSOld
 c97bBCO2y/swoZMizIz57/cWgrphi8WTSYznhJIOYpmMhRb0aegiDmMFkESxOgHaSwA+
 j0HYE9910Qr4u5w/JTDC+EwVSlTJtG9HCj5A54rLYuccn9TrC9W1ZT2/5JGlzSY17U+K
 EnyOpc3guBd3pZr331mtxKz83GFBz/v4qmsChMAWbe1VmpsETZa7r9//2Odmv8122VYd
 NUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fvYtSaElAmq2WLUELQeK4OKjyFCYcgjs36OAcwLVWs=;
 b=SUm0UfRYbZPWrnK6djZ7tz1pwiErL2qIEym98UceWadNZnT0/PqlJEB6Fb4jt98A3n
 5QIaCZT9OH7GxoSFgOHkARkQrmTqb8EXKmgTwAJHRGQZyD227l1WDh7e1nDZzbzmDCL/
 q8TAbseXsfxSjDb3SdXtoq2F0+sNBEmKcP//LFq6GyC/8QSEUHCa0CKEH6+tkB9Gx3e6
 TD16xxuglBtysRo155EfpjmhOaz5y+l+btnE8rRbb9jNBxAyfbEC3zPBLjT25JBHuDhh
 KJNwXmL11qKd8/Lc9Xs80tZ5kDvKXy4zthgVMGpd0cI5Pbk75TIxQ0SijqNFh0ptaela
 u7hQ==
X-Gm-Message-State: AOAM5324QGM7ut4UGmPel1VY5s88To1DgoV+/pcr5UujVREV+aHRJgdG
 q11842yMAP7l6QXQb9g0g9dsTQiRyxjB3Q==
X-Google-Smtp-Source: ABdhPJwJo/t/t29sQ014slSDh1Awvaj8N4184GvnSJcaRL8hK/nQqDiqySU6yZMTfK1v2a411gS8VA==
X-Received: by 2002:a17:906:da0e:: with SMTP id
 fi14mr15571121ejb.188.1615210850947; 
 Mon, 08 Mar 2021 05:40:50 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f480:31ac:e949:bf58])
 by smtp.gmail.com with ESMTPSA id s18sm6655701ejc.79.2021.03.08.05.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:40:50 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Arunpravin.PaneerSelvam@amd.com,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/amdgpu: use the new cursor in the VM code
Date: Mon,  8 Mar 2021 14:40:44 +0100
Message-Id: <20210308134044.133658-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308134044.133658-1-christian.koenig@amd.com>
References: <20210308134044.133658-1-christian.koenig@amd.com>
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

U2VwYXJhdGUgdGhlIGRybV9tbV9ub2RlIHdhbGtpbmcgZnJvbSB0aGUgYWN0dWFsIGhhbmRsaW5n
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgpBY2tlZC1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+ClRlc3RlZC1ieTogTmly
bW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jIHwgNTQgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IDlkMTkwNzgyNDZjOC4uYmY5NjM4YmQwZGRkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpAQCAtMzcsNiArMzcsNyBAQAog
I2luY2x1ZGUgImFtZGdwdV9nbWMuaCIKICNpbmNsdWRlICJhbWRncHVfeGdtaS5oIgogI2luY2x1
ZGUgImFtZGdwdV9kbWFfYnVmLmgiCisjaW5jbHVkZSAiYW1kZ3B1X3Jlc19jdXJzb3IuaCIKIAog
LyoqCiAgKiBET0M6IEdQVVZNCkBAIC0xNTgyLDcgKzE1ODMsNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywK
ICAqIEBsYXN0OiBsYXN0IG1hcHBlZCBlbnRyeQogICogQGZsYWdzOiBmbGFncyBmb3IgdGhlIGVu
dHJpZXMKICAqIEBvZmZzZXQ6IG9mZnNldCBpbnRvIG5vZGVzIGFuZCBwYWdlc19hZGRyCi0gKiBA
bm9kZXM6IGFycmF5IG9mIGRybV9tbV9ub2RlcyB3aXRoIHRoZSBNQyBhZGRyZXNzZXMKKyAqIEBy
ZXM6IHR0bV9yZXNvdXJjZSB0byBtYXAKICAqIEBwYWdlc19hZGRyOiBETUEgYWRkcmVzc2VzIHRv
IHVzZSBmb3IgbWFwcGluZwogICogQGZlbmNlOiBvcHRpb25hbCByZXN1bHRpbmcgZmVuY2UKICAq
CkBAIC0xNTk3LDEzICsxNTk4LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9t
YXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCSAgICAgICBib29sIHVubG9j
a2VkLCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsCiAJCQkJICAgICAgIHVpbnQ2NF90IHN0YXJ0LCB1
aW50NjRfdCBsYXN0LAogCQkJCSAgICAgICB1aW50NjRfdCBmbGFncywgdWludDY0X3Qgb2Zmc2V0
LAotCQkJCSAgICAgICBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzLAorCQkJCSAgICAgICBzdHJ1
Y3QgdHRtX3Jlc291cmNlICpyZXMsCiAJCQkJICAgICAgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIs
CiAJCQkJICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1
X3ZtX3VwZGF0ZV9wYXJhbXMgcGFyYW1zOworCXN0cnVjdCBhbWRncHVfcmVzX2N1cnNvciBjdXJz
b3I7CiAJZW51bSBhbWRncHVfc3luY19tb2RlIHN5bmNfbW9kZTsKLQl1aW50NjRfdCBwZm47CiAJ
aW50IHI7CiAKIAltZW1zZXQoJnBhcmFtcywgMCwgc2l6ZW9mKHBhcmFtcykpOwpAQCAtMTYyMSwx
NCArMTYyMiw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogCWVsc2UKIAkJc3luY19tb2RlID0gQU1ER1BVX1NZTkNf
RVhQTElDSVQ7CiAKLQlwZm4gPSBvZmZzZXQgPj4gUEFHRV9TSElGVDsKLQlpZiAobm9kZXMpIHsK
LQkJd2hpbGUgKHBmbiA+PSBub2Rlcy0+c2l6ZSkgewotCQkJcGZuIC09IG5vZGVzLT5zaXplOwot
CQkJKytub2RlczsKLQkJfQotCX0KLQogCWFtZGdwdV92bV9ldmljdGlvbl9sb2NrKHZtKTsKIAlp
ZiAodm0tPmV2aWN0aW5nKSB7CiAJCXIgPSAtRUJVU1k7CkBAIC0xNjQ3LDIzICsxNjQwLDE3IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAogCWlmIChyKQogCQlnb3RvIGVycm9yX3VubG9jazsKIAotCWRvIHsKKwlhbWRn
cHVfcmVzX2ZpcnN0KHJlcywgb2Zmc2V0LCAobGFzdCAtIHN0YXJ0ICsgMSkgKiBBTURHUFVfR1BV
X1BBR0VfU0laRSwKKwkJCSAmY3Vyc29yKTsKKwl3aGlsZSAoY3Vyc29yLnJlbWFpbmluZykgewog
CQl1aW50NjRfdCB0bXAsIG51bV9lbnRyaWVzLCBhZGRyOwogCi0KLQkJbnVtX2VudHJpZXMgPSBs
YXN0IC0gc3RhcnQgKyAxOwotCQlpZiAobm9kZXMpIHsKLQkJCWFkZHIgPSBub2Rlcy0+c3RhcnQg
PDwgUEFHRV9TSElGVDsKLQkJCW51bV9lbnRyaWVzID0gbWluKChub2Rlcy0+c2l6ZSAtIHBmbikg
KgotCQkJCUFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0UsIG51bV9lbnRyaWVzKTsKLQkJfSBl
bHNlIHsKLQkJCWFkZHIgPSAwOwotCQl9Ci0KKwkJbnVtX2VudHJpZXMgPSBjdXJzb3Iuc2l6ZSA+
PiBBTURHUFVfR1BVX1BBR0VfU0hJRlQ7CiAJCWlmIChwYWdlc19hZGRyKSB7CiAJCQlib29sIGNv
bnRpZ3VvdXMgPSB0cnVlOwogCiAJCQlpZiAobnVtX2VudHJpZXMgPiBBTURHUFVfR1BVX1BBR0VT
X0lOX0NQVV9QQUdFKSB7CisJCQkJdWludDY0X3QgcGZuID0gY3Vyc29yLnN0YXJ0ID4+IFBBR0Vf
U0hJRlQ7CiAJCQkJdWludDY0X3QgY291bnQ7CiAKIAkJCQljb250aWd1b3VzID0gcGFnZXNfYWRk
cltwZm4gKyAxXSA9PQpAQCAtMTY4MywxNiArMTY3MCwxOCBAQCBzdGF0aWMgaW50IGFtZGdwdV92
bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCX0KIAog
CQkJaWYgKCFjb250aWd1b3VzKSB7Ci0JCQkJYWRkciA9IHBmbiA8PCBQQUdFX1NISUZUOworCQkJ
CWFkZHIgPSBjdXJzb3Iuc3RhcnQ7CiAJCQkJcGFyYW1zLnBhZ2VzX2FkZHIgPSBwYWdlc19hZGRy
OwogCQkJfSBlbHNlIHsKLQkJCQlhZGRyID0gcGFnZXNfYWRkcltwZm5dOworCQkJCWFkZHIgPSBw
YWdlc19hZGRyW2N1cnNvci5zdGFydCA+PiBQQUdFX1NISUZUXTsKIAkJCQlwYXJhbXMucGFnZXNf
YWRkciA9IE5VTEw7CiAJCQl9CiAKIAkJfSBlbHNlIGlmIChmbGFncyAmIChBTURHUFVfUFRFX1ZB
TElEIHwgQU1ER1BVX1BURV9QUlQpKSB7Ci0JCQlhZGRyICs9IGJvX2FkZXYtPnZtX21hbmFnZXIu
dnJhbV9iYXNlX29mZnNldDsKLQkJCWFkZHIgKz0gcGZuIDw8IFBBR0VfU0hJRlQ7CisJCQlhZGRy
ID0gYm9fYWRldi0+dm1fbWFuYWdlci52cmFtX2Jhc2Vfb2Zmc2V0ICsKKwkJCQljdXJzb3Iuc3Rh
cnQ7CisJCX0gZWxzZSB7CisJCQlhZGRyID0gMDsKIAkJfQogCiAJCXRtcCA9IHN0YXJ0ICsgbnVt
X2VudHJpZXM7CkBAIC0xNzAwLDE0ICsxNjg5LDkgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9f
dXBkYXRlX21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWlmIChyKQogCQkJ
Z290byBlcnJvcl91bmxvY2s7CiAKLQkJcGZuICs9IG51bV9lbnRyaWVzIC8gQU1ER1BVX0dQVV9Q
QUdFU19JTl9DUFVfUEFHRTsKLQkJaWYgKG5vZGVzICYmIG5vZGVzLT5zaXplID09IHBmbikgewot
CQkJcGZuID0gMDsKLQkJCSsrbm9kZXM7Ci0JCX0KKwkJYW1kZ3B1X3Jlc19uZXh0KCZjdXJzb3Is
IG51bV9lbnRyaWVzICogQU1ER1BVX0dQVV9QQUdFX1NJWkUpOwogCQlzdGFydCA9IHRtcDsKLQot
CX0gd2hpbGUgKHVubGlrZWx5KHN0YXJ0ICE9IGxhc3QgKyAxKSk7CisJfTsKIAogCXIgPSB2bS0+
dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgZmVuY2UpOwogCkBAIC0xNzM2LDcgKzE3MjAs
NiBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
c3RydWN0IGFtZGdwdV9ib192YSAqYm9fdmEsCiAJc3RydWN0IGFtZGdwdV9ib192YV9tYXBwaW5n
ICptYXBwaW5nOwogCWRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIgPSBOVUxMOwogCXN0cnVjdCB0dG1f
cmVzb3VyY2UgKm1lbTsKLQlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOwogCXN0cnVjdCBkbWFf
ZmVuY2UgKipsYXN0X3VwZGF0ZTsKIAlzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3Y7CiAJdWludDY0X3Qg
ZmxhZ3M7CkBAIC0xNzQ1LDcgKzE3MjgsNiBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9ib192YSAqYm9fdmEsCiAKIAlp
ZiAoY2xlYXIgfHwgIWJvKSB7CiAJCW1lbSA9IE5VTEw7Ci0JCW5vZGVzID0gTlVMTDsKIAkJcmVz
diA9IHZtLT5yb290LmJhc2UuYm8tPnRiby5iYXNlLnJlc3Y7CiAJfSBlbHNlIHsKIAkJc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmYm8tPnRiby5iYXNlOwpAQCAtMTgwOSw3ICsxNzkxLDcg
QEAgaW50IGFtZGdwdV92bV9ib191cGRhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0
cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhLAogCQlyID0gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBw
aW5nKGFkZXYsIGJvX2FkZXYsIHZtLCBmYWxzZSwgZmFsc2UsCiAJCQkJCQlyZXN2LCBtYXBwaW5n
LT5zdGFydCwKIAkJCQkJCW1hcHBpbmctPmxhc3QsIHVwZGF0ZV9mbGFncywKLQkJCQkJCW1hcHBp
bmctPm9mZnNldCwgbm9kZXMsCisJCQkJCQltYXBwaW5nLT5vZmZzZXQsIG1lbSwKIAkJCQkJCXBh
Z2VzX2FkZHIsIGxhc3RfdXBkYXRlKTsKIAkJaWYgKHIpCiAJCQlyZXR1cm4gcjsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
