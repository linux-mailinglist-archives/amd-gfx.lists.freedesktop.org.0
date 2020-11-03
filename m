Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C214E2A4029
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Nov 2020 10:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340B6EC3C;
	Tue,  3 Nov 2020 09:30:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8854A6E8A2;
 Tue,  3 Nov 2020 09:30:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B16F0B11A;
 Tue,  3 Nov 2020 09:30:20 +0000 (UTC)
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
Subject: [PATCH v7 04/10] drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,
 vunmap}()
Date: Tue,  3 Nov 2020 10:30:09 +0100
Message-Id: <20201103093015.1063-5-tzimmermann@suse.de>
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
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9ucyBleHlub3NfZHJtX2dlbV9wcmltZV97dm1hcCx2dW5tYXB9KCkgYXJlIGVt
cHR5LiBSZW1vdmUKdGhlbSBiZWZvcmUgY2hhbmdpbmcgdGhlIGludGVyZmFjZSB0byB1c2Ugc3Ry
dWN0IGRybV9idWZfbWFwLiBBcyBhIHNpZGUKZWZmZWN0IG9mIHJlbW92aW5nIGRybV9nZW1fcHJp
bWVfdm1hcCgpLCB0aGUgZXJyb3IgY29kZSBjaGFuZ2VzIGZyb20KRU5PTUVNIHRvIEVPUE5PVFNV
UFAuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
VGVzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jIHwgMTIgLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmggfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMK
aW5kZXggNGFmYmY1MTA5Y2JmLi40Mzk2MjI0MjI3ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZ2VtLmMKQEAgLTEzNSw4ICsxMzUsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHZtX29wZXJhdGlvbnNfc3RydWN0IGV4eW5vc19kcm1fZ2VtX3ZtX29wcyA9IHsKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZXh5bm9zX2RybV9nZW1fb2JqZWN0X2Z1
bmNzID0gewogCS5mcmVlID0gZXh5bm9zX2RybV9nZW1fZnJlZV9vYmplY3QsCiAJLmdldF9zZ190
YWJsZSA9IGV4eW5vc19kcm1fZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKLQkudm1hcCA9IGV4eW5v
c19kcm1fZ2VtX3ByaW1lX3ZtYXAsCi0JLnZ1bm1hcAk9IGV4eW5vc19kcm1fZ2VtX3ByaW1lX3Z1
bm1hcCwKIAkudm1fb3BzID0gJmV4eW5vc19kcm1fZ2VtX3ZtX29wcywKIH07CiAKQEAgLTQ2OSwx
NiArNDY3LDYgQEAgZXh5bm9zX2RybV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAJcmV0dXJuICZleHlub3NfZ2VtLT5iYXNlOwogfQogCi12b2lkICpl
eHlub3NfZHJtX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQotewot
CXJldHVybiBOVUxMOwotfQotCi12b2lkIGV4eW5vc19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCi17Ci0JLyogTm90aGluZyB0byBk
byAqLwotfQotCiBpbnQgZXh5bm9zX2RybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwKIAkJCSAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oCmluZGV4IDc0ZTkyNmFiZWZmMC4uYTIz
MjcyZmI5NmZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z2VtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oCkBAIC0x
MDcsOCArMTA3LDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoKIGV4eW5vc19kcm1fZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCSAgICAgc3Ry
dWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAogCQkJCSAgICAgc3RydWN0IHNnX3RhYmxl
ICpzZ3QpOwotdm9pZCAqZXh5bm9zX2RybV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaik7Ci12b2lkIGV4eW5vc19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpOwogaW50IGV4eW5vc19kcm1fZ2VtX3ByaW1l
X21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSk7CiAKLS0gCjIuMjkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
