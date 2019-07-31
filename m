Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF27C987
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 18:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BBA6E10F;
	Wed, 31 Jul 2019 16:59:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36036E0B8;
 Wed, 31 Jul 2019 16:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2F7E928B7B7
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] drm/tegra: Provide ddc symlink in output connector
 sysfs directory
Date: Wed, 31 Jul 2019 18:58:17 +0200
Message-Id: <da3269686a37100c1ead17026f92e31492ce4717.1564591626.git.andrzej.p@collabora.com>
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
 Emil Velikov <emil.velikov@collabora.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Shashank Sharma <shashank.sharma@intel.com>, linux-tegra@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>,
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
L2dwdS9kcm0vdGVncmEvaGRtaS5jIHwgNyArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMgIHwgNyArKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYwppbmRleCAzMzRjNGQ3ZDIzOGIuLjQxNmEyODYy
YTg0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCkBAIC0xNDI1LDkgKzE0MjUsMTAgQEAgc3RhdGljIGlu
dCB0ZWdyYV9oZG1pX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAogCWhkbWkt
Pm91dHB1dC5kZXYgPSBjbGllbnQtPmRldjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkcm0sICZo
ZG1pLT5vdXRwdXQuY29ubmVjdG9yLAotCQkJICAgJnRlZ3JhX2hkbWlfY29ubmVjdG9yX2Z1bmNz
LAotCQkJICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKTsKKwlkcm1fY29ubmVjdG9yX2luaXRf
d2l0aF9kZGMoZHJtLCAmaGRtaS0+b3V0cHV0LmNvbm5lY3RvciwKKwkJCQkgICAgJnRlZ3JhX2hk
bWlfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCisJ
CQkJICAgIGhkbWktPm91dHB1dC5kZGMpOwogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaGRt
aS0+b3V0cHV0LmNvbm5lY3RvciwKIAkJCQkgJnRlZ3JhX2hkbWlfY29ubmVjdG9yX2hlbHBlcl9m
dW5jcyk7CiAJaGRtaS0+b3V0cHV0LmNvbm5lY3Rvci5kcG1zID0gRFJNX01PREVfRFBNU19PRkY7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvc29yLmMKaW5kZXggNGZmZTM3OTRlNmQzLi4zYTY5ZTM4N2M2MmQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvc29yLmMKQEAgLTI4MzIsOSArMjgzMiwxMCBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9pbml0
KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiAKIAlzb3ItPm91dHB1dC5kZXYgPSBzb3It
PmRldjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkcm0sICZzb3ItPm91dHB1dC5jb25uZWN0b3Is
Ci0JCQkgICAmdGVncmFfc29yX2Nvbm5lY3Rvcl9mdW5jcywKLQkJCSAgIGNvbm5lY3Rvcik7CisJ
ZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRybSwgJnNvci0+b3V0cHV0LmNvbm5lY3RvciwK
KwkJCQkgICAgJnRlZ3JhX3Nvcl9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIGNvbm5lY3RvciwK
KwkJCQkgICAgc29yLT5vdXRwdXQuZGRjKTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnNv
ci0+b3V0cHV0LmNvbm5lY3RvciwKIAkJCQkgJnRlZ3JhX3Nvcl9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzKTsKIAlzb3ItPm91dHB1dC5jb25uZWN0b3IuZHBtcyA9IERSTV9NT0RFX0RQTVNfT0ZGOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
