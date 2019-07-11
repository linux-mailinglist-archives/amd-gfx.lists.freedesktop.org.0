Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0532D65596
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 13:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4E06E203;
	Thu, 11 Jul 2019 11:31:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A19A6E17E;
 Thu, 11 Jul 2019 11:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7B08828B698
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/23] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
Date: Thu, 11 Jul 2019 13:26:45 +0200
Message-Id: <b039fbddc020d20457023bda631de8aacb5d061d.1562843413.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgfCAxOSArKysr
KysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRh
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwppbmRleCBkMzI4ODVi
OTA2YWUuLmI0Y2MzMjM4NDAwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9k
dW1iLXZnYS1kYWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5j
CkBAIC0yMCw3ICsyMCw2IEBAIHN0cnVjdCBkdW1iX3ZnYSB7CiAJc3RydWN0IGRybV9icmlkZ2UJ
YnJpZGdlOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yCWNvbm5lY3RvcjsKIAotCXN0cnVjdCBpMmNf
YWRhcHRlcgkqZGRjOwogCXN0cnVjdCByZWd1bGF0b3IJKnZkZDsKIH07CiAKQEAgLTQyLDEwICs0
MSwxMCBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCByZXQ7CiAKLQlpZiAoSVNf
RVJSKHZnYS0+ZGRjKSkKKwlpZiAoSVNfRVJSKHZnYS0+Y29ubmVjdG9yLmRkYykpCiAJCWdvdG8g
ZmFsbGJhY2s7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgdmdhLT5kZGMpOwor
CWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCB2Z2EtPmNvbm5lY3Rvci5kZGMpOwogCWlm
ICghZWRpZCkgewogCQlEUk1fSU5GTygiRURJRCByZWFkb3V0IGZhaWxlZCwgZmFsbGluZyBiYWNr
IHRvIHN0YW5kYXJkIG1vZGVzXG4iKTsKIAkJZ290byBmYWxsYmFjazsKQEAgLTg0LDcgKzgzLDcg
QEAgZHVtYl92Z2FfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBib29sIGZvcmNlKQogCSAqIHdpcmUgdGhlIEREQyBwaW5zLCBvciB0aGUgSTJDIGJ1cyBt
aWdodCBub3QgYmUgd29ya2luZyBhdAogCSAqIGFsbC4KIAkgKi8KLQlpZiAoIUlTX0VSUih2Z2Et
PmRkYykgJiYgZHJtX3Byb2JlX2RkYyh2Z2EtPmRkYykpCisJaWYgKCFJU19FUlIodmdhLT5jb25u
ZWN0b3IuZGRjKSAmJiBkcm1fcHJvYmVfZGRjKHZnYS0+Y29ubmVjdG9yLmRkYykpCiAJCXJldHVy
biBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKIAogCXJldHVybiBjb25uZWN0b3Jfc3RhdHVz
X3Vua25vd247CkBAIC0xOTAsMTQgKzE4OSwxNCBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWRldl9kYmcoJnBkZXYtPmRldiwgIk5v
IHZkZCByZWd1bGF0b3IgZm91bmQ6ICVkXG4iLCByZXQpOwogCX0KIAotCXZnYS0+ZGRjID0gZHVt
Yl92Z2FfcmV0cmlldmVfZGRjKCZwZGV2LT5kZXYpOwotCWlmIChJU19FUlIodmdhLT5kZGMpKSB7
Ci0JCWlmIChQVFJfRVJSKHZnYS0+ZGRjKSA9PSAtRU5PREVWKSB7CisJdmdhLT5jb25uZWN0b3Iu
ZGRjID0gZHVtYl92Z2FfcmV0cmlldmVfZGRjKCZwZGV2LT5kZXYpOworCWlmIChJU19FUlIodmdh
LT5jb25uZWN0b3IuZGRjKSkgeworCQlpZiAoUFRSX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMpID09
IC1FTk9ERVYpIHsKIAkJCWRldl9kYmcoJnBkZXYtPmRldiwKIAkJCQkiTm8gaTJjIGJ1cyBzcGVj
aWZpZWQuIERpc2FibGluZyBFRElEIHJlYWRvdXRcbiIpOwogCQl9IGVsc2UgewogCQkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiQ291bGRuJ3QgcmV0cmlldmUgaTJjIGJ1c1xuIik7Ci0JCQlyZXR1cm4g
UFRSX0VSUih2Z2EtPmRkYyk7CisJCQlyZXR1cm4gUFRSX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMp
OwogCQl9CiAJfQogCkBAIC0yMTYsOCArMjE1LDggQEAgc3RhdGljIGludCBkdW1iX3ZnYV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWRybV9icmlkZ2VfcmVtb3ZlKCZ2
Z2EtPmJyaWRnZSk7CiAKLQlpZiAoIUlTX0VSUih2Z2EtPmRkYykpCi0JCWkyY19wdXRfYWRhcHRl
cih2Z2EtPmRkYyk7CisJaWYgKCFJU19FUlIodmdhLT5jb25uZWN0b3IuZGRjKSkKKwkJaTJjX3B1
dF9hZGFwdGVyKHZnYS0+Y29ubmVjdG9yLmRkYyk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
