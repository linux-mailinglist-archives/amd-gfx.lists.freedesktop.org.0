Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1251156E7
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Dec 2019 19:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789E16FA73;
	Fri,  6 Dec 2019 18:00:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5306E0A5
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Dec 2019 17:33:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so8652428wrw.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Dec 2019 09:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMfYIWLSosBRTt5c0OFOGfQasicxq89+EkLtycU5ptQ=;
 b=oUS0y/gi+U9ov4yYuYEdMCVUENMYNhHdCBhROL3PvCaAMbzSsAPr0EvIiL+S7VCDJY
 4gzDZPoINvZjbjpI2fjfWknTEXyCSfRI/VYvwPCv5+IQLHssklZMLdIww7rYPJ+R77yd
 ImEHQrH3TojNqmVlumEVqWx8C4q8SR6kIljWfVoOsD3QoYPt9gfMcgZAkyIumqYVIw+o
 H93FEuO+k4FFbQ2QIak8/jBYqlrT/3dRyrS8pJ/HvyOMKq2tQZuv9Vnr+acNTSYGH8tq
 Sw6SAtI5zoVKB/iA9Uic3HAZFRJaf7CQSJiJB+YmhhZmORZaGW4x5V/PuSBPVQip5Rf7
 O9nw==
X-Gm-Message-State: APjAAAVbRme1iJLJbPiklG10YYu69moXVxFG97GNg8YR1k0fbyJ6ytJf
 12c3Xj+bXpKQCBCClLB0wlY=
X-Google-Smtp-Source: APXvYqw32P15uVKiT40qublhgXE9lnxGOMMJgONfKbuBizHR3EMIi9hR9tMVBVo01YXE5d0TVOqMDA==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr16804684wrh.272.1575653593967; 
 Fri, 06 Dec 2019 09:33:13 -0800 (PST)
Received: from linux-f4ir.fritz.box
 (p200300C58F4B11009E92A83957331E39.dip0.t-ipconnect.de.
 [2003:c5:8f4b:1100:9e92:a839:5733:1e39])
 by smtp.gmail.com with ESMTPSA id v14sm16906912wrm.28.2019.12.06.09.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 09:33:13 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: alexander.deucher@amd.com,
	kenny.ho@amd.com,
	christian.koenig@amd.com
Subject: [PATCH 2/4] drm/amdgpu: replace vm_pte's run-queue list with drm gpu
 scheds list
