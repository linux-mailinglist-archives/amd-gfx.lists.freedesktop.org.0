Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616D2A4035
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Nov 2020 10:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D13B6EC5E;
	Tue,  3 Nov 2020 09:30:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA2CC6EC44;
 Tue,  3 Nov 2020 09:30:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B272B135;
 Tue,  3 Nov 2020 09:30:23 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v7 07/10] drm/gem: Update internal GEM vmap/vunmap interfaces
 to use struct dma_buf_map
Date: Tue,  3 Nov 2020 10:30:12 +0100
Message-Id: <20201103093015.1063-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

R0VNJ3Mgdm1hcCBhbmQgdnVubWFwIGludGVyZmFjZXMgbm93IHdyYXAgbWVtb3J5IHBvaW50ZXJz
IGluIHN0cnVjdApkbWFfYnVmX21hcC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KVGVzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyAgIHwgMTggKysrKysrKysrKyst
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgfCAyNiArKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oIHwgIDUgKysrLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgICB8IDE0ICsrKystLS0tLS0tLS0tCiA0IGZp
bGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Ns
aWVudC5jCmluZGV4IDQ5NWY0N2QyM2Q4Ny4uYWMwMDgyYmVkOTY2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50
LmMKQEAgLTMsNiArMyw3IEBACiAgKiBDb3B5cmlnaHQgMjAxOCBOb3JhbGYgVHLDuG5uZXMKICAq
LwogCisjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi1tYXAuaD4KICNpbmNsdWRlIDxsaW51eC9saXN0
Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4K
QEAgLTMwNCw3ICszMDUsOCBAQCBkcm1fY2xpZW50X2J1ZmZlcl9jcmVhdGUoc3RydWN0IGRybV9j
bGllbnRfZGV2ICpjbGllbnQsIHUzMiB3aWR0aCwgdTMyIGhlaWdodCwgdQogICovCiB2b2lkICpk
cm1fY2xpZW50X2J1ZmZlcl92bWFwKHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyKQog
ewotCXZvaWQgKnZhZGRyOworCXN0cnVjdCBkbWFfYnVmX21hcCBtYXA7CisJaW50IHJldDsKIAog
CWlmIChidWZmZXItPnZhZGRyKQogCQlyZXR1cm4gYnVmZmVyLT52YWRkcjsKQEAgLTMxNywxMyAr
MzE5LDEzIEBAIHZvaWQgKmRybV9jbGllbnRfYnVmZmVyX3ZtYXAoc3RydWN0IGRybV9jbGllbnRf
YnVmZmVyICpidWZmZXIpCiAJICogZmRfaW5zdGFsbCBzdGVwIG91dCBvZiB0aGUgZHJpdmVyIGJh
Y2tlbmQgaG9va3MsIHRvIG1ha2UgdGhhdAogCSAqIGZpbmFsIHN0ZXAgb3B0aW9uYWwgZm9yIGlu
dGVybmFsIHVzZXJzLgogCSAqLwotCXZhZGRyID0gZHJtX2dlbV92bWFwKGJ1ZmZlci0+Z2VtKTsK
LQlpZiAoSVNfRVJSKHZhZGRyKSkKLQkJcmV0dXJuIHZhZGRyOworCXJldCA9IGRybV9nZW1fdm1h
cChidWZmZXItPmdlbSwgJm1hcCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIEVSUl9QVFIocmV0KTsK
IAotCWJ1ZmZlci0+dmFkZHIgPSB2YWRkcjsKKwlidWZmZXItPnZhZGRyID0gbWFwLnZhZGRyOwog
Ci0JcmV0dXJuIHZhZGRyOworCXJldHVybiBtYXAudmFkZHI7CiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9jbGllbnRfYnVmZmVyX3ZtYXApOwogCkBAIC0zMzcsNyArMzM5LDkgQEAgRVhQT1JUX1NZTUJP
TChkcm1fY2xpZW50X2J1ZmZlcl92bWFwKTsKICAqLwogdm9pZCBkcm1fY2xpZW50X2J1ZmZlcl92
dW5tYXAoc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIpCiB7Ci0JZHJtX2dlbV92dW5t
YXAoYnVmZmVyLT5nZW0sIGJ1ZmZlci0+dmFkZHIpOworCXN0cnVjdCBkbWFfYnVmX21hcCBtYXAg
PSBETUFfQlVGX01BUF9JTklUX1ZBRERSKGJ1ZmZlci0+dmFkZHIpOworCisJZHJtX2dlbV92dW5t
YXAoYnVmZmVyLT5nZW0sICZtYXApOwogCWJ1ZmZlci0+dmFkZHIgPSBOVUxMOwogfQogRVhQT1JU
X1NZTUJPTChkcm1fY2xpZW50X2J1ZmZlcl92dW5tYXApOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggNDIzMWZk
YTI2ZTcwLi5lYjJkMjNlMDRiZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwpAQCAtMTIwNiwzMiArMTIwNiwzMiBA
QCB2b2lkIGRybV9nZW1fdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJCW9iai0+
ZnVuY3MtPnVucGluKG9iaik7CiB9CiAKLXZvaWQgKmRybV9nZW1fdm1hcChzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaikKK2ludCBkcm1fZ2VtX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQogewotCXN0cnVjdCBkbWFfYnVmX21hcCBtYXA7
CiAJaW50IHJldDsKIAogCWlmICghb2JqLT5mdW5jcy0+dm1hcCkKLQkJcmV0dXJuIEVSUl9QVFIo
LUVPUE5PVFNVUFApOworCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAKLQlyZXQgPSBvYmotPmZ1bmNz
LT52bWFwKG9iaiwgJm1hcCk7CisJcmV0ID0gb2JqLT5mdW5jcy0+dm1hcChvYmosIG1hcCk7CiAJ
aWYgKHJldCkKLQkJcmV0dXJuIEVSUl9QVFIocmV0KTsKLQllbHNlIGlmIChkbWFfYnVmX21hcF9p
c19udWxsKCZtYXApKQotCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKKwkJcmV0dXJuIHJldDsK
KwllbHNlIGlmIChkbWFfYnVmX21hcF9pc19udWxsKG1hcCkpCisJCXJldHVybiAtRU5PTUVNOwog
Ci0JcmV0dXJuIG1hcC52YWRkcjsKKwlyZXR1cm4gMDsKIH0KIAotdm9pZCBkcm1fZ2VtX3Z1bm1h
cChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCit2b2lkIGRybV9nZW1f
dnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1h
cCkKIHsKLQlzdHJ1Y3QgZG1hX2J1Zl9tYXAgbWFwID0gRE1BX0JVRl9NQVBfSU5JVF9WQUREUih2
YWRkcik7Ci0KLQlpZiAoIXZhZGRyKQorCWlmIChkbWFfYnVmX21hcF9pc19udWxsKG1hcCkpCiAJ
CXJldHVybjsKIAogCWlmIChvYmotPmZ1bmNzLT52dW5tYXApCi0JCW9iai0+ZnVuY3MtPnZ1bm1h
cChvYmosICZtYXApOworCQlvYmotPmZ1bmNzLT52dW5tYXAob2JqLCBtYXApOworCisJLyogQWx3
YXlzIHNldCB0aGUgbWFwcGluZyB0byBOVUxMLiBDYWxsZXJzIG1heSByZWx5IG9uIHRoaXMuICov
CisJZG1hX2J1Zl9tYXBfY2xlYXIobWFwKTsKIH0KIAogLyoqCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ludGVybmFsLmggYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgK
aW5kZXggMmJkYWMzNTU3NzY1Li44MWQzODZiNWI5MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1faW50ZXJuYWwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgK
QEAgLTMzLDYgKzMzLDcgQEAKIAogc3RydWN0IGRlbnRyeTsKIHN0cnVjdCBkbWFfYnVmOworc3Ry
dWN0IGRtYV9idWZfbWFwOwogc3RydWN0IGRybV9jb25uZWN0b3I7CiBzdHJ1Y3QgZHJtX2NydGM7
CiBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyOwpAQCAtMTg3LDggKzE4OCw4IEBAIHZvaWQgZHJtX2dl
bV9wcmludF9pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwK
IAogaW50IGRybV9nZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIHZvaWQgZHJt
X2dlbV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7Ci12b2lkICpkcm1fZ2VtX3Zt
YXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwotdm9pZCBkcm1fZ2VtX3Z1bm1hcChzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpOworaW50IGRybV9nZW1fdm1hcChz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRtYV9idWZfbWFwICptYXApOwordm9p
ZCBkcm1fZ2VtX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRtYV9i
dWZfbWFwICptYXApOwogCiAvKiBkcm1fZGVidWdmcy5jIGRybV9kZWJ1Z2ZzX2NyYy5jICovCiAj
aWYgZGVmaW5lZChDT05GSUdfREVCVUdfRlMpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKaW5kZXggMTg3YjU1ZWRl
NjJlLi4zMDJlMmJiM2RmZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKQEAgLTY2NywyMSArNjY3LDE1IEBA
IEVYUE9SVF9TWU1CT0woZHJtX2dlbV91bm1hcF9kbWFfYnVmKTsKICAqCiAgKiBTZXRzIHVwIGEg
a2VybmVsIHZpcnR1YWwgbWFwcGluZy4gVGhpcyBjYW4gYmUgdXNlZCBhcyB0aGUgJmRtYV9idWZf
b3BzLnZtYXAKICAqIGNhbGxiYWNrLiBDYWxscyBpbnRvICZkcm1fZ2VtX29iamVjdF9mdW5jcy52
bWFwIGZvciBkZXZpY2Ugc3BlY2lmaWMgaGFuZGxpbmcuCisgKiBUaGUga2VybmVsIHZpcnR1YWwg
YWRkcmVzcyBpcyByZXR1cm5lZCBpbiBtYXAuCiAgKgotICogUmV0dXJucyB0aGUga2VybmVsIHZp
cnR1YWwgYWRkcmVzcyBvciBOVUxMIG9uIGZhaWx1cmUuCisgKiBSZXR1cm5zIDAgb24gc3VjY2Vz
cyBvciBhIG5lZ2F0aXZlIGVycm5vIGNvZGUgb3RoZXJ3aXNlLgogICovCiBpbnQgZHJtX2dlbV9k
bWFidWZfdm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Ziwgc3RydWN0IGRtYV9idWZfbWFwICpt
YXApCiB7CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVmLT5wcml2OwotCXZv
aWQgKnZhZGRyOwogCi0JdmFkZHIgPSBkcm1fZ2VtX3ZtYXAob2JqKTsKLQlpZiAoSVNfRVJSKHZh
ZGRyKSkKLQkJcmV0dXJuIFBUUl9FUlIodmFkZHIpOwotCi0JZG1hX2J1Zl9tYXBfc2V0X3ZhZGRy
KG1hcCwgdmFkZHIpOwotCi0JcmV0dXJuIDA7CisJcmV0dXJuIGRybV9nZW1fdm1hcChvYmosIG1h
cCk7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9nZW1fZG1hYnVmX3ZtYXApOwogCkBAIC02OTcsNyAr
NjkxLDcgQEAgdm9pZCBkcm1fZ2VtX2RtYWJ1Zl92dW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYV9i
dWYsIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQogewogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqID0gZG1hX2J1Zi0+cHJpdjsKIAotCWRybV9nZW1fdnVubWFwKG9iaiwgbWFwLT52YWRkcik7
CisJZHJtX2dlbV92dW5tYXAob2JqLCBtYXApOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX2Rt
YWJ1Zl92dW5tYXApOwogCi0tIAoyLjI5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo=
