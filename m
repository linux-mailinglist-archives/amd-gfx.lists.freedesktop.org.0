Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A27C9A3
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51ED6E181;
	Wed, 31 Jul 2019 17:00:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8476E151;
 Wed, 31 Jul 2019 17:00:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 1DAE328A758
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/13] drm/i915: Provide ddc symlink in hdmi connector sysfs
 directory
Date: Wed, 31 Jul 2019 18:58:22 +0200
Message-Id: <fcacfbfa9bbc1b721a630fec885782f98e84d356.1564591626.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
References: <cover.1564591626.git.andrzej.p@collabora.com>
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
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
 amd-gfx@lists.freedesktop.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyB8IDEyICsrKysrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCmluZGV4IDBlYmVjNjliYmJmYy4uN2U2OWU1
NzgyZjZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hk
bWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwpAQCAt
MzA4NCw2ICszMDg0LDcgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9yKHN0cnVjdCBp
bnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAogCXN0cnVjdCBpbnRlbF9lbmNvZGVy
ICppbnRlbF9lbmNvZGVyID0gJmludGVsX2RpZ19wb3J0LT5iYXNlOwogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBpbnRlbF9lbmNvZGVyLT5iYXNlLmRldjsKIAlzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7CisJc3RydWN0IGkyY19hZGFwdGVyICpkZGM7
CiAJZW51bSBwb3J0IHBvcnQgPSBpbnRlbF9lbmNvZGVyLT5wb3J0OwogCiAJRFJNX0RFQlVHX0tN
UygiQWRkaW5nIEhETUkgY29ubmVjdG9yIG9uIHBvcnQgJWNcbiIsCkBAIC0zMDk0LDggKzMwOTUs
MTMgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9yKHN0cnVjdCBpbnRlbF9kaWdpdGFs
X3BvcnQgKmludGVsX2RpZ19wb3J0LAogCQkgaW50ZWxfZGlnX3BvcnQtPm1heF9sYW5lcywgcG9y
dF9uYW1lKHBvcnQpKSkKIAkJcmV0dXJuOwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29u
bmVjdG9yLCAmaW50ZWxfaGRtaV9jb25uZWN0b3JfZnVuY3MsCi0JCQkgICBEUk1fTU9ERV9DT05O
RUNUT1JfSERNSUEpOworCWludGVsX2hkbWktPmRkY19idXMgPSBpbnRlbF9oZG1pX2RkY19waW4o
ZGV2X3ByaXYsIHBvcnQpOworCWRkYyA9IGludGVsX2dtYnVzX2dldF9hZGFwdGVyKGRldl9wcml2
LCBpbnRlbF9oZG1pLT5kZGNfYnVzKTsKKworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhk
ZXYsIGNvbm5lY3RvciwKKwkJCQkgICAgJmludGVsX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAorCQkJ
CSAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCisJCQkJICAgIGRkYyk7CiAJZHJtX2Nvbm5l
Y3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJmludGVsX2hkbWlfY29ubmVjdG9yX2hlbHBlcl9m
dW5jcyk7CiAKIAljb25uZWN0b3ItPmludGVybGFjZV9hbGxvd2VkID0gMTsKQEAgLTMxMDUsOCAr
MzExMSw2IEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGln
aXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKIAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAx
MCB8fCBJU19HRU1JTklMQUtFKGRldl9wcml2KSkKIAkJY29ubmVjdG9yLT55Y2Jjcl80MjBfYWxs
b3dlZCA9IHRydWU7CiAKLQlpbnRlbF9oZG1pLT5kZGNfYnVzID0gaW50ZWxfaGRtaV9kZGNfcGlu
KGRldl9wcml2LCBwb3J0KTsKLQogCWlmIChXQVJOX09OKHBvcnQgPT0gUE9SVF9BKSkKIAkJcmV0
dXJuOwogCWludGVsX2VuY29kZXItPmhwZF9waW4gPSBpbnRlbF9ocGRfcGluX2RlZmF1bHQoZGV2
X3ByaXYsIHBvcnQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
