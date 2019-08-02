Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5215D7EC02
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 07:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329446ECC0;
	Fri,  2 Aug 2019 05:23:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF0D6E8AE;
 Fri,  2 Aug 2019 05:22:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4186330832E1;
 Fri,  2 Aug 2019 05:22:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 486C960BE2;
 Fri,  2 Aug 2019 05:22:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 078569D7C; Fri,  2 Aug 2019 07:22:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/17] drm/amdgpu: use embedded gem object
Date: Fri,  2 Aug 2019 07:22:35 +0200
Message-Id: <20190802052247.18427-6-kraxel@redhat.com>
In-Reply-To: <20190802052247.18427-1-kraxel@redhat.com>
References: <20190802052247.18427-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 02 Aug 2019 05:22:57 +0000 (UTC)
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, thomas@shipmail.org,
 tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 bskeggs@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHJvcCBkcm1fZ2VtX29iamVjdCBmcm9tIGFtZGdwdV9ibywgdXNlIHRoZQp0dG1fYnVmZmVyX29i
amVjdC5iYXNlIGluc3RlYWQuCgpCdWlsZCB0ZXN0ZWQgb25seS4KClNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uaCAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5oICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmMgIHwgMTAgKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0u
aAppbmRleCBiOGJhNmUyN2M2MWYuLjJmMTcxNTBlMjZlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uaApAQCAtMzEsNyArMzEsNyBAQAogICovCiAKICNkZWZpbmUgQU1E
R1BVX0dFTV9ET01BSU5fTUFYCQkweDMKLSNkZWZpbmUgZ2VtX3RvX2FtZGdwdV9ibyhnb2JqKSBj
b250YWluZXJfb2YoKGdvYmopLCBzdHJ1Y3QgYW1kZ3B1X2JvLCBnZW1fYmFzZSkKKyNkZWZpbmUg
Z2VtX3RvX2FtZGdwdV9ibyhnb2JqKSBjb250YWluZXJfb2YoKGdvYmopLCBzdHJ1Y3QgYW1kZ3B1
X2JvLCB0Ym8uYmFzZSkKIAogdm9pZCBhbWRncHVfZ2VtX29iamVjdF9mcmVlKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqKTsKIGludCBhbWRncHVfZ2VtX29iamVjdF9vcGVuKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5oCmluZGV4IGQ2MDU5M2NjNDM2ZS4uNjQ1YTE4OWQzNjVjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCkBAIC05NCw3ICs5NCw2IEBAIHN0cnVjdCBhbWRn
cHVfYm8gewogCS8qIHBlciBWTSBzdHJ1Y3R1cmUgZm9yIHBhZ2UgdGFibGVzIGFuZCB3aXRoIHZp
cnR1YWwgYWRkcmVzc2VzICovCiAJc3RydWN0IGFtZGdwdV92bV9ib19iYXNlCSp2bV9ibzsKIAkv
KiBDb25zdGFudCBhZnRlciBpbml0aWFsaXphdGlvbiAqLwotCXN0cnVjdCBkcm1fZ2VtX29iamVj
dAkJZ2VtX2Jhc2U7CiAJc3RydWN0IGFtZGdwdV9ibwkJKnBhcmVudDsKIAlzdHJ1Y3QgYW1kZ3B1
X2JvCQkqc2hhZG93OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9i
dWYuYwppbmRleCAwMmNkODQ1ZTc3YjMuLjRlZTQ1MmZlMDUyNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCkBAIC0zOTMsNyArMzkzLDcgQEAgYW1kZ3B1
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJYm8t
PnByaW1lX3NoYXJlZF9jb3VudCA9IDE7CiAKIAl3d19tdXRleF91bmxvY2soJnJlc3YtPmxvY2sp
OwotCXJldHVybiAmYm8tPmdlbV9iYXNlOworCXJldHVybiAmYm8tPnRiby5iYXNlOwogCiBlcnJv
cjoKIAl3d19tdXRleF91bmxvY2soJnJlc3YtPmxvY2spOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jCmluZGV4IDkzOWY4MzA1NTExYi4uOWZmMDUwMWNmMWUwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCkBAIC04NSw3ICs4NSw3IEBAIGludCBh
bWRncHVfZ2VtX29iamVjdF9jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2ln
bmVkIGxvbmcgc2l6ZSwKIAkJfQogCQlyZXR1cm4gcjsKIAl9Ci0JKm9iaiA9ICZiby0+Z2VtX2Jh
c2U7CisJKm9iaiA9ICZiby0+dGJvLmJhc2U7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTY4OSw3ICs2
ODksNyBAQCBpbnQgYW1kZ3B1X2dlbV9vcF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAogCQlzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fY3JlYXRlX2luIGluZm87CiAJCXZv
aWQgX191c2VyICpvdXQgPSB1NjRfdG9fdXNlcl9wdHIoYXJncy0+dmFsdWUpOwogCi0JCWluZm8u
Ym9fc2l6ZSA9IHJvYmotPmdlbV9iYXNlLnNpemU7CisJCWluZm8uYm9fc2l6ZSA9IHJvYmotPnRi
by5iYXNlLnNpemU7CiAJCWluZm8uYWxpZ25tZW50ID0gcm9iai0+dGJvLm1lbS5wYWdlX2FsaWdu
bWVudCA8PCBQQUdFX1NISUZUOwogCQlpbmZvLmRvbWFpbnMgPSByb2JqLT5wcmVmZXJyZWRfZG9t
YWluczsKIAkJaW5mby5kb21haW5fZmxhZ3MgPSByb2JqLT5mbGFnczsKQEAgLTgxOSw4ICs4MTks
OCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2dlbV9ib19pbmZvKGludCBpZCwgdm9pZCAq
cHRyLCB2b2lkICpkYXRhKQogCWlmIChwaW5fY291bnQpCiAJCXNlcV9wcmludGYobSwgIiBwaW4g
Y291bnQgJWQiLCBwaW5fY291bnQpOwogCi0JZG1hX2J1ZiA9IFJFQURfT05DRShiby0+Z2VtX2Jh
c2UuZG1hX2J1Zik7Ci0JYXR0YWNobWVudCA9IFJFQURfT05DRShiby0+Z2VtX2Jhc2UuaW1wb3J0
X2F0dGFjaCk7CisJZG1hX2J1ZiA9IFJFQURfT05DRShiby0+dGJvLmJhc2UuZG1hX2J1Zik7CisJ
YXR0YWNobWVudCA9IFJFQURfT05DRShiby0+dGJvLmJhc2UuaW1wb3J0X2F0dGFjaCk7CiAKIAlp
ZiAoYXR0YWNobWVudCkKIAkJc2VxX3ByaW50ZihtLCAiIGltcG9ydGVkIGZyb20gJXAiLCBkbWFf
YnVmKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCAx
OWVjNzc1YjdhYTguLjhkNjQ5ZDhhNzMwMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYwpAQCAtODUsOSArODUsOSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfYm9f
ZGVzdHJveShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibykKIAogCWFtZGdwdV9ib19rdW5t
YXAoYm8pOwogCi0JaWYgKGJvLT5nZW1fYmFzZS5pbXBvcnRfYXR0YWNoKQotCQlkcm1fcHJpbWVf
Z2VtX2Rlc3Ryb3koJmJvLT5nZW1fYmFzZSwgYm8tPnRiby5zZyk7Ci0JZHJtX2dlbV9vYmplY3Rf
cmVsZWFzZSgmYm8tPmdlbV9iYXNlKTsKKwlpZiAoYm8tPnRiby5iYXNlLmltcG9ydF9hdHRhY2gp
CisJCWRybV9wcmltZV9nZW1fZGVzdHJveSgmYm8tPnRiby5iYXNlLCBiby0+dGJvLnNnKTsKKwlk
cm1fZ2VtX29iamVjdF9yZWxlYXNlKCZiby0+dGJvLmJhc2UpOwogCS8qIGluIGNhc2UgYW1kZ3B1
X2RldmljZV9yZWNvdmVyX3ZyYW0gZ290IE5VTEwgb2YgYm8tPnBhcmVudCAqLwogCWlmICghbGlz
dF9lbXB0eSgmYm8tPnNoYWRvd19saXN0KSkgewogCQltdXRleF9sb2NrKCZhZGV2LT5zaGFkb3df
bGlzdF9sb2NrKTsKQEAgLTQ1NCw3ICs0NTQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19j
cmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJYm8gPSBremFsbG9jKHNpemVvZihz
dHJ1Y3QgYW1kZ3B1X2JvKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKGJvID09IE5VTEwpCiAJCXJldHVy
biAtRU5PTUVNOwotCWRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdChhZGV2LT5kZGV2LCAmYm8t
PmdlbV9iYXNlLCBzaXplKTsKKwlkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoYWRldi0+ZGRl
diwgJmJvLT50Ym8uYmFzZSwgc2l6ZSk7CiAJSU5JVF9MSVNUX0hFQUQoJmJvLT5zaGFkb3dfbGlz
dCk7CiAJYm8tPnZtX2JvID0gTlVMTDsKIAliby0+cHJlZmVycmVkX2RvbWFpbnMgPSBicC0+cHJl
ZmVycmVkX2RvbWFpbiA/IGJwLT5wcmVmZXJyZWRfZG9tYWluIDoKQEAgLTUwOSw3ICs1MDksNyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpCiAJCXJldHVybiByOwogCi0JYm8tPmdlbV9iYXNl
LnJlc3YgPSBiby0+dGJvLnJlc3Y7CisJYm8tPnRiby5iYXNlLnJlc3YgPSBiby0+dGJvLnJlc3Y7
CiAKIAlpZiAoIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUoJmFkZXYtPmdtYykgJiYKIAkg
ICAgYm8tPnRiby5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0gJiYKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCBlNTFiNDhhYzQ4ZWIuLmIzOWI1MDE3NThkZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtMjI3LDcgKzIyNyw3
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywgc3RydWN0IGZpbGUgKmZpbHApCiAKIAlpZiAoYW1kZ3B1X3R0bV90dF9nZXRfdXNl
cm1tKGJvLT50dG0pKQogCQlyZXR1cm4gLUVQRVJNOwotCXJldHVybiBkcm1fdm1hX25vZGVfdmVy
aWZ5X2FjY2VzcygmYWJvLT5nZW1fYmFzZS52bWFfbm9kZSwKKwlyZXR1cm4gZHJtX3ZtYV9ub2Rl
X3ZlcmlmeV9hY2Nlc3MoJmFiby0+dGJvLmJhc2Uudm1hX25vZGUsCiAJCQkJCSAgZmlscC0+cHJp
dmF0ZV9kYXRhKTsKIH0KIAotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