Date: Fri,  6 Dec 2019 18:33:02 +0100
Message-Id: <20191206173304.3025-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191206173304.3025-1-nirmoy.das@amd.com>
References: <20191206173304.3025-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 18:00:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMfYIWLSosBRTt5c0OFOGfQasicxq89+EkLtycU5ptQ=;
 b=efCmJSFPCe4L9N9e0MCxSktc0PmfHNoPMx8KwjQbuQ/humR9ruhet9EfNtD7BCeHUC
 gPl02TyBG2JR2+jo+Kp7hXWhDMrBPK1DBtHm4ioyecU0mh/mJ1Bi+cq9PX7KZ8ZbScO2
 h77L6DysQZJx2ANaFWOxYbpP1j1ERM2hhv7bYdu7pXrh5c8VHGDAy5ObK2W8xQdvvfaR
 vbqangMD4mMdrUK/gBMX8ziG2pqflt4kKtvDdyWmUqBovCw1NknWuhxu3Y6G0DY1UWZF
 1zG2xEw6bKYxn0DKLViVCRFNBEkx2EXavM2hzOltSApbdbuU76s5C70ZAXjaN2Ft4dtu
 8/Jw==
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZHJtX3NjaGVkX2VudGl0eV9pbml0KCkgdGFrZXMgZHJtIGdwdSBzY2hlZHVsZXIgbGlzdCBpbnN0
ZWFkIG9mCmRybV9zY2hlZF9ycSBsaXN0LiBUaGlzIG1ha2VzIGNvbnZlcnNpb24gb2YgZHJtX3Nj
aGVkX3JxIGxpc3QKdG8gZHJtIGdwdSBzY2hlZHVsZXIgbGlzdCB1bm5lY2Vzc2FyeQoKU2lnbmVk
LW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgfCAxMSArKysrLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvY2lrX3NkbWEuYyAgICAgIHwgIDggKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjJfNC5jICAgICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAuYyAgICAgfCAgOCArKystLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jICAgICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zaV9kbWEuYyAgICAgICAgfCAgOCArKystLS0tLQogOSBmaWxlcyBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZjg1MDA3MzgyMDkzLi5jZjQ5NTNjNGUy
Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTI3
NzksNyArMjc3OSw3IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJYWRldi0+bW1hbi5idWZmZXJfZnVuY3MgPSBOVUxMOwogCWFkZXYtPm1tYW4u
YnVmZmVyX2Z1bmNzX3JpbmcgPSBOVUxMOwogCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX2Z1bmNz
ID0gTlVMTDsKLQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gMDsKKwlhZGV2LT52
bV9tYW5hZ2VyLnZtX3B0ZV9udW1fc2NoZWRzID0gMDsKIAlhZGV2LT5nbWMuZ21jX2Z1bmNzID0g
TlVMTDsKIAlhZGV2LT5mZW5jZV9jb250ZXh0ID0gZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MoQU1E
R1BVX01BWF9SSU5HUyk7CiAJYml0bWFwX3plcm8oYWRldi0+Z2Z4LnBpcGVfcmVzZXJ2ZV9iaXRt
YXAsIEFNREdQVV9NQVhfQ09NUFVURV9RVUVVRVMpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uYwppbmRleCA1ZTc4ZGIzMGM3MjIuLjBlMWVkOGVmMmNlNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTI2ODcsNyArMjY4Nyw2IEBAIGludCBhbWRn
cHVfdm1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAq
dm0sCiB7CiAJc3RydWN0IGFtZGdwdV9ib19wYXJhbSBicDsKIAlzdHJ1Y3QgYW1kZ3B1X2JvICpy
b290OwotCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWRfbGlzdFtBTURHUFVfTUFYX1JJ
TkdTXTsKIAlpbnQgciwgaTsKIAogCXZtLT52YSA9IFJCX1JPT1RfQ0FDSEVEOwpAQCAtMjcwMSwx
OSArMjcwMCwxNyBAQCBpbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCXNwaW5fbG9ja19pbml0KCZ2bS0+aW52YWxpZGF0
ZWRfbG9jayk7CiAJSU5JVF9MSVNUX0hFQUQoJnZtLT5mcmVlZCk7CiAKLQlmb3IgKGkgPSAwOyBp
IDwgYWRldi0+dm1fbWFuYWdlci52bV9wdGVfbnVtX3JxczsgaSsrKQotCQlzY2hlZF9saXN0W2ld
ID0gYWRldi0+dm1fbWFuYWdlci52bV9wdGVfcnFzW2ldLT5zY2hlZDsKIAogCS8qIGNyZWF0ZSBz
Y2hlZHVsZXIgZW50aXRpZXMgZm9yIHBhZ2UgdGFibGUgdXBkYXRlcyAqLwogCXIgPSBkcm1fc2No
ZWRfZW50aXR5X2luaXQoJnZtLT5kaXJlY3QsIERSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUwsCi0J
CQkJICBzY2hlZF9saXN0LCBhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzLAotCQkJCSAg
TlVMTCk7CisJCQkJICBhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9zY2hlZHMsCisJCQkJICBhZGV2
LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fc2NoZWRzLCBOVUxMKTsKIAlpZiAocikKIAkJcmV0dXJu
IHI7CiAKIAlyID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZ2bS0+ZGVsYXllZCwgRFJNX1NDSEVE
X1BSSU9SSVRZX05PUk1BTCwKLQkJCQkgIHNjaGVkX2xpc3QsIGFkZXYtPnZtX21hbmFnZXIudm1f
cHRlX251bV9ycXMsCi0JCQkJICBOVUxMKTsKKwkJCQkgIGFkZXYtPnZtX21hbmFnZXIudm1fcHRl
X3NjaGVkcywKKwkJCQkgIGFkZXYtPnZtX21hbmFnZXIudm1fcHRlX251bV9zY2hlZHMsIE5VTEwp
OwogCWlmIChyKQogCQlnb3RvIGVycm9yX2ZyZWVfZGlyZWN0OwogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5oCmluZGV4IDc2ZmNmODUzMDM1Yy4uNWVhYmE4NjQ1YTQzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaApAQCAtMzIyLDggKzMyMiw4IEBAIHN0
cnVjdCBhbWRncHVfdm1fbWFuYWdlciB7CiAJdTY0CQkJCQl2cmFtX2Jhc2Vfb2Zmc2V0OwogCS8q
IHZtIHB0ZSBoYW5kbGluZyAqLwogCWNvbnN0IHN0cnVjdCBhbWRncHVfdm1fcHRlX2Z1bmNzCSp2
bV9wdGVfZnVuY3M7Ci0Jc3RydWN0IGRybV9zY2hlZF9ycQkJCSp2bV9wdGVfcnFzW0FNREdQVV9N
QVhfUklOR1NdOwotCXVuc2lnbmVkCQkJCXZtX3B0ZV9udW1fcnFzOworCXN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlcgkJKnZtX3B0ZV9zY2hlZHNbQU1ER1BVX01BWF9SSU5HU107CisJdW5zaWduZWQJ
CQkJdm1fcHRlX251bV9zY2hlZHM7CiAJc3RydWN0IGFtZGdwdV9yaW5nCQkJKnBhZ2VfZmF1bHQ7
CiAKIAkvKiBwYXJ0aWFsIHJlc2lkZW50IHRleHR1cmUgaGFuZGxpbmcgKi8KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19zZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9jaWtfc2RtYS5jCmluZGV4IDgyY2RiOGY1N2JmZC4uMWYyMmE4ZDBmN2YzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWtfc2RtYS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19zZG1hLmMKQEAgLTEzNzMsMTYgKzEzNzMsMTQg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfdm1fcHRlX2Z1bmNzIGNpa19zZG1hX3ZtX3B0
ZV9mdW5jcyA9IHsKIAogc3RhdGljIHZvaWQgY2lrX3NkbWFfc2V0X3ZtX3B0ZV9mdW5jcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQlzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNj
aGVkOwogCXVuc2lnbmVkIGk7CiAKIAlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9mdW5jcyA9ICZj
aWtfc2RtYV92bV9wdGVfZnVuY3M7CiAJZm9yIChpID0gMDsgaSA8IGFkZXYtPnNkbWEubnVtX2lu
c3RhbmNlczsgaSsrKSB7Ci0JCXNjaGVkID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucmluZy5z
Y2hlZDsKLQkJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfcnFzW2ldID0KLQkJCSZzY2hlZC0+c2No
ZWRfcnFbRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTF07CisJCWFkZXYtPnZtX21hbmFnZXIudm1f
cHRlX3NjaGVkc1tpXSA9CisJCQkmYWRldi0+c2RtYS5pbnN0YW5jZVtpXS5yaW5nLnNjaGVkOwog
CX0KLQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gYWRldi0+c2RtYS5udW1faW5z
dGFuY2VzOworCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX251bV9zY2hlZHMgPSBhZGV2LT5zZG1h
Lm51bV9pbnN0YW5jZXM7CiB9CiAKIGNvbnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lv
biBjaWtfc2RtYV9pcF9ibG9jayA9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3YyXzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjJfNC5j
CmluZGV4IDg5ZThjNzRhNDBmNC4uNjA2YjYyMTE0NWExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YyXzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3YyXzQuYwpAQCAtMTI2MSwxNiArMTI2MSwxNCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGdwdV92bV9wdGVfZnVuY3Mgc2RtYV92Ml80X3ZtX3B0ZV9mdW5jcyA9IHsKIAogc3Rh
dGljIHZvaWQgc2RtYV92Ml80X3NldF92bV9wdGVfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiB7Ci0Jc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsKIAl1bnNpZ25lZCBp
OwogCiAJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfZnVuY3MgPSAmc2RtYV92Ml80X3ZtX3B0ZV9m
dW5jczsKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsK
LQkJc2NoZWQgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVtpXS5yaW5nLnNjaGVkOwotCQlhZGV2LT52
bV9tYW5hZ2VyLnZtX3B0ZV9ycXNbaV0gPQotCQkJJnNjaGVkLT5zY2hlZF9ycVtEUk1fU0NIRURf
UFJJT1JJVFlfS0VSTkVMXTsKKwkJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfc2NoZWRzW2ldID0K
KwkJCSZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmcuc2NoZWQ7CiAJfQotCWFkZXYtPnZtX21h
bmFnZXIudm1fcHRlX251bV9ycXMgPSBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7CisJYWRldi0+
dm1fbWFuYWdlci52bV9wdGVfbnVtX3NjaGVkcyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsK
IH0KIAogY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9uIHNkbWFfdjJfNF9pcF9i
bG9jayA9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjNfMC5jCmluZGV4IDAxMWZkMTJj
NDFmZS4uYTU1OTU3M2VjOGZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3YzXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAu
YwpAQCAtMTY5OSwxNiArMTY5OSwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV92bV9w
dGVfZnVuY3Mgc2RtYV92M18wX3ZtX3B0ZV9mdW5jcyA9IHsKIAogc3RhdGljIHZvaWQgc2RtYV92
M18wX3NldF92bV9wdGVfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0Jc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsKIAl1bnNpZ25lZCBpOwogCiAJYWRldi0+dm1f
bWFuYWdlci52bV9wdGVfZnVuY3MgPSAmc2RtYV92M18wX3ZtX3B0ZV9mdW5jczsKIAlmb3IgKGkg
PSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsKLQkJc2NoZWQgPSAmYWRl
di0+c2RtYS5pbnN0YW5jZVtpXS5yaW5nLnNjaGVkOwotCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0
ZV9ycXNbaV0gPQotCQkJJnNjaGVkLT5zY2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfS0VSTkVM
XTsKKwkJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfc2NoZWRzW2ldID0KKwkJCSAmYWRldi0+c2Rt
YS5pbnN0YW5jZVtpXS5yaW5nLnNjaGVkOwogCX0KLQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9u
dW1fcnFzID0gYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOworCWFkZXYtPnZtX21hbmFnZXIudm1f
cHRlX251bV9zY2hlZHMgPSBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7CiB9CiAKIGNvbnN0IHN0
cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lvbiBzZG1hX3YzXzBfaXBfYmxvY2sgPQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCAzNTBiMmM5OWZlZmMuLmJkOWVkMzNi
YWI0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTI0MTEsMTAg
KzI0MTEsOSBAQCBzdGF0aWMgdm9pZCBzZG1hX3Y0XzBfc2V0X3ZtX3B0ZV9mdW5jcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAkJCXNjaGVkID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0u
cGFnZS5zY2hlZDsKIAkJZWxzZQogCQkJc2NoZWQgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVtpXS5y
aW5nLnNjaGVkOwotCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9ycXNbaV0gPQotCQkJJnNjaGVk
LT5zY2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfS0VSTkVMXTsKKwkJYWRldi0+dm1fbWFuYWdl
ci52bV9wdGVfc2NoZWRzW2ldID0gc2NoZWQ7CiAJfQotCWFkZXYtPnZtX21hbmFnZXIudm1fcHRl
X251bV9ycXMgPSBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7CisJYWRldi0+dm1fbWFuYWdlci52
bV9wdGVfbnVtX3NjaGVkcyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsKIH0KIAogY29uc3Qg
c3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9uIHNkbWFfdjRfMF9pcF9ibG9jayA9IHsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKaW5kZXggNjRjNTNlZWQ3ZmFjLi42M2Y2
NjdjZmUzZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCkBAIC0xNzIz
LDE3ICsxNzIzLDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3ZtX3B0ZV9mdW5jcyBz
ZG1hX3Y1XzBfdm1fcHRlX2Z1bmNzID0gewogCiBzdGF0aWMgdm9pZCBzZG1hX3Y1XzBfc2V0X3Zt
X3B0ZV9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQlzdHJ1Y3QgZHJtX2dw
dV9zY2hlZHVsZXIgKnNjaGVkOwogCXVuc2lnbmVkIGk7CiAKIAlpZiAoYWRldi0+dm1fbWFuYWdl
ci52bV9wdGVfZnVuY3MgPT0gTlVMTCkgewogCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9mdW5j
cyA9ICZzZG1hX3Y1XzBfdm1fcHRlX2Z1bmNzOwogCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2Rt
YS5udW1faW5zdGFuY2VzOyBpKyspIHsKLQkJCXNjaGVkID0gJmFkZXYtPnNkbWEuaW5zdGFuY2Vb
aV0ucmluZy5zY2hlZDsKLQkJCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX3Jxc1tpXSA9Ci0JCQkJ
JnNjaGVkLT5zY2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfS0VSTkVMXTsKKwkJCWFkZXYtPnZt
X21hbmFnZXIudm1fcHRlX3NjaGVkc1tpXSA9CisJCQkJJmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0u
cmluZy5zY2hlZDsKIAkJfQotCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gYWRl
di0+c2RtYS5udW1faW5zdGFuY2VzOworCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fc2No
ZWRzID0gYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOwogCX0KIH0KIApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zaV9kbWEuYwppbmRleCAxMjJkZjA3MzJmMGMuLjlhZDg1ZWRkZjljNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2lfZG1hLmMKQEAgLTgzNSwxNiArODM1LDE0IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X3ZtX3B0ZV9mdW5jcyBzaV9kbWFfdm1fcHRlX2Z1bmNzID0gewogCiBz
dGF0aWMgdm9pZCBzaV9kbWFfc2V0X3ZtX3B0ZV9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIHsKLQlzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkOwogCXVuc2lnbmVkIGk7
CiAKIAlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9mdW5jcyA9ICZzaV9kbWFfdm1fcHRlX2Z1bmNz
OwogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgewotCQlz
Y2hlZCA9ICZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmcuc2NoZWQ7Ci0JCWFkZXYtPnZtX21h
bmFnZXIudm1fcHRlX3Jxc1tpXSA9Ci0JCQkmc2NoZWQtPnNjaGVkX3JxW0RSTV9TQ0hFRF9QUklP
UklUWV9LRVJORUxdOworCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9zY2hlZHNbaV0gPQorCQkJ
JmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucmluZy5zY2hlZDsKIAl9Ci0JYWRldi0+dm1fbWFuYWdl
ci52bV9wdGVfbnVtX3JxcyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsKKwlhZGV2LT52bV9t
YW5hZ2VyLnZtX3B0ZV9udW1fc2NoZWRzID0gYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOwogfQog
CiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lwX2Jsb2NrX3ZlcnNpb24gc2lfZG1hX2lwX2Jsb2NrID0K
LS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
