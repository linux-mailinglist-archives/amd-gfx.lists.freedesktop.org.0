Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A1730AD
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573906E55C;
	Wed, 24 Jul 2019 14:02:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F190C6E55C;
 Wed, 24 Jul 2019 14:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 9C210263BB0
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/24] drm/tegra: Provide ddc symlink in output connector
 sysfs directory
Date: Wed, 24 Jul 2019 15:59:31 +0200
Message-Id: <fe644059eb44b16733999d7541934a8e502f249f.1563960855.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
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
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgICB8ICAxIC0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9oZG1pLmMgICB8ICA3ICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9vdXRwdXQuYyB8IDEyICsrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5j
ICAgIHwgMTMgKysrKysrKy0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJt
LmggYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmgKaW5kZXggODZkYWExOWZjZjI0Li45YmY3
MmJjZDNlYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmgKQEAgLTEyMCw3ICsxMjAsNiBAQCBzdHJ1Y3QgdGVn
cmFfb3V0cHV0IHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAKIAlzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbDsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAljb25zdCBzdHJ1Y3QgZWRpZCAqZWRp
ZDsKIAlzdHJ1Y3QgY2VjX25vdGlmaWVyICpjZWM7CiAJdW5zaWduZWQgaW50IGhwZF9pcnE7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2hkbWkuYwppbmRleCAzMzRjNGQ3ZDIzOGIuLmFhYzg3MTg0N2JlNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvaGRtaS5jCkBAIC0xNDI1LDkgKzE0MjUsMTAgQEAgc3RhdGljIGludCB0ZWdyYV9oZG1pX2lu
aXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAogCWhkbWktPm91dHB1dC5kZXYgPSBj
bGllbnQtPmRldjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkcm0sICZoZG1pLT5vdXRwdXQuY29u
bmVjdG9yLAotCQkJICAgJnRlZ3JhX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAgRFJNX01P
REVfQ09OTkVDVE9SX0hETUlBKTsKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAm
aGRtaS0+b3V0cHV0LmNvbm5lY3RvciwKKwkJCQkgICAgJnRlZ3JhX2hkbWlfY29ubmVjdG9yX2Z1
bmNzLAorCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCisJCQkJICAgIGhkbWktPm91
dHB1dC5jb25uZWN0b3IuZGRjKTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmhkbWktPm91
dHB1dC5jb25uZWN0b3IsCiAJCQkJICZ0ZWdyYV9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mp
OwogCWhkbWktPm91dHB1dC5jb25uZWN0b3IuZHBtcyA9IERSTV9NT0RFX0RQTVNfT0ZGOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL291dHB1dC5jCmluZGV4IDI3NGNiOTU1ZTJlMS4uMGI1MDM3YTI5YzYzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL291dHB1dC5jCkBAIC0zMCw4ICszMCw4IEBAIGludCB0ZWdyYV9vdXRwdXRfY29ubmVj
dG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCiAJaWYgKG91
dHB1dC0+ZWRpZCkKIAkJZWRpZCA9IGttZW1kdXAob3V0cHV0LT5lZGlkLCBzaXplb2YoKmVkaWQp
LCBHRlBfS0VSTkVMKTsKLQllbHNlIGlmIChvdXRwdXQtPmRkYykKLQkJZWRpZCA9IGRybV9nZXRf
ZWRpZChjb25uZWN0b3IsIG91dHB1dC0+ZGRjKTsKKwllbHNlIGlmIChjb25uZWN0b3ItPmRkYykK
KwkJZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGNvbm5lY3Rvci0+ZGRjKTsKIAogCWNl
Y19ub3RpZmllcl9zZXRfcGh5c19hZGRyX2Zyb21fZWRpZChvdXRwdXQtPmNlYywgZWRpZCk7CiAJ
ZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOwpAQCAt
MTExLDggKzExMSw4IEBAIGludCB0ZWdyYV9vdXRwdXRfcHJvYmUoc3RydWN0IHRlZ3JhX291dHB1
dCAqb3V0cHV0KQogCiAJZGRjID0gb2ZfcGFyc2VfcGhhbmRsZShvdXRwdXQtPm9mX25vZGUsICJu
dmlkaWEsZGRjLWkyYy1idXMiLCAwKTsKIAlpZiAoZGRjKSB7Ci0JCW91dHB1dC0+ZGRjID0gb2Zf
ZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkYyk7Ci0JCWlmICghb3V0cHV0LT5kZGMpIHsKKwkJ
b3V0cHV0LT5jb25uZWN0b3IuZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkYyk7
CisJCWlmICghb3V0cHV0LT5jb25uZWN0b3IuZGRjKSB7CiAJCQllcnIgPSAtRVBST0JFX0RFRkVS
OwogCQkJb2Zfbm9kZV9wdXQoZGRjKTsKIAkJCXJldHVybiBlcnI7CkBAIC0xNzQsOCArMTc0LDgg
QEAgdm9pZCB0ZWdyYV9vdXRwdXRfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkK
IAlpZiAob3V0cHV0LT5ocGRfZ3BpbykKIAkJZnJlZV9pcnEob3V0cHV0LT5ocGRfaXJxLCBvdXRw
dXQpOwogCi0JaWYgKG91dHB1dC0+ZGRjKQotCQlwdXRfZGV2aWNlKCZvdXRwdXQtPmRkYy0+ZGV2
KTsKKwlpZiAob3V0cHV0LT5jb25uZWN0b3IuZGRjKQorCQlwdXRfZGV2aWNlKCZvdXRwdXQtPmNv
bm5lY3Rvci5kZGMtPmRldik7CiB9CiAKIGludCB0ZWdyYV9vdXRwdXRfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLCBzdHJ1Y3QgdGVncmFfb3V0cHV0ICpvdXRwdXQpCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMK
aW5kZXggNGZmZTM3OTRlNmQzLi42M2I2Y2ZiYmQxN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKQEAgLTIz
MTEsNyArMjMxMSw3IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9oZG1pX2Rpc2FibGVfc2NyYW1i
bGluZyhzdHJ1Y3QgdGVncmFfc29yICpzb3IpCiAKIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9oZG1p
X3NjZGNfZGlzYWJsZShzdHJ1Y3QgdGVncmFfc29yICpzb3IpCiB7Ci0Jc3RydWN0IGkyY19hZGFw
dGVyICpkZGMgPSBzb3ItPm91dHB1dC5kZGM7CisJc3RydWN0IGkyY19hZGFwdGVyICpkZGMgPSBz
b3ItPm91dHB1dC5jb25uZWN0b3IuZGRjOwogCiAJZHJtX3NjZGNfc2V0X2hpZ2hfdG1kc19jbG9j
a19yYXRpbyhkZGMsIGZhbHNlKTsKIAlkcm1fc2NkY19zZXRfc2NyYW1ibGluZyhkZGMsIGZhbHNl
KTsKQEAgLTIzMzksNyArMjMzOSw3IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9oZG1pX2VuYWJs
ZV9zY3JhbWJsaW5nKHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKIAogc3RhdGljIHZvaWQgdGVncmFf
c29yX2hkbWlfc2NkY19lbmFibGUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQogewotCXN0cnVjdCBp
MmNfYWRhcHRlciAqZGRjID0gc29yLT5vdXRwdXQuZGRjOworCXN0cnVjdCBpMmNfYWRhcHRlciAq
ZGRjID0gc29yLT5vdXRwdXQuY29ubmVjdG9yLmRkYzsKIAogCWRybV9zY2RjX3NldF9oaWdoX3Rt
ZHNfY2xvY2tfcmF0aW8oZGRjLCB0cnVlKTsKIAlkcm1fc2NkY19zZXRfc2NyYW1ibGluZyhkZGMs
IHRydWUpOwpAQCAtMjM1MCw3ICsyMzUwLDcgQEAgc3RhdGljIHZvaWQgdGVncmFfc29yX2hkbWlf
c2NkY19lbmFibGUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQogc3RhdGljIHZvaWQgdGVncmFfc29y
X2hkbWlfc2NkY193b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIHsKIAlzdHJ1Y3QgdGVn
cmFfc29yICpzb3IgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IHRlZ3JhX3Nvciwgc2NkYy53
b3JrKTsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IHNvci0+b3V0cHV0LmRkYzsKKwlzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IHNvci0+b3V0cHV0LmNvbm5lY3Rvci5kZGM7CiAKIAlpZiAo
IWRybV9zY2RjX2dldF9zY3JhbWJsaW5nX3N0YXR1cyhkZGMpKSB7CiAJCURSTV9ERUJVR19LTVMo
IlNDREMgbm90IHNjcmFtYmxlZFxuIik7CkBAIC0yODMyLDkgKzI4MzIsMTAgQEAgc3RhdGljIGlu
dCB0ZWdyYV9zb3JfaW5pdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQogCiAJc29yLT5v
dXRwdXQuZGV2ID0gc29yLT5kZXY7CiAKLQlkcm1fY29ubmVjdG9yX2luaXQoZHJtLCAmc29yLT5v
dXRwdXQuY29ubmVjdG9yLAotCQkJICAgJnRlZ3JhX3Nvcl9jb25uZWN0b3JfZnVuY3MsCi0JCQkg
ICBjb25uZWN0b3IpOworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkcm0sICZzb3ItPm91
dHB1dC5jb25uZWN0b3IsCisJCQkJICAgICZ0ZWdyYV9zb3JfY29ubmVjdG9yX2Z1bmNzLAorCQkJ
CSAgICBjb25uZWN0b3IsCisJCQkJICAgIHNvci0+b3V0cHV0LmNvbm5lY3Rvci5kZGMpOwogCWRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZCgmc29yLT5vdXRwdXQuY29ubmVjdG9yLAogCQkJCSAmdGVn
cmFfc29yX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCXNvci0+b3V0cHV0LmNvbm5lY3Rvci5k
cG1zID0gRFJNX01PREVfRFBNU19PRkY7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
