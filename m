Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E9D30FA
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 20:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9956E3CB;
	Thu, 10 Oct 2019 18:57:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D386E444;
 Thu, 10 Oct 2019 16:28:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8AF26308620B;
 Thu, 10 Oct 2019 16:28:21 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-59.ams2.redhat.com
 [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD7D65C1B2;
 Thu, 10 Oct 2019 16:28:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
Subject: [PATCH] drm/amdgpu: Bail earlier when amdgpu.cik_/si_support is not
 set to 1
Date: Thu, 10 Oct 2019 18:28:17 +0200
Message-Id: <20191010162817.55446-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 10 Oct 2019 16:28:21 +0000 (UTC)
X-Mailman-Approved-At: Thu, 10 Oct 2019 18:57:06 +0000
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
Cc: David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QmFpbCBmcm9tIHRoZSBwY2lfZHJpdmVyIHByb2JlIGZ1bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0
aGUgZHJtX2RyaXZlcgpsb2FkIGZ1bmN0aW9uLgoKVGhpcyBhdm9pZCAvZGV2L2RyaS9jYXJkMCB0
ZW1wb3JhcmlseSBnZXR0aW5nIHJlZ2lzdGVyZWQgYW5kIHRoZW4KdW5yZWdpc3RlcmVkIGFnYWlu
LCBzZW5kaW5nIHVud2FudGVkIGFkZCAvIHJlbW92ZSB1ZGV2IGV2ZW50cyB0bwp1c2Vyc3BhY2Uu
CgpTcGVjaWZpY2FsbHkgdGhpcyBhdm9pZHMgdHJpZ2dlcmluZyB0aGUgKHVzZXJzcGFjZSkgYnVn
IGZpeGVkIGJ5IHRoaXMKcGx5bW91dGggbWVyZ2UtcmVxdWVzdDoKaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3BseW1vdXRoL3BseW1vdXRoL21lcmdlX3JlcXVlc3RzLzU5CgpOb3RlIHRo
YXQgZGVzcGl0ZSB0aGF0IGJlaW5nIGEgdXNlcnNwYWNlIGJ1Zywgbm90IHNlbmRpbmcgdW5uZWNl
c3NhcnkKdWRldiBldmVudHMgaXMgYSBnb29kIGlkZWEgaW4gZ2VuZXJhbC4KCkJ1Z0xpbms6IGh0
dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTQ5MDQ5MApTaWduZWQt
b2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyB8IDM1IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwg
MzUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmlu
ZGV4IDZmOGFhZjY1NWE5Zi4uMmEwMGEzNjEwNmIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCkBAIC0xMDQ4LDYgKzEwNDgsNDEgQEAgc3RhdGljIGludCBhbWRncHVf
cGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCQlyZXR1cm4gLUVOT0RFVjsKIAl9CiAK
KyNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQorCWlmICghYW1kZ3B1X3NpX3N1cHBvcnQpIHsK
KwkJc3dpdGNoIChmbGFncyAmIEFNRF9BU0lDX01BU0spIHsKKwkJY2FzZSBDSElQX1RBSElUSToK
KwkJY2FzZSBDSElQX1BJVENBSVJOOgorCQljYXNlIENISVBfVkVSREU6CisJCWNhc2UgQ0hJUF9P
TEFORDoKKwkJY2FzZSBDSElQX0hBSU5BTjoKKwkJCWRldl9pbmZvKCZwZGV2LT5kZXYsCisJCQkJ
ICJTSSBzdXBwb3J0IHByb3ZpZGVkIGJ5IHJhZGVvbi5cbiIpOworCQkJZGV2X2luZm8oJnBkZXYt
PmRldiwKKwkJCQkgIlVzZSByYWRlb24uc2lfc3VwcG9ydD0wIGFtZGdwdS5zaV9zdXBwb3J0PTEg
dG8gb3ZlcnJpZGUuXG4iCisJCQkJKTsKKwkJCXJldHVybiAtRU5PREVWOworCQl9CisJfQorI2Vu
ZGlmCisjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVfQ0lLCisJaWYgKCFhbWRncHVfY2lrX3N1cHBv
cnQpIHsKKwkJc3dpdGNoIChmbGFncyAmIEFNRF9BU0lDX01BU0spIHsKKwkJY2FzZSBDSElQX0tB
VkVSSToKKwkJY2FzZSBDSElQX0JPTkFJUkU6CisJCWNhc2UgQ0hJUF9IQVdBSUk6CisJCWNhc2Ug
Q0hJUF9LQUJJTkk6CisJCWNhc2UgQ0hJUF9NVUxMSU5TOgorCQkJZGV2X2luZm8oJnBkZXYtPmRl
diwKKwkJCQkgIkNJSyBzdXBwb3J0IHByb3ZpZGVkIGJ5IHJhZGVvbi5cbiIpOworCQkJZGV2X2lu
Zm8oJnBkZXYtPmRldiwKKwkJCQkgIlVzZSByYWRlb24uY2lrX3N1cHBvcnQ9MCBhbWRncHUuY2lr
X3N1cHBvcnQ9MSB0byBvdmVycmlkZS5cbiIKKwkJCQkpOworCQkJcmV0dXJuIC1FTk9ERVY7CisJ
CX0KKwl9CisjZW5kaWYKKwogCS8qIEdldCByaWQgb2YgdGhpbmdzIGxpa2Ugb2ZmYiAqLwogCXJl
dCA9IGRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMocGRl
diwgMCwgImFtZGdwdWRybWZiIik7CiAJaWYgKHJldCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9rbXMuYwppbmRleCBmMmMwOTc5ODNmNDguLmQ1NWY1YmFhODNkMyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwpAQCAtMTQ0LDQxICsxNDQsNiBAQCBpbnQg
YW1kZ3B1X2RyaXZlcl9sb2FkX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBs
b25nIGZsYWdzKQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2OwogCWludCByLCBhY3BpX3N0
YXR1czsKIAotI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX1NJCi0JaWYgKCFhbWRncHVfc2lfc3Vw
cG9ydCkgewotCQlzd2l0Y2ggKGZsYWdzICYgQU1EX0FTSUNfTUFTSykgewotCQljYXNlIENISVBf
VEFISVRJOgotCQljYXNlIENISVBfUElUQ0FJUk46Ci0JCWNhc2UgQ0hJUF9WRVJERToKLQkJY2Fz
ZSBDSElQX09MQU5EOgotCQljYXNlIENISVBfSEFJTkFOOgotCQkJZGV2X2luZm8oZGV2LT5kZXYs
Ci0JCQkJICJTSSBzdXBwb3J0IHByb3ZpZGVkIGJ5IHJhZGVvbi5cbiIpOwotCQkJZGV2X2luZm8o
ZGV2LT5kZXYsCi0JCQkJICJVc2UgcmFkZW9uLnNpX3N1cHBvcnQ9MCBhbWRncHUuc2lfc3VwcG9y
dD0xIHRvIG92ZXJyaWRlLlxuIgotCQkJCSk7Ci0JCQlyZXR1cm4gLUVOT0RFVjsKLQkJfQotCX0K
LSNlbmRpZgotI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0NJSwotCWlmICghYW1kZ3B1X2Npa19z
dXBwb3J0KSB7Ci0JCXN3aXRjaCAoZmxhZ3MgJiBBTURfQVNJQ19NQVNLKSB7Ci0JCWNhc2UgQ0hJ
UF9LQVZFUkk6Ci0JCWNhc2UgQ0hJUF9CT05BSVJFOgotCQljYXNlIENISVBfSEFXQUlJOgotCQlj
YXNlIENISVBfS0FCSU5JOgotCQljYXNlIENISVBfTVVMTElOUzoKLQkJCWRldl9pbmZvKGRldi0+
ZGV2LAotCQkJCSAiQ0lLIHN1cHBvcnQgcHJvdmlkZWQgYnkgcmFkZW9uLlxuIik7Ci0JCQlkZXZf
aW5mbyhkZXYtPmRldiwKLQkJCQkgIlVzZSByYWRlb24uY2lrX3N1cHBvcnQ9MCBhbWRncHUuY2lr
X3N1cHBvcnQ9MSB0byBvdmVycmlkZS5cbiIKLQkJCQkpOwotCQkJcmV0dXJuIC1FTk9ERVY7Ci0J
CX0KLQl9Ci0jZW5kaWYKLQogCWFkZXYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSksIEdGUF9LRVJORUwpOwogCWlmIChhZGV2ID09IE5VTEwpIHsKIAkJcmV0dXJuIC1FTk9N
RU07Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
