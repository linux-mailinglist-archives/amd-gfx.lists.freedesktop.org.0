Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006439D6A2
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 21:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630496E2D2;
	Mon, 26 Aug 2019 19:27:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA626E2D2;
 Mon, 26 Aug 2019 19:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B79E5283D3B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 10/14] drm/vc4: Provide ddc symlink in connector sysfs
 directory
Date: Mon, 26 Aug 2019 21:25:52 +0200
Message-Id: <4e2c062c45c4bb63a6baaeef0ef229f85abd400b.1566845537.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
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
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCmlu
ZGV4IGVlN2Q0ZTdiMGVlMy4uZWI1N2M5MDdhMjU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCkBA
IC0yNjcsNyArMjY3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyB2YzRfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0KIH07CiAKIHN0YXRpYyBz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdmM0X2hkbWlfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKLQkJCQkJCSAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQorCQkJ
CQkJICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCisJCQkJCQkgICAgIHN0cnVjdCBp
MmNfYWRhcHRlciAqZGRjKQogewogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7CiAJ
c3RydWN0IHZjNF9oZG1pX2Nvbm5lY3RvciAqaGRtaV9jb25uZWN0b3I7CkBAIC0yODEsOCArMjgy
LDEwIEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdmM0X2hkbWlfY29ubmVjdG9yX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCWhkbWlfY29ubmVjdG9yLT5lbmNvZGVyID0g
ZW5jb2RlcjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNvbm5lY3RvciwgJnZjNF9oZG1p
X2Nvbm5lY3Rvcl9mdW5jcywKLQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJZHJt
X2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgY29ubmVjdG9yLAorCQkJCSAgICAmdmM0X2hk
bWlfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCisJ
CQkJICAgIGRkYyk7CiAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJnZjNF9o
ZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCiAJLyogQ3JlYXRlIGFuZCBhdHRhY2ggVFYg
bWFyZ2luIHByb3BzIHRvIHRoaXMgY29ubmVjdG9yLiAqLwpAQCAtMTM5NSw3ICsxMzk4LDggQEAg
c3RhdGljIGludCB2YzRfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCQkJIERSTV9NT0RFX0VOQ09ERVJfVE1EUywgTlVMTCk7
CiAJZHJtX2VuY29kZXJfaGVscGVyX2FkZChoZG1pLT5lbmNvZGVyLCAmdmM0X2hkbWlfZW5jb2Rl
cl9oZWxwZXJfZnVuY3MpOwogCi0JaGRtaS0+Y29ubmVjdG9yID0gdmM0X2hkbWlfY29ubmVjdG9y
X2luaXQoZHJtLCBoZG1pLT5lbmNvZGVyKTsKKwloZG1pLT5jb25uZWN0b3IgPQorCQl2YzRfaGRt
aV9jb25uZWN0b3JfaW5pdChkcm0sIGhkbWktPmVuY29kZXIsIGhkbWktPmRkYyk7CiAJaWYgKElT
X0VSUihoZG1pLT5jb25uZWN0b3IpKSB7CiAJCXJldCA9IFBUUl9FUlIoaGRtaS0+Y29ubmVjdG9y
KTsKIAkJZ290byBlcnJfZGVzdHJveV9lbmNvZGVyOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
